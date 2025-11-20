<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST');
header('Access-Control-Allow-Headers: Content-Type');

$servername = "caboose.proxy.rlwy.net";
$username = "root";
$password = "uuEilzwNfhvWKZaCEOcIdDSRIHyChOZb";
$dbname = "railway";
$port = 39358;

$conn = new mysqli($servername, $username, $password, $dbname, $port);

if ($conn->connect_error) {
    die(json_encode([
        'success' => false,
        'message' => 'Database connection failed: ' . $conn->connect_error
    ]));
}

// สร้างตาราง
$createTable = "CREATE TABLE IF NOT EXISTS user_verification (
    id INT AUTO_INCREMENT PRIMARY KEY,
    discord_id VARCHAR(255) NOT NULL UNIQUE,
    discord_username VARCHAR(255) NOT NULL,
    roblox_username VARCHAR(255) NOT NULL,
    roblox_user_id VARCHAR(255) NOT NULL,
    roblox_profile_url TEXT,
    rank_number INT DEFAULT NULL,
    rank_name VARCHAR(255) DEFAULT NULL,
    role_prefix VARCHAR(255) DEFAULT NULL,
    verified TINYINT(1) DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    verified_at TIMESTAMP NULL
)";
$conn->query($createTable);

$method = $_SERVER['REQUEST_METHOD'];

if ($method === 'POST') {
    $data = json_decode(file_get_contents('php://input'), true);
    
    // กรณีบันทึกข้อมูลจาก Discord Bot
    if (!isset($data['action'])) {
        $discord_id = $conn->real_escape_string($data['discord_id']);
        $discord_username = $conn->real_escape_string($data['discord_username']);
        $roblox_username = $conn->real_escape_string($data['roblox_username']);
        $roblox_user_id = $conn->real_escape_string($data['roblox_user_id']);
        $roblox_profile_url = $conn->real_escape_string($data['roblox_profile_url']);
        
        $checkSql = "SELECT * FROM user_verification WHERE roblox_user_id = '$roblox_user_id'";
        $result = $conn->query($checkSql);
        
        if ($result->num_rows > 0) {
            $updateSql = "UPDATE user_verification SET 
                          discord_id = '$discord_id',
                          discord_username = '$discord_username',
                          roblox_username = '$roblox_username',
                          verified = 0,
                          rank_number = NULL,
                          rank_name = NULL,
                          role_prefix = NULL
                          WHERE roblox_user_id = '$roblox_user_id'";
            $conn->query($updateSql);
        } else {
            $insertSql = "INSERT INTO user_verification 
                          (discord_id, discord_username, roblox_username, roblox_user_id, roblox_profile_url, verified) 
                          VALUES ('$discord_id', '$discord_username', '$roblox_username', '$roblox_user_id', '$roblox_profile_url', 0)";
            $conn->query($insertSql);
        }
        
        echo json_encode([
            'success' => true,
            'message' => 'Data saved successfully',
            'data' => [
                'discord_username' => $discord_username,
                'roblox_username' => $roblox_username
            ]
        ]);
    }
    // กรณียืนยันจาก Roblox พร้อมข้อมูล Rank
    elseif ($data['action'] === 'confirm') {
        $roblox_user_id = $conn->real_escape_string($data['roblox_user_id']);
        $roblox_username = $conn->real_escape_string($data['roblox_username']);
        $rank_number = intval($data['rank_number']);
        $rank_name = $conn->real_escape_string($data['rank_name']);
        $role_prefix = $conn->real_escape_string($data['role_prefix']);
        
        // อัพเดทข้อมูลและเปลี่ยนสถานะเป็นยืนยันแล้ว
        $sql = "UPDATE user_verification 
                SET verified = 1, 
                    verified_at = CURRENT_TIMESTAMP,
                    rank_number = '$rank_number',
                    rank_name = '$rank_name',
                    role_prefix = '$role_prefix',
                    roblox_username = '$roblox_username'
                WHERE roblox_user_id = '$roblox_user_id'";
        
        if ($conn->query($sql)) {
            // ดึงข้อมูลผู้ใช้เพื่อส่งไปยัง Discord Bot
            $getUserSql = "SELECT * FROM user_verification WHERE roblox_user_id = '$roblox_user_id'";
            $userResult = $conn->query($getUserSql);
            $userData = $userResult->fetch_assoc();
            
            // ส่ง Webhook ไปยัง Discord Bot (ถ้ามี)
            $discord_webhook_url = "YOUR_DISCORD_WEBHOOK_URL_HERE"; // ใส่ URL ของ webhook
            
            if ($discord_webhook_url && $discord_webhook_url !== "YOUR_DISCORD_WEBHOOK_URL_HERE") {
                $webhook_data = json_encode([
                    'discord_id' => $userData['discord_id'],
                    'discord_username' => $userData['discord_username'],
                    'roblox_username' => $roblox_username,
                    'rank_number' => $rank_number,
                    'rank_name' => $rank_name,
                    'role_prefix' => $role_prefix
                ]);
                
                $ch = curl_init($discord_webhook_url);
                curl_setopt($ch, CURLOPT_HTTPHEADER, ['Content-Type: application/json']);
                curl_setopt($ch, CURLOPT_POST, 1);
                curl_setopt($ch, CURLOPT_POSTFIELDS, $webhook_data);
                curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
                curl_exec($ch);
                curl_close($ch);
            }
            
            echo json_encode([
                'success' => true,
                'status' => 'confirmed',
                'message' => 'ยืนยันตัวตนสำเร็จ',
                'discord_username' => $userData['discord_username'],
                'discord_id' => $userData['discord_id'],
                'rank_info' => [
                    'rank_number' => $rank_number,
                    'rank_name' => $rank_name,
                    'role_prefix' => $role_prefix
                ],
                'action' => 'kick'
            ]);
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
    
    if (empty($roblox_user_id) && $action !== 'get_pending') {
        echo json_encode([
            'success' => false,
            'message' => 'Roblox User ID is required'
        ]);
        exit;
    }
    
    // เช็คสถานะการยืนยัน
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
    
    // สำหรับ Discord Bot ดึงรายชื่อที่รอการ set role
    elseif ($action === 'get_pending') {
        $sql = "SELECT * FROM user_verification WHERE verified = 1 AND rank_number IS NOT NULL";
        $result = $conn->query($sql);
        
        $pending_users = [];
        while ($row = $result->fetch_assoc()) {
            $pending_users[] = $row;
        }
        
        echo json_encode([
            'success' => true,
            'users' => $pending_users
        ]);
    }
}

$conn->close();
?>
