<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "word";

// Создаем соединение
$conn = new mysqli($servername, $username, $password, $dbname);

// Проверяем соединение
if ($conn->connect_error) {
    die("Ошибка соединения: " . $conn->connect_error);
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $fio = $_POST['fio'];

    // Подготавливаем и выполняем SQL-запрос для вставки данных в таблицу
    $sql = "INSERT INTO orderok (fio) VALUES ('$fio')";

    if ($conn->query($sql) === TRUE) {
        echo "Данные успешно добавлены в БД";
    } else {
        echo "Ошибка: " . $sql . "<br>" . $conn->error;
    }
}

$conn->close();
?>

<!DOCTYPE html>
<html>
<head>
    <title>Форма для ввода ФИО студента</title>
</head>
<body>
    <form method="post" action="">
        <label for="fio">ФИО студента:</label><br>
        <input type="text" id="fio" name="fio"><br><br>
        <input type="submit" value="Отправить">
    </form>
</body>
</html>
