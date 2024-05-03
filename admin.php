<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Администратор</title>
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

        <label for="name">Название института:</label>
        <input type="text" id="name" name="name" required><br><br>

        <label for="direction">Направление подготовки:</label>
        <input type="text" id="direction" name="direction" required><br><br>

        <label for="class">Курс:</label>
        <input type="text" id="class" name="class" required><br><br>

        <label for="number">Группа:</label>
        <input type="text" id="number" name="number" required><br><br>

        <label for="code">Код группы:</label>
        <input type="text" name="code" ><br><br>

        <h3>Анкета руководителя образовательной программы:</h3>
        <label for="fio">ФИО:</label>
        <input type="text" id="fio" name="fio" required><br><br>

        <label for="post">Должность:</label>
        <input type="text" id="post" name="post" required><br><br>


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

    $name = $_POST['name'];
    $direction = $_POST['direction'];
    $number = $_POST['number'];
    $class = $_POST['class'];
    $fio = $_POST['fio'];
    $post = $_POST['post'];
    $code = $_POST['code'];

    // Один запрос на добавление всех данных
    $sql = "INSERT INTO institute (name, direction) VALUES ('$name', '$direction' );
            INSERT INTO direction (name, groupe,code) VALUES ('$direction','$number', '$code');
            INSERT INTO groupe (number, class) VALUES ('$number', '$class');
            INSERT INTO opop (fio, post, direction) VALUES ('$fio', '$post', '$direction')";

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
