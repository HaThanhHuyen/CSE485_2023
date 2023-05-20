-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th5 20, 2023 lúc 08:45 AM
-- Phiên bản máy phục vụ: 10.4.28-MariaDB
-- Phiên bản PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `btth02`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `attendances`
--

CREATE TABLE `attendances` (
  `ID` int(11) NOT NULL,
  `Date` date DEFAULT NULL,
  `ClassID` int(11) DEFAULT NULL,
  `StudentID` int(11) DEFAULT NULL,
  `AttendanceStatus` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `attendances`
--

INSERT INTO `attendances` (`ID`, `Date`, `ClassID`, `StudentID`, `AttendanceStatus`) VALUES
(1, '2023-05-01', 1, 1, 'Present'),
(2, '2023-05-01', 1, 2, 'Late'),
(3, '2023-05-01', 1, 3, 'Absent'),
(4, '2023-05-01', 2, 1, 'Present'),
(5, '2023-05-01', 2, 2, 'Present'),
(6, '2023-05-01', 2, 3, 'Present');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `classes`
--

CREATE TABLE `classes` (
  `ID` int(11) NOT NULL,
  `CourseID` int(11) DEFAULT NULL,
  `InstructorID` int(11) DEFAULT NULL,
  `TimePeriod` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `classes`
--

INSERT INTO `classes` (`ID`, `CourseID`, `InstructorID`, `TimePeriod`) VALUES
(1, 1, 1, '2023-05-01 to 2023-06-30'),
(2, 2, 2, '2023-05-01 to 2023-07-31');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `courses`
--

CREATE TABLE `courses` (
  `ID` int(11) NOT NULL,
  `CourseCode` varchar(255) DEFAULT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `Description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `courses`
--

INSERT INTO `courses` (`ID`, `CourseCode`, `Title`, `Description`) VALUES
(1, 'CSC101', 'Introduction to Computer Science', 'This course provides an introduction to the fundamentals of computer science.'),
(2, 'ENG202', 'Advanced English Writing', 'This course focuses on advanced writing skills in English.'),
(3, 'MAT303', 'Linear Algebra', 'This course covers the theory and applications of linear algebra.');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `instructors`
--

CREATE TABLE `instructors` (
  `ID` int(11) NOT NULL,
  `FullName` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `ContactInfo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `instructors`
--

INSERT INTO `instructors` (`ID`, `FullName`, `Email`, `ContactInfo`) VALUES
(1, 'Le Thi D', 'lethid@example.com', '4567890123'),
(2, 'Hoang Van E', 'hoangvane@example.com', '0123456789');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `students`
--

CREATE TABLE `students` (
  `ID` int(11) NOT NULL,
  `FullName` varchar(255) DEFAULT NULL,
  `DateOfBirth` date DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `ContactInfo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `students`
--

INSERT INTO `students` (`ID`, `FullName`, `DateOfBirth`, `Email`, `ContactInfo`) VALUES
(1, 'Nguyen Van A', '1998-05-10', 'nguyenvana@example.com', '1234567890'),
(2, 'Tran Thi B', '1999-08-15', 'tranthib@example.com', '0987654321'),
(3, 'Pham Van C', '2000-03-20', 'phamvanc@example.com', '9876543210');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `attendances`
--
ALTER TABLE `attendances`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ClassID` (`ClassID`),
  ADD KEY `StudentID` (`StudentID`);

--
-- Chỉ mục cho bảng `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `CourseID` (`CourseID`),
  ADD KEY `InstructorID` (`InstructorID`);

--
-- Chỉ mục cho bảng `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`ID`);

--
-- Chỉ mục cho bảng `instructors`
--
ALTER TABLE `instructors`
  ADD PRIMARY KEY (`ID`);

--
-- Chỉ mục cho bảng `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`ID`);

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `attendances`
--
ALTER TABLE `attendances`
  ADD CONSTRAINT `attendances_ibfk_1` FOREIGN KEY (`ClassID`) REFERENCES `classes` (`ID`),
  ADD CONSTRAINT `attendances_ibfk_2` FOREIGN KEY (`StudentID`) REFERENCES `students` (`ID`);

--
-- Các ràng buộc cho bảng `classes`
--
ALTER TABLE `classes`
  ADD CONSTRAINT `classes_ibfk_1` FOREIGN KEY (`CourseID`) REFERENCES `courses` (`ID`),
  ADD CONSTRAINT `classes_ibfk_2` FOREIGN KEY (`InstructorID`) REFERENCES `instructors` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
