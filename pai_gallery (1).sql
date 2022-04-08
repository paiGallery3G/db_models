-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 08 Kwi 2022, 04:46
-- Wersja serwera: 10.4.17-MariaDB
-- Wersja PHP: 7.3.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `pai_gallery`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `album`
--

CREATE TABLE `album` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(64) DEFAULT NULL,
  `author` varchar(64) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `album`
--

INSERT INTO `album` (`id`, `title`, `author`, `description`, `created_at`) VALUES
(1, 'Wakacje', 'John Doe', 'Album ze zdjęciami z wakacji 2004', '2001-02-01'),
(2, 'Wakacje', 'John Doe', 'Album ze zdjęciami z wakacji 2004', '2001-02-01');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `album_tag`
--

CREATE TABLE `album_tag` (
  `album_id` bigint(20) UNSIGNED NOT NULL,
  `tag_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `album_tag`
--

INSERT INTO `album_tag` (`album_id`, `tag_id`) VALUES
(2, 3);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Zrzut danych tabeli `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20220403154310', '2022-04-03 18:53:10', 117);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `image`
--

CREATE TABLE `image` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(64) DEFAULT NULL,
  `ftype` varchar(32) DEFAULT NULL,
  `author` varchar(64) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `album_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `image`
--

INSERT INTO `image` (`id`, `title`, `ftype`, `author`, `description`, `created_at`, `album_id`) VALUES
(1, 'Wujek w wodzie', 'jpg', 'Tata', 'Wujek tonie w wodzie', '2002-02-22', 1),
(3, 'Grill', 'jpg', 'Tata', 'Wieczorny grill', '2022-04-08', 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `image_tag`
--

CREATE TABLE `image_tag` (
  `image_id` bigint(20) UNSIGNED NOT NULL,
  `tag_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `image_tag`
--

INSERT INTO `image_tag` (`image_id`, `tag_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `primary_comment`
--

CREATE TABLE `primary_comment` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(64) DEFAULT NULL,
  `author` varchar(64) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `image_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `primary_comment`
--

INSERT INTO `primary_comment` (`id`, `title`, `author`, `content`, `created_at`, `image_id`) VALUES
(1, 'Hahaha', 'Pawełek', 'ale śmieszne zdjęcie', '2022-04-08', 1),
(2, 'Pyszne', 'Ciocia', 'Wygląda bardzo pysznie', '2022-04-08', 3);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `secondary_comment`
--

CREATE TABLE `secondary_comment` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(64) DEFAULT NULL,
  `author` varchar(64) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `primary_comment_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `secondary_comment`
--

INSERT INTO `secondary_comment` (`id`, `title`, `author`, `content`, `created_at`, `primary_comment_id`) VALUES
(1, ':(', 'Mama', 'Pawełku to nie ładnie się śmiać z kogoś', '2022-04-08', 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `tag`
--

CREATE TABLE `tag` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(64) DEFAULT NULL,
  `author` varchar(64) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `created_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `tag`
--

INSERT INTO `tag` (`id`, `title`, `author`, `content`, `created_at`) VALUES
(1, 'Polska', 'Mama', 'Zdjęcia z Polski', '2022-04-08'),
(2, 'Góry', 'Mama', 'Zdjęcia z gór', '2022-04-08'),
(3, '2004', 'Tata', 'Zdjęcia z roku 2004', '2022-04-08');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `album`
--
ALTER TABLE `album`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `album_tag`
--
ALTER TABLE `album_tag`
  ADD PRIMARY KEY (`album_id`,`tag_id`),
  ADD KEY `IDX_6397379A1137ABCF` (`album_id`),
  ADD KEY `IDX_6397379ABAD26311` (`tag_id`);

--
-- Indeksy dla tabeli `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Indeksy dla tabeli `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_C53D045F1137ABCF` (`album_id`);

--
-- Indeksy dla tabeli `image_tag`
--
ALTER TABLE `image_tag`
  ADD PRIMARY KEY (`image_id`,`tag_id`),
  ADD KEY `IDX_5B6367D03DA5256D` (`image_id`),
  ADD KEY `IDX_5B6367D0BAD26311` (`tag_id`);

--
-- Indeksy dla tabeli `primary_comment`
--
ALTER TABLE `primary_comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_5FED16583DA5256D` (`image_id`);

--
-- Indeksy dla tabeli `secondary_comment`
--
ALTER TABLE `secondary_comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_516AA4ACC6CD9175` (`primary_comment_id`);

--
-- Indeksy dla tabeli `tag`
--
ALTER TABLE `tag`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `album`
--
ALTER TABLE `album`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT dla tabeli `image`
--
ALTER TABLE `image`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT dla tabeli `primary_comment`
--
ALTER TABLE `primary_comment`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT dla tabeli `secondary_comment`
--
ALTER TABLE `secondary_comment`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT dla tabeli `tag`
--
ALTER TABLE `tag`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `album_tag`
--
ALTER TABLE `album_tag`
  ADD CONSTRAINT `FK_6397379A1137ABCF` FOREIGN KEY (`album_id`) REFERENCES `album` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_6397379ABAD26311` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`) ON DELETE CASCADE;

--
-- Ograniczenia dla tabeli `image`
--
ALTER TABLE `image`
  ADD CONSTRAINT `FK_C53D045F1137ABCF` FOREIGN KEY (`album_id`) REFERENCES `album` (`id`);

--
-- Ograniczenia dla tabeli `image_tag`
--
ALTER TABLE `image_tag`
  ADD CONSTRAINT `FK_5B6367D03DA5256D` FOREIGN KEY (`image_id`) REFERENCES `image` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_5B6367D0BAD26311` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`) ON DELETE CASCADE;

--
-- Ograniczenia dla tabeli `primary_comment`
--
ALTER TABLE `primary_comment`
  ADD CONSTRAINT `FK_5FED16583DA5256D` FOREIGN KEY (`image_id`) REFERENCES `image` (`id`);

--
-- Ograniczenia dla tabeli `secondary_comment`
--
ALTER TABLE `secondary_comment`
  ADD CONSTRAINT `FK_516AA4ACC6CD9175` FOREIGN KEY (`primary_comment_id`) REFERENCES `primary_comment` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
