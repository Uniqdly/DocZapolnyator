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

// Запрос для извлечения списка групп
$sql = "SELECT DISTINCT number FROM groupe";

$result = $conn->query($sql);

$groups = array();

if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        $groups[] = $row["number"];
    }
}

$conn->close();

?>

<!DOCTYPE html>
<html>
<head>
    <title>Форма руководителя практики</title>
</head>
<body>
    <h2>Форма руководителя практики</h2>

    <form method="post" action="process_form.php">
    <label for="group">Группа:</label>
    <select name="group" id="group" form="practice_form">
        <option value="">Выберите группу</option>
        <?php
        foreach ($groups as $group) {
            echo "<option value='$group'>$group</option>";
        }
        ?>
    </select><br><br>
    <input type="hidden" name="group" id="selected_group">
    
   


    <form method="post" action="process_form.php">
        <label for="year">Год:</label>
        <input type="text" name="year" required><br><br>

        <label for="dates">Сроки:</label>
        <input type="text" name="dates" required><br><br>

        <label for="name">Название:</label>
        <input type="text" name="name" required><br><br>

        <label for="order_number">Номер приказа:</label>
        <input type="text" name="order_number" required><br><br>

        <label for="order_date">Дата приказа:</label>
        <input type="text" name="order_date" required><br><br>

        <label for="practice_type">Тип практики:</label>
        <select name="practice_type">
            <option value="стажировка">Стажировка</option>
            <option value="обучение">Обучение</option>
        </select><br><br>

        <label for="practice_location">Место практики:</label>
        <input type="text" name="practice_location" required><br><br>

        <label for="practice_supervisor_university">Руководитель практики (Университет):</label>
        <input type="text" name="practice_supervisor_university" required><br><br>

        <label for="practice_supervisor_company">Руководитель практики (Предприятие):</label>
        <input type="text" name="practice_supervisor_company" required><br><br>

        <input type="submit" value="Отправить">
    </form>
    <script>
    // Загрузка списка групп из базы данных
    fetch('get_groups.php')
            .then(response => response.json())
            .then(data => {
                const groupSelect = document.getElementById('group');
                data.forEach(group => {
                    const option = document.createElement('option');
                    option.value = group;
                    option.text = group;
                    groupSelect.appendChild(option);
                });
            })
            .catch(error => console.error('Ошибка загрузки списка групп:', error));
</script>

</body>
</html>