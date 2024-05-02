<?php

// Подключение к базе данных MySQL
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "word";

$conn = new mysqli($servername, $username, $password, $dbname);

// Проверка соединения
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Чтение CSV файла и запись данных в базу данных
if (($handle = fopen("issues.csv", "r")) !== FALSE) {
    while (($data = fgetcsv($handle, 1000, ",")) !== FALSE) {
        $column1 = $conn->real_escape_string($data[5]);
        $column2 = $conn->real_escape_string($data[4]);
        $column3 = $conn->real_escape_string($data[6]);
       
        $sql = "INSERT INTO tasks (student_fio, name_task, datee) VALUES ('$column1', '$column2', '$column3')";
        if ($conn->query($sql) !== TRUE) {
            echo "Error: " . $sql . "<br>" . $conn->error;
        }
    }
    fclose($handle);
}

// Закрытие соединения
$conn->close();

?>
