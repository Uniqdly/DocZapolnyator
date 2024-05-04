-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Май 04 2024 г., 11:12
-- Версия сервера: 8.0.30
-- Версия PHP: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `word`
--

-- --------------------------------------------------------

--
-- Структура таблицы `boss_huisos`
--

CREATE TABLE `boss_huisos` (
  `id` bigint UNSIGNED NOT NULL,
  `fio` varchar(255) DEFAULT NULL,
  `post` varchar(255) DEFAULT NULL,
  `name_practice` varchar(255) DEFAULT NULL,
  `org` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `boss_huisos`
--

INSERT INTO `boss_huisos` (`id`, `fio`, `post`, `name_practice`, `org`) VALUES
(1, 'Змеев Денис Олегович', 'Доцент', '', 'От ЮГУ'),
(4, 'Выходцев Александр Михайлович', 'Преподаватель', 'Дело в Казахстане', 'От ЮГУ'),
(5, 'Змеев Денис Олегович', 'Доцент', 'Практика ЮГУ 2024', 'От ЮГУ'),
(6, 'Самарин Валерий Анатольевич', 'Доцент', 'Практика ЮГУ 2024', 'От ЮГУ'),
(7, '', '', '', 'Дениска'),
(8, 'Змеев Денис Олегович ', 'Доцент', 'Разработка Web-приложений с использованием баз данных', ''),
(9, '', '', '', ''),
(10, 'Змеев Денис Олегович ', 'Доцент', 'Разработка Web-приложений с использованием баз данных', ''),
(11, 'Змеев Денис Олегович ', 'Доцент', 'Разработка Web-приложений с использованием баз данных', '');

-- --------------------------------------------------------

--
-- Структура таблицы `boss_practice_company`
--

CREATE TABLE `boss_practice_company` (
  `fio` varchar(255) DEFAULT NULL,
  `post` varchar(255) DEFAULT NULL,
  `name_practice` varchar(255) DEFAULT NULL,
  `id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `boss_practice_company`
--

INSERT INTO `boss_practice_company` (`fio`, `post`, `name_practice`, `id`) VALUES
('Змеев Денис Олегович ', 'Доцент', 'Практика ЮГУ 2024', 6),
('', '', '', 7),
('Самарин Валерий Анатольевич ', 'Доцент', 'Разработка Web-приложений с использованием баз данных', 8),
('', '', '', 9),
('Самарин Валерий Анатольевич ', 'Доцент', 'Разработка Web-приложений с использованием баз данных', 10),
('Самарин Валерий Анатольевич ', 'Доцент', 'Разработка Web-приложений с использованием баз данных', 11);

-- --------------------------------------------------------

--
-- Структура таблицы `boss_practice_org_company`
--

CREATE TABLE `boss_practice_org_company` (
  `fio` varchar(255) DEFAULT NULL,
  `post` varchar(255) DEFAULT NULL,
  `name_practice` varchar(255) DEFAULT NULL,
  `id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `boss_practice_org_company`
--

INSERT INTO `boss_practice_org_company` (`fio`, `post`, `name_practice`, `id`) VALUES
('Змеев Денис Олегович ', 'Доцент', 'Практика ЮГУ 2024', 1),
('', '', '', 2),
('Дениска', 'Пиписка', '', 3);

-- --------------------------------------------------------

--
-- Структура таблицы `boss_practice_ugrasu`
--

CREATE TABLE `boss_practice_ugrasu` (
  `fio` varchar(255) DEFAULT NULL,
  `post` varchar(255) DEFAULT NULL,
  `name_practice` varchar(255) DEFAULT NULL,
  `id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `boss_practice_ugrasu`
--

INSERT INTO `boss_practice_ugrasu` (`fio`, `post`, `name_practice`, `id`) VALUES
('Змеев Денис Олегович', 'Доцент', 'Практика ЮГУ 2024', 37),
('Змеев Денис Олегович', 'От ЮГУ', '', 38),
('', '', '', 39),
('Змеев Денис Олегович ', 'Доцент', 'Разработка Web-приложений с использованием баз данных', 40),
('', '', '', 41),
('Змеев Денис Олегович ', 'Доцент', 'Разработка Web-приложений с использованием баз данных', 42),
('Змеев Денис Олегович ', 'Доцент', 'Разработка Web-приложений с использованием баз данных', 43);

-- --------------------------------------------------------

--
-- Структура таблицы `comments`
--

CREATE TABLE `comments` (
  `student_fio` varchar(255) DEFAULT NULL,
  `text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `direction`
--

CREATE TABLE `direction` (
  `name` varchar(255) DEFAULT NULL,
  `groupe` varchar(255) DEFAULT NULL,
  `id` bigint UNSIGNED NOT NULL,
  `code` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `direction`
--

INSERT INTO `direction` (`name`, `groupe`, `id`, `code`) VALUES
('Информатика и вычислительная техника', '1121б', 53, '9.03.01'),
('Программная инженерия', '1521б', 54, '9.03.02'),
('Информатика и вычислительная техника', '1121б', 55, '9.03.01');

-- --------------------------------------------------------

--
-- Структура таблицы `end`
--

CREATE TABLE `end` (
  `id` bigint UNSIGNED NOT NULL,
  `student_fio` varchar(255) DEFAULT NULL,
  `viewe_contract` varchar(255) DEFAULT NULL,
  `pay` varchar(255) DEFAULT NULL,
  `hards` text,
  `name_tasks` varchar(255) DEFAULT NULL,
  `quality` text,
  `size_work` text,
  `comments` text,
  `name_practice` varchar(255) DEFAULT NULL,
  `rate` varchar(255) DEFAULT NULL,
  `groupe` varchar(255) DEFAULT NULL,
  `years` varchar(255) DEFAULT NULL,
  `srok` varchar(255) DEFAULT NULL,
  `number_order` varchar(255) DEFAULT NULL,
  `view_practice` varchar(255) DEFAULT NULL,
  `type_practice` varchar(255) DEFAULT NULL,
  `code_direction` varchar(255) DEFAULT NULL,
  `order_date` varchar(255) DEFAULT NULL,
  `direction` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `name_place` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `class` int DEFAULT NULL,
  `Ugra_boss_fio` varchar(255) DEFAULT NULL,
  `Ugra_boss_post` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `company_boss_fio` varchar(255) DEFAULT NULL,
  `company_boss_post` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `end`
--

INSERT INTO `end` (`id`, `student_fio`, `viewe_contract`, `pay`, `hards`, `name_tasks`, `quality`, `size_work`, `comments`, `name_practice`, `rate`, `groupe`, `years`, `srok`, `number_order`, `view_practice`, `type_practice`, `code_direction`, `order_date`, `direction`, `address`, `name_place`, `name`, `class`, `Ugra_boss_fio`, `Ugra_boss_post`, `company_boss_fio`, `company_boss_post`) VALUES
(115, 'Тешкина Анастасия Павловна ', 'Краткосрочный', 'Нет', 'с высокой точностью, тщательностью и вниманием к деталям. Студент проявил способность к самостоятельной работе и решению задач, что позволило ему эффективно выполнять поставленные задачи. ', '', 'продемонстрировал высокий профессионализм, ответственность и отличные навыки коммуникации', 'в полном объёме', 'нет', 'Разработка Web-приложений с использованием баз данных', 'Отлично', '1121б', '2024', 'с 22.04.2024 по 18.05.2024', '№2-222  ', 'стажировка', 'обучение', '9.03.02', '06.03.2024', 'Информатика и вычислительная техника', 'Чехова 16', 'Югорский Государственный Университет', 'Инженерная школа цифровых технологий ', 2, 'Змеев Денис Олегович ', 'Доцент', 'Змеев Денис Олегович ', 'Доцент'),
(116, 'Маслаков Юрий Алексеевич', 'Краткосрочный', 'Нет', 'с высокой точностью, тщательностью и вниманием к деталям. Студент проявил способность к самостоятельной работе и решению задач, что позволило ему эффективно выполнять поставленные задачи. ', '', 'продемонстрировал высокий профессионализм, ответственность и отличные навыки коммуникации', 'в полном объёме', 'никаких', 'Разработка Web-приложений с использованием баз данных', 'Отлично', '1121б', '2024', 'с 22.04.2024 по 18.05.2024', '№2-222  ', 'стажировка', 'обучение', '9.03.01', '06.03.2024', 'Информатика и вычислительная техника', 'Чехова 16', 'Югорский Государственный Университет', 'Инженерная школа цифровых технологий ', 2, 'Змеев Денис Олегович ', 'Доцент', 'Змеев Денис Олегович ', 'Доцент');

-- --------------------------------------------------------

--
-- Структура таблицы `groupe`
--

CREATE TABLE `groupe` (
  `number` varchar(255) DEFAULT NULL,
  `class` int DEFAULT NULL,
  `student` varchar(255) DEFAULT NULL,
  `id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `groupe`
--

INSERT INTO `groupe` (`number`, `class`, `student`, `id`) VALUES
('1121б', 2, NULL, 55),
('1521б', 2, NULL, 56),
('1121б', 2, NULL, 57);

-- --------------------------------------------------------

--
-- Структура таблицы `hards`
--

CREATE TABLE `hards` (
  `student_fio` varchar(255) DEFAULT NULL,
  `text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `institute`
--

CREATE TABLE `institute` (
  `name` varchar(255) DEFAULT NULL,
  `direction` varchar(255) DEFAULT NULL,
  `id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `institute`
--

INSERT INTO `institute` (`name`, `direction`, `id`) VALUES
('Инженерная школа цифровых технологий ', 'Информатика и вычислительная техника', 58),
('Инженерная школа цифровых технологий ', 'Программная инженерия', 59),
('Инженерная школа цифровых технологий ', 'Информатика и вычислительная техника', 60);

-- --------------------------------------------------------

--
-- Структура таблицы `opop`
--

CREATE TABLE `opop` (
  `fio` varchar(255) DEFAULT NULL,
  `post` varchar(255) DEFAULT NULL,
  `direction` varchar(255) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `opop`
--

INSERT INTO `opop` (`fio`, `post`, `direction`, `user_id`, `id`) VALUES
('Самарин Валерий Анатольевич', 'Доцент', 'Информатика и вычислительная техника', NULL, 9),
('Самарин Валерий Анатольевич', 'Доцент', 'Программная инженерия', NULL, 10),
('Самарин Валерий Анатольевич', 'Доцент', 'Информатика и вычислительная техника', NULL, 11);

-- --------------------------------------------------------

--
-- Структура таблицы `orderok`
--

CREATE TABLE `orderok` (
  `id` int NOT NULL,
  `fio` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `pay`
--

CREATE TABLE `pay` (
  `student_fio` varchar(255) DEFAULT NULL,
  `viewe` varchar(255) DEFAULT NULL,
  `id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `place_practice`
--

CREATE TABLE `place_practice` (
  `address` varchar(255) DEFAULT NULL,
  `name_place` varchar(255) DEFAULT NULL,
  `name_practice` varchar(255) DEFAULT NULL,
  `id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `place_practice`
--

INSERT INTO `place_practice` (`address`, `name_place`, `name_practice`, `id`) VALUES
('Чехова 16', 'Югорский Государственный Университет', 'Разработка Web-приложений с использованием баз данных', 15),
('', '', '', 16),
('Чехова 16', 'Югорский Государственный Университет', 'Разработка Web-приложений с использованием баз данных', 17),
('Чехова 16', 'Югорский Государственный Университет', 'Разработка Web-приложений с использованием баз данных', 18);

-- --------------------------------------------------------

--
-- Структура таблицы `practice`
--

CREATE TABLE `practice` (
  `years` varchar(255) DEFAULT NULL,
  `srok` varchar(255) DEFAULT NULL,
  `name_practice` varchar(255) DEFAULT NULL,
  `number_order` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `groupe` varchar(255) DEFAULT NULL,
  `id` bigint UNSIGNED NOT NULL,
  `view_practice` varchar(255) DEFAULT NULL,
  `type_practice` varchar(255) DEFAULT NULL,
  `code_direction` varchar(255) DEFAULT NULL,
  `order_date` varchar(255) DEFAULT NULL,
  `direction` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `practice`
--

INSERT INTO `practice` (`years`, `srok`, `name_practice`, `number_order`, `groupe`, `id`, `view_practice`, `type_practice`, `code_direction`, `order_date`, `direction`) VALUES
('2024', 'с 22.04.2024 по 18.05.2024', 'Разработка Web-приложений с использованием баз данных', '№2-222  ', '1121б', 16, 'стажировка', 'обучение', '9.03.01', '06.03.2024', NULL),
('', '', '', '', '', 17, 'стажировка', 'стажировка', '', '', NULL),
('2024', 'с 22.04.2024 по 18.05.2024', 'Разработка Web-приложений с использованием баз данных', '№2-222  ', '1521б', 18, 'стажировка', 'обучение', '9.03.02', '06.03.2024', NULL),
('2024', 'с 22.04.2024 по 18.05.2024', 'Разработка Web-приложений с использованием баз данных', '№2-222  ', '1121б', 19, 'стажировка', 'обучение', '9.03.01', '06.03.2024', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `practice_student`
--

CREATE TABLE `practice_student` (
  `student_fio` varchar(255) DEFAULT NULL,
  `viewe_contract` varchar(255) DEFAULT NULL,
  `pay` varchar(255) DEFAULT NULL,
  `hards` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `name_tasks` varchar(255) DEFAULT NULL,
  `quality` text,
  `size_work` text,
  `comments` text,
  `name_practice` varchar(255) DEFAULT NULL,
  `rate` varchar(255) DEFAULT NULL,
  `id` bigint UNSIGNED NOT NULL,
  `groupe` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `practice_student`
--

INSERT INTO `practice_student` (`student_fio`, `viewe_contract`, `pay`, `hards`, `name_tasks`, `quality`, `size_work`, `comments`, `name_practice`, `rate`, `id`, `groupe`) VALUES
('Тешкина Анастасия Павловна ', 'Краткосрочный', 'Нет', 'с высокой точностью, тщательностью и вниманием к деталям. Студент проявил способность к самостоятельной работе и решению задач, что позволило ему эффективно выполнять поставленные задачи. ', '', 'продемонстрировал высокий профессионализм, ответственность и отличные навыки коммуникации', 'в полном объёме', 'нет', 'Разработка Web-приложений с использованием баз данных', 'Отлично', 5, '1121б'),
('Попова Владислава Батьковна', 'Краткосрочный', 'Нет', 'с высокой точностью, тщательностью и вниманием к деталям. Студент проявил способность к самостоятельной работе и решению задач, что позволило ему эффективно выполнять поставленные задачи. ', '', 'продемонстрировал высокий профессионализм, ответственность и отличные навыки коммуникации', 'в полном объёме', 'нет', 'Разработка Web-приложений с использованием баз данных', 'Отлично', 6, '1521б'),
('Маслаков Юрий Алексеевич', 'Краткосрочный', 'Нет', 'с высокой точностью, тщательностью и вниманием к деталям. Студент проявил способность к самостоятельной работе и решению задач, что позволило ему эффективно выполнять поставленные задачи. ', '', 'продемонстрировал высокий профессионализм, ответственность и отличные навыки коммуникации', 'в полном объёме', 'никаких', 'Разработка Web-приложений с использованием баз данных', 'Отлично', 7, '1121б');

-- --------------------------------------------------------

--
-- Структура таблицы `quality`
--

CREATE TABLE `quality` (
  `student_fio` varchar(255) DEFAULT NULL,
  `text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `size_work`
--

CREATE TABLE `size_work` (
  `student_fio` varchar(255) DEFAULT NULL,
  `text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `student`
--

CREATE TABLE `student` (
  `fio` varchar(255) DEFAULT NULL,
  `id` bigint UNSIGNED NOT NULL,
  `number_groupe` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `student`
--

INSERT INTO `student` (`fio`, `id`, `number_groupe`) VALUES
('Тешкина Анастасия Павловна ', 11, '1121б'),
('Попова Владислава Батьковна', 12, '1521б'),
('Маслаков Юрий Алексеевич', 13, '1121б'),
('Голошубин Александр Владимирович', 14, '1121б'),
('Кокорина Елизавета Алексеевна', 15, '1121б'),
('Корчагина Елизавета Андреевна', 16, '1121б'),
('Майковский Даниил Евгеньевич', 17, '1121б'),
('Малахин Антон Сергеевич', 18, '1121б'),
('Малых Кирилл Алексеевич', 19, '1121б'),
('Мельник Андрей Алексеевич', 20, '1121б'),
('Невьянцев Александр Михайлович', 21, '1121б'),
('Овчинников Леонид Викторович', 22, '1121б'),
('Павловский Никита Вячеславович', 23, '1121б'),
('Петрушов Александр Сергеевич', 24, '1121б'),
('Пономаренко Егор Сергеевич', 25, '1121б'),
('Прошенкова Виталия Витальевна', 26, '1121б'),
('Растокин Максим Артёмович', 27, '1121б'),
('Рахматуллина Лия Рамильевна', 28, '1121б'),
('Розмахов Илья Владимирович', 29, '1121б'),
('Рычко Иван Евгеньевич', 30, '1121б'),
('Сиваков Вадим Александрович', 31, '1121б'),
('Сирченко Михаил Сергеевич', 32, '1121б'),
('Утев Даниил Антонович', 33, '1121б'),
('Александров Александр Сергеевич', 34, '1121б'),
('Богданов Никита Батюшкин', 35, '1121б');

-- --------------------------------------------------------

--
-- Структура таблицы `tasks`
--

CREATE TABLE `tasks` (
  `student_fio` varchar(255) DEFAULT NULL,
  `name_task` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `datee` varchar(255) DEFAULT NULL,
  `id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `tasks`
--

INSERT INTO `tasks` (`student_fio`, `name_task`, `datee`, `id`) VALUES
('Тешкина Анастасия Павловна ', 'сборка всех страниц в один полноценный проект', '26/04/2024 08:17 AM', 12),
('Тешкина Анастасия Павловна ', 'Оформить дизайн всех страниц', '26/04/2024 08:13 AM', 13),
('Маслаков Юрий Алексеевич', 'Заняться авторизацией пользователей и сотрудников', '26/04/2024 08:10 AM', 14),
('Тешкина Анастасия Павловна ', 'Создаю страницу для менеджера', '26/04/2024 08:12 AM', 15),
('Тешкина Анастасия Павловна ', 'создание странички для курьера', '26/04/2024 08:12 AM', 16),
('Маслаков Юрий Алексеевич', 'доработка базы данных', '26/04/2024 08:11 AM', 17),
('Тешкина Анастасия Павловна ', 'Добавление ингредиентов в поле кухни', '26/04/2024 08:11 AM', 18),
('Тешкина Анастасия Павловна ', 'Ингридиенты', '23/04/2024 06:51 AM', 19),
('Маслаков Юрий Алексеевич', 'Блюда', '26/04/2024 08:15 AM', 20),
('Тешкина Анастасия Павловна ', 'Создание странички для кухни', '24/04/2024 06:18 AM', 21),
('Маслаков Юрий Алексеевич', 'Создание страницы пользователя', '26/04/2024 08:09 AM', 22),
('Тешкина Анастасия Павловна ', 'Создание базы данных', '24/04/2024 06:19 AM', 23),
('Маслаков Юрий Алексеевич', 'Создать диаграмму БД', '23/04/2024 06:12 AM', 24);

-- --------------------------------------------------------

--
-- Структура таблицы `view_contract`
--

CREATE TABLE `view_contract` (
  `student_fio` varchar(255) DEFAULT NULL,
  `viewe` varchar(255) DEFAULT NULL,
  `id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `vse`
--

CREATE TABLE `vse` (
  `id` int NOT NULL,
  `sum_student` int DEFAULT NULL,
  `plase_practice` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `boss_org` varchar(255) DEFAULT NULL,
  `opop` varchar(255) DEFAULT NULL,
  `not_st` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `vse`
--

INSERT INTO `vse` (`id`, `sum_student`, `plase_practice`, `city`, `boss_org`, `opop`, `not_st`) VALUES
(1, 24, 'ЮГУ', 'г. Ханты-Мансийск', 'Д.О. Змеев', 'В.А. Самарин', 6);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `boss_huisos`
--
ALTER TABLE `boss_huisos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Индексы таблицы `boss_practice_company`
--
ALTER TABLE `boss_practice_company`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Индексы таблицы `boss_practice_org_company`
--
ALTER TABLE `boss_practice_org_company`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Индексы таблицы `boss_practice_ugrasu`
--
ALTER TABLE `boss_practice_ugrasu`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Индексы таблицы `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Индексы таблицы `direction`
--
ALTER TABLE `direction`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Индексы таблицы `end`
--
ALTER TABLE `end`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Индексы таблицы `groupe`
--
ALTER TABLE `groupe`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Индексы таблицы `hards`
--
ALTER TABLE `hards`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Индексы таблицы `institute`
--
ALTER TABLE `institute`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Индексы таблицы `opop`
--
ALTER TABLE `opop`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Индексы таблицы `orderok`
--
ALTER TABLE `orderok`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `pay`
--
ALTER TABLE `pay`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Индексы таблицы `place_practice`
--
ALTER TABLE `place_practice`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Индексы таблицы `practice`
--
ALTER TABLE `practice`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Индексы таблицы `practice_student`
--
ALTER TABLE `practice_student`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Индексы таблицы `quality`
--
ALTER TABLE `quality`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Индексы таблицы `size_work`
--
ALTER TABLE `size_work`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Индексы таблицы `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Индексы таблицы `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Индексы таблицы `view_contract`
--
ALTER TABLE `view_contract`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Индексы таблицы `vse`
--
ALTER TABLE `vse`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `boss_huisos`
--
ALTER TABLE `boss_huisos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT для таблицы `boss_practice_company`
--
ALTER TABLE `boss_practice_company`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT для таблицы `boss_practice_org_company`
--
ALTER TABLE `boss_practice_org_company`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `boss_practice_ugrasu`
--
ALTER TABLE `boss_practice_ugrasu`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT для таблицы `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT для таблицы `direction`
--
ALTER TABLE `direction`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT для таблицы `end`
--
ALTER TABLE `end`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=117;

--
-- AUTO_INCREMENT для таблицы `groupe`
--
ALTER TABLE `groupe`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT для таблицы `hards`
--
ALTER TABLE `hards`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `institute`
--
ALTER TABLE `institute`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT для таблицы `opop`
--
ALTER TABLE `opop`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT для таблицы `orderok`
--
ALTER TABLE `orderok`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `pay`
--
ALTER TABLE `pay`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `place_practice`
--
ALTER TABLE `place_practice`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT для таблицы `practice`
--
ALTER TABLE `practice`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT для таблицы `practice_student`
--
ALTER TABLE `practice_student`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `quality`
--
ALTER TABLE `quality`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `size_work`
--
ALTER TABLE `size_work`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `student`
--
ALTER TABLE `student`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT для таблицы `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT для таблицы `view_contract`
--
ALTER TABLE `view_contract`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `vse`
--
ALTER TABLE `vse`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
