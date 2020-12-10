


CREATE TABLE `books` (
  `USERID` int(11) DEFAULT NULL,
  `BOOKID` int(11) NOT NULL,
  `TITLE` varchar(256) DEFAULT NULL,
  `PUBLISHER` varchar(64) DEFAULT NULL,
  `STATUS` varchar(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



INSERT INTO `books` (`USERID`, `BOOKID`, `TITLE`, `PUBLISHER`, `STATUS`) VALUES
(1, 1, 'Tai lieu huong dan thuc hanh dien tu co ban', 'Phan Đình Duy, Lê Văn La, Cao Văn Hưng', 'available'),
(1, 2, 'Tai lieu huong dan cong nghe .Net', 'Phạm Thi Vương, Trần Anh Dũng, Lê Minh Trí, Nguyễn Phương Anh', 'available'),
(1, 3, 'Giao trinh nhap mon phat trien game', 'Vũ Thanh Nguyên, Đinh Nguyễn Anh Dũng', 'available'),
(2, 4, 'Giao trinh dac ta hinh thuc', 'Vũ Thanh Nguyên, Hầu Nguyễn Thành Nam', 'available'),
(1, 5, 'Tich hop ONTOLOGY dong thuan', 'Trương Hải Bằng', 'unavailable'),
(2, 6, 'Phan tich dao dong phi tuyen', 'Dương Ngọc Hảo', 'unavailable');

CREATE TABLE `exchange` (
  `EXCHANGEID` int(11) NOT NULL,
  `USERID1` int(11) DEFAULT NULL,
  `USERID2` int(11) DEFAULT NULL,
  `BOOKID1` int(11) DEFAULT NULL,
  `BOOKID2` int(11) DEFAULT NULL,
  `STATUS` varchar(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO `exchange` (`EXCHANGEID`, `USERID1`, `USERID2`, `BOOKID1`, `BOOKID2`, `STATUS`) VALUES
(1, 1, 2, 5, 6, 'accepted'),
(2, 2, 1, 4, 2, 'waiting');


CREATE TABLE `user` (
  `ID` int(11) NOT NULL,
  `USERNAME` varchar(32) DEFAULT NULL,
  `NAME` varchar(32) DEFAULT NULL,
  `PASSWORD` varchar(256) DEFAULT NULL,
  `PHONE` varchar(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO `user` (`ID`, `USERNAME`, `NAME`, `PASSWORD`, `PHONE`) VALUES
(1, 'admin', 'Nguyen Van An', '$2y$10$cYU3SahLcmhiCoN9Pg6.p.dn/kj2dqgYK6QaleJBz3aRSculMKwGe', '02131232222'),
(2, 'test', 'Tran Thi Bich', '$2y$10$Di1QbvK8cxbn82fAv1Tg5OZeyovsg/mx5yroqwCsNcj1qS5Jf9YIq', '0923423342');

ALTER TABLE `books`
  ADD PRIMARY KEY (`BOOKID`),
  ADD KEY `FK_RELATIONSHIP_1` (`USERID`);


ALTER TABLE `exchange`
  ADD PRIMARY KEY (`EXCHANGEID`),
  ADD KEY `FK_RELATIONSHIP_2` (`USERID1`),
  ADD KEY `FK_RELATIONSHIP_3` (`USERID2`),
  ADD KEY `FK_RELATIONSHIP_4` (`BOOKID1`),
  ADD KEY `FK_RELATIONSHIP_5` (`BOOKID2`);

ALTER TABLE `user`
  ADD PRIMARY KEY (`ID`);

ALTER TABLE `books`
  MODIFY `BOOKID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
ALTER TABLE `user`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
ALTER TABLE `exchange`
  MODIFY `EXCHANGEID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;


ALTER TABLE `books`
  ADD CONSTRAINT `FK_RELATIONSHIP_1` FOREIGN KEY (`USERID`) REFERENCES `user` (`ID`);


ALTER TABLE `exchange`
  ADD CONSTRAINT `FK_RELATIONSHIP_2` FOREIGN KEY (`USERID1`) REFERENCES `user` (`ID`),
  ADD CONSTRAINT `FK_RELATIONSHIP_3` FOREIGN KEY (`USERID2`) REFERENCES `user` (`ID`),
  ADD CONSTRAINT `FK_RELATIONSHIP_4` FOREIGN KEY (`BOOKID1`) REFERENCES `books` (`BOOKID`),
  ADD CONSTRAINT `FK_RELATIONSHIP_5` FOREIGN KEY (`BOOKID2`) REFERENCES `books` (`BOOKID`);
COMMIT;

