-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th6 21, 2020 lúc 05:23 PM
-- Phiên bản máy phục vụ: 10.1.38-MariaDB
-- Phiên bản PHP: 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `ticket`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comments`
--

CREATE TABLE `comments` (
  `CommentsID` int(11) NOT NULL,
  `TicketID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `Content` text COLLATE utf8_vietnamese_ci NOT NULL,
  `Attachment` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  `CreateAt` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `departments`
--

CREATE TABLE `departments` (
  `ID` int(11) NOT NULL,
  `Name` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  `LeaderID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `departments`
--

INSERT INTO `departments` (`ID`, `Name`, `LeaderID`) VALUES
(2, 'Phòng giám đốc', 1),
(3, 'Phòng Đào Tạo', 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `role`
--

CREATE TABLE `role` (
  `ID` int(11) NOT NULL,
  `Name` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `role`
--

INSERT INTO `role` (`ID`, `Name`) VALUES
(1, 'Sinh viên'),
(2, 'Trưởng phòng'),
(3, 'Nhân Viên');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `status`
--

CREATE TABLE `status` (
  `StatusID` int(11) NOT NULL,
  `Name` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `status`
--

INSERT INTO `status` (`StatusID`, `Name`) VALUES
(1, 'Lưu nháp'),
(2, 'Chờ xử lý'),
(3, 'Đã tiếp nhận xử lý'),
(4, 'Từ chối tiếp nhận'),
(5, 'Đang xử lý'),
(6, 'Từ chối xử lý'),
(7, 'Hoàn tất-Chờ xác nhận'),
(8, 'Xác nhận hoàn thành'),
(9, 'Từ chối xác nhận'),
(10, 'Đóng yêu cầu');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ticket`
--

CREATE TABLE `ticket` (
  `ID` int(11) NOT NULL,
  `StudentID` int(11) NOT NULL,
  `LeaderID` int(11) DEFAULT NULL,
  `StaffID` int(11) DEFAULT NULL,
  `StatusID` int(11) NOT NULL,
  `CatID` int(11) NOT NULL,
  `Reason` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `Subject` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  `Content` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  `CreateAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `UpdateAt` timestamp NULL DEFAULT NULL,
  `ApproveAt` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `ticket`
--

INSERT INTO `ticket` (`ID`, `StudentID`, `LeaderID`, `StaffID`, `StatusID`, `CatID`, `Reason`, `Subject`, `Content`, `CreateAt`, `UpdateAt`, `ApproveAt`) VALUES
(38, 2, NULL, 4, 5, 1, NULL, 'Đơn xin học lại môn Lập trình PHP1- WEB2013', 'Em chào anh chị phòng CTSV ạ. Em tạo ticket này với mong muôn được học lại môn PHP1-WEB2013 trong kỳ Spring 2020 Block 1 vào những ngày 2-4-6 Slot 1 ạ. Em xin cảm ơn', '2020-06-20 06:03:52', NULL, NULL),
(46, 2, NULL, 4, 5, 1, NULL, 'Đơn xin học lại môn dự án 1_PRO1014', 'Em chào anh chị phòng CTSV\r\n', '2019-12-22 14:52:18', NULL, NULL),
(48, 2, NULL, 4, 7, 1, NULL, 'Đơn xin học lại môn dự án 1_PRO1014', 'Em chào anh/chị phòng đào tạo. Em tạo ticket này để muốn xin học lai môn dự án 1 chuyên ngành thiết kế web. Em xin cảm ơn', '2019-12-17 15:02:28', NULL, NULL),
(49, 0, NULL, 4, 3, 1, NULL, 'Đơn xin học lại môn Java 1', 'Em chào anh chị phòng đào tạo. Em tạo ticket này với mong muốn được học lại môn Java 1 và kì sau ạ. Em xin cảm ơn. ', '2019-12-17 15:02:37', NULL, NULL),
(50, 2, NULL, 0, 9, 1, 'Thiếu title', 'CCho em học lại dự án 1', 'Học lại dự án 1', '2019-12-22 14:54:44', NULL, NULL),
(51, 2, NULL, 4, 7, 1, NULL, 'Đơn xin học lại môn cơ sở dữ liệu', 'Em chào anh chị phòng CTSV ạ, em muốn xin anh chị học lại môn cơ sở dữ liệu ở kỳ SP 2020 Block 1 ca 2 ngày 357 ạ, Em xin cảm ơn ', '2019-12-17 15:02:41', NULL, NULL),
(52, 2, NULL, 4, 8, 1, NULL, 'Đơn xin học lại môn Lập trình cơ sở với Javascript-WEB1042', 'Em chào anh chị phòng CTSV ạ. Em tạo ticket này với mong muốn được đăng kí học lại môn Javascript vào kỳ Spring 2020 vào block 1 vào ca 2 ạ. Em xin cảm ơn', '2019-12-17 15:02:45', NULL, NULL),
(53, 2, NULL, NULL, 4, 1, 'Thiếu title', 'Đơn xin học lại môn Thiết kế minh họa với Illustrator-MUL1023', 'Em tạo ticket này với mong muốn được học lại môn Thiết kế minh họa với Illustrator vào kỳ sau ạ', '2019-12-08 14:52:13', NULL, NULL),
(54, 2, NULL, 0, 7, 1, NULL, 'Đơn xin học lại môn WEB1013 - Xây dựng trang web', 'Em muốn học lại môn xây dựng trang web luôn vào ngay block 01 SP20 ạ. Em cảm ơn', '2019-12-20 15:18:26', NULL, NULL),
(55, 2, NULL, 4, 8, 1, NULL, 'Môn chính trị', 'Em chào anh chị abc xyz phòng CTSV ạ, em muốn dkdi a', '2019-12-17 15:02:53', NULL, NULL),
(56, 2, NULL, 0, 8, 1, NULL, 'Đơn xin học lại môn NET101 - Lập trình C#1', 'Em chào anh chị phòng CTSV. Em tạo ticket này với mong muốn đc học lại môn NET101 - Lập trình C#1 - SP20', '2019-12-20 15:15:34', NULL, NULL),
(58, 2, NULL, 0, 3, 1, NULL, 'Đơn xin học lại môn WEB4012 - Lập trình PHP3 (Laravel)', 'Lorem ', '2019-12-20 15:19:45', NULL, NULL),
(59, 2, NULL, 0, 7, 1, NULL, 'Đơn xin học lại môn WEB3013 - Lập trình PHP2 ', 'Lorem ', '2019-12-22 14:52:32', NULL, NULL),
(60, 5, NULL, 0, 3, 1, NULL, 'Đơn xin học lại môn Java 1', 'Chào anh chị phòng đào tạo ạ. Em tạo ticket này là để muốn anh chị cho em học lại môn Java 1 vào kỳ sau. Em xin cảm ơn ', '2019-12-17 14:43:58', NULL, NULL),
(61, 5, NULL, 0, 3, 1, NULL, 'Đơn xin học lại môn MOB103 - Lập trình Android cơ bản', 'Anh chị phòng CTSV cho em đc học lại môn học lại tại block 2 kỳ Srping 2020 với ạ. Em cảm ơn', '2019-12-20 15:14:29', NULL, NULL),
(62, 5, NULL, 0, 6, 1, NULL, 'Đơn xin học lại môn INF2042 - Phần mềm miễn phí và mã nguồn mở', 'Anh chị ơi. Em tạo ticket này với mong muốn đc học lại môn này trong block 2 kỳ tới ạ. Em cảm ơn', '2019-12-20 15:13:09', NULL, NULL),
(63, 5, NULL, 6, 3, 1, NULL, 'Đơn xin học lại môn COM1032 - Thiết lập và quản trị mạng máy tính', 'Em chào anh chị phòng CTSV ạ. Em tạo ticket này với mong muốn đc học lại môn này ngay trong block sau ạ. Em cảm ơn', '2019-12-20 15:12:10', NULL, NULL),
(64, 2, NULL, 4, 6, 1, '', 'Test bug lần 1', 'Test bug lần 1', '2019-12-22 14:59:07', NULL, NULL),
(65, 2, NULL, NULL, 4, 1, 'reject', 'Test bug lần 2', 'Test bug lần 2', '2019-12-22 14:51:22', NULL, NULL),
(66, 2, NULL, 4, 8, 1, NULL, 'Đơn xin học lại dự án 3', 'Lorem ', '2019-12-23 05:53:09', NULL, NULL),
(67, 2, NULL, 4, 4, 1, 'Thiếu title', 'Đơn xin học lại 5', 'Lorem ', '2019-12-23 05:58:30', NULL, NULL),
(68, 2, NULL, 4, 4, 1, '', 'Test 2', 'Lorem ', '2019-12-23 06:01:07', NULL, NULL),
(69, 2, NULL, 6, 5, 1, NULL, 'Test lần 3', 'Test lần 3', '2019-12-23 06:09:01', NULL, NULL),
(70, 2, NULL, 4, 8, 1, NULL, 'Đơn xin học lại dự án 4', 'Lorem ', '2020-01-06 02:44:54', NULL, NULL),
(71, 2, NULL, 3, 3, 1, NULL, 'Xin đơn bán trường', 'Lorem ', '2020-05-09 08:17:27', NULL, NULL),
(72, 2, NULL, NULL, 4, 1, 'Thiếu title ngày 20 ', 'Đơn xin học lại môn dự án 1_PRO1014', 'Lorem', '2020-06-20 06:06:09', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ticketcategories`
--

CREATE TABLE `ticketcategories` (
  `ID` int(11) NOT NULL,
  `Name` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  `DeptID` int(11) NOT NULL,
  `Status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `ticketcategories`
--

INSERT INTO `ticketcategories` (`ID`, `Name`, `DeptID`, `Status`) VALUES
(1, 'Đơn xác nhận sinh viên', 3, 1),
(5, 'Đơn xin vào CLB', 2, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tickethistory`
--

CREATE TABLE `tickethistory` (
  `TicketHistoryID` int(11) NOT NULL,
  `TicketID` int(11) NOT NULL,
  `Activity` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  `UserID` int(11) NOT NULL,
  `TimeStamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `tickethistory`
--

INSERT INTO `tickethistory` (`TicketHistoryID`, `TicketID`, `Activity`, `UserID`, `TimeStamp`) VALUES
(1, 16, 'Tạo ticket', 2, '2019-11-17 15:31:34'),
(2, 17, 'Tạo ticket', 2, '2019-11-17 15:46:52'),
(3, 3, 'Xóa ticket', 0, '2019-11-17 16:18:16'),
(4, 6, 'Sửa ticket', 0, '2019-11-18 16:27:24'),
(5, 4, 'Sửa ticket', 3, '2019-11-18 16:28:43'),
(6, 4, 'Sửa ticket', 3, '2019-11-22 15:32:03'),
(7, 4, 'Sửa ticket', 3, '2019-11-22 15:32:58'),
(8, 4, 'Đã tiếp nhận xử lý', 3, '2019-11-22 15:33:08'),
(9, 5, 'Đã tiếp nhận xử lý', 3, '2019-11-22 15:33:16'),
(10, 6, 'Đã tiếp nhận xử lý', 3, '2019-11-22 15:49:06'),
(11, 7, 'Đã tiếp nhận xử lý', 3, '2019-11-22 15:49:37'),
(12, 8, 'Đã tiếp nhận xử lý', 3, '2019-11-22 15:53:08'),
(13, 12, 'Đã tiếp nhận xử lý', 3, '2019-11-22 15:53:32'),
(14, 12, 'Đã tiếp nhận xử lý', 3, '2019-11-22 15:54:23'),
(15, 12, 'Đã tiếp nhận xử lý', 3, '2019-11-22 15:55:34'),
(16, 11, 'Đã tiếp nhận xử lý', 3, '2019-11-22 15:55:38'),
(17, 12, 'Đã tiếp nhận xử lý', 3, '2019-11-22 15:58:02'),
(18, 10, 'Đã tiếp nhận xử lý', 3, '2019-11-22 15:58:11'),
(19, 9, 'Đã tiếp nhận xử lý', 3, '2019-11-22 15:58:15'),
(20, 12, 'Từ chối tiếp nhận', 3, '2019-11-22 15:59:20'),
(21, 11, 'Từ chối tiếp nhận', 3, '2019-11-22 15:59:29'),
(22, 4, 'Đã tiếp nhận xử lý', 3, '2019-11-22 16:10:00'),
(23, 4, 'Đã tiếp nhận xử lý', 3, '2019-11-22 16:11:55'),
(24, 12, 'Đã tiếp nhận xử lý', 3, '2019-11-22 16:12:27'),
(25, 12, 'Đã tiếp nhận xử lý', 3, '2019-11-22 16:15:26'),
(26, 4, 'Đang xử lý', 4, '2019-11-23 03:09:04'),
(27, 5, 'Đang xử lý', 4, '2019-11-23 03:13:26'),
(28, 12, 'Đang xử lý', 4, '2019-11-23 03:14:40'),
(29, 11, 'Đã tiếp nhận xử lý', 4, '2019-11-23 03:16:55'),
(30, 10, 'Đang xử lý', 4, '2019-11-23 03:18:08'),
(31, 4, 'Từ chối tiếp nhận', 4, '2019-11-23 03:19:21'),
(32, 5, 'Đang xử lý', 4, '2019-11-23 03:28:11'),
(33, 12, 'Đang xử lý', 4, '2019-11-23 03:28:56'),
(34, 12, 'Đang xử lý', 4, '2019-11-23 03:29:26'),
(35, 12, 'Đang xử lý', 3, '2019-11-23 03:34:03'),
(36, 11, 'Từ chối xử lý', 3, '2019-11-23 03:47:10'),
(37, 8, 'Từ chối tiếp nhận', 3, '2019-11-24 05:41:11'),
(38, 9, 'Từ chối tiếp nhận', 3, '2019-11-24 14:59:36'),
(39, 4, 'Từ chối tiếp nhận', 3, '2019-11-24 14:59:43'),
(40, 9, 'Từ chối tiếp nhận', 3, '2019-11-24 15:03:42'),
(41, 10, 'Từ chối tiếp nhận', 3, '2019-11-24 15:03:48'),
(42, 6, 'Từ chối tiếp nhận', 3, '2019-11-24 15:09:28'),
(43, 4, 'Từ chối tiếp nhận', 3, '2019-11-24 15:11:53'),
(44, 1, 'Từ chối tiếp nhận', 3, '2019-11-24 15:12:17'),
(45, 4, 'Từ chối tiếp nhận', 3, '2019-11-24 15:12:20'),
(46, 5, 'Từ chối tiếp nhận', 3, '2019-11-24 15:17:47'),
(47, 13, 'Tạo ticket', 2, '2019-11-26 14:45:05'),
(48, 14, 'Tạo ticket', 2, '2019-11-26 14:46:26'),
(49, 15, 'Tạo ticket', 2, '2019-11-26 14:48:58'),
(50, 16, 'Tạo ticket', 2, '2019-11-26 14:50:04'),
(51, 17, 'Tạo ticket', 2, '2019-11-26 14:51:05'),
(52, 18, 'Lưu nháp ticket', 2, '2019-11-26 14:52:06'),
(53, 17, 'Xóa ticket', 0, '2019-11-26 15:12:57'),
(54, 16, 'Xóa ticket', 0, '2019-11-26 15:13:03'),
(55, 15, 'Xóa ticket', 0, '2019-11-26 15:15:22'),
(56, 18, 'Xóa ticket', 2, '2019-11-26 15:16:21'),
(57, 19, 'Tạo ticket', 2, '2019-11-26 15:16:45'),
(58, 20, 'Tạo ticket', 2, '2019-11-26 15:17:54'),
(59, 20, 'Xóa ticket', 2, '2019-11-26 15:17:59'),
(60, 19, 'Xóa ticket', 2, '2019-11-26 15:18:06'),
(61, 14, 'Xóa ticket', 2, '2019-11-26 15:18:10'),
(62, 21, 'Tạo ticket', 2, '2019-11-26 15:25:27'),
(63, 22, 'Tạo ticket', 2, '2019-11-26 15:38:17'),
(64, 23, 'Tạo ticket', 2, '2019-11-26 15:39:27'),
(65, 24, 'Tạo ticket', 2, '2019-11-26 15:40:27'),
(66, 25, 'Tạo ticket', 2, '2019-11-26 15:43:10'),
(67, 26, 'Tạo ticket', 2, '2019-11-26 15:45:10'),
(68, 27, 'Tạo ticket', 2, '2019-11-26 15:46:56'),
(69, 28, 'Tạo ticket', 2, '2019-11-26 15:48:45'),
(70, 29, 'Tạo ticket', 2, '2019-11-26 15:49:39'),
(71, 30, 'Tạo ticket', 2, '2019-11-26 15:51:03'),
(72, 31, 'Tạo ticket', 2, '2019-11-26 15:51:40'),
(73, 32, 'Tạo ticket', 2, '2019-11-26 15:52:48'),
(74, 33, 'Tạo ticket', 2, '2019-11-26 15:54:19'),
(75, 34, 'Tạo ticket', 2, '2019-11-26 16:24:13'),
(76, 35, 'Tạo ticket', 2, '2019-11-26 16:29:23'),
(77, 36, 'Tạo ticket', 2, '2019-11-26 16:30:24'),
(78, 37, 'Tạo ticket', 2, '2019-11-26 16:31:26'),
(79, 7, 'Sửa ticket', 0, '2019-11-27 14:29:35'),
(80, 38, 'Tạo ticket', 2, '2019-11-27 14:33:16'),
(81, 39, 'Tạo ticket', 2, '2019-11-27 14:35:46'),
(82, 39, 'Sửa ticket', 2, '2019-11-27 14:37:40'),
(83, 39, 'Sửa ticket', 2, '2019-11-27 14:37:47'),
(84, 39, 'Sửa ticket', 2, '2019-11-27 14:37:56'),
(85, 29, 'Xóa ticket', 2, '2019-11-27 14:38:13'),
(86, 13, 'Xóa ticket', 2, '2019-11-27 14:38:28'),
(87, 21, 'Xóa ticket', 2, '2019-11-27 14:38:39'),
(88, 40, 'Tạo ticket', 5, '2019-11-27 14:55:24'),
(89, 35, 'Sửa ticket', 3, '2019-11-27 14:57:51'),
(90, 22, 'Đã tiếp nhận xử lý', 3, '2019-11-27 14:58:38'),
(91, 40, 'Đã tiếp nhận xử lý', 3, '2019-11-27 14:58:45'),
(92, 39, 'Đã tiếp nhận xử lý', 3, '2019-11-27 15:08:03'),
(93, 38, 'Đã tiếp nhận xử lý', 3, '2019-11-27 15:09:07'),
(94, 24, 'Từ chối tiếp nhận', 3, '2019-11-27 15:10:34'),
(95, 28, 'Đã tiếp nhận xử lý', 4, '2019-11-28 15:08:26'),
(96, 37, 'Đã tiếp nhận xử lý', 4, '2019-11-28 15:08:32'),
(97, 36, 'Từ chối tiếp nhận', 4, '2019-11-28 15:10:45'),
(98, 41, 'Tạo ticket', 2, '2019-11-29 05:38:58'),
(99, 41, 'Đã tiếp nhận xử lý', 3, '2019-11-29 05:40:36'),
(100, 41, 'Đã tiếp nhận xử lý', 4, '2019-11-29 05:41:29'),
(101, 42, 'Tạo ticket', 2, '2019-11-30 15:56:18'),
(102, 1, 'Đã tiếp nhận xử lý', 3, '2019-11-30 16:06:31'),
(103, 43, 'Tạo ticket', 2, '2019-12-02 06:10:24'),
(104, 44, 'Tạo ticket', 2, '2019-12-02 06:14:46'),
(105, 44, 'Từ chối tiếp nhận', 3, '2019-12-02 06:15:09'),
(106, 44, 'Sửa ticket', 2, '2019-12-02 06:15:30'),
(107, 44, 'Xóa ticket', 2, '2019-12-02 06:22:03'),
(108, 43, 'Xóa ticket', 2, '2019-12-02 06:22:16'),
(109, 45, 'Tạo ticket', 2, '2019-12-02 06:23:09'),
(110, 45, 'Sửa ticket', 2, '2019-12-02 06:24:00'),
(111, 45, 'Sửa ticket', 2, '2019-12-02 06:24:29'),
(112, 45, 'Đã tiếp nhận xử lý', 3, '2019-12-02 06:24:36'),
(113, 46, 'Tạo ticket', 2, '2019-12-02 11:48:55'),
(114, 46, 'Đã tiếp nhận xử lý', 3, '2019-12-02 11:49:43'),
(115, 47, 'Tạo ticket', 2, '2019-12-02 12:11:05'),
(116, 48, 'Tạo ticket', 2, '2019-12-02 15:25:13'),
(117, 49, 'Tạo ticket', 0, '2019-12-03 09:34:32'),
(118, 0, 'Từ chối tiếp nhận', 4, '2019-12-03 09:43:13'),
(119, 47, 'Từ chối tiếp nhận', 4, '2019-12-03 09:43:23'),
(120, 47, 'Sửa ticket', 2, '2019-12-03 09:43:46'),
(121, 45, 'Đã tiếp nhận xử lý', 2, '2019-12-03 09:48:24'),
(122, 46, 'Đã tiếp nhận xử lý', 4, '2019-12-03 09:49:02'),
(123, 48, 'Đã tiếp nhận xử lý', 4, '2019-12-03 09:49:16'),
(124, 48, 'Sửa ticket', 2, '2019-12-03 09:59:44'),
(125, 50, 'Tạo ticket', 2, '2019-12-03 10:00:51'),
(126, 51, 'Tạo ticket', 2, '2019-12-03 10:00:54'),
(127, 52, 'Tạo ticket', 2, '2019-12-03 10:02:46'),
(128, 53, 'Tạo ticket', 2, '2019-12-03 10:03:41'),
(129, 50, 'Xóa ticket', 2, '2019-12-03 10:03:49'),
(130, 51, 'Xóa ticket', 2, '2019-12-03 10:03:51'),
(131, 52, 'Xóa ticket', 2, '2019-12-03 10:03:53'),
(132, 54, 'Tạo ticket', 2, '2019-12-03 10:05:41'),
(133, 38, 'Đã tiếp nhận xử lý', 0, '2019-12-03 10:07:24'),
(134, 49, 'Đã tiếp nhận xử lý', 0, '2019-12-03 10:07:50'),
(135, 54, 'Xóa ticket', 2, '2019-12-04 05:50:48'),
(136, 53, 'Xóa ticket', 2, '2019-12-04 05:50:52'),
(137, 50, 'Tạo ticket', 2, '2019-12-04 08:48:09'),
(138, 50, 'Đã tiếp nhận xử lý', 3, '2019-12-04 08:48:29'),
(139, 50, 'Đã tiếp nhận xử lý', 4, '2019-12-05 13:50:59'),
(140, 48, 'Đã tiếp nhận xử lý', 4, '2019-12-05 13:51:51'),
(141, 50, 'Đã tiếp nhận xử lý', 4, '2019-12-05 14:00:15'),
(142, 48, 'Đã tiếp nhận xử lý', 4, '2019-12-05 14:00:52'),
(143, 50, 'Đang xử lý', 0, '2019-12-05 14:04:14'),
(144, 50, 'Đang xử lý', 0, '2019-12-05 14:09:18'),
(145, 45, 'Đã tiếp nhận xử lý', 4, '2019-12-05 15:10:56'),
(146, 45, 'Đã tiếp nhận xử lý', 4, '2019-12-05 15:11:13'),
(147, 38, 'Đã tiếp nhận xử lý', 4, '2019-12-05 15:11:23'),
(148, 48, 'Đang xử lý', 0, '2019-12-05 16:27:07'),
(149, 51, 'Tạo ticket', 2, '2019-12-05 16:52:51'),
(150, 51, 'Đã tiếp nhận xử lý', 3, '2019-12-05 16:53:50'),
(151, 51, 'Đã tiếp nhận xử lý', 4, '2019-12-05 16:54:06'),
(152, 51, 'Đang xử lý', 0, '2019-12-05 16:54:13'),
(153, 0, 'Tạo ticket', 2, '2019-12-07 15:17:59'),
(154, 0, 'Tạo ticket', 2, '2019-12-07 15:18:43'),
(155, 55, 'Tạo ticket', 2, '2019-12-07 15:21:17'),
(156, 56, 'Tạo ticket', 2, '2019-12-07 15:22:58'),
(157, 0, 'Tạo ticket', 2, '2019-12-07 15:31:21'),
(158, 0, 'Tạo ticket', 2, '2019-12-07 15:32:05'),
(159, 0, 'Tạo ticket', 2, '2019-12-07 15:32:57'),
(160, 0, 'Tạo ticket', 2, '2019-12-07 15:33:29'),
(161, 61, 'Tạo ticket', 2, '2019-12-07 15:35:02'),
(162, 61, 'Xóa ticket', 2, '2019-12-07 15:36:22'),
(163, 60, 'Xóa ticket', 2, '2019-12-07 15:36:24'),
(164, 59, 'Xóa ticket', 2, '2019-12-07 15:36:27'),
(165, 58, 'Xóa ticket', 2, '2019-12-07 15:36:29'),
(166, 57, 'Xóa ticket', 2, '2019-12-07 15:36:32'),
(167, 56, 'Xóa ticket', 2, '2019-12-07 15:36:33'),
(168, 55, 'Xóa ticket', 2, '2019-12-07 15:36:35'),
(169, 54, 'Xóa ticket', 2, '2019-12-07 15:36:37'),
(170, 53, 'Xóa ticket', 2, '2019-12-07 15:36:39'),
(171, 52, 'Xóa ticket', 2, '2019-12-07 15:36:42'),
(172, 47, 'Sửa ticket', 2, '2019-12-07 15:37:00'),
(173, 47, 'Sửa ticket', 2, '2019-12-07 15:37:17'),
(174, 51, 'Sửa ticket', 2, '2019-12-07 15:45:28'),
(175, 52, 'Tạo ticket', 2, '2019-12-08 07:13:09'),
(176, 52, 'Đã tiếp nhận xử lý', 3, '2019-12-08 07:14:13'),
(177, 52, 'Đã tiếp nhận xử lý', 4, '2019-12-08 07:14:32'),
(178, 52, 'Đang xử lý', 0, '2019-12-08 07:16:26'),
(179, 52, 'Đang xử lý', 0, '2019-12-08 07:17:00'),
(180, 53, 'Tạo ticket', 2, '2019-12-08 07:21:06'),
(181, 53, 'Từ chối tiếp nhận', 3, '2019-12-08 07:22:00'),
(182, 54, 'Tạo ticket', 2, '2019-12-08 07:22:35'),
(183, 54, 'Đã tiếp nhận xử lý', 3, '2019-12-08 07:22:49'),
(184, 54, 'Từ chối tiếp nhận', 4, '2019-12-08 07:23:10'),
(185, 54, 'Đã tiếp nhận xử lý', 3, '2019-12-08 07:23:27'),
(186, 54, 'Đã tiếp nhận xử lý', 4, '2019-12-08 07:23:53'),
(187, 54, 'Đang xử lý', 0, '2019-12-08 07:23:59'),
(188, 54, 'Đang xử lý', 0, '2019-12-08 07:24:32'),
(189, 54, 'Từ chối xử lý', 3, '2019-12-08 07:27:39'),
(190, 54, 'Đã tiếp nhận xử lý', 4, '2019-12-08 07:28:01'),
(191, 54, 'Đang xử lý', 0, '2019-12-08 07:28:10'),
(192, 55, 'Tạo ticket', 2, '2019-12-08 15:35:31'),
(193, 55, 'Đã tiếp nhận xử lý', 3, '2019-12-08 15:36:03'),
(194, 55, 'Đã tiếp nhận xử lý', 4, '2019-12-08 15:36:25'),
(195, 55, 'Đang xử lý', 0, '2019-12-08 15:36:34'),
(196, 55, 'Đang xử lý', 0, '2019-12-08 15:37:04'),
(197, 56, 'Tạo ticket', 2, '2019-12-11 05:08:48'),
(198, 56, 'Đã tiếp nhận xử lý', 3, '2019-12-11 05:09:21'),
(199, 56, 'Đã tiếp nhận xử lý', 4, '2019-12-11 05:09:47'),
(200, 56, 'Đang xử lý', 0, '2019-12-11 05:09:55'),
(201, 56, 'Đang xử lý', 0, '2019-12-11 05:12:07'),
(202, 57, 'Tạo ticket', 2, '2019-12-11 05:12:28'),
(203, 57, 'Từ chối tiếp nhận', 3, '2019-12-11 05:12:58'),
(204, 58, 'Tạo ticket', 2, '2019-12-11 05:13:25'),
(205, 58, 'Đã tiếp nhận xử lý', 3, '2019-12-11 05:13:33'),
(206, 58, 'Từ chối tiếp nhận', 4, '2019-12-11 05:13:52'),
(207, 58, 'Đã tiếp nhận xử lý', 3, '2019-12-11 05:14:17'),
(208, 59, 'Tạo ticket', 2, '2019-12-11 06:03:49'),
(209, 60, 'Tạo ticket', 2, '2019-12-11 06:08:02'),
(210, 60, 'Xóa ticket', 0, '2019-12-15 06:35:41'),
(211, 59, 'Đã tiếp nhận xử lý', 3, '2019-12-16 14:24:18'),
(212, 59, 'Từ chối tiếp nhận', 4, '2019-12-16 14:28:14'),
(213, 59, 'Đã tiếp nhận xử lý', 4, '2019-12-16 14:28:17'),
(214, 59, 'Đã tiếp nhận xử lý', 3, '2019-12-16 14:28:46'),
(215, 59, 'Từ chối tiếp nhận', 4, '2019-12-16 14:29:01'),
(216, 59, 'Đã tiếp nhận xử lý', 4, '2019-12-16 14:29:06'),
(217, 60, 'Tạo ticket', 5, '2019-12-17 14:43:29'),
(218, 60, 'Đã tiếp nhận xử lý', 3, '2019-12-17 14:43:58'),
(219, 61, 'Tạo ticket', 5, '2019-12-17 14:50:01'),
(220, 61, 'Đã tiếp nhận xử lý', 3, '2019-12-17 14:50:20'),
(221, 62, 'Tạo ticket', 5, '2019-12-17 14:52:11'),
(222, 62, 'Đã tiếp nhận xử lý', 3, '2019-12-17 14:52:35'),
(223, 62, 'Từ chối tiếp nhận', 6, '2019-12-17 14:57:38'),
(224, 63, 'Tạo ticket', 5, '2019-12-17 14:58:10'),
(225, 63, 'Đã tiếp nhận xử lý', 3, '2019-12-17 14:59:45'),
(226, 64, 'Tạo ticket', 2, '2019-12-22 14:47:26'),
(227, 64, 'Từ chối tiếp nhận', 3, '2019-12-22 14:47:50'),
(228, 64, 'Đã tiếp nhận xử lý', 3, '2019-12-22 14:47:56'),
(229, 65, 'Tạo ticket', 2, '2019-12-22 14:51:11'),
(230, 65, 'Từ chối tiếp nhận', 3, '2019-12-22 14:51:22'),
(231, 46, 'Đã tiếp nhận xử lý', 4, '2019-12-22 14:52:18'),
(232, 59, 'Đang xử lý', 0, '2019-12-22 14:52:32'),
(233, 50, 'Từ chối tiếp nhận', 3, '2019-12-22 14:52:56'),
(234, 50, 'Đã tiếp nhận xử lý', 4, '2019-12-22 14:53:43'),
(235, 50, 'Đang xử lý', 0, '2019-12-22 14:54:16'),
(236, 50, 'Từ chối xử lý', 3, '2019-12-22 14:54:44'),
(237, 64, 'Đã tiếp nhận xử lý', 3, '2019-12-22 14:57:15'),
(238, 64, 'Đã tiếp nhận xử lý', 4, '2019-12-22 14:57:33'),
(239, 64, 'Đang xử lý', 0, '2019-12-22 14:57:40'),
(240, 64, 'Từ chối tiếp nhận', 4, '2019-12-22 14:57:55'),
(241, 64, 'Đã tiếp nhận xử lý', 3, '2019-12-22 14:58:39'),
(242, 64, 'Đã tiếp nhận xử lý', 4, '2019-12-22 14:58:53'),
(243, 64, 'Từ chối tiếp nhận', 4, '2019-12-22 14:59:07'),
(244, 66, 'Tạo ticket', 2, '2019-12-23 05:51:39'),
(245, 66, 'Đã tiếp nhận xử lý', 3, '2019-12-23 05:52:23'),
(246, 66, 'Đã tiếp nhận xử lý', 4, '2019-12-23 05:52:35'),
(247, 66, 'Đang xử lý', 0, '2019-12-23 05:52:48'),
(248, 66, 'Đang xử lý', 0, '2019-12-23 05:53:09'),
(249, 67, 'Tạo ticket', 2, '2019-12-23 05:56:19'),
(250, 67, 'Đã tiếp nhận xử lý', 3, '2019-12-23 05:57:04'),
(251, 67, 'Từ chối tiếp nhận', 4, '2019-12-23 05:57:25'),
(252, 67, 'Đã tiếp nhận xử lý', 3, '2019-12-23 05:57:39'),
(253, 67, 'Từ chối tiếp nhận', 3, '2019-12-23 05:58:30'),
(254, 68, 'Tạo ticket', 2, '2019-12-23 05:59:44'),
(255, 68, 'Đã tiếp nhận xử lý', 3, '2019-12-23 05:59:53'),
(256, 68, 'Đã tiếp nhận xử lý', 4, '2019-12-23 06:00:08'),
(257, 68, 'Từ chối tiếp nhận', 3, '2019-12-23 06:01:07'),
(258, 69, 'Tạo ticket', 2, '2019-12-23 06:04:52'),
(259, 69, 'Đã tiếp nhận xử lý', 3, '2019-12-23 06:05:06'),
(260, 69, 'Đã tiếp nhận xử lý', 3, '2019-12-23 06:07:25'),
(261, 69, 'Đã tiếp nhận xử lý', 4, '2019-12-23 06:08:45'),
(262, 69, 'Đã tiếp nhận xử lý', 4, '2019-12-23 06:08:56'),
(263, 69, 'Đã tiếp nhận xử lý', 4, '2019-12-23 06:09:01'),
(264, 70, 'Tạo ticket', 2, '2020-01-06 02:42:44'),
(265, 70, 'Đã tiếp nhận xử lý', 3, '2020-01-06 02:43:06'),
(266, 70, 'Đã tiếp nhận xử lý', 4, '2020-01-06 02:44:30'),
(267, 70, 'Đang xử lý', 0, '2020-01-06 02:44:39'),
(268, 70, 'Đang xử lý', 0, '2020-01-06 02:44:54'),
(269, 71, 'Tạo ticket', 2, '2020-05-09 08:16:09'),
(270, 71, 'Đã tiếp nhận xử lý', 3, '2020-05-09 08:17:27'),
(271, 72, 'Tạo ticket', 2, '2020-06-01 02:45:50'),
(272, 38, 'Đã tiếp nhận xử lý', 4, '2020-06-20 06:03:52'),
(273, 72, 'Từ chối tiếp nhận', 3, '2020-06-20 06:06:09');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `UserID` int(11) NOT NULL,
  `Fullname` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  `UserName` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  `Password` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  `Email` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  `Status` int(11) NOT NULL,
  `DeptID` int(11) DEFAULT NULL,
  `RoleID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`UserID`, `Fullname`, `UserName`, `Password`, `Email`, `Status`, `DeptID`, `RoleID`) VALUES
(1, '', 'sinhvien', 'c4ca4238a0b923820dcc509a6f75849b', '', 1, 0, 1),
(2, 'Nguyễn Bá Vinh', 'sv', 'c4ca4238a0b923820dcc509a6f75849b', '', 1, NULL, 1),
(3, '', 'ad', 'c4ca4238a0b923820dcc509a6f75849b', 'vinhnguyenba217@gmail.com', 1, 3, 2),
(4, '', 'staff', 'c4ca4238a0b923820dcc509a6f75849b', 'vinhnbph07366@fpt.edu.vn', 1, 3, 3),
(5, 'Trần Văn B', 'svb', 'c4ca4238a0b923820dcc509a6f75849b', '', 1, NULL, 1),
(6, 'Thien Tran Huu', 'Thientt', 'c4ca4238a0b923820dcc509a6f75849b', 'Thien@gmail.com', 1, 3, 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `userattributes`
--

CREATE TABLE `userattributes` (
  `ID` int(11) NOT NULL,
  `Attribute` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `userattributes`
--

INSERT INTO `userattributes` (`ID`, `Attribute`) VALUES
(1, 'Fullname'),
(2, 'Phone'),
(3, 'Email');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `userdetails`
--

CREATE TABLE `userdetails` (
  `ID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `AttrID` int(11) NOT NULL,
  `Value` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`CommentsID`);

--
-- Chỉ mục cho bảng `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`ID`);

--
-- Chỉ mục cho bảng `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`ID`);

--
-- Chỉ mục cho bảng `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`StatusID`);

--
-- Chỉ mục cho bảng `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`ID`);

--
-- Chỉ mục cho bảng `ticketcategories`
--
ALTER TABLE `ticketcategories`
  ADD PRIMARY KEY (`ID`);

--
-- Chỉ mục cho bảng `tickethistory`
--
ALTER TABLE `tickethistory`
  ADD PRIMARY KEY (`TicketHistoryID`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`UserID`);

--
-- Chỉ mục cho bảng `userattributes`
--
ALTER TABLE `userattributes`
  ADD PRIMARY KEY (`ID`);

--
-- Chỉ mục cho bảng `userdetails`
--
ALTER TABLE `userdetails`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `comments`
--
ALTER TABLE `comments`
  MODIFY `CommentsID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `departments`
--
ALTER TABLE `departments`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `role`
--
ALTER TABLE `role`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `status`
--
ALTER TABLE `status`
  MODIFY `StatusID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `ticket`
--
ALTER TABLE `ticket`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT cho bảng `ticketcategories`
--
ALTER TABLE `ticketcategories`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `tickethistory`
--
ALTER TABLE `tickethistory`
  MODIFY `TicketHistoryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=274;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `userattributes`
--
ALTER TABLE `userattributes`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `userdetails`
--
ALTER TABLE `userdetails`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
