<?php

$servername = "localhost";
$username   = "root";
$password   = "StructQueryRohan7272";
$dbname     = "lib_rohan";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Get form data
$accession_number = $_POST['accession_number'];
$title            = $_POST['title'];
$author           = $_POST['author'];
$edition          = $_POST['edition'];
$publication      = $_POST['publication'];

// Insert data
$sql = "INSERT INTO books 
(accession_number, title, author, edition, publication)
VALUES ('$accession_number', '$title', '$author', '$edition', '$publication')";

$conn->query($sql);

// Fetch all books
$result = $conn->query("SELECT * FROM books");

echo "<h2>Book Records</h2>";
echo "<table border='1' cellpadding='8'>";
echo "<tr>
<th>ID</th>
<th>Accession No</th>
<th>Title</th>
<th>Author</th>
<th>Edition</th>
<th>Publication</th>
</tr>";

while($row = $result->fetch_assoc()) {
    echo "<tr>";
    echo "<td>".$row['id']."</td>";
    echo "<td>".$row['accession_number']."</td>";
    echo "<td>".$row['title']."</td>";
    echo "<td>".$row['author']."</td>";
    echo "<td>".$row['edition']."</td>";
    echo "<td>".$row['publication']."</td>";
    echo "</tr>";
}

echo "</table>";

$conn->close();
?>