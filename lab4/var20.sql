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
-- База данных: `var20`
--

-- --------------------------------------------------------

--
-- Структура таблицы `book`
--

CREATE TABLE IF NOT EXISTS `book` (
  `id_book` int(5) NOT NULL AUTO_INCREMENT,
  `id_publishing_house` int(5) NOT NULL,
  `author` text NOT NULL,
  `name_book` text NOT NULL,
  `publishing_date` year(4) NOT NULL,
  PRIMARY KEY (`id_book`),
  UNIQUE KEY `id_book` (`id_book`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- Дамп данных таблицы `book`
--

INSERT INTO `book` (`id_book`, `id_publishing_house`, `author`, `name_book`, `publishing_date`) VALUES
(1, 3, 'C. S. Lewis', 'The Lion, the Witch and the Wardrobe', 1950),
(2, 3, 'C. S. Lewis', 'Prince Caspian: The Return to Narnia', 1951),
(3, 1, 'Nikolai Gogol', 'Dead Souls', 1942),
(4, 2, 'Leo Tolstoy', 'War and Peace', 1996),
(13, 2, 'C.S.Lewis', 'Narnia', 1950),
(14, 3, 'cor', 'noblesse', 2014);

-- --------------------------------------------------------

--
-- Структура таблицы `book_copy`
--

CREATE TABLE IF NOT EXISTS `book_copy` (
  `id_book` int(5) NOT NULL AUTO_INCREMENT,
  `id_publishing_house` int(5) NOT NULL,
  `author` text NOT NULL,
  `name_book` text NOT NULL,
  `publishing_date` year(4) NOT NULL,
  PRIMARY KEY (`id_book`),
  UNIQUE KEY `id_book` (`id_book`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=16 ;

--
-- Дамп данных таблицы `book_copy`
--

INSERT INTO `book_copy` (`id_book`, `id_publishing_house`, `author`, `name_book`, `publishing_date`) VALUES
(8, 1, 'gffd', 'fdvd', 1945),
(9, 3, 'C. S. Lewis', 'The Lion, the Witch and the Wardrobe', 1950),
(10, 3, 'C. S. Lewis', 'Prince Caspian: The Return to Narnia', 1950),
(11, 1, 'Nikolai Gogol', 'Dead Souls', 1945),
(12, 1, 'Leo Tolstoy', 'War and Peace', 1945),
(13, 1, 'C.S.Lewis', 'Narnia', 1945),
(14, 1, 'Leo Tolstoy', 'noblesse', 1945);

-- --------------------------------------------------------

--
-- Структура таблицы `cheque`
--

CREATE TABLE IF NOT EXISTS `cheque` (
  `id_cheque` int(5) NOT NULL AUTO_INCREMENT,
  `id_client` int(5) NOT NULL,
  `id_book` int(5) NOT NULL,
  `id_shops` int(5) NOT NULL,
  `amount` int(10) NOT NULL,
  PRIMARY KEY (`id_cheque`),
  UNIQUE KEY `id_cheque` (`id_cheque`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Дамп данных таблицы `cheque`
--

INSERT INTO `cheque` (`id_cheque`, `id_client`, `id_book`, `id_shops`, `amount`) VALUES
(1, 2, 2, 1, 1000),
(2, 2, 2, 2, 555),
(3, 4, 1, 3, 756),
(4, 3, 4, 3, 453);

-- --------------------------------------------------------

--
-- Структура таблицы `client`
--

CREATE TABLE IF NOT EXISTS `client` (
  `id_cl` int(5) NOT NULL AUTO_INCREMENT,
  `surname` text NOT NULL,
  `mobilpe_phone` bigint(13) NOT NULL,
  PRIMARY KEY (`id_cl`),
  UNIQUE KEY `id_cl` (`id_cl`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Дамп данных таблицы `client`
--

INSERT INTO `client` (`id_cl`, `surname`, `mobilpe_phone`) VALUES
(1, 'Nikandrova', 89177189818),
(2, 'Nicandrova', 89027458355),
(3, 'Sturlson', 87879045467),
(4, 'Archeri', 85673426732);

-- --------------------------------------------------------

--
-- Структура таблицы `contract`
--

CREATE TABLE IF NOT EXISTS `contract` (
  `id_contract` int(5) NOT NULL AUTO_INCREMENT,
  `id_book` int(5) NOT NULL,
  `id_shop` int(5) NOT NULL,
  `amount_contract` int(15) NOT NULL,
  `date_conclusion` date NOT NULL,
  UNIQUE KEY `id_contract` (`id_contract`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Дамп данных таблицы `contract`
--

INSERT INTO `contract` (`id_contract`, `id_book`, `id_shop`, `amount_contract`, `date_conclusion`) VALUES
(1, 2, 1, 15000, '2015-09-15'),
(2, 2, 2, 45678, '2017-04-17'),
(3, 1, 3, 34009, '2016-05-13'),
(4, 4, 3, 1000000, '2015-10-13');

-- --------------------------------------------------------

--
-- Структура таблицы `publishing_house`
--

CREATE TABLE IF NOT EXISTS `publishing_house` (
  `id_publishing_house` int(5) NOT NULL AUTO_INCREMENT,
  `name_publishing_house` text NOT NULL,
  `address_publishing_house` text NOT NULL,
  UNIQUE KEY `id_publishing_house` (`id_publishing_house`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Дамп данных таблицы `publishing_house`
--

INSERT INTO `publishing_house` (`id_publishing_house`, `name_publishing_house`, `address_publishing_house`) VALUES
(1, 'Eksmo', 'Moscow'),
(2, 'Eksmo', 'Kazan'),
(3, 'Classic ABC', 'Moscow'),
(4, 'Russian Herald', 'St.Petersburg');

-- --------------------------------------------------------

--
-- Структура таблицы `shop`
--

CREATE TABLE IF NOT EXISTS `shop` (
  `id_shop` int(5) NOT NULL AUTO_INCREMENT,
  `name_shop` text NOT NULL,
  `address_shop` text NOT NULL,
  UNIQUE KEY `id_shop` (`id_shop`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Дамп данных таблицы `shop`
--

INSERT INTO `shop` (`id_shop`, `name_shop`, `address_shop`) VALUES
(1, 'The World of Books', 'Yoshkar-Ola'),
(2, 'Good books', 'Kazan'),
(3, 'Torch', 'Moscow'),
(4, 'Shakespeare and Company', 'Paris');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
