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
    // Проверяем, было ли отправлено ФИО
    if(isset($_POST['fio'])) {
        $fio = $_POST['fio'];

        // Запрос для выборки данных из таблицы practice_student
        $sql_select = "SELECT student_fio, viewe_contract, pay, hards, name_tasks, quality, size_work, comments, name_practice, rate, groupe FROM practice_student WHERE student_fio = '$fio'";
        $result = $conn->query($sql_select);
        
        if ($result->num_rows > 0) {
            // Массив для хранения данных
            $data = [];

            // Получаем данные и добавляем их в массив
            while ($row = $result->fetch_assoc()) {
                $data[] = $row;
            }

            // Переносим данные в таблицу end
            foreach($data as $row) {
                $student_fio = $row['student_fio'];
                $viewe_contract = $row['viewe_contract'];
                $pay = $row['pay']; 
                $hards = $row['hards']; 
                $name_tasks = $row['name_tasks']; 
                $quality = $row['quality']; 
                $size_work = $row['size_work']; 
                $comments = $row['comments']; 
                $name_practice = $row['name_practice']; 
                $rate = $row['rate']; 
                $groupe = $row['groupe']; 

                $sql_insert_end = "INSERT INTO end (student_fio, viewe_contract, pay, hards, name_tasks, quality, size_work, comments, name_practice, rate, groupe) VALUES ('$student_fio', '$viewe_contract', '$pay', '$hards', '$name_tasks', '$quality', '$size_work','$comments','$name_practice','$rate','$groupe')";
                if ($conn->query($sql_insert_end) === TRUE) {
                    echo "Данные успешно добавлены в БД";
                } else {
                    echo "Ошибка: " . $sql_insert_end . "<br>" . $conn->error;
                }
            }
            $sql_practic = "SELECT years,srok,number_order,view_practice,type_practice,code_direction,order_date FROM practice WHERE name_practice = '$name_practice'";
            $result_pactis = $conn->query($sql_practic); 
            if ($result_pactis->num_rows > 0) {
                // Массив для хранения данных
                $data_practic = [];
    
                // Получаем данные и добавляем их в массив
                while ($row_practic = $result_pactis->fetch_assoc()) {
                    $data_practic[] = $row_practic;
                }
    
                // Переносим данные в таблицу end
                foreach($data_practic as $row_practic) {
                    $years = $row_practic['years'];
                    $srok = $row_practic['srok'];
                    $number_order = $row_practic['number_order']; 
                    $view_practice = $row_practic['view_practice']; 
                    $type_practice = $row_practic['type_practice']; 
                    $code_direction = $row_practic['code_direction']; 
                    $order_date = $row_practic['order_date']; 
                    // $direction = $row_practic['direction']; 
                    
    
                    $sql_insert_endd = "UPDATE end SET years='$years', srok='$srok', number_order='$number_order', view_practice='$view_practice', type_practice='$type_practice', code_direction='$code_direction', order_date='$order_date' WHERE student_fio='$fio'";
                    if ($conn->query($sql_insert_endd) === TRUE) {
                        echo "Данные успешно добавлены в БД";
                    } else {
                        echo "Ошибка: " . $sql_insert_end . "<br>" . $conn->error;
                    }
                }
                

        } 
        // Запрос для получения названия направления
        $sql_direction = "SELECT name FROM direction WHERE groupe = ?";
        // Подготавливаем SQL выражение для обновления
        $stmt_update_end = $conn->prepare("UPDATE end SET direction = ? WHERE groupe = ?");

        // Подготавливаем SQL выражение для выборки
        $stmt_select_direction = $conn->prepare($sql_direction);
        $stmt_select_direction->bind_param("s", $groupe); // предположим, что $groupe уже имеет значение группы
        $stmt_select_direction->execute();
        $result_direction = $stmt_select_direction->get_result();

        if ($result_direction->num_rows > 0) {
            // Получаем значение названия направления
            $row_direction = $result_direction->fetch_assoc();
            $direction_name = $row_direction['name'];

            // Обновляем данные в таблице 'end'
            $stmt_update_end->bind_param("ss", $direction_name, $groupe);
            $stmt_update_end->execute();
            
            if ($stmt_update_end->affected_rows > 0) {
                echo "Данные успешно обновлены.";
            } else {
                echo "Ошибка при обновлении данных.";
            }
        } else {
            echo "Направление не найдено.";
        }
        $sql_place = "SELECT address, name_place FROM place_practice WHERE name_practice = '$name_practice'";
            $result_place = $conn->query($sql_place); 
            if ($result_place->num_rows > 0) {
                // Массив для хранения данных
                $data_place = [];
    
                // Получаем данные и добавляем их в массив
                while ($row_place = $result_place->fetch_assoc()) {
                    $data_place[] = $row_place;
                }
    
                // Переносим данные в таблицу end
                foreach($data_place as $row_place) {
                    $address = $row_place['address'];
                    $name_place = $row_place['name_place'];
                    
                    
    
                    $sql_insert_enddd = "UPDATE end SET address='$address', name_place='$name_place' WHERE student_fio='$fio'";
                    if ($conn->query($sql_insert_enddd) === TRUE) {
                        echo "Данные успешно добавлены в БД";
                    } else {
                        echo "Ошибка: " . $sql_insert_end . "<br>" . $conn->error;
                    }
                }
                
        }
        
        $sql_i = "SELECT name FROM institute WHERE direction = '$direction_name'";
            $result_i = $conn->query($sql_i); 
            if ($result_i->num_rows > 0) {
                // Массив для хранения данных
                $data_i = [];
    
                // Получаем данные и добавляем их в массив
                while ($row_i = $result_i->fetch_assoc()) {
                    $data_i[] = $row_i;
                }
    
                // Переносим данные в таблицу end
                foreach($data_i as $row_i) {
                    $name = $row_i['name'];
                    
                    
    
                    $sql_insert_endddd = "UPDATE end SET name='$name' WHERE student_fio='$fio'";
                    if ($conn->query($sql_insert_endddd) === TRUE) {
                        echo "Данные успешно добавлены в БД";
                    } else {
                        echo "Ошибка: " . $sql_insert_end . "<br>" . $conn->error;
                    }
                }
            }
            $sql_c = "SELECT class FROM groupe WHERE number = '$groupe'";
            $result_c = $conn->query($sql_c); 
            if ($result_c->num_rows > 0) {
                // Массив для хранения данных
                $data_c = [];
    
                // Получаем данные и добавляем их в массив
                while ($row_c = $result_c->fetch_assoc()) {
                    $data_c[] = $row_c;
                }
    
                // Переносим данные в таблицу end
                foreach($data_c as $row_c) {
                    $class = $row_c['class'];
                    
                    
    
                    $sql_insert_enddddd = "UPDATE end SET class='$class' WHERE student_fio='$fio'";
                    if ($conn->query($sql_insert_enddddd) === TRUE) {
                        echo "Данные успешно добавлены в БД";
                    } else {
                        echo "Ошибка: " . $sql_insert_end . "<br>" . $conn->error;
                    }
                }
            }

            $sql_ugra = "SELECT fio,post FROM boss_practice_ugrasu WHERE name_practice = '$name_practice'";
            $result_ugra = $conn->query($sql_ugra); 
            if ($result_ugra->num_rows > 0) {
                // Массив для хранения данных
                $data_ugra = [];
    
                // Получаем данные и добавляем их в массив
                while ($row_ugra = $result_ugra->fetch_assoc()) {
                    $data_ugra[] = $row_ugra;
                }
    
                // Переносим данные в таблицу end
                foreach($data_ugra as $row_ugra) {
                    $Ugra_boss_fio = $row_ugra['fio'];
                    $Ugra_boss_post = $row_ugra['post'];
                    
    
                    $sql_insert_endddddd = "UPDATE end SET Ugra_boss_fio='$Ugra_boss_fio', Ugra_boss_post='$Ugra_boss_post' WHERE student_fio='$fio'";
                    if ($conn->query($sql_insert_endddddd) === TRUE) {
                        echo "Данные успешно добавлены в БД";
                    } else {
                        echo "Ошибка: " . $sql_insert_end . "<br>" . $conn->error;
                    }
                }
            }
            $sql_company = "SELECT fio,post FROM boss_practice_ugrasu WHERE name_practice = '$name_practice'";
            $result_company = $conn->query($sql_company); 
            if ($result_company->num_rows > 0) {
                // Массив для хранения данных
                $data_company = [];
    
                // Получаем данные и добавляем их в массив
                while ($row_company = $result_company->fetch_assoc()) {
                    $data_company[] = $row_company;
                }
    
                // Переносим данные в таблицу end
                foreach($data_company as $row_company) {
                    $company_boss_fio = $row_company['fio'];
                    $company_boss_post = $row_company['post'];
                    
    
                    $sql_insert_endddddd = "UPDATE end SET company_boss_fio='$company_boss_fio', company_boss_post='$company_boss_post' WHERE student_fio='$fio'";
                    if ($conn->query($sql_insert_endddddd) === TRUE) {
                        echo "Данные успешно добавлены в БД";
                    } else {
                        echo "Ошибка: " . $sql_insert_end . "<br>" . $conn->error;
                    }
                }
            }
          
        } 
    }
}

$conn->close();
?>

<!DOCTYPE html>
<html>
<head>
    <title>Форма для ввода ФИО студента</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
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


<form method="post" action="">
<h2>Форма для ввода ФИО студента</h2>
    <label for="fio">ФИО студента:</label><br>
    <input type="text" id="fio" name="fio"><br><br>
    <input type="submit" value="Отправить">
</form>
</body>
</html>
