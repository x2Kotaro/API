<?php
// ป้องกัน error แสดงออกมา
error_reporting(0);
ini_set('display_errors', 0);

header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST, OPTIONS');
header('Access-Control-Allow-Headers: Content-Type');

// Handle preflight request
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
        throw new Exception('Database connection failed: ' . $conn->connect_error);
    }
    
    $conn->set_charset("utf8mb4");
} catch (Exception $e) {
    http_response_code(500);
    echo json_encode([
        'success' => false,
        'message' => $e->getMessage()
    ]);
    exit();
}

$createTable = "CREATE TABLE IF NOT EXISTS user_verification (
    id INT AUTO_INCREMENT PRIMARY KEY,
    discord_id VARCHAR(255) NOT NULL UNIQUE,
    discord_username VARCHAR(255) NOT NULL,
    roblox_username VARCHAR(255) NOT NULL,
    roblox_user_id VARCHAR(255) NOT NULL,
    roblox_profile_url TEXT,
    verified TINYINT(1) DEFAULT 0,
    new_nickname VARCHAR(255) NULL,
    rank_id INT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    verified_at TIMESTAMP NULL
)";
$conn->query($createTable);

$method = $_SERVER['REQUEST_METHOD'];

if ($method === 'POST') {
    try {
        $rawInput = file_get_contents('php://input');
        $data = json_decode($rawInput, true);
        
        if (json_last_error() !== JSON_ERROR_NONE) {
            throw new Exception('Invalid JSON: ' . json_last_error_msg());
        }
        
        // กรณีบันทึกข้อมูลจาก Discord
        if (!isset($data['action'])) {
            if (!isset($data['discord_id']) || !isset($data['roblox_user_id'])) {
                throw new Exception('Missing required fields');
            }
            
            $discord_id = $conn->real_escape_string($data['discord_id']);
            $discord_username = $conn->real_escape_string($data['discord_username']);
            $roblox_username = $conn->real_escape_string($data['roblox_username']);
            $roblox_user_id = $conn->real_escape_string($data['roblox_user_id']);
            $roblox_profile_url = $conn->real_escape_string($data['roblox_profile_url']);
            
            $checkSql = "SELECT * FROM user_verification WHERE roblox_user_id = '$roblox_user_id'";
            $result = $conn->query($checkSql);
            
            if (!$result) {
                throw new Exception('Database query failed: ' . $conn->error);
            }
            
            if ($result->num_rows > 0) {
                $updateSql = "UPDATE user_verification SET 
                              discord_id = '$discord_id',
                              discord_username = '$discord_username',
                              roblox_username = '$roblox_username',
                              verified = 0,
                              new_nickname = NULL,
                              rank_id = NULL
                              WHERE roblox_user_id = '$roblox_user_id'";
                
                if (!$conn->query($updateSql)) {
                    throw new Exception('Update failed: ' . $conn->error);
                }
            } else {
                $insertSql = "INSERT INTO user_verification 
                              (discord_id, discord_username, roblox_username, roblox_user_id, roblox_profile_url, verified) 
                              VALUES ('$discord_id', '$discord_username', '$roblox_username', '$roblox_user_id', '$roblox_profile_url', 0)";
                
                if (!$conn->query($insertSql)) {
                    throw new Exception('Insert failed: ' . $conn->error);
                }
            }
            
            echo json_encode([
                'success' => true,
                'message' => 'Data saved successfully',
                'data' => [
                    'discord_username' => $discord_username,
                    'roblox_username' => $roblox_username
                ]
            ]);
            exit();
        }
    } catch (Exception $e) {
        http_response_code(400);
        echo json_encode([
            'success' => false,
            'message' => $e->getMessage()
        ]);
        exit();
    }
    // กรณีอัพเดทชื่อจาก Roblox
    elseif ($data['action'] === 'update_nickname') {
        $roblox_user_id = $conn->real_escape_string($data['roblox_user_id']);
        $new_nickname = $conn->real_escape_string($data['new_nickname']);
        $rank = isset($data['rank']) ? intval($data['rank']) : 0;
        
        // อัพเดทข้อมูลในฐานข้อมูล
        $updateSql = "UPDATE user_verification 
                      SET verified = 1, 
                          verified_at = CURRENT_TIMESTAMP,
                          new_nickname = '$new_nickname',
                          rank_id = $rank
                      WHERE roblox_user_id = '$roblox_user_id'";
        
        if ($conn->query($updateSql)) {
            // ดึงข้อมูล discord_id เพื่อส่งไปอัพเดทชื่อใน Discord
            $getUserSql = "SELECT * FROM user_verification WHERE roblox_user_id = '$roblox_user_id'";
            $userResult = $conn->query($getUserSql);
            
            if ($userResult->num_rows > 0) {
                $userData = $userResult->fetch_assoc();
                
                // ส่งคำขอไปยัง Discord Bot เพื่ออัพเดทชื่อ
                $discord_webhook_url = "YOUR_DISCORD_BOT_WEBHOOK_URL"; // ใส่ URL ของ webhook หรือ endpoint
                
                $discord_data = json_encode([
                    'discord_id' => $userData['discord_id'],
                    'new_nickname' => $new_nickname,
                    'rank' => $rank
                ]);
                
                // บันทึกข้อมูลสำหรับ Discord Bot มาดึง
                echo json_encode([
                    'success' => true,
                    'status' => 'confirmed',
                    'message' => 'ยืนยันตัวตนสำเร็จ',
                    'discord_username' => $userData['discord_username'],
                    'discord_id' => $userData['discord_id'],
                    'new_nickname' => $new_nickname,
                    'action' => 'update_nickname'
                ]);
            } else {
                echo json_encode([
                    'success' => false,
                    'message' => 'ไม่พบข้อมูลผู้ใช้'
                ]);
            }
        } else {
            echo json_encode([
                'success' => false,
                'message' => 'เกิดข้อผิดพลาดในการยืนยัน'
            ]);
        }
    }
}

elseif ($method === 'GET') {
    $roblox_user_id = isset($_GET['roblox_user_id']) ? $conn->real_escape_string($_GET['roblox_user_id']) : '';
    $action = isset($_GET['action']) ? $_GET['action'] : 'check';
    
    if (empty($roblox_user_id)) {
        echo json_encode([
            'success' => false,
            'message' => 'Roblox User ID is required'
        ]);
        exit;
    }
    
    if ($action === 'check') {
        $sql = "SELECT * FROM user_verification WHERE roblox_user_id = '$roblox_user_id'";
        $result = $conn->query($sql);
        
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
            }
            else {
                echo json_encode([
                    'success' => true,
                    'status' => 'pending',
                    'message' => 'กรุณายืนยันตัวตน',
                    'discord_username' => $row['discord_username'],
                    'roblox_username' => $row['roblox_username'],
                    'action' => 'show_ui'
                ]);
            }
        }
        else {
            echo json_encode([
                'success' => true,
                'status' => 'not_found',
                'message' => 'กรุณาไปยืนยันใน Discord ก่อน',
                'action' => 'none'
            ]);
        }
    }
    
    // Endpoint สำหรับ Discord Bot ดึงข้อมูลที่ต้องอัพเดท
    elseif ($action === 'get_pending_updates') {
        $sql = "SELECT discord_id, new_nickname, rank_id, roblox_user_id 
                FROM user_verification 
                WHERE verified = 1 AND new_nickname IS NOT NULL";
        $result = $conn->query($sql);
        
        $updates = [];
        while ($row = $result->fetch_assoc()) {
            $updates[] = $row;
        }
        
        echo json_encode([
            'success' => true,
            'updates' => $updates
        ]);
    }
}

$conn->close();
?>
