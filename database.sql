-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 29, 2023 at 07:10 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `student_management_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `advised_course`
--

CREATE TABLE `advised_course` (
  `STID` int(18) NOT NULL,
  `COURSE_ID` varchar(15) NOT NULL,
  `SECTION` int(11) NOT NULL,
  `FACULTY` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `advised_course`
--

INSERT INTO `advised_course` (`STID`, `COURSE_ID`, `SECTION`, `FACULTY`) VALUES
(111002, 'CSE111', 1, 'RAK'),
(111002, 'MAT120', 2, 'DTY'),
(111004, 'MAT120', 2, 'DTY');

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `COURSE_ID` varchar(15) NOT NULL,
  `COURSE_NAME` varchar(25) NOT NULL,
  `CREDIT` int(11) NOT NULL DEFAULT 3,
  `COURSE_TYPE` varchar(15) NOT NULL DEFAULT 'Mandatory',
  `TOTALNUMBER_OF_PRE_REQ_COURSE` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`COURSE_ID`, `COURSE_NAME`, `CREDIT`, `COURSE_TYPE`, `TOTALNUMBER_OF_PRE_REQ_COURSE`) VALUES
('CSE110', 'PROGRAMMING_LANGUAGE_1', 3, 'Mandatory', 0),
('CSE111', 'PROGRAMMING_LANGUAGE_2', 3, 'Mandatory', 1),
('CSE220', 'DATA_STRUCTURES', 3, 'Mandatory', 1),
('CSE221', 'ALGORITHM', 3, 'Mandatory', 1),
('CSE330', 'NUMERICAL_METHODS', 3, 'Mandatory', 1),
('CSE370', 'DATABASE_SYSTEM', 3, 'Mandatory', 2),
('CSE420', 'COMPILER_DESIGN', 4, 'Elective', 2),
('MAT120', 'INTEGRAL_CALCULUS_AND_DIF', 3, 'Mandatory(GED)', 0);

-- --------------------------------------------------------

--
-- Table structure for table `course_finished`
--

CREATE TABLE `course_finished` (
  `STID` int(18) NOT NULL,
  `FINISHED_COURSE_ID` varchar(15) NOT NULL,
  `COURSE_RESULT` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `course_finished`
--

INSERT INTO `course_finished` (`STID`, `FINISHED_COURSE_ID`, `COURSE_RESULT`) VALUES
(111002, 'CSE110', 3),
(111002, 'CSE111', 2.3),
(111003, 'CSE111', 3),
(111003, 'CSE220', 3),
(111004, 'CSE110', 4),
(111004, 'CSE111', 4),
(111005, 'CSE110', 1.7),
(111006, 'CSE110', 4),
(111006, 'CSE111', 4),
(111006, 'CSE220', 3.7),
(111006, 'CSE221', 3.7),
(111006, 'MAT120', 1.7),
(111007, 'CSE110', 4),
(111007, 'CSE111', 2.7),
(111008, 'CSE110', 4),
(111008, 'CSE111', 3.7),
(111008, 'CSE220', 4),
(111008, 'CSE221', 3.7),
(111008, 'CSE330', 2.7),
(111008, 'CSE370', 2),
(111008, 'MAT120', 2);

-- --------------------------------------------------------

--
-- Table structure for table `pre_req_course`
--

CREATE TABLE `pre_req_course` (
  `COURSE_ID` varchar(15) NOT NULL,
  `PRE_REQ_COURSE_ID` varchar(15) NOT NULL,
  `PRE_REQ_REQUIREMENT` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `pre_req_course`
--

INSERT INTO `pre_req_course` (`COURSE_ID`, `PRE_REQ_COURSE_ID`, `PRE_REQ_REQUIREMENT`) VALUES
('CSE110', '', NULL),
('CSE111', 'CSE110', 2.3),
('CSE220', 'CSE111', 3),
('CSE221', 'CSE220', 2.3),
('CSE330', 'MAT120', 2.3),
('CSE370', 'CSE221', 3),
('CSE370', 'MAT120', 2),
('CSE420', 'CSE330', 2),
('CSE420', 'CSE370', 2.3),
('MAT120', '', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `section`
--

CREATE TABLE `section` (
  `COURSE_ID` varchar(15) NOT NULL,
  `SECTION` int(11) NOT NULL,
  `FACULTY` varchar(255) NOT NULL,
  `SEAT_REMAINING` int(11) NOT NULL DEFAULT 30,
  `TOTAL_SEAT` int(11) NOT NULL DEFAULT 30
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `section`
--

INSERT INTO `section` (`COURSE_ID`, `SECTION`, `FACULTY`, `SEAT_REMAINING`, `TOTAL_SEAT`) VALUES
('CSE110', 1, 'AAJ', 30, 30),
('CSE110', 2, 'DIP', 30, 30),
('CSE111', 1, 'RAK', 29, 30),
('CSE220', 1, 'RAK', 30, 30),
('CSE220', 2, 'RAK', 30, 30),
('CSE220', 3, 'SEJ', 30, 30),
('CSE221', 1, 'RAK', 30, 30),
('CSE330', 1, 'AAJ', 30, 30),
('CSE330', 2, 'ACH', 30, 30),
('CSE330', 3, 'MHT', 30, 30),
('CSE370', 1, 'HOS', 30, 30),
('CSE370', 2, 'NNC', 30, 30),
('CSE420', 1, 'AKO', 30, 30),
('MAT120', 1, 'FAB', 30, 30),
('MAT120', 2, 'DTY', 28, 30);

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `STID` int(18) NOT NULL,
  `STNAME` varchar(50) NOT NULL,
  `AGE` int(3) DEFAULT NULL,
  `CONTACT_INFO` varchar(11) DEFAULT NULL,
  `ADDRESS` varchar(20) DEFAULT NULL,
  `PASSWORD` varchar(5) NOT NULL,
  `Email address` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`STID`, `STNAME`, `AGE`, `CONTACT_INFO`, `ADDRESS`, `PASSWORD`, `Email address`) VALUES
(111002, 'NUSRAT JAHAN', 22, '01711111111', 'MIRPUR', '0t5y7', 'nusrat21@gmail.com'),
(111003, 'AHMAD NAYEM', 22, '01933333333', 'MOHAKHALI', '29h6y', 'nayemcric1@gmail.com'),
(111004, 'FARIA KABIR', 21, '01400000000', 'KAZIPARA', '0f7yt', 'faria56@gmail.com'),
(111005, 'NAYEM TALUKDER', 20, '01955555555', 'UTTARA', '44r6y', ''),
(111006, 'WAFI KHAN', 21, '01322222222', 'NEWMARKET', '57r7y', 'waffle@gmail.com'),
(111007, 'TAHSIN RAHMAN', 22, '01377777777', 'MIRPUR', '6t7e7', 'tahsinBreakupMithila@gmail.com'),
(111008, 'NAYON HASAN', 20, '01785555555', 'GULSHAN', '7y7pz', 'nayon43@gmail.com'),
(111009, 'KHAN JAHAN', 20, '01922222222', 'KURIL', '3e5r6', 'khanjahan34@gmail.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `advised_course`
--
ALTER TABLE `advised_course`
  ADD PRIMARY KEY (`STID`,`COURSE_ID`,`SECTION`),
  ADD UNIQUE KEY `STID` (`STID`,`COURSE_ID`),
  ADD KEY `advised_course_ibfk_2` (`COURSE_ID`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`COURSE_ID`);

--
-- Indexes for table `course_finished`
--
ALTER TABLE `course_finished`
  ADD PRIMARY KEY (`STID`,`FINISHED_COURSE_ID`),
  ADD UNIQUE KEY `STID` (`STID`,`FINISHED_COURSE_ID`),
  ADD KEY `course_finished_ibfk_2` (`FINISHED_COURSE_ID`);

--
-- Indexes for table `pre_req_course`
--
ALTER TABLE `pre_req_course`
  ADD PRIMARY KEY (`COURSE_ID`,`PRE_REQ_COURSE_ID`);

--
-- Indexes for table `section`
--
ALTER TABLE `section`
  ADD PRIMARY KEY (`COURSE_ID`,`SECTION`),
  ADD UNIQUE KEY `COURSE_ID` (`COURSE_ID`,`SECTION`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`STID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `advised_course`
--
ALTER TABLE `advised_course`
  ADD CONSTRAINT `advised_course_ibfk_1` FOREIGN KEY (`STID`) REFERENCES `student` (`STID`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `advised_course_ibfk_2` FOREIGN KEY (`COURSE_ID`) REFERENCES `courses` (`COURSE_ID`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `course_finished`
--
ALTER TABLE `course_finished`
  ADD CONSTRAINT `course_finished_ibfk_1` FOREIGN KEY (`STID`) REFERENCES `student` (`STID`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `course_finished_ibfk_2` FOREIGN KEY (`FINISHED_COURSE_ID`) REFERENCES `courses` (`COURSE_ID`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `pre_req_course`
--
ALTER TABLE `pre_req_course`
  ADD CONSTRAINT `pre_req_course_ibfk_1` FOREIGN KEY (`COURSE_ID`) REFERENCES `courses` (`COURSE_ID`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `section`
--
ALTER TABLE `section`
  ADD CONSTRAINT `section_ibfk_1` FOREIGN KEY (`COURSE_ID`) REFERENCES `courses` (`COURSE_ID`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
