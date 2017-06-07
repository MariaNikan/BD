-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1
-- Время создания: Апр 30 2017 г., 11:03
-- Версия сервера: 5.6.17
-- Версия PHP: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `lab5_var17`
--

-- --------------------------------------------------------

--
-- Структура таблицы `children`
--

CREATE TABLE IF NOT EXISTS `children` (
  `id_child` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_parent` int(10) unsigned NOT NULL,
  `name_child` text NOT NULL,
  `age` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_child`),
  KEY `age` (`age`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Дамп данных таблицы `children`
--

INSERT INTO `children` (`id_child`, `id_parent`, `name_child`, `age`) VALUES
(1, 2, 'Maria', 13),
(2, 1, 'Lev', 4),
(3, 1, 'Marina', 9),
(4, 4, 'Ivan', 15),
(5, 3, 'Fruit', 4),
(6, 4, 'Squalo', 16);

-- --------------------------------------------------------

--
-- Структура таблицы `disease`
--

CREATE TABLE IF NOT EXISTS `disease` (
  `id_disease` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name_disease` text CHARACTER SET utf8 NOT NULL,
  `degree_danger` text CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id_disease`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Дамп данных таблицы `disease`
--

INSERT INTO `disease` (`id_disease`, `name_disease`, `degree_danger`) VALUES
(1, 'esotropia', ''),
(2, 'measles', 'medium'),
(3, 'polio', ''),
(4, 'hepatitis_b', 'medium'),
(5, 'flu', 'hard'),
(6, 'hepatitis_a', 'easy');

-- --------------------------------------------------------

--
-- Структура таблицы `hospitals`
--

CREATE TABLE IF NOT EXISTS `hospitals` (
  `id_hospital` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name_hospital` text NOT NULL,
  `city` text NOT NULL,
  PRIMARY KEY (`id_hospital`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Дамп данных таблицы `hospitals`
--

INSERT INTO `hospitals` (`id_hospital`, `name_hospital`, `city`) VALUES
(1, 'republican hospital', 'Yoshkar-Ola'),
(2, 'city hospital', 'Yoshkar-Ola'),
(3, 'Private clinic', 'Kazan'),
(4, 'International polyclinic', 'Moscow');

-- --------------------------------------------------------

--
-- Структура таблицы `made_vaccinations`
--

CREATE TABLE IF NOT EXISTS `made_vaccinations` (
  `id_made_vaccinations` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_child` int(10) unsigned NOT NULL,
  `id_vaccination` int(10) unsigned NOT NULL,
  `id_hospital` int(10) unsigned NOT NULL,
  `date` date NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`id_made_vaccinations`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Дамп данных таблицы `made_vaccinations`
--

INSERT INTO `made_vaccinations` (`id_made_vaccinations`, `id_child`, `id_vaccination`, `id_hospital`, `date`, `amount`) VALUES
(1, 2, 4, 1, '2017-04-02', 1000),
(2, 1, 1, 3, '2016-04-13', 500),
(3, 5, 3, 2, '2015-01-08', 750),
(4, 4, 4, 2, '2004-04-04', 1200),
(5, 6, 4, 4, '2017-04-09', 800),
(6, 3, 1, 1, '2017-04-05', 500);

-- --------------------------------------------------------

--
-- Структура таблицы `parents`
--

CREATE TABLE IF NOT EXISTS `parents` (
  `id_parent` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name_parent` text NOT NULL,
  `surname_parent` text NOT NULL,
  PRIMARY KEY (`id_parent`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Дамп данных таблицы `parents`
--

INSERT INTO `parents` (`id_parent`, `name_parent`, `surname_parent`) VALUES
(1, 'Lyudmila', 'Archeri'),
(2, 'Lev', 'Nikandrov'),
(3, 'Fruit', 'Fruits'),
(4, 'Aleksandr', 'Petrov');

-- --------------------------------------------------------

--
-- Структура таблицы `vaccinations`
--

CREATE TABLE IF NOT EXISTS `vaccinations` (
  `id_vaccination` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_desease` int(10) unsigned NOT NULL,
  `name_vaccination` text NOT NULL,
  PRIMARY KEY (`id_vaccination`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Дамп данных таблицы `vaccinations`
--

INSERT INTO `vaccinations` (`id_vaccination`, `id_desease`, `name_vaccination`) VALUES
(1, 3, 'kpk'),
(2, 2, 'kpk'),
(3, 1, 'simple vaccination'),
(4, 4, 'special vaccination\r\n');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
