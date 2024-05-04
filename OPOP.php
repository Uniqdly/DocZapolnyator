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

// Получение данных о студентах из базы данных
$sql = "SELECT number FROM groupe";
$result = $conn->query($sql);

// Получаем данные о группах и сохраняем их в массиве
$groups = array();
if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        $groups[] = $row;
    }
}
$unique_groups = array_unique(array_column($groups, 'number'));

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
    $zalypa = $_POST['zalypa'];
    $bts = $_POST['bts'];
    $groupe = $_POST['groupe'];
    $code = $_POST['code'];
    $order_date = $_POST['order_date'];
    

    // Ваш SQL-запрос для вставки данных в базу данных
    $sql = "INSERT INTO practice (years, srok, name_practice, number_order, groupe, view_practice, type_practice,code_direction,order_date) VALUES ('$year', '$srok', '$name', '$order_number', '$groupe','$view_practice','$type_practice', '$code', '$order_date');
        -- INSERT INTO view_practice (viewe, name_practice) VALUES ('$view_practice','$name');
        -- INSERT INTO type_practice (type, name_practice) VALUES ('$type_practice', '$name');
        INSERT INTO place_practice (address, name_place, name_practice) VALUES ('$address', '$name_place','$name');
        INSERT INTO boss_huisos (fio, post, name_practice, org) VALUES ('$fio', '$post','$name', '$zalypa' );
        INSERT INTO boss_practice_ugrasu (fio, post, name_practice) VALUES ('$fio', '$post','$name');
        -- INSERT INTO boss_practice_org_company (fio, post, name_practice) VALUES ('$zalypa', '$bts','$name');
        INSERT INTO boss_practice_company (fio, post, name_practice) VALUES ('$Fio', '$postt','$name');
        ";

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
    <title>opop</title>
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

        input[type="number"],
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
    <h2>Форма для опоп </h2>
        
            <?php
    // Выводим выпадающий список для выбора группы
    echo '<label for="number">Выберите группу:</label><br>';
    echo '<select id="number" name="number">';
    foreach ($unique_groups as $groups) {
        echo '<option value="' . $groups . '">' . $groups . '</option>';
    }
    
    echo '</select>';
    ?>
        </select><br><br>

        <label for="code">Код группы:</label>
        <input type="text" name="code" ><br><br>

        <label for="year">Год:</label>
        <input type="number" name="year" ><br><br>

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
            <option value="учебная">учебная</option>
            <option value="производственная">производственная</option>
            <option value="преддипломная">преддипломная</option>
        </select><br><br>

        <label for="type_practice">Тип практики:</label>
        <select name="type_practice">
            <option value="учебная">учебная</option>
            <option value="ознакомительная">ознакомительная</option>
        </select><br><br>

        <h4>Место практики</h4>
        <label for="address">Адрес :</label>
        <input type="text" name="address" ><br><br>

        <label for="name_place">Название :</label>
        <input type="text" name="name_place" ><br><br>
        <hr>

        <!-- <h4>Руководитель практики ЮГУ:</h4> -->
        <!-- <label for="fio">Руководитель практики ЮГУ:</label> -->
        <!-- <input type="text" name="fio" ><br><br>

        
        <label for="post">Должность:</label>
        <input type="text" name="post" ><br>

        <form action="handler.php"> -->
        <!-- <p><b>Руководитель практики:</b></p> -->
            <!-- <p><input name="zalypa" type="radio" value="От ЮГУ" value> От ЮГУ</p>
            <p><input name="zalypa" type="radio" value="От организации" value> От организации</p>
            <p><input name="zalypa" type="radio" value="От предприятия" value> От предприятия</p><br>
            <input type="submit" value="Отправить">
        <a href="process_form.php" class="ml-2">Список студентов</a> -->
        
        
        <h4>Руководитель практики от предприятия:</h4> 
         <input type="text" name="Fio" ><br><br> 

        <label for="postt">Должность:</label>
        <input type="text" name="postt" ><br><br>

        <hr>

        <h4>Руководитель практики от ЮГУ:</h4>
        <input type="text" name="fio" ><br><br>

        <label for="post">Должность:</label>
        <input type="text" name="post" ><br><br>

        <input type="submit" value="Отправить">
        <a href="process_form.php" class="ml-2">Список студентов</a>
    </form>

</body>
</html>


