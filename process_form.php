<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Добавление студентов</title>
    <style>
        table {
            border-collapse: collapse;
            width: 100%;
        }
        th, td {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
        }
        th {
            background-color: #f2f2f2;
        }
        .add-button {
            margin-top: 10px;
        }
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
        }
        
        h2 {
            margin-bottom: 20px;
        }
        
        form {
            max-width: 500px;
            margin: 0 auto;
        }
        
        label {
            display: block;
            margin-bottom: 10px;
        }
        
        input[type="text"],
        select {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        
        input[type="submit"] {
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            border: none;
            cursor: pointer;
        }
        
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
    
    </style>
</head>
<body>
<form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>">
<h2>Добавление студентов</h2>

<?php
// Подключение к базе данных
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "word";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Ошибка подключения: " . $conn->connect_error);
}

// Обработка добавления студента
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['fio'])) {
    $fio = $_POST['fio'];
    $sql = "INSERT INTO student (fio) VALUES ('$fio')";
    if ($conn->query($sql) === TRUE) {
        echo "Студент успешно добавлен";
        // Перенаправляем на себя, чтобы избежать дублирования при обновлении страницы
        header("Location: " . $_SERVER['PHP_SELF']);
        exit();
    } else {
        echo "Ошибка: " . $sql . "<br>" . $conn->error;
    }
}

// Получение данных о студентах из базы данных
$sql = "SELECT * FROM student";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    echo "<table><tr><th>ФИО</th></tr>";
    // Выводим данные о студентах в таблицу
    while($row = $result->fetch_assoc()) {
        echo "<tr><td>" . $row["fio"] . "</td></tr>";
    }
    echo "</table>";
} else {
    echo "0 результатов";
}

$conn->close();
?>
    <br>
    <label for="fio">ФИО студента:</label><br>
    <input type="text" id="fio" name="fio"><br><br>
    <input type="submit" value="Добавить студента" class="add-button">
    <a href="OPOP.php" class="ml-2">Заполнение документов</a>
</form>

