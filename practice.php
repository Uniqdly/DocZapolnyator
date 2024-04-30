<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Руководитель практики</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
        }

        h2 {
            margin-top: 20px;
        }
        
        h3 {
            margin-top: 20px;
        }
        
        form {
            max-width: 500px;
            margin: 0 auto;
        }
        
        label {
            display: block;
            margin-bottom: 10px;
        }
        
        input[type="text"] {
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
<form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">
    <h2>Форма заполнения</h2>

    <label for="student_fio">ФИО:</label>
        <input type="text" id="student_fio" name="student_fio" required><br><br>

        <label for="view">Вид договора:</label>
        <select id="view" name="view">
            <option value="Долгосрочный">Долгосрочный</option>
            <option value="Краткосрочный">Краткосрочный</option>
        </select>
        <br><br>

        <label for="viewe">Оплачиваемая практика:</label>
        <select id="viewe" name="viewe">
            <option value="Да">Да</option>
            <option value="Нет">Нет</option>
        </select>
        <br><br>

        <h3>Производственные задачи:</h3>
        <label for="name">Название:</label>
        <input type="text" id="name" name="name" ><br><br>

        <label for="datee">Дата:</label>
        <input type="text" id="datee" name="datee" ><br>
        <hr>
        <br>
        <label for="text">Как студент справлялся с трудностями:</label>
        <input type="text" id="text" name="text" ><br><br>

        <label for="textt">Какие качества проявил студент:</label>
        <input type="text" id="textt" name="textt" ><br><br>

        <label for="texte">Объем работы:</label>
        <input type="text" id="texte" name="texte" ><br><br>

        <label for="textte">Замечания:</label>
        <input type="text" id="textte" name="textte" ><br><br>

        <input type="submit" value="Отправить">
    </form>
    
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

    $datee = $_POST['datee'];
    $name = $_POST['name'];
    $textte = $_POST['textte'];
    $texte = $_POST['texte'];
    $textt = $_POST['textt'];
    $text = $_POST['text'];
    $viewe = $_POST['viewe'];
    $student_fio = $_POST['student_fio'];
    $view = $_POST['view'];

    // Один запрос на добавление всех данных 
    $sql = "INSERT INTO tasks (student_fio, name_task, datee) VALUES ('$student_fio', '$name', '$datee' );
            INSERT INTO comments (student_fio, text) VALUES ('$student_fio', '$textte');
            INSERT INTO size_work (student_fio, text) VALUES ('$student_fio', '$texte');
            INSERT INTO quality (student_fio, text) VALUES ('$student_fio', '$textt');
            INSERT INTO hards (student_fio, text) VALUES ('$student_fio', '$text');
            INSERT INTO pay (student_fio, viewe) VALUES ('$student_fio', '$viewe');
            INSERT INTO view_contract (student_fio, view) VALUES ('$student_fio', '$view')";

    if ($conn->multi_query($sql) === TRUE) {
        // После успешного добавления данных перенаправляем пользователя на другую страницу или на ту же страницу без параметров POST
        header("Location: " . $_SERVER['PHP_SELF']);
        exit();
    } else {
        echo "Ошибка при добавлении записи в базу данных: " . $conn->error;
    }

    $conn->close();
}
?>

</body>
</html>