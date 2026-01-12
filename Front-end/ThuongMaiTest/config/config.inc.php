<?php
define('API_BASE_URL', 'http://localhost:8080');

$host = 'localhost';
$db = 'ThuongMaiEureka';
$user = 'root';
$pass = 'root';

$conn = new mysqli($host, $user, $pass, $db);

if($conn->connect_error)
{
    die("Connection failed: " . $conn->connect_error);
}
?>