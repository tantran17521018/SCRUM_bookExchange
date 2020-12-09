<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "exchangebook";
 
// tạo connection
$conn = new mysqli($servername, $username, $password, $dbname);
// kiểm connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
?>