-- phpMyAdmin SQL Dump
-- version 4.6.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- 생성 시간: 16-10-02 03:14
-- 서버 버전: 5.6.31
-- PHP 버전: 5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 데이터베이스: `baguni`
--

-- --------------------------------------------------------

--
-- 테이블 구조 `orderinfo`
--

CREATE TABLE `orderinfo` (
  `orderSeq` int(11) NOT NULL COMMENT '주문번호',
  `username` varchar(30) NOT NULL COMMENT '사용자이름',
  `paymentMethod` varchar(30) NOT NULL COMMENT '결제방식',
  `recipientAddress` varchar(60) NOT NULL COMMENT '받는주소',
  `recipientContact` varchar(30) NOT NULL COMMENT '전화번호',
  `shippingCost` int(11) NOT NULL COMMENT '운송료',
  `totalCost` int(11) NOT NULL COMMENT '총금액'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='주문정보테이블';

--
-- 테이블의 덤프 데이터 `orderinfo`
--

INSERT INTO `orderinfo` (`orderSeq`, `username`, `paymentMethod`, `recipientAddress`, `recipientContact`, `shippingCost`, `totalCost`) VALUES
(3, 'baguni', 'Visa Card', 'Daechidong Centreville Gangnam Seoul South Korea 138545', '01087742064', 2, 55202),
(4, 'name', 'visa', 'seoul', '1234', 1000, 20000),
(11, 'suzy', 'visa', 'seoul', '1234', 1000, 20000);

-- --------------------------------------------------------

--
-- 테이블 구조 `productinfo`
--

CREATE TABLE `productinfo` (
  `productSeq` int(11) NOT NULL COMMENT '상품번호',
  `imageURL` varchar(255) NOT NULL COMMENT '이미지링크',
  `name` varchar(100) NOT NULL COMMENT '상품이름',
  `price` int(11) NOT NULL COMMENT '상품가격',
  `quantity` int(11) NOT NULL COMMENT '상품수량',
  `orderId` int(11) NOT NULL COMMENT '주문번호'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='주문에 대한 상품정보';

--
-- 테이블의 덤프 데이터 `productinfo`
--

INSERT INTO `productinfo` (`productSeq`, `imageURL`, `name`, `price`, `quantity`, `orderId`) VALUES
(1, '"http://bagazimuri.com/web/product/medium/201608/94712_shop1_576216.jpg"', '"볼륨-블라우스"', 27600, 2, 3),
(2, '"http://img.mapssi.com/newItem/costumeoclock/9%EC%9B%9421%EC%9D%BC%EC%98%88%EC%95%BD%EB%B0%9C%EC%86%A1JAYADAMSCOACHJACKETBEIGE/20160913104537sideCOOSJP013BEIGE11.jpg"', 'JAY ADAMS COACH JACKET BEIGE', 79000, 1, 4),
(12, 'http://img.mapssi.com/newItem/WHAT9/16SSBASIC%EB%A3%A8%EC%A6%88%ED%95%8F%EB%A0%88%EC%9D%B4%EC%96%B4%EB%93%9C%EB%A7%A8%ED%88%AC%EB%A7%A85ColorBLACK/20160824005122side900jpg.jpg', '\n 16 F/W BASIC 루즈핏 레이어드 맨투맨 5 Color (BLACK)', 39800, 3, 11),
(13, 'http://img.mapssi.com/newItem/G-SHOCK/%EC%B6%9C%EA%B3%A035%EC%9D%BCGSHOCK%EC%A7%80%EC%83%A5GA1501A%EB%B9%85%ED%8E%98%EC%9D%B4%EC%8A%A4%EC%8A%A4%ED%8F%AC%EC%B8%A0%EC%8B%9C%EA%B3%84/20160930023537side117.jpg', '\n [출고3-5일]G-SHOCK 지샥 GA-150-1A 빅페이스 스포츠 시계', 168000, 1, 11);

-- --------------------------------------------------------

--
-- 테이블 구조 `productoptioninfo`
--

CREATE TABLE `productoptioninfo` (
  `optionSeq` int(11) NOT NULL COMMENT '옵션번호',
  `productId` int(11) NOT NULL COMMENT '상품번호',
  `optionDetail` varchar(255) NOT NULL COMMENT '옵션사항'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='상품번호에 대한 옵션테이블';

--
-- 테이블의 덤프 데이터 `productoptioninfo`
--

INSERT INTO `productoptioninfo` (`optionSeq`, `productId`, `optionDetail`) VALUES
(1, 1, 'M'),
(2, 2, 'L'),
(12, 13, 'BLACK'),
(11, 12, 'XL');

--
-- 덤프된 테이블의 인덱스
--

--
-- 테이블의 인덱스 `orderinfo`
--
ALTER TABLE `orderinfo`
  ADD PRIMARY KEY (`orderSeq`);

--
-- 테이블의 인덱스 `productinfo`
--
ALTER TABLE `productinfo`
  ADD PRIMARY KEY (`productSeq`);

--
-- 테이블의 인덱스 `productoptioninfo`
--
ALTER TABLE `productoptioninfo`
  ADD PRIMARY KEY (`optionSeq`);

--
-- 덤프된 테이블의 AUTO_INCREMENT
--

--
-- 테이블의 AUTO_INCREMENT `orderinfo`
--
ALTER TABLE `orderinfo`
  MODIFY `orderSeq` int(11) NOT NULL AUTO_INCREMENT COMMENT '주문번호', AUTO_INCREMENT=13;
--
-- 테이블의 AUTO_INCREMENT `productinfo`
--
ALTER TABLE `productinfo`
  MODIFY `productSeq` int(11) NOT NULL AUTO_INCREMENT COMMENT '상품번호', AUTO_INCREMENT=16;
--
-- 테이블의 AUTO_INCREMENT `productoptioninfo`
--
ALTER TABLE `productoptioninfo`
  MODIFY `optionSeq` int(11) NOT NULL AUTO_INCREMENT COMMENT '옵션번호', AUTO_INCREMENT=15;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
