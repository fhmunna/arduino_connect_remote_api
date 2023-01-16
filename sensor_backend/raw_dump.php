<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "arduino";
$data_a = $_GET["data_a"];
// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
} 

$sql = "INSERT INTO raw_dump (data_a)
VALUES ('$data_a')";

if ($conn->query($sql) === TRUE) {
    echo "New record created successfully";
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}

$conn->close();
?>