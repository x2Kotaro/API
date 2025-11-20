<?php
error_reporting(0);
ini_set('display_errors', 0);

header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST, OPTIONS');
header('Access-Control-Allow-Headers: Content-Type');

if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    http_response_code(200);
    exit();
}

$servername = "caboose.proxy.rlwy.net";
$username = "root";
$password = "uuEilzwNfhvWKZaCEOcIdDSRIHyChOZb";
$dbname = "railway";
$port = 39358;

try {
    $conn = new mysqli($servername, $username, $password, $dbname, $port);
    
    if ($conn->connect_error) {
        throw new Exception('Database connection failed');
    }
    
    $conn->set_charset("utf8mb4");
    
    // สำคัญ! ตั้งค่า isolation level
    $conn->query("SET SESSION TRANSACTION ISOLATION LEVEL READ COMMITTED");
    
} catch (Exception $e) {
    http_response_code(500);
    echo json_encode(['success' => false, 'message' => $e->getMessage()]);
    exit();
}

$createTable = "CREATE TABLE IF NOT EXISTS user_verification (
    id INT AUTO_INCREMENT PRIMARY KEY,
    discord_id VARCHAR(255) NOT NULL,
    discord_username VARCHAR(255) NOT NULL,
    roblox_username VARCHAR(255) NOT NULL,
    roblox_user_id VARCHAR(255) NOT NULL UNIQUE,
    roblox_profile_url TEXT,
    verified TINYINT(1) DEFAULT 0,
    new_nickname VARCHAR(255) NULL,
    rank_id INT NULL,
    processing TINYINT(1) DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    verified_at TIMESTAMP NULL,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX idx_discord_id (discord_id),
    INDEX idx_verified_processing (verified, processing),
    INDEX idx_roblox_user_id (roblox_user_id)
) ENGINE=InnoDB";
$conn->query($createTable);

$method = $_SERVER['REQUEST_METHOD'];

// ================== POST REQUEST ==================
if ($method === 'POST') {
    try {
        $rawInput = file_get_contents('php://input');
        $data = json_decode($rawInput, true);
        
        if (json_last_error() !== JSON_ERROR_NONE) {
            throw new Exception('Invalid JSON');
        }
        
        // กรณีบันทึกข้อมูลจาก Discord
        if (!isset($data['action'])) {
            if (!isset($data['discord_id']) || !isset($data['roblox_user_id'])) {
                throw new Exception('Missing required fields');
            }
            
            // เริ่ม transaction
            $conn->begin_transaction();
            
            try {
                // ใช้ prepared statement ป้องกัน SQL injection และ race condition
                $stmt = $conn->prepare("
                    INSERT INTO user_verification 
                    (discord_id, discord_username, roblox_username, roblox_user_id, roblox_profile_url, verified, processing) 
                    VALUES (?, ?, ?, ?, ?, 0, 0)
                    ON DUPLICATE KEY UPDATE 
                        discord_id = VALUES(discord_id),
                        discord_username = VALUES(discord_username),
                        roblox_username = VALUES(roblox_username),
                        verified = 0,
                        processing = 0,
                        new_nickname = NULL,
                        rank_id = NULL
                ");
                
                $stmt->bind_param(
                    "sssss",
                    $data['discord_id'],
                    $data['discord_username'],
                    $data['roblox_username'],
                    $data['roblox_user_id'],
                    $data['roblox_profile_url']
                );
                
                if (!$stmt->execute()) {
                    throw new Exception('Database insert failed');
                }
                
                $conn->commit();
                $stmt->close();
                
                echo json_encode([
                    'success' => true,
                    'message' => 'Data saved successfully',
                    'data' => [
                        'discord_username' => $data['discord_username'],
                        'roblox_username' => $data['roblox_username']
                    ]
                ]);
                
            } catch (Exception $e) {
                $conn->rollback();
                throw $e;
            }
            exit();
        }
        
        // กรณีอัพเดทชื่อจาก Roblox
        if ($data['action'] === 'update_nickname') {
            $conn->begin_transaction();
            
            try {
                // Lock row เพื่อป้องกัน concurrent update
                $stmt = $conn->prepare("
                    SELECT * FROM user_verification 
                    WHERE roblox_user_id = ? 
                    AND verified = 0
                    AND processing = 0
                    FOR UPDATE
                ");
                $stmt->bind_param("s", $data['roblox_user_id']);
                $stmt->execute();
                $result = $stmt->get_result();
                
                if ($result->num_rows === 0) {
                    $conn->rollback();
                    echo json_encode([
                        'success' => false,
                        'message' => 'User not found or already verified'
                    ]);
                    exit();
                }
                
                $userData = $result->fetch_assoc();
                $stmt->close();
                
                // อัพเดทข้อมูล
                $updateStmt = $conn->prepare("
                    UPDATE user_verification 
                    SET verified = 1, 
                        verified_at = CURRENT_TIMESTAMP,
                        new_nickname = ?,
                        rank_id = ?,
                        processing = 1
                    WHERE roblox_user_id = ?
                ");
                
                $rank = isset($data['rank']) ? intval($data['rank']) : 0;
                $updateStmt->bind_param("sis", $data['new_nickname'], $rank, $data['roblox_user_id']);
                
                if (!$updateStmt->execute()) {
                    throw new Exception('Update failed');
                }
                
                $conn->commit();
                $updateStmt->close();
                
                echo json_encode([
                    'success' => true,
                    'status' => 'confirmed',
                    'message' => 'ยืนยันตัวตนสำเร็จ',
                    'discord_username' => $userData['discord_username'],
                    'discord_id' => $userData['discord_id'],
                    'new_nickname' => $data['new_nickname'],
                    'action' => 'update_nickname'
                ]);
                
            } catch (Exception $e) {
                $conn->rollback();
                throw $e;
            }
        }
        
    } catch (Exception $e) {
        http_response_code(400);
        echo json_encode(['success' => false, 'message' => $e->getMessage()]);
        exit();
    }
}

// ================== GET REQUEST ==================
elseif ($method === 'GET') {
    $roblox_user_id = isset($_GET['roblox_user_id']) ? $conn->real_escape_string($_GET['roblox_user_id']) : '';
    $action = isset($_GET['action']) ? $_GET['action'] : 'check';
    
    if ($action === 'check' && !empty($roblox_user_id)) {
        $stmt = $conn->prepare("SELECT * FROM user_verification WHERE roblox_user_id = ?");
        $stmt->bind_param("s", $roblox_user_id);
        $stmt->execute();
        $result = $stmt->get_result();
        
        if ($result->num_rows > 0) {
            $row = $result->fetch_assoc();
            
            if ($row['verified'] == 1) {
                echo json_encode([
                    'success' => true,
                    'status' => 'verified',
                    'message' => 'คุณได้รับการยืนยันแล้ว',
                    'discord_username' => $row['discord_username'],
                    'action' => 'kick'
                ]);
            } else {
                echo json_encode([
                    'success' => true,
                    'status' => 'pending',
                    'message' => 'กรุณายืนยันตัวตน',
                    'discord_username' => $row['discord_username'],
                    'roblox_username' => $row['roblox_username'],
                    'action' => 'show_ui'
                ]);
            }
        } else {
            echo json_encode([
                'success' => true,
                'status' => 'not_found',
                'message' => 'กรุณาไปยืนยันใน Discord ก่อน',
                'action' => 'none'
            ]);
        }
        $stmt->close();
    }
    
    // ดึงข้อมูลที่รอการอัพเดท (จำกัด 10 รายการต่อครั้ง)
    elseif ($action === 'get_pending_updates') {
        $stmt = $conn->prepare("
            SELECT discord_id, new_nickname, rank_id, roblox_user_id 
            FROM user_verification 
            WHERE verified = 1 
            AND new_nickname IS NOT NULL 
            AND processing = 1
            LIMIT 10
        ");
        $stmt->execute();
        $result = $stmt->get_result();
        
        $updates = [];
        while ($row = $result->fetch_assoc()) {
            $updates[] = $row;
        }
        
        echo json_encode([
            'success' => true,
            'updates' => $updates,
            'count' => count($updates)
        ]);
        $stmt->close();
    }
    
    // เคลียร์สถานะหลังอัพเดทเสร็จ
    elseif ($action === 'clear_update') {
        $discord_id = isset($_GET['discord_id']) ? $conn->real_escape_string($_GET['discord_id']) : '';
        
        if (!empty($discord_id)) {
            $stmt = $conn->prepare("
                UPDATE user_verification 
                SET new_nickname = NULL, processing = 0 
                WHERE discord_id = ? AND verified = 1
            ");
            $stmt->bind_param("s", $discord_id);
            
            if ($stmt->execute()) {
                echo json_encode(['success' => true, 'message' => 'Cleared']);
            } else {
                echo json_encode(['success' => false, 'message' => 'Failed']);
            }
            $stmt->close();
        }
    }
}

$conn->close();
?>
