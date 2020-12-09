-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 09, 2020 lúc 08:15 AM
-- Phiên bản máy phục vụ: 10.4.14-MariaDB
-- Phiên bản PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `exchangebook`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `books`
--

CREATE TABLE `books` (
  `USERID` int(11) DEFAULT NULL,
  `BOOKID` int(11) NOT NULL,
  `TITLE` varchar(256) DEFAULT NULL,
  `PUBLISHER` varchar(64) DEFAULT NULL,
  `STATUS` varchar(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `books`
--

INSERT INTO `books` (`USERID`, `BOOKID`, `TITLE`, `PUBLISHER`, `STATUS`) VALUES
(1, 1, 'Tài liệu hướng dẫn thực hành Điện-Điện tử cơ bản', 'Phan Đình Duy, Lê Văn La, Cao Văn Hưng', 'available'),
(1, 2, 'Tài liệu hướng dẫn thực hành công nghệ .Net', 'Phạm Thi Vương, Trần Anh Dũng, Lê Minh Trí, Nguyễn Phương Anh', 'available'),
(1, 3, 'Giáo trình nhập môn phát triển game', 'Vũ Thanh Nguyên, Đinh Nguyễn Anh Dũng', 'available'),
(2, 4, 'Giáo trình đặc tả hình thức', 'Vũ Thanh Nguyên, Hầu Nguyễn Thành Nam', 'available'),
(1, 5, 'Tích hợp ONTOLOGY mở trên cơ sở lý thuyết đồng thuận', 'Trương Hải Bằng', 'unavailable'),
(2, 6, 'Phân tích dao động phi tuyến', 'Dương Ngọc Hảo', 'unavailable');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `exchange`
--

CREATE TABLE `exchange` (
  `EXCHANGEID` int(11) NOT NULL,
  `USERID1` int(11) DEFAULT NULL,
  `USERID2` int(11) DEFAULT NULL,
  `BOOKID1` int(11) DEFAULT NULL,
  `BOOKID2` int(11) DEFAULT NULL,
  `STATUS` varchar(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `exchange`
--

INSERT INTO `exchange` (`EXCHANGEID`, `USERID1`, `USERID2`, `BOOKID1`, `BOOKID2`, `STATUS`) VALUES
(1, 1, 2, 5, 6, 'accepted'),
(2, 2, 1, 4, 2, 'waiting');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `ID` int(11) NOT NULL,
  `USERNAME` varchar(32) DEFAULT NULL,
  `NAME` varchar(32) DEFAULT NULL,
  `PASSWORD` varchar(256) DEFAULT NULL,
  `PHONE` varchar(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`ID`, `USERNAME`, `NAME`, `PASSWORD`, `PHONE`) VALUES
(1, 'admin', 'Nguyen Van An', '$2y$10$cYU3SahLcmhiCoN9Pg6.p.dn/kj2dqgYK6QaleJBz3aRSculMKwGe', '02131232222'),
(2, 'test', 'Tran Thi Bich', '$2y$10$Di1QbvK8cxbn82fAv1Tg5OZeyovsg/mx5yroqwCsNcj1qS5Jf9YIq', '0923423342');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`BOOKID`),
  ADD KEY `FK_RELATIONSHIP_1` (`USERID`);

--
-- Chỉ mục cho bảng `exchange`
--
ALTER TABLE `exchange`
  ADD PRIMARY KEY (`EXCHANGEID`),
  ADD KEY `FK_RELATIONSHIP_2` (`USERID1`),
  ADD KEY `FK_RELATIONSHIP_3` (`USERID2`),
  ADD KEY `FK_RELATIONSHIP_4` (`BOOKID1`),
  ADD KEY `FK_RELATIONSHIP_5` (`BOOKID2`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `books`
--
ALTER TABLE `books`
  MODIFY `BOOKID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `books`
--
ALTER TABLE `books`
  ADD CONSTRAINT `FK_RELATIONSHIP_1` FOREIGN KEY (`USERID`) REFERENCES `user` (`ID`);

--
-- Các ràng buộc cho bảng `exchange`
--
ALTER TABLE `exchange`
  ADD CONSTRAINT `FK_RELATIONSHIP_2` FOREIGN KEY (`USERID1`) REFERENCES `user` (`ID`),
  ADD CONSTRAINT `FK_RELATIONSHIP_3` FOREIGN KEY (`USERID2`) REFERENCES `user` (`ID`),
  ADD CONSTRAINT `FK_RELATIONSHIP_4` FOREIGN KEY (`BOOKID1`) REFERENCES `books` (`BOOKID`),
  ADD CONSTRAINT `FK_RELATIONSHIP_5` FOREIGN KEY (`BOOKID2`) REFERENCES `books` (`BOOKID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
