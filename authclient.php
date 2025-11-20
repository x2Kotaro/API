header('Access-Control-Allow-Methods: GET, POST');
header('Access-Control-Allow-Headers: Content-Type');

$servername = "localhost";
$servername = "caboose.proxy.rlwy.net";
$username = "root";
$password = "";
$dbname = "roblox_auth";
$password = "uuEilzwNfhvWKZaCEOcIdDSRIHyChOZb";
$dbname = "railway";
$port = 39358;

$conn = new mysqli($servername, $username, $password, $dbname);
$conn = new mysqli($servername, $username, $password, $dbname, $port);

if ($conn->connect_error) {
    die(json_encode([
        'success' => false,
        'message' => 'Database connection failed'
        'message' => 'Database connection failed: ' . $conn->connect_error
    ]));
}
