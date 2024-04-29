-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Апр 29 2024 г., 13:19
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
-- Структура таблицы `boss_practice_company`
--

CREATE TABLE `boss_practice_company` (
  `fio` varchar(255) DEFAULT NULL,
  `post` varchar(255) DEFAULT NULL,
  `name_practice` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `boss_practice_org_company`
--

CREATE TABLE `boss_practice_org_company` (
  `fio` varchar(255) DEFAULT NULL,
  `post` varchar(255) DEFAULT NULL,
  `name_practice` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `boss_practice_ugrasu`
--

CREATE TABLE `boss_practice_ugrasu` (
  `fio` varchar(255) DEFAULT NULL,
  `post` varchar(255) DEFAULT NULL,
  `name_practice` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `comments`
--

CREATE TABLE `comments` (
  `student_fio` varchar(255) DEFAULT NULL,
  `text_` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `direction`
--

CREATE TABLE `direction` (
  `name` varchar(255) DEFAULT NULL,
  `groupe` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `groupe`
--

CREATE TABLE `groupe` (
  `number` varchar(255) DEFAULT NULL,
  `class` int DEFAULT NULL,
  `student` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `hards`
--

CREATE TABLE `hards` (
  `student_fio` varchar(255) DEFAULT NULL,
  `text_` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `institute`
--

CREATE TABLE `institute` (
  `name` varchar(255) DEFAULT NULL,
  `direction` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `opop`
--

CREATE TABLE `opop` (
  `fio` varchar(255) DEFAULT NULL,
  `post` varchar(255) DEFAULT NULL,
  `direction` varchar(255) DEFAULT NULL,
  `user_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `pay`
--

CREATE TABLE `pay` (
  `student_fio` varchar(255) DEFAULT NULL,
  `viewe` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `place_practice`
--

CREATE TABLE `place_practice` (
  `address` varchar(255) DEFAULT NULL,
  `name_place` varchar(255) DEFAULT NULL,
  `name_practice` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `practice`
--

CREATE TABLE `practice` (
  `years` int DEFAULT NULL,
  `srok` varchar(255) DEFAULT NULL,
  `name_practice` varchar(255) DEFAULT NULL,
  `namber_date_order` varchar(255) DEFAULT NULL,
  `groupe` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `practice_student`
--

CREATE TABLE `practice_student` (
  `id` int DEFAULT NULL,
  `student_fio` varchar(255) DEFAULT NULL,
  `viewe_contract` varchar(255) DEFAULT NULL,
  `pay` varchar(255) DEFAULT NULL,
  `hards` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `name_tasks` varchar(255) DEFAULT NULL,
  `quality` text,
  `size_work` text,
  `comments` text,
  `name_practice` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `quality`
--

CREATE TABLE `quality` (
  `student_fio` varchar(255) DEFAULT NULL,
  `text_` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `size_work`
--

CREATE TABLE `size_work` (
  `student_fio` varchar(255) DEFAULT NULL,
  `text_` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `student`
--

CREATE TABLE `student` (
  `fio` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `tasks`
--

CREATE TABLE `tasks` (
  `student_fio` varchar(255) DEFAULT NULL,
  `name_task` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `datee` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `type_practice`
--

CREATE TABLE `type_practice` (
  `type` varchar(255) DEFAULT NULL,
  `name_practice` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `login` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `view_contract`
--

CREATE TABLE `view_contract` (
  `student_fio` varchar(255) DEFAULT NULL,
  `viewe` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `view_practice`
--

CREATE TABLE `view_practice` (
  `name_practice` varchar(255) DEFAULT NULL,
  `viewe` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
