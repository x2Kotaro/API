<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST');
header('Access-Control-Allow-Headers: Content-Type');

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "roblox_auth";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die(json_encode([
        'success' => false,
        'message' => 'Database connection failed'
    ]));
}

$createTable = "CREATE TABLE IF NOT EXISTS user_verification (
    id INT AUTO_INCREMENT PRIMARY KEY,
    discord_id VARCHAR(255) NOT NULL UNIQUE,
    discord_username VARCHAR(255) NOT NULL,
    roblox_username VARCHAR(255) NOT NULL,
    roblox_user_id VARCHAR(255) NOT NULL,
    roblox_profile_url TEXT,
    verified TINYINT(1) DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    verified_at TIMESTAMP NULL
)";
$conn->query($createTable);

$method = $_SERVER['REQUEST_METHOD'];

if ($method === 'POST') {
    $data = json_decode(file_get_contents('php://input'), true);
    
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
                      verified = 0
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
    
    elseif ($action === 'confirm') {
        $sql = "UPDATE user_verification 
                SET verified = 1, verified_at = CURRENT_TIMESTAMP 
                WHERE roblox_user_id = '$roblox_user_id'";
        
        if ($conn->query($sql)) {
            $getUserSql = "SELECT * FROM user_verification WHERE roblox_user_id = '$roblox_user_id'";
            $userResult = $conn->query($getUserSql);
            $userData = $userResult->fetch_assoc();
            
            echo json_encode([
                'success' => true,
                'status' => 'confirmed',
                'message' => 'ยืนยันตัวตนสำเร็จ',
                'discord_username' => $userData['discord_username'],
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

$conn->close();
?>
