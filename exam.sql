-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 30, 2017 at 09:13 AM
-- Server version: 5.6.35
-- PHP Version: 7.0.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `exam`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'Toán học'),
(2, 'Văn học'),
(3, 'Sinh Học'),
(5, 'Vật Lý');

-- --------------------------------------------------------

--
-- Table structure for table `exams`
--

CREATE TABLE `exams` (
  `id` int(11) NOT NULL,
  `cateid` int(11) DEFAULT NULL,
  `duration` int(11) NOT NULL,
  `name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `userID` int(11) NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `exams`
--

INSERT INTO `exams` (`id`, `cateid`, `duration`, `name`, `userID`, `description`) VALUES
(1, 1, 30, 'Bai thi so 1 PUT', 1, ''),
(2, 2, 60, 'Bai kiem tra so 2', 1, ''),
(3, 1, 60, 'Bai kiem tra so 3', 1, ''),
(4, 2, 60, 'Bai kiem tra so 4', 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `exam_questions`
--

CREATE TABLE `exam_questions` (
  `id` int(11) NOT NULL,
  `Examid` int(11) DEFAULT NULL,
  `questionId` int(11) DEFAULT NULL,
  `no` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `exam_questions`
--

INSERT INTO `exam_questions` (`id`, `Examid`, `questionId`, `no`) VALUES
(3, 1, 2, 0),
(4, 1, 4, 0);

-- --------------------------------------------------------

--
-- Table structure for table `point_exams`
--

CREATE TABLE `point_exams` (
  `id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `examid` int(11) DEFAULT NULL,
  `point` int(11) NOT NULL,
  `userid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` int(11) NOT NULL,
  `answer1` text COLLATE utf8_unicode_ci,
  `answer2` text COLLATE utf8_unicode_ci,
  `answer3` text COLLATE utf8_unicode_ci,
  `answer4` text COLLATE utf8_unicode_ci,
  `content` longtext COLLATE utf8_unicode_ci,
  `correct_answer` int(11) NOT NULL,
  `userid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `answer1`, `answer2`, `answer3`, `answer4`, `content`, `correct_answer`, `userid`) VALUES
(1, 'A', 'B', 'C', 'D', 'Cau 1 chinh sua', 0, 1),
(2, 'A', 'B', 'C', 'D', 'Cau hoi so 2', 2, 1),
(4, 'A', 'B', 'C', 'D', 'Cau hoi so 3', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` text COLLATE utf8_unicode_ci,
  `name` text COLLATE utf8_unicode_ci,
  `password` longtext COLLATE utf8_unicode_ci,
  `username` text COLLATE utf8_unicode_ci,
  `role` int(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `name`, `password`, `username`, `role`) VALUES
(1, 'phuapple@gmail.com', 'Minh Phu Nguyen', '123456', 'phuapple', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exams`
--
ALTER TABLE `exams`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IX_exams_cateid` (`cateid`),
  ADD KEY `userID` (`userID`);

--
-- Indexes for table `exam_questions`
--
ALTER TABLE `exam_questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IX_exam_questions_examid` (`Examid`),
  ADD KEY `IX_exam_questions_questionid` (`questionId`);

--
-- Indexes for table `point_exams`
--
ALTER TABLE `point_exams`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IX_point_exams_examid` (`examid`),
  ADD KEY `IX_point_exams_userid` (`userid`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IX_questions_userid` (`userid`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `exams`
--
ALTER TABLE `exams`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `exam_questions`
--
ALTER TABLE `exam_questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `point_exams`
--
ALTER TABLE `point_exams`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `exams`
--
ALTER TABLE `exams`
  ADD CONSTRAINT `FK_exams_categories_cateid` FOREIGN KEY (`cateid`) REFERENCES `categories` (`id`) ON DELETE NO ACTION,
  ADD CONSTRAINT `exams_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `exam_questions`
--
ALTER TABLE `exam_questions`
  ADD CONSTRAINT `FK_exam_questions_exams_examid` FOREIGN KEY (`Examid`) REFERENCES `exams` (`id`) ON DELETE NO ACTION,
  ADD CONSTRAINT `FK_exam_questions_questions_questionid` FOREIGN KEY (`questionId`) REFERENCES `questions` (`id`) ON DELETE NO ACTION;

--
-- Constraints for table `point_exams`
--
ALTER TABLE `point_exams`
  ADD CONSTRAINT `FK_point_exams_exams_examid` FOREIGN KEY (`examid`) REFERENCES `exams` (`id`) ON DELETE NO ACTION,
  ADD CONSTRAINT `FK_point_exams_users_userid` FOREIGN KEY (`userid`) REFERENCES `users` (`id`) ON DELETE NO ACTION;

--
-- Constraints for table `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `FK_questions_users_userid` FOREIGN KEY (`userid`) REFERENCES `users` (`id`) ON DELETE NO ACTION;
