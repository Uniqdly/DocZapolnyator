<?php

    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        $servername = "localhost";
        $username = "root";
        $password = "";
        $dbname = "word";

        $conn = new mysqli($servername, $username, $password, $dbname);

        if ($conn->connect_error) {
            die("Connection failed: " . $conn->connect_error);
        }


        // Получение данных из формы
        $datee = $_POST['datee'];
        $name = $_POST['name'];
        $textte = $_POST['textte'];
        $texte = $_POST['texte'];
        $textt = $_POST['textt'];
        $text = $_POST['text'];
        $viewe = $_POST['viewe'];
        $student_fio = $_POST['student_fio'];
        $view = $_POST['view'];
        $rate = $_POST['rate'];
        $name_practice = $_POST['name_practice'];

        // SQL запрос для вставки данных в таблицу practice_student
        $sql = "INSERT INTO practice_student (student_fio, viewe_contract, pay, hards, name_tasks, quality, size_work, comments, name_practice, rate) VALUES ('$student_fio', '$view', '$viewe', '$text', '$name', '$textt', '$texte', '$textte', '$name_practice', '$rate')";

        // Отправка запроса к базе данных
        if ($conn->query($sql) === TRUE) {
            // После успешного добавления данных перенаправляем пользователя на другую страницу или на ту же страницу без параметров POST
            header("Location: practice.php");
            exit();
        } else {
            echo "Ошибка при добавлении записи в базу данных: " . $conn->error;
        }

    $conn->close();
    }
?>