-- phpMyAdmin SQL Dump
-- version 4.6.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- 생성 시간: 16-11-17 22:14
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
  `orderSeq` int(11) NOT NULL COMMENT '주문Seq',
  `orderState` varchar(30) NOT NULL COMMENT '주문상태',
  `orderNum` int(11) NOT NULL COMMENT '주문번호(날짜+Seq)',
  `orderDate` datetime NOT NULL COMMENT '주문일시',
  `purchaseDate` datetime NOT NULL COMMENT '결제일시',
  `id` varchar(25) NOT NULL COMMENT '아이디',
  `username` varchar(30) NOT NULL COMMENT '사용자이름',
  `recipient` varchar(25) NOT NULL COMMENT '받는사람',
  `purchasename` varchar(25) NOT NULL COMMENT '입금자',
  `paymentMethod` varchar(30) NOT NULL COMMENT '결제방식',
  `recipientAddressNum` int(11) NOT NULL COMMENT '우편번호',
  `recipientAddress` varchar(60) NOT NULL COMMENT '받는주소',
  `recipientContact` varchar(30) NOT NULL COMMENT '전화번호',
  `escro` varchar(25) NOT NULL COMMENT '에스크로여부',
  `couponCost` int(11) NOT NULL COMMENT '쿠폰사용액',
  `totalCost` int(11) NOT NULL COMMENT '총금액',
  `adminName` varchar(30) NOT NULL COMMENT '관리자이름',
  `postNum` int(21) NOT NULL COMMENT '송장번호',
  `request` varchar(1024) NOT NULL COMMENT '요청사항'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='주문정보테이블';

--
-- 테이블의 덤프 데이터 `orderinfo`
--

INSERT INTO `orderinfo` (`orderSeq`, `orderState`, `orderNum`, `orderDate`, `purchaseDate`, `id`, `username`, `recipient`, `purchasename`, `paymentMethod`, `recipientAddressNum`, `recipientAddress`, `recipientContact`, `escro`, `couponCost`, `totalCost`, `adminName`, `postNum`, `request`) VALUES
(3, '주문접수', 201610203, '2016-10-20 05:21:22', '2016-10-21 04:22:08', 'testid1', '김도영', '조성동', '박태우', '신용카드', 34312, 'Daechidong Centreville Gangnam Seoul South Korea 138545', '01087742064', '일반결제', 0, 52500, '노가모토', 49586794, '빠른 배송 부탁드립니다.'),
(4, '배송완료', 201610194, '2016-10-19 07:34:27', '2016-10-19 13:34:24', 'testid2', '노가모토', '곽유미', '박태우', '신용카드', 23453, '서울특별시 광진구 군자동 48-36 403호', '01053929123', '에스크로', 1000, 133000, '김도영', 34589209, '경비실에 맡겨주세요.'),
(11, '배송준비', 2016102211, '2016-10-22 05:24:15', '2016-10-22 16:32:27', 'testid3', '박태우', '조상혁', '박태우', '신용카드', 45323, '부산특별시 사하구 우동 현대아파트 102동 603호', '01048593950', '일반결제', 2000, 144000, '곽유미', 3674567, '안전하게 배송해주세요.');

-- --------------------------------------------------------

--
-- 테이블 구조 `productinfo`
--

CREATE TABLE `productinfo` (
  `productSeq` int(11) NOT NULL COMMENT '상품번호',
  `productState` varchar(25) NOT NULL COMMENT '처리상태',
  `shoppingmall` varchar(60) NOT NULL COMMENT '쇼핑몰',
  `imageURL` varchar(255) NOT NULL COMMENT '이미지링크',
  `name` varchar(100) NOT NULL COMMENT '상품이름',
  `price` int(11) NOT NULL COMMENT '상품가격',
  `shippingcost` int(11) NOT NULL COMMENT '운송료',
  `discountprice` int(11) NOT NULL COMMENT '할인액',
  `quantity` int(11) NOT NULL COMMENT '상품수량',
  `orderId` int(11) NOT NULL COMMENT '주문번호'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='주문에 대한 상품정보';

--
-- 테이블의 덤프 데이터 `productinfo`
--

INSERT INTO `productinfo` (`productSeq`, `productState`, `shoppingmall`, `imageURL`, `name`, `price`, `shippingcost`, `discountprice`, `quantity`, `orderId`) VALUES
(1, '입금확인', 'http://bokhaksaeng.com/', '"http://bagazimuri.com/web/product/medium/201608/94712_shop1_576216.jpg"', '"볼륨-블라우스"', 25000, 2500, 0, 2, 3),
(2, '배송준비중', 'http://www.mapssi.com/', '"http://bagazimuri.com/web/product/medium/201608/94712_shop1_576216.jpg"', 'JAY ADAMS COACH JACKET BEIGE', 79000, 2500, 1000, 1, 4),
(12, '입금확인', 'http://www.mapssi.com/', '"http://bagazimuri.com/web/product/medium/201608/94712_shop1_576216.jpg"', ' 16 F/W BASIC 루즈핏 레이어드 맨투맨 5 Color (BLACK)', 30000, 3000, 1000, 3, 11),
(13, '입금확인', 'http://www.mapssi.com/', '"http://bagazimuri.com/web/product/medium/201608/94712_shop1_576216.jpg"', ' [출고3-5일]G-SHOCK 지샥 GA-150-1A 빅페이스 스포츠 시계', 50000, 3000, 1000, 1, 11),
(16, '반품', 'http://bokhaksaeng.com/', '"http://bagazimuri.com/web/product/medium/201608/94712_shop1_576216.jpg"', '"볼륨-블라우스"', 25000, 2500, 0, 2, 4);

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
(11, 12, 'XL'),
(15, 16, 'S');

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
  MODIFY `orderSeq` int(11) NOT NULL AUTO_INCREMENT COMMENT '주문Seq', AUTO_INCREMENT=13;
--
-- 테이블의 AUTO_INCREMENT `productinfo`
--
ALTER TABLE `productinfo`
  MODIFY `productSeq` int(11) NOT NULL AUTO_INCREMENT COMMENT '상품번호', AUTO_INCREMENT=17;
--
-- 테이블의 AUTO_INCREMENT `productoptioninfo`
--
ALTER TABLE `productoptioninfo`
  MODIFY `optionSeq` int(11) NOT NULL AUTO_INCREMENT COMMENT '옵션번호', AUTO_INCREMENT=16;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
