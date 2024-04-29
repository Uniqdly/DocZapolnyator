<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "word";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Ошибка подключения: " . $conn->connect_error);
}

$year = $_POST['year'];
$dates = $_POST['dates'];
$name = $_POST['name'];
$order_number = $_POST['order_number'];
$order_date = $_POST['order_date'];
$practice_type = $_POST['practice_type'];
$practice_location = $_POST['practice_location'];
$practice_supervisor_university = $_POST['practice_supervisor_university'];
$practice_supervisor_company = $_POST['practice_supervisor_company'];
$group = $_POST['group'];

$sql = "INSERT INTO practice (years, srok, name_practice, namber_date_order, groupe) VALUES ('$year', '$dates', '$name', '$order_number', '$group')";

if ($conn->query($sql) === TRUE) {
    echo "Данные успешно добавлены в базу данных";
} else {
    echo "Ошибка: " . $sql . "<br>" . $conn->error;
}

$conn->close();
?>
