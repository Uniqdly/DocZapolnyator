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

// Запрос к базе данных для получения списка групп
$sql = "SELECT number FROM groupe";
$result = $conn->query($sql);

// Проверяем, есть ли результаты
if ($result->num_rows > 0) {
    // Создаем массив для хранения групп
    $groups = array();
    // Заполняем массив данными из запроса
    while($row = $result->fetch_assoc()) {
        $groups[] = $row["number"];
    }
} else {
    echo "0 результатов";
}

// Проверяем, была ли отправлена форма
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $year = $_POST['year'];
    $srok = $_POST['srok'];
    $name = $_POST['name'];
    $order_number = $_POST['order_number'];
    $order_date = $_POST['order_date'];
    $type_practice = $_POST['type_practice'];
    $view_practice = $_POST['view_practice'];
    $address = $_POST['address'];
    $name_place = $_POST['name_place'];
    $fio = $_POST['fio'];
    $post = $_POST['post'];
    $Fio = $_POST['Fio'];
    $postt = $_POST['postt'];
    $boss_practice_ugrasu = $_POST['boss_practice_ugrasu'];
    $boss_practice_company = $_POST['boss_practice_company'];
    $groupe = $_POST['groupe'];

    // Ваш SQL-запрос для вставки данных в базу данных
    $sql = "INSERT INTO practice (years, srok, name_practice, namber_date_order, groupe) VALUES ('$year', '$srok', '$name', '$order_number', '$groupe');
        INSERT INTO view_practice (viewe, name_practice) VALUES ('$view_practice','$name');
        INSERT INTO type_practice (type, name_practice) VALUES ('$type_practice', '$name');
        INSERT INTO place_practice (address, name_place, name_practice) VALUES ('$address', '$name_place','$name');
        INSERT INTO boss_practice_ugrasu (fio, post, name_practice) VALUES ('$fio', '$post','$name');
        INSERT INTO boss_practice_company (fio, post, name_practice) VALUES ('$Fio', '$postt','$name');";

    if ($conn->multi_query($sql) === TRUE) {
        // После успешного добавления данных перенаправляем пользователя на другую страницу или на ту же страницу без параметров POST
        header("Location: " . $_SERVER['PHP_SELF']);
        exit();
    } else {
        echo "Ошибка при добавлении записи в базу данных: " . $conn->error;
    }
}

$conn->close();
?>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Форма руководителя практики</title>
    <script>
        function addRow() {
            var table = document.getElementById("studentsTable");
            var rowCount = table.rows.length;
            var row = table.insertRow(rowCount);
            var cell1 = row.insertCell(0);
            var cell2 = row.insertCell(1);
            cell1.innerHTML = "<input type='text' name='student_name[]'>";
            cell2.innerHTML = "<input type='text' name='student_group[]'>";
        }
    </script>
    <!-- Подключение стилей -->
    <style>
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

    <form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">
    <h2>Форма руководителя практики</h2>
        <label for="groupe">Группа:</label>
        <select name="groupe" id="groupe" >
            <option value="">Выберите группу</option>
            <?php
            // Выводим список групп в элементах списка
            foreach ($groups as $groupe) {
                echo "<option value='$groupe'>$groupe</option>";
            }
            ?>
        </select><br><br>

   
        <label for="year">Год:</label>
        <input type="text" name="year" ><br><br>

        <label for="srok">Сроки:</label>
        <input type="text" name="srok" ><br><br>

        <label for="name">Название  практики:</label>
        <input type="text" name="name" ><br><br>

        <label for="order_number">Номер приказа:</label>
        <input type="text" name="order_number" ><br><br>

        <label for="order_date">Дата приказа:</label>
        <input type="text" name="order_date" ><br><br>

        <label for="view_practice">Вид практики:</label>
        <select name="view_practice">
            <option value="стажировка">Стажировка</option>
            <option value="обучение">Обучение</option>
        </select><br><br>

        <label for="type_practice">Тип практики:</label>
        <select name="type_practice">
            <option value="стажировка">Стажировка</option>
            <option value="обучение">Обучение</option>
        </select><br><br>

        <h4>Место практики</h4>
        <label for="address">Адрес :</label>
        <input type="text" name="address" ><br><br>

        <label for="name_place">Название :</label>
        <input type="text" name="name_place" ><br><br>
        <hr>

        <h4>Руководитель практики ЮГУ:</h4>
        <!-- <label for="fio">Руководитель практики ЮГУ:</label> -->
        <input type="text" name="fio" ><br><br>

        
        <label for="post">Должность:</label>
        <input type="text" name="post" ><br><br>

        <hr>
        
        <h4>Руководитель практики от предприятия:</h4>
        <!-- <label for="Fio">Руководитель практики от предприятия:</label> -->
        <input type="text" name="Fio" ><br><br>

        <label for="postt">Должность:</label>
        <input type="text" name="postt" ><br><br>

        <input type="submit" value="Отправить">
        <a href="process_form.php" class="ml-2">Список студентов</a>
    </form>

</body>
</html>


