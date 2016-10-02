-- phpMyAdmin SQL Dump
-- version 4.6.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- 생성 시간: 16-10-02 03:12
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
CREATE DATABASE IF NOT EXISTS `baguni` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `baguni`;

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
  MODIFY `optionSeq` int(11) NOT NULL AUTO_INCREMENT COMMENT '옵션번호', AUTO_INCREMENT=15;--
-- 데이터베이스: `sj_member`
--
CREATE DATABASE IF NOT EXISTS `sj_member` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `sj_member`;

DELIMITER $$
--
-- 프로시저
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `FILL_RATE_TEST_DATA` ()  BEGIN
WHILE (i < 99) DO
	select SUM((SELECT `opacity` FROM `bus_info` where busSeq=i) - (SELECT count(*) FROM `sales_info` where busseq=i and refund='X'));
END WHILE;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- 테이블 구조 `account_info`
--

CREATE TABLE `account_info` (
  `memberSeq` int(11) NOT NULL,
  `id` varchar(30) NOT NULL COMMENT '아이디',
  `pwd` varchar(255) NOT NULL COMMENT '비밀번호'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 테이블의 덤프 데이터 `account_info`
--

INSERT INTO `account_info` (`memberSeq`, `id`, `pwd`) VALUES
(25, 'master', '$2y$10$vka0mHK5hAV1r1DshufAauJ6d0raL0nnnJOlD8F3M2pbOMsTLfxUe');

-- --------------------------------------------------------

--
-- 테이블 구조 `account_info1`
--

CREATE TABLE `account_info1` (
  `memberSeq` int(11) NOT NULL,
  `id` varchar(30) NOT NULL COMMENT '아이디',
  `pwd` varchar(255) NOT NULL COMMENT '비밀번호',
  `nick` varchar(10) NOT NULL COMMENT '닉네임',
  `mail` varchar(30) NOT NULL COMMENT '학교 이메일'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 테이블의 덤프 데이터 `account_info1`
--

INSERT INTO `account_info1` (`memberSeq`, `id`, `pwd`, `nick`, `mail`) VALUES
(43, 'josungdong', '$2y$10$OzpLNulH9O9Sp4UEpedYSOTFaLjRkgRnJIHl3LHRE28KsBYgw1BVe', 'asdf234', 'josungdong@sju.ac.kr');

-- --------------------------------------------------------

--
-- 테이블 구조 `arrival_info`
--

CREATE TABLE `arrival_info` (
  `arrivalSeq` int(11) NOT NULL,
  `arrival` varchar(30) NOT NULL COMMENT '지역명'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 테이블의 덤프 데이터 `arrival_info`
--

INSERT INTO `arrival_info` (`arrivalSeq`, `arrival`) VALUES
(1, '대전'),
(2, '대구');

-- --------------------------------------------------------

--
-- 테이블 구조 `board_info`
--

CREATE TABLE `board_info` (
  `boardSeq` int(11) NOT NULL,
  `category` varchar(30) NOT NULL,
  `title` varchar(30) NOT NULL,
  `content` text NOT NULL,
  `author` varchar(30) NOT NULL,
  `date` datetime NOT NULL,
  `hit` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 테이블의 덤프 데이터 `board_info`
--

INSERT INTO `board_info` (`boardSeq`, `category`, `title`, `content`, `author`, `date`, `hit`) VALUES
(1, 'free', '테스트제목', '테스트내용', '테스트작성자', '2016-08-17 08:21:33', 0),
(2, 'free', '응테스트야', '응테스트', 'asdf234', '2016-08-20 04:13:00', 0);

-- --------------------------------------------------------

--
-- 테이블 구조 `bus_info`
--

CREATE TABLE `bus_info` (
  `busSeq` int(11) NOT NULL,
  `depart1` varchar(30) NOT NULL COMMENT '제1출발지',
  `depart2` varchar(30) NOT NULL COMMENT '제2출발지',
  `devert` varchar(30) NOT NULL COMMENT '경유지',
  `arrival` varchar(30) NOT NULL COMMENT '도착지',
  `margin` varchar(30) NOT NULL COMMENT '여석',
  `opacity` varchar(30) NOT NULL COMMENT '수용인원',
  `price` varchar(30) NOT NULL COMMENT '가격'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 테이블의 덤프 데이터 `bus_info`
--

INSERT INTO `bus_info` (`busSeq`, `depart1`, `depart2`, `devert`, `arrival`, `margin`, `opacity`, `price`) VALUES
(26, '한국외대', '세종대', '대전', '부산', '1', '45', '9000'),
(27, '삼육대', '건국대', '대구', '부산', '1', '45', '9000'),
(28, '한예종', '', '구미', '군산', '1', '45', '9000'),
(29, '세종대 (화 17:00출발)', '서울여대', '구미', '강릉', '1', '45', '9000'),
(30, '대전', '', '', '서울', '1', '33', '9000');

-- --------------------------------------------------------

--
-- 테이블 구조 `city_info`
--

CREATE TABLE `city_info` (
  `citySeq` int(11) NOT NULL,
  `index` varchar(30) NOT NULL COMMENT '지역알파벳',
  `city` varchar(255) NOT NULL COMMENT '도시이름'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 테이블의 덤프 데이터 `city_info`
--

INSERT INTO `city_info` (`citySeq`, `index`, `city`) VALUES
(1, 'A', '강릉, 동해, 삼척, 속초, 원주, 춘천, 태백'),
(2, 'B', '김해, 진주, 진해, 마산, 사천, 통영, 거제, 양산, 밀양, 안동, 경주, 대구, 포항, 구미, 김천, 부산'),
(3, 'C', '광주, 여수, 목포, 순천, 완도, 고흥, 광양, 전주, 남원, 고창, 무주, 화순, 군산'),
(4, 'D', '아산, 보령, 천안, 대전, 보은, 영동, 안면도, 당진, 청주, 충주, 제천');

-- --------------------------------------------------------

--
-- 테이블 구조 `mail_code`
--

CREATE TABLE `mail_code` (
  `codeSeq` int(11) NOT NULL COMMENT '시퀀스',
  `mail` varchar(255) NOT NULL COMMENT '메일주소',
  `code` varchar(30) NOT NULL COMMENT '메일코드',
  `cert_ok` varchar(30) NOT NULL DEFAULT 'X' COMMENT '인증확인'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='가입시 메일과 인증코드 인증';

-- --------------------------------------------------------

--
-- 테이블 구조 `sales_info`
--

CREATE TABLE `sales_info` (
  `salesSeq` int(11) NOT NULL,
  `depart` varchar(30) NOT NULL COMMENT '출발지',
  `arrival` varchar(30) NOT NULL COMMENT '도착지',
  `name` varchar(30) NOT NULL COMMENT '이름',
  `phone` varchar(30) NOT NULL COMMENT '전화번호',
  `univ` varchar(30) NOT NULL COMMENT '소속',
  `refundpwd` varchar(255) NOT NULL COMMENT '환불비밀번호',
  `ticketnum` varchar(30) NOT NULL COMMENT '티켓번호',
  `busseq` varchar(30) NOT NULL COMMENT '버스시퀀스',
  `blank` varchar(60) NOT NULL COMMENT '비고',
  `price` varchar(30) NOT NULL COMMENT '가격',
  `refund` varchar(30) NOT NULL DEFAULT 'X' COMMENT '환불'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 테이블의 덤프 데이터 `sales_info`
--

INSERT INTO `sales_info` (`salesSeq`, `depart`, `arrival`, `name`, `phone`, `univ`, `refundpwd`, `ticketnum`, `busseq`, `blank`, `price`, `refund`) VALUES
(6, '한국외대', '부산', '박진영', '1234', '세종대', '$2y$10$GS33YneCrlAu8TkthahVI.rZtKTT0MzgwrDy.OoKAA.8wxEBTN80O', 'B1234', '26', '1234', '9000', 'O'),
(7, '삼육대', '부산', '유현수', '1234', '세종대', '$2y$10$2QAwWEcrm/17XCB5Brdm2Oaas2nYjLVRso4u8cgYvBOyTcQStUFSe', 'B1234', '27', '1234', '9000', 'O'),
(8, '한예종', '군산', '박진영', '01012341234', '세종대', '$2y$10$9kPddPRsf7430srNbeelAOJC3BtsQjhTbXQ72fKFZ7Wu.D4qoj8I.', 'C1234', '28', '1234', '9000', 'O'),
(9, '세종대 (화 17:00출발)', '강릉', '박진영', '1234', '세종대', '$2y$10$b7p0tP0Xu2LmF.gU1PWCpeyZf14tRt8mAypGIPBkjDae5vs8nBvOi', 'A1234', '29', '1234', '9000', 'O'),
(10, '삼육대', '부산', '김태희', '1234', '세종대', '$2y$10$MAFCYFfLYcm7uRTYWRRE6edEkzrrGMZrmDSjUlTtwvjF6uiP7EEvW', 'B1234', '27', '1234', '9000', 'O'),
(11, '삼육대', '부산', '응아니야', '0101234', '세종대', '$2y$10$.HPkTghOLeKMS4O2YFFOvOPfy8siOpqCpSGRnzLigqTJOpexkQOwK', 'B1234', '27', '1234', '9000', 'O'),
(12, '한국외대', '부산', '으아아', '1234', '세종대', '$2y$10$vMEZgiCH2tbXVPTd4wF80OchGL8m69LLKMMuj1fjlMrd6.vVQpGZm', 'B1234', '26', '1234', '9000', 'O'),
(13, '한국외대', '부산', '한승연', '01012341234', '세종대', '$2y$10$QHSz2uFoAeQy/YV1pDj0Ue/oMdTcp6hyXgMjAl6Eaig6RPYX.Siwa', '부산1234', '26', '1234', '9000', 'X'),
(14, '삼육대', '부산', 'sdsdf', '1234', '세종대', '$2y$10$8w0HFlx6mxdzuh3ILbQSVeB4ogTXO3X.1yCjw6dQNehKMoCM9641.', 'B1234', '27', '\'or\'1\'=\'1\'', '9000', 'X'),
(15, '삼육대', '부산', 'dlamkdi', '1324', '세종대', '$2y$10$gGE1UifbtTvHSPgcIqhbhutT95iwtvCX58WkVK/DUU1lNXvnQ8wd6', 'B1234', '27', '\'or', '9000', 'X'),
(16, '', '', '', '1234', '세종대', '$2y$10$PMgtC.ui1T8jQ4KhKQo/ZOjKKCdkcxHUubJvG1tIMg7QAJ2Dm/lUq', 'B1234', '27', '', '9000', 'X'),
(17, '삼육대', '부산', '자다시', '01012341234', '세종대', '$2y$10$4cjTjZKoBB391L/aMGgjJ.E0y6hh2wYJdZe7a3JA4jSd9INi6tlWW', 'B1234', '27', '\'or \'1\'=\'1\'', '9000', 'X'),
(18, '삼육대', '부산', '제에발', '12341234', '세종대', '$2y$10$a6uxn7ZJJ03ilQBRWFIuHe6rwCehIOLsqvNZSHa5JBY7wToiZsgBy', 'B1234', '27', '\'or \'1\'=\'1\'', '9000', 'X'),
(19, '삼육대', '부산', '으아', '1234', '세종대', '$2y$10$QwDpLosvIB5BG/ZDkQn3eO/vnUXBdylvKVQOwF8Pn2sdZuUnkDA7m', 'B1234', '27', '\'or', '9000', 'X'),
(20, '삼육대', '부산', 'dldi', '1234', '세종대', '$2y$10$PsgKX1Ru1xp2DE.SY7SqTeKv6TzcTpqY0tvPXKoKDU6.JVHoPnS1q', 'B1234', '27', '\'dd', '9000', 'X'),
(21, '삼육대', '부산', 'ddd', '12345664536', '세종대', '$2y$10$ADhPv224csIoZb9qJ3mwj.4boBTPSdl0Zp2.mY0ksjTqlqL1/djbS', 'B1234', '27', '1234', '9000', 'X'),
(22, '세종대 (화 17:00출발)', '강릉', 'ddd23', '123456645365', '과기대', '$2y$10$vEIZXokdPkEBhEAv/4lXuebY.ewHfXuK/Bhvk/CYpUN/WnZT/EOLa', 'A1234', '29', '1234', '9000', 'X'),
(23, '삼육대', '부산', '조성동임', '01012341342', '세종대', '$2y$10$9jazj0vLbV00c0SMgAYecO8wTBNM.Xu/juxywmiVUhFaO3Atl8Flm', 'B33', '27', '', '9000', 'X'),
(24, '삼육대', '부산', '조성동임1', '010234322', '세종대', '$2y$10$bDTSfvnecDGzScZN/4EJS.xtP6AcMLxtcoo9zxqi/xZe/MzsphEui', 'B33', '27', '', '9000', 'X'),
(25, '삼육대', '부산', '되야지', '01023428833', '세종대', '$2y$10$rAnfTf3k1HKlI4zd4UBtCehTgiLO6NHbFjW9ZBcy4ffQMMf.OUAIG', 'B1234', '27', '될거야', '9000', 'X'),
(26, '삼육대', '부산', '설현', '0102342342', '세종대', '$2y$10$xjo3ko.8dV/CTYjBrmzyJON0WojnC5VF1GlVjUjlOLmvFMqermwBy', 'B12', '27', '수지', '9000', 'X'),
(27, '대전', '서울', '조성동', '01034823161', '세종대', '$2y$10$R.ARuYJr2PYV5p0..PYFUeZzI3Dt0yPYIRiwwwn2SnzX3/hZxEEum', 'E1234', '30', '1234', '9000', 'X'),
(28, '대전', '서울', '조성동', '01034823161', '세종대', '$2y$10$m5H55KubBG.SPfLQPQela.UGFpfytg0PyOU5P0Bf4FZMaBRv2jz7q', 'E1234', '30', '1234', '9000', 'O'),
(29, '대전', '서울', '조성동', '01034823161', '세종대', '$2y$10$LvwXqNzPO9Zmsd4HJNY5B.UR/WGFnFuqB5k5/j3jO2mHaPV7iEG0G', 'E1234', '30', '1234', '9000', 'O'),
(30, '삼육대', '부산', '조성동', '01034823161', '세종대', '$2y$10$Y3wgcx3ol2gNwCCtmGE8e.lsvZ3On05o3WYuatrj67LuJxJYKWA1O', 'B1234', '27', '1234', '9000', 'O'),
(31, '한예종', '군산', '테스트', '01012341234', '세종대', '$2y$10$6I319cq/cG0D3ZGumoa9Ouhjw2WXA1SlOVpUv9SQuEFSEbV6d0EpS', 'C1234', '28', '1234', '9000', 'O');

-- --------------------------------------------------------

--
-- 테이블 구조 `univ_info`
--

CREATE TABLE `univ_info` (
  `univSeq` int(11) NOT NULL,
  `univname` varchar(30) NOT NULL COMMENT '대학명'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 테이블의 덤프 데이터 `univ_info`
--

INSERT INTO `univ_info` (`univSeq`, `univname`) VALUES
(1, '세종대'),
(2, '과기대'),
(3, '한예종'),
(4, '삼육대'),
(5, '건국대'),
(6, '시립대'),
(7, '서울여대'),
(8, '한국외대');

-- --------------------------------------------------------

--
-- 테이블 구조 `xe_action_forward`
--

CREATE TABLE `xe_action_forward` (
  `act` varchar(80) NOT NULL,
  `module` varchar(60) NOT NULL,
  `type` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 테이블의 덤프 데이터 `xe_action_forward`
--

INSERT INTO `xe_action_forward` (`act`, `module`, `type`) VALUES
('atom', 'rss', 'view'),
('IS', 'integration_search', 'view'),
('rss', 'rss', 'view');

-- --------------------------------------------------------

--
-- 테이블 구조 `xe_addons`
--

CREATE TABLE `xe_addons` (
  `addon` varchar(250) NOT NULL,
  `is_used` char(1) NOT NULL DEFAULT 'Y',
  `is_used_m` char(1) NOT NULL DEFAULT 'N',
  `is_fixed` char(1) NOT NULL DEFAULT 'N',
  `extra_vars` text,
  `regdate` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 테이블 구조 `xe_addons_site`
--

CREATE TABLE `xe_addons_site` (
  `site_srl` bigint(11) NOT NULL DEFAULT '0',
  `addon` varchar(250) NOT NULL,
  `is_used` char(1) NOT NULL DEFAULT 'Y',
  `is_used_m` char(1) NOT NULL DEFAULT 'N',
  `extra_vars` text,
  `regdate` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 테이블의 덤프 데이터 `xe_addons_site`
--

INSERT INTO `xe_addons_site` (`site_srl`, `addon`, `is_used`, `is_used_m`, `extra_vars`, `regdate`) VALUES
(0, 'autolink', 'Y', 'N', NULL, '20160816232828'),
(0, 'blogapi', 'N', 'N', NULL, '20160816232828'),
(0, 'member_communication', 'Y', 'N', NULL, '20160816232828'),
(0, 'member_extra_info', 'Y', 'N', NULL, '20160816232828'),
(0, 'mobile', 'Y', 'N', NULL, '20160816232828'),
(0, 'openid_delegation_id', 'N', 'N', NULL, '20160816232828'),
(0, 'point_level_icon', 'N', 'N', NULL, '20160816232828'),
(0, 'resize_image', 'Y', 'N', NULL, '20160816232828');

-- --------------------------------------------------------

--
-- 테이블 구조 `xe_admin_favorite`
--

CREATE TABLE `xe_admin_favorite` (
  `admin_favorite_srl` bigint(11) NOT NULL,
  `site_srl` bigint(11) DEFAULT '0',
  `module` varchar(80) DEFAULT NULL,
  `type` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 테이블 구조 `xe_admin_log`
--

CREATE TABLE `xe_admin_log` (
  `ipaddress` varchar(100) NOT NULL,
  `regdate` varchar(14) DEFAULT NULL,
  `site_srl` bigint(11) DEFAULT '0',
  `module` varchar(100) DEFAULT NULL,
  `act` varchar(100) DEFAULT NULL,
  `request_vars` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 테이블 구조 `xe_ai_installed_packages`
--

CREATE TABLE `xe_ai_installed_packages` (
  `package_srl` bigint(11) NOT NULL DEFAULT '0',
  `version` varchar(255) DEFAULT NULL,
  `current_version` varchar(255) DEFAULT NULL,
  `need_update` char(1) DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 테이블의 덤프 데이터 `xe_ai_installed_packages`
--

INSERT INTO `xe_ai_installed_packages` (`package_srl`, `version`, `current_version`, `need_update`) VALUES
(18325662, '1.8.24', '1.8.24', 'N'),
(18324167, '1.7.1.1', '1.7.2', 'N'),
(18324266, '0.1', '1.7', 'N'),
(22590697, '1.0.0', '1.0.0', 'N'),
(18910976, '0.1', '1.7', 'N'),
(22753354, '1.8.19', '1.8.19', 'N'),
(18745485, '5.0.0', '5.0.0', 'N'),
(18324327, '0.1', '1.7', 'N'),
(18378362, '0.2', '1.7', 'N');

-- --------------------------------------------------------

--
-- 테이블 구조 `xe_ai_remote_categories`
--

CREATE TABLE `xe_ai_remote_categories` (
  `category_srl` bigint(11) NOT NULL DEFAULT '0',
  `parent_srl` bigint(11) NOT NULL DEFAULT '0',
  `title` varchar(250) NOT NULL,
  `list_order` bigint(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 테이블의 덤프 데이터 `xe_ai_remote_categories`
--

INSERT INTO `xe_ai_remote_categories` (`category_srl`, `parent_srl`, `title`, `list_order`) VALUES
(18322907, 18322917, 'XE 코어', 1),
(18322917, 0, '프로그램', 0),
(18322919, 0, '스킨', 7),
(18322923, 18322917, '모듈', 2),
(18322925, 18322917, '애드온', 3),
(18322927, 18322917, '위젯', 4),
(18322929, 18322917, '에디터컴포넌트', 5),
(18322943, 18322919, '모듈 스킨', 10),
(18322950, 18322919, '위젯 스킨', 12),
(18322952, 18322919, '위젯 스타일', 13),
(18322954, 18322919, '레이아웃', 8),
(18322977, 18322919, '회원레벨 아이콘', 15),
(18631347, 18322917, '단락에디터컴포넌트', 6),
(18904838, 18322919, '에디터 스타일', 14),
(18994170, 18322919, '모듈 모바일 스킨', 11),
(18994172, 18322919, '모바일 레이아웃', 9);

-- --------------------------------------------------------

--
-- 테이블 구조 `xe_autoinstall_packages`
--

CREATE TABLE `xe_autoinstall_packages` (
  `package_srl` bigint(11) NOT NULL DEFAULT '0',
  `category_srl` bigint(11) DEFAULT '0',
  `path` varchar(250) NOT NULL,
  `have_instance` char(1) NOT NULL DEFAULT 'N',
  `updatedate` varchar(14) DEFAULT NULL,
  `latest_item_srl` bigint(11) NOT NULL DEFAULT '0',
  `version` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 테이블의 덤프 데이터 `xe_autoinstall_packages`
--

INSERT INTO `xe_autoinstall_packages` (`package_srl`, `category_srl`, `path`, `have_instance`, `updatedate`, `latest_item_srl`, `version`) VALUES
(18325662, 18322907, '.', 'N', '20160817152942', 22755650, '1.8.24'),
(20118343, 18322925, './addon/cufon', 'N', '20160817140336', 20190605, '0.1.0'),
(18790298, 18322925, './addon/hellomaster', 'N', '20160810224236', 18794783, '1.0.0'),
(21382622, 18322925, './addon/jquery_snow', 'N', '20160817135709', 21391227, '0.0.1'),
(22260417, 18322925, './addons/301moved', 'N', '20160808224427', 22265949, '0.2'),
(21805731, 18322925, './addons/activescrollbar', 'N', '20160805202209', 21805732, '1.0'),
(18982154, 18322925, './addons/addfooter', 'N', '20160722092023', 18983942, '0.2'),
(18982156, 18322925, './addons/additional_mid', 'N', '20160813103753', 18983989, '0.2'),
(22228663, 18322925, './addons/addon_insert_sticker', 'N', '20160817135427', 22228684, '1.0'),
(22753419, 18322925, './addons/addon_insert_video', 'N', '20160817135005', 22754313, '0.1'),
(22753417, 18322925, './addons/addon_write_insert_media', 'N', '20160816212004', 22754309, '0.1'),
(18459111, 18322925, './addons/addthis', 'N', '20160704184813', 18459913, '0.1'),
(18539546, 18322925, './addons/addvote', 'N', '20160816232521', 21244042, '1.0'),
(18777712, 18322925, './addons/add_document', 'N', '20160817152809', 18794485, '0.1.1'),
(22753748, 18322925, './addons/admin_hide', 'N', '20160816204628', 22755416, '1.0'),
(22753706, 18322925, './addons/adsense_helper', 'N', '20160817152441', 22755268, '1.0'),
(18511514, 18322925, './addons/adult_keyword', 'N', '20160817134903', 22754386, '1.0'),
(18681809, 18322925, './addons/age_restrictions', 'N', '20160619022251', 18687595, '1.0'),
(19145884, 18322925, './addons/always_follower', 'N', '20160817102142', 19503998, '1.1'),
(19503269, 18322925, './addons/analysis', 'N', '20160731105634', 19527972, '0.1.2'),
(21788706, 18322925, './addons/AntiProxy', 'N', '20160815024441', 21788708, '1.0.0'),
(21015635, 18322925, './addons/appoint_view_user', 'N', '20160810132356', 21409930, '1.0'),
(22753564, 18322925, './addons/apporix', 'N', '20160810094939', 22754645, '1.1'),
(22753581, 18322925, './addons/apporix_native_alert', 'N', '20160808151058', 22754678, '0.1'),
(22654408, 18322925, './addons/authentication_change', 'N', '20160810134845', 22654433, '0.1'),
(22753797, 18322925, './addons/autoattach', 'N', '20160817105717', 22755535, '1.1'),
(22716407, 18322925, './addons/autodeny', 'N', '20160804112953', 22716411, '0.7'),
(22753640, 18322925, './addons/autolang', 'N', '20160815123013', 22754915, '1.0'),
(19600206, 18322925, './addons/autowww', 'N', '20160817073031', 19604227, '1.0'),
(22753745, 18322925, './addons/auto_comment_allow', 'N', '20160817125234', 22755397, '1.0'),
(22753416, 18322925, './addons/auto_multimedia', 'N', '20160817135012', 22754308, '1.0'),
(22753466, 18322925, './addons/auto_nick', 'N', '20160815014147', 22754428, '1.0'),
(22753534, 18322925, './addons/auto_reply', 'N', '20160817111345', 22754579, '0.1a'),
(22753723, 18322925, './addons/auto_secret', 'N', '20160817142137', 22755355, '1.1'),
(19274574, 18322925, './addons/a_soo_wikidoc_pointfixer', 'N', '20160627163250', 19274579, '1'),
(22736353, 18322925, './addons/bbCode', 'N', '20160716000845', 22736356, '1.0'),
(18388093, 18322925, './addons/bekmeProhibite', 'N', '20160815142111', 18388181, '1.0'),
(22622633, 18322925, './addons/blockact', 'N', '20160802222214', 22622739, '1.0'),
(22753411, 18322925, './addons/block_control', 'N', '20160817115404', 22754291, '1.0'),
(22752234, 18322925, './addons/block_country', 'N', '20160815101306', 22752338, '0.2'),
(22455366, 18322925, './addons/block_document', 'N', '20160816122849', 22755330, '0.2'),
(22653449, 18322925, './addons/block_ip', 'N', '20160816232735', 22754567, '2.1a'),
(20453531, 18322925, './addons/bodyfade', 'N', '20160630170858', 21401825, '0.2.3'),
(22537451, 18322925, './addons/bootstrap3_css', 'N', '20160816015904', 22537493, '1.0'),
(21194850, 18322925, './addons/bootstrap_btn', 'N', '20160714021959', 21194883, '1.0'),
(21195053, 18322925, './addons/bootstrap_icon', 'N', '20160815154520', 21202617, '1.1a'),
(22753648, 18322925, './addons/bot_challenge', 'N', '20160816142958', 22755249, '1.0.5'),
(22643750, 18322925, './addons/bot_title_control', 'N', '20160816154148', 22643845, '0.2'),
(22634250, 18322925, './addons/browser_helper', 'N', '20160729052906', 22634254, '1.0'),
(22605220, 18322925, './addons/cameron_plugin', 'N', '20160817151313', 22754521, '1.2'),
(22715595, 18322925, './addons/captbha', 'N', '20160816125434', 22715603, '0.5'),
(21354767, 18322925, './addons/change_nickname', 'N', '20160816232120', 22754182, '2.0'),
(22649328, 18322925, './addons/checkkorean', 'N', '20160817135210', 22651662, '1.1'),
(22618830, 18322925, './addons/checklen', 'N', '20160816043407', 22754320, '1.3'),
(20520855, 18322925, './addons/color_message', 'N', '20160324151124', 20520858, '1.1'),
(20522778, 18322925, './addons/color_message_for_14', 'N', '20160807000056', 20522789, '1.0'),
(20649732, 18322925, './addons/commentwritedownload', 'N', '20160816132837', 20681999, '0.3'),
(18342939, 18322925, './addons/comment_new', 'N', '20160810224252', 18670429, '1.1.1'),
(22652987, 18322925, './addons/confirm_declare', 'N', '20160810223455', 22754564, '1.1a'),
(22753653, 18322925, './addons/content_regex_filter', 'N', '20160810053116', 22754961, '0.2'),
(20277901, 18322925, './addons/controlbox', 'N', '20160816115827', 20632434, '1.0.1'),
(19069946, 18322925, './addons/cookie-free_domains', 'N', '20160528181520', 19070012, '1.0'),
(21889835, 18322925, './addons/counter_ex', 'N', '20160817004048', 22754574, '1.1.0'),
(19555887, 18322925, './addons/css3pie', 'N', '20160814175943', 20878725, '1.3.3.0'),
(20951206, 18322925, './addons/css3pie_js', 'N', '20160716211822', 20966650, '1.1.1'),
(20949728, 18322925, './addons/CssOutPlus', 'N', '20160727204420', 20952200, '1.1'),
(18779239, 18322925, './addons/daumview_vote', 'N', '20160812174315', 18898435, '0.5.5'),
(19608490, 18322925, './addons/del-www', 'N', '20160817131701', 19608585, '0.1'),
(22753608, 18322925, './addons/denied_exist', 'N', '20160815235216', 22754798, '0.2'),
(22753515, 18322925, './addons/denied_word', 'N', '20160816155717', 22754797, '1.002'),
(22753633, 18322925, './addons/Ding_Fixed_Banner', 'N', '20160817064738', 22755314, '1.6'),
(22753639, 18322925, './addons/Ding_Light_Box', 'N', '20160813234449', 22755312, '1.2'),
(21289114, 18322925, './addons/division', 'N', '20160817135946', 21294767, '1.0'),
(22753702, 18322925, './addons/document_permission_control_by_author', 'N', '20160813083125', 22755263, '0.2'),
(20959091, 18322925, './addons/doc_viewer', 'N', '20160817142016', 20959094, '0.1.2'),
(19049200, 18322925, './addons/domain_check', 'N', '20160730155122', 19050476, '0.2'),
(22753462, 18322925, './addons/download_wanna_reply', 'N', '20160813104359', 22754407, '1.0'),
(21384926, 18322925, './addons/dragcolor', 'N', '20160729135355', 21385023, '1.0'),
(22610154, 18322925, './addons/dsori_ckeditor_setting', 'N', '20160816191423', 22624891, '0.1740.3'),
(22611192, 18322925, './addons/dsori_facebook_comment', 'N', '20160804092334', 22613855, '0.1740.2'),
(22607524, 18322925, './addons/dsori_submanager_free', 'N', '20160816184149', 22608742, '0.1740.2'),
(22723913, 18322925, './addons/dyform_no_spam', 'N', '20160816052612', 22754947, '0.4'),
(20466120, 18322925, './addons/elfinder', 'N', '20160811193140', 20480086, '0.1.1'),
(20092760, 18322925, './addons/elkha_packer', 'N', '20160817140154', 20702463, '0.11'),
(22359020, 18322925, './addons/elkha_simple_spam', 'N', '20160813202125', 22359071, '0.1'),
(19804189, 18322925, './addons/elkha_www', 'N', '20160816232459', 20702493, '0.11'),
(18334990, 18322925, './addons/entry', 'N', '20160807211136', 18685479, '1.2'),
(19527443, 18322925, './addons/event_board', 'N', '20160718185518', 19527447, '0.1'),
(20547035, 18322925, './addons/exif', 'N', '20160817095449', 21378417, '0.9.2.2'),
(18882151, 18322925, './addons/facebook_social', 'N', '20160810051200', 18882152, '0.1'),
(20673640, 18322925, './addons/falling_snow', 'N', '20160817140146', 20697610, '1.5.0'),
(22526528, 18322925, './addons/falling_snow2', 'N', '20160817135350', 22528351, '1.0.0'),
(22526756, 18322925, './addons/falling_snow3', 'N', '20160812114529', 22528554, '1.0.0'),
(19431519, 18322925, './addons/favicon', 'N', '20160815224539', 19434038, '1.1'),
(22718477, 18322925, './addons/fa_fileicon', 'N', '20160816010247', 22754338, '1.1.2'),
(22649096, 18322925, './addons/fa_loader', 'N', '20160813105411', 22754343, '4.2.0'),
(22673162, 18322925, './addons/fileicon', 'N', '20160816161933', 22716823, '1.1'),
(22753755, 18322925, './addons/fixed_img', 'N', '20160815221026', 22755449, '1.3'),
(22753627, 18322925, './addons/fixed_notice', 'N', '20160729175105', 22754875, '1.1'),
(22753646, 18322925, './addons/fix_domain', 'N', '20160817072205', 22754935, '1.0.0'),
(22753796, 18322925, './addons/fix_mysql_utf8', 'N', '20160817002627', 22755521, '1.0'),
(22208653, 18322925, './addons/font-awesome', 'N', '20160814171039', 22226740, '1.0'),
(22753336, 18322925, './addons/font_awesome_new', 'N', '20160814124732', 22754115, '1.0'),
(22753340, 18322925, './addons/font_nanum_gothic', 'N', '20160816014715', 22754124, '1.0'),
(18334989, 18322925, './addons/func_include', 'N', '20160816155051', 18336654, 'v1.0'),
(22753770, 18322925, './addons/ggwoorimailscrap', 'N', '20160730101810', 22755522, '0.3'),
(19859881, 18322925, './addons/googleplus', 'N', '20160711092112', 19864516, '0.1.1'),
(19157569, 18322925, './addons/google_analytics', 'N', '20160814153000', 19157571, '1.0.0'),
(19875631, 18322925, './addons/gosite', 'N', '20160724234752', 19875632, '0.1'),
(18326352, 18322925, './addons/guest_name', 'N', '20160811151441', 19010744, '1.1.2'),
(22753681, 18322925, './addons/hashtags', 'N', '20160816161318', 22755203, '1.2'),
(18982164, 18322925, './addons/header_editor', 'N', '20160816120434', 18984012, '0.3'),
(22753807, 18322925, './addons/hello_member', 'N', '20160817041907', 22755565, '1.1.0.0'),
(18326011, 18322925, './addons/hidden_module', 'N', '20160809211706', 18337264, '0.3'),
(22706212, 18322925, './addons/hide_mid', 'N', '20160816232503', 22706230, '0.1.0'),
(22753506, 18322925, './addons/hot_document', 'N', '20160816221610', 22754766, '1.2.3'),
(21606824, 18322925, './addons/href_fixed1', 'N', '20160808235246', 21606841, '1.0'),
(20673638, 18322925, './addons/html5audio_flash', 'N', '20160816161524', 22541039, '1.5.1'),
(22753484, 18322925, './addons/html5multimedia_flash', 'N', '20160815141715', 22754465, '1.0.0'),
(22544858, 18322925, './addons/html5video_flash', 'N', '20160816161602', 22544908, '1.0.0'),
(18982175, 18322925, './addons/id_rejection', 'N', '20160726194436', 18984037, '0.2'),
(18990092, 18322925, './addons/IEblock', 'N', '20160703061703', 18993329, '0.1'),
(21154641, 18322925, './addons/iframe_resize', 'N', '20160817142123', 21189969, '0.2'),
(22753703, 18322925, './addons/image_new_windows', 'N', '20160816142706', 22755252, '1.1'),
(22753463, 18322925, './addons/image_preview', 'N', '20160817134850', 22754413, '1.0'),
(20340640, 18322925, './addons/iphone_checkbox', 'N', '20160623110500', 20409821, '1.0a'),
(22677441, 18322925, './addons/jquerycdn', 'N', '20160814004206', 22714080, '1.0.3'),
(22673736, 18322925, './addons/jqueryuicdn', 'N', '20160816193020', 22673740, '1.0'),
(19433415, 18322925, './addons/jquery_external_load', 'N', '20160815031441', 22674018, '2.0'),
(22678880, 18322925, './addons/jsecure_xe', 'N', '20160724211603', 22684436, '0.2'),
(20971314, 18322925, './addons/kakao_link', 'N', '20160817140051', 20975200, '0.2'),
(18324226, 18322925, './addons/keyword_link', 'N', '20160806230619', 18325653, '0.1'),
(21736776, 18322925, './addons/kru_dab', 'N', '20160814170411', 21748943, '1.1'),
(21439563, 18322925, './addons/kru_sslhelper', 'N', '20160802213045', 21711242, '3.0.1'),
(22516532, 18322925, './addons/langfilter', 'N', '20160817120125', 22754507, '0.7'),
(22753722, 18322925, './addons/latex', 'N', '20160816153345', 22755316, '1.7'),
(21752944, 18322925, './addons/layerAlert', 'N', '20160809153544', 21753018, '1.1'),
(21298003, 18322925, './addons/layerpopup', 'N', '20160817150021', 22754287, '1.10'),
(22753606, 18322925, './addons/level_permit', 'N', '20160813152143', 22754795, '0.1'),
(21220010, 18322925, './addons/limit_message', 'N', '20160817140014', 21229637, '0.2'),
(22753546, 18322925, './addons/login_2sisstore', 'N', '20160817092754', 22755326, '1.1'),
(22650410, 18322925, './addons/login_defencer', 'N', '20160816171445', 22650418, '1.0'),
(22753684, 18322925, './addons/lua_external_file', 'N', '20160817020719', 22755147, '0.0.3'),
(22753695, 18322925, './addons/lua_hashtag', 'N', '20160725154554', 22755190, '0.0.1'),
(22753696, 18322925, './addons/lua_shortcut', 'N', '20160813234511', 22755315, '1.1'),
(21391263, 18322925, './addons/mbanner', 'N', '20160808171003', 21391414, '1.0'),
(20191860, 18322925, './addons/me2plugin', 'N', '20160620073115', 20191861, '1.0'),
(20526823, 18322925, './addons/me2plugin_for_14', 'N', '20160625115536', 20526828, '1.0'),
(22736227, 18322925, './addons/memberinfo', 'N', '20160816215339', 22754342, '1.10'),
(22511691, 18322925, './addons/member_activity_check', 'N', '20160816232849', 22754292, '0.4'),
(22753489, 18322925, './addons/member_ajaxboard', 'N', '20160817141750', 22754483, '2.1.1'),
(22753510, 18322925, './addons/member_block_addon', 'N', '20160816212355', 22754665, '0.4'),
(22644317, 18322925, './addons/member_control', 'N', '20160816232156', 22644546, '0.1'),
(22753607, 18322925, './addons/member_doc', 'N', '20160817134728', 22754796, '0.2'),
(22753408, 18322925, './addons/member_extra_vars_check', 'N', '20160814074611', 22754283, '1.0'),
(18956315, 18322925, './addons/member_icon_print', 'N', '20160815133342', 18968140, '0.3'),
(18853350, 18322925, './addons/member_join_captcha', 'N', '20160817033617', 18855317, '0.1.4'),
(22194465, 18322925, './addons/member_join_ex', 'N', '20160817111526', 22194483, '0.2.3'),
(18324227, 18322925, './addons/member_join_extend', 'N', '20160816193304', 18325647, '0.1'),
(18766704, 18322925, './addons/member_layer_config', 'N', '20160811010109', 18766875, '1.1'),
(18410868, 18322925, './addons/member_pointsend', 'N', '20160816175844', 21227458, '0.2.2'),
(22753815, 18322925, './addons/member_realname', 'N', '20160816134003', 22755592, '0.2'),
(20954749, 18322925, './addons/message_alarm', 'N', '20160817151615', 21041089, '2.0'),
(22753570, 18322925, './addons/message_btn', 'N', '20160803223422', 22754743, '1.1'),
(18982191, 18322925, './addons/meta_add', 'N', '20160816132528', 19814958, '0.2.2'),
(22631178, 18322925, './addons/mobile_redirect', 'N', '20160816190522', 22631183, '1.0'),
(21352623, 18322925, './addons/mresizer', 'N', '20160817092549', 22755552, '1.6'),
(21354730, 18322925, './addons/msg_point', 'N', '20160816132811', 21354731, '1.0'),
(21876999, 18322925, './addons/multidomain', 'N', '20160806173347', 22280906, '1.2'),
(22753343, 18322925, './addons/multimedia_thumbnail', 'N', '20160817135037', 22754311, '2.0.0'),
(19692912, 18322925, './addons/music24', 'N', '20160810152802', 19692913, '1.0.0'),
(19906026, 18322925, './addons/mypeople', 'N', '20160509135144', 19906139, '0.0.1'),
(21369594, 18322925, './addons/my_comment_addon', 'N', '20160816155044', 21394119, '1.1.2'),
(22753359, 18322925, './addons/my_reading', 'N', '20160810232609', 22754203, '1.1'),
(21221462, 18322925, './addons/naver_analytics', 'N', '20160816121421', 22658323, '1.2'),
(22672196, 18322925, './addons/new_document_notify', 'N', '20160817134938', 22754335, '2.0'),
(22753312, 18322925, './addons/new_document_notify2', 'N', '20160817135108', 22754204, '1.0.12'),
(21526323, 18322925, './addons/noclick', 'N', '20160816193058', 22754294, '1.3'),
(20806148, 18322925, './addons/nonebutton', 'N', '20160601014213', 20823285, '0.1.1'),
(22753846, 18322925, './addons/no_act', 'N', '20160817151357', 22755656, '0.1'),
(22753685, 18322925, './addons/no_adblock', 'N', '20160811205215', 22755161, '1.1.3'),
(21204144, 18322925, './addons/number_display', 'N', '20160817140007', 21204145, '0.1'),
(22753492, 18322925, './addons/okiz_easyadmin_logout', 'N', '20160816171330', 22754522, '1.1'),
(21717279, 18322925, './addons/okname', 'N', '20160817035510', 21726233, '0.2.0'),
(21620531, 18322925, './addons/opengraph', 'N', '20160816121517', 21620532, '0.0.2'),
(22753693, 18322925, './addons/outdated_browser', 'N', '20160816201934', 22755188, '1.1.1'),
(18664319, 18322925, './addons/P3P', 'N', '20160702024100', 18668421, '1.0'),
(21398290, 18322925, './addons/pagechange', 'N', '20160808170953', 21432465, '3.0'),
(18334980, 18322925, './addons/piclens', 'N', '20160815171653', 20168732, '1.5'),
(22736372, 18322925, './addons/placeHolders', 'N', '20160731193929', 22736378, '1.0'),
(18324228, 18322925, './addons/planet_bookmark', 'N', '20160812174329', 21017018, '0.1.1'),
(18324233, 18322925, './addons/planet_todo', 'N', '20160815211232', 21016986, '0.1.1'),
(22753652, 18322925, './addons/point_pangpang', 'N', '20160815022451', 22755059, '1.5.2'),
(22753528, 18322925, './addons/point_pangpang_plus', 'N', '20160816155728', 22754951, '0.2b'),
(22753610, 18322925, './addons/poll_point', 'N', '20160801030436', 22754813, '0.2'),
(18334979, 18322925, './addons/popup', 'N', '20160816201907', 18335423, '0.1'),
(20525058, 18322925, './addons/popup_menu_like_1_4', 'N', '20160808091045', 20798880, '1.0'),
(18640943, 18322925, './addons/pop_up', 'N', '20160817145502', 19149746, '0.0.8'),
(19555797, 18322925, './addons/prettyphoto', 'N', '20160817135938', 21336236, '1.1.3.0'),
(20644220, 18322925, './addons/prohibit_monologue', 'N', '20160723120432', 20644221, '0.1'),
(22616427, 18322925, './addons/pushwing', 'N', '20160809142347', 22663888, '0.5'),
(22616439, 18322925, './addons/pushwing_comment', 'N', '20160730150318', 22639689, '0.5'),
(19519186, 18322925, './addons/qrcode', 'N', '20160810051411', 19528193, '0.2'),
(18982192, 18322925, './addons/q_emphasis', 'N', '20160816132411', 18984109, '0.1'),
(21591779, 18322925, './addons/radarURL', 'N', '20160815235734', 21594258, '1.2'),
(19137447, 18322925, './addons/rainbow_link', 'N', '20160725115209', 19431548, '0.3'),
(22549104, 18322925, './addons/recommend', 'N', '20160816233246', 22549119, '1.0'),
(21626541, 18322925, './addons/Redirection', 'N', '20160805163340', 21626542, '1.0a'),
(20673999, 18322925, './addons/referer', 'N', '20160817124024', 22755559, '3.5.1'),
(18990133, 18322925, './addons/referercheck', 'N', '20160815195627', 19009627, '2.1'),
(18324241, 18322925, './addons/referer_old', 'N', '20160810224329', 18325632, '0.1'),
(19187623, 18322925, './addons/refhide', 'N', '20160703030420', 19191147, '0.1.1'),
(22753609, 18322925, './addons/regdate_edit', 'N', '20160816155625', 22754803, '0.1'),
(22753657, 18322925, './addons/remail', 'N', '20160816091302', 22754984, '1.0'),
(18326351, 18322925, './addons/remove_id_search', 'N', '20160814180621', 18326429, '1.0'),
(21190663, 18322925, './addons/report_addon', 'N', '20160816233135', 21194703, '0.2'),
(22753667, 18322925, './addons/requirefile', 'N', '20160804224658', 22755038, '1.01'),
(22648862, 18322925, './addons/robotcontrol', 'N', '20160815014316', 22649123, '1.1.0'),
(21651786, 18322925, './addons/scmplayer', 'N', '20160817095504', 22299133, '1.5'),
(21262112, 18322925, './addons/scrollbar', 'N', '20160728153531', 21262114, '0.9.1'),
(21373345, 18322925, './addons/searchhighlight', 'N', '20160814230536', 21394152, '0.2'),
(21400134, 18322925, './addons/securityPlus', 'N', '20160612210708', 21400135, '1.0.0'),
(22753500, 18322925, './addons/sejin7940_addvote', 'N', '20160810185944', 22754633, '1.2'),
(20564368, 18322925, './addons/sejin7940_align', 'N', '20160731060726', 20564370, '1.0'),
(22753508, 18322925, './addons/sejin7940_all_notice', 'N', '20160813152327', 22754697, '1.4'),
(21978106, 18322925, './addons/sejin7940_autotrash', 'N', '20160817120634', 21978124, '1.1.1'),
(22753481, 18322925, './addons/sejin7940_kakao_link', 'N', '20160812113156', 22754488, '0.5.2'),
(22735026, 18322925, './addons/sejin7940_mobile_resize', 'N', '20160806080940', 22735066, '1.0'),
(21950613, 18322925, './addons/sejin7940_mustlogin', 'N', '20160812184156', 21959492, '0.2'),
(19960240, 18322925, './addons/sejin7940_readed_count', 'N', '20160816173644', 19960243, '1.6'),
(19923002, 18322925, './addons/sejin7940_write_limit', 'N', '20160817120316', 22687892, '1.5.2'),
(22753612, 18322925, './addons/select_addon', 'N', '20160816215728', 22754818, '1.0'),
(22753594, 18322925, './addons/session_shield', 'N', '20160817114451', 22755299, '2.0'),
(21415137, 18322925, './addons/setitle2', 'N', '20160810075429', 21415140, '2.1.0'),
(21189057, 18322925, './addons/settitle', 'N', '20160815164757', 21383555, '1.3'),
(19442769, 18322925, './addons/sex_restrictions', 'N', '20160812015915', 19455388, '0.1.1'),
(19306395, 18322925, './addons/shortcut', 'N', '20160805072948', 19306492, '0.9.9.2'),
(22753622, 18322925, './addons/signoutdel', 'N', '20160803190029', 22754837, '0.1'),
(19574799, 18322925, './addons/smenubox_scaleupdown', 'N', '20160815235940', 19576713, '0.1'),
(18325951, 18322925, './addons/sms_alert', 'N', '20160601014925', 18326173, '1.0'),
(22753315, 18322925, './addons/sns_card', 'N', '20160816204919', 22754099, '1.1'),
(19513447, 18322925, './addons/sns_linker_lite', 'N', '20160817011816', 22754189, '1.1'),
(19518196, 18322925, './addons/socialxe_helper', 'N', '20160817135344', 20361435, '1.0.6'),
(19550402, 18322925, './addons/socialxe_mid_forwarder', 'N', '20160813193529', 20361446, '1.0.3'),
(18982195, 18322925, './addons/soo_add_content', 'N', '20160817054130', 22755412, '0.6a'),
(21124707, 18322925, './addons/soo_add_ssl', 'N', '20160806152022', 21124708, '0.1'),
(18982196, 18322925, './addons/soo_autolang', 'N', '20160817140551', 19687115, '1.0.3'),
(19336589, 18322925, './addons/soo_block_UA', 'N', '20160804231050', 19336590, '0.1'),
(19565911, 18322925, './addons/soo_body_content', 'N', '20160817140639', 19565912, '0.2'),
(19458868, 18322925, './addons/soo_feed_delay', 'N', '20160812100929', 19458869, '0.1'),
(18648969, 18322925, './addons/soo_for_muzik_player', 'N', '20160817140537', 19687129, '0.3.1'),
(19862381, 18322925, './addons/soo_googleplus', 'N', '20160814181954', 19890691, '0.2.1'),
(18682481, 18322925, './addons/soo_js_exif', 'N', '20160817112435', 18859459, '0.3.4'),
(18990588, 18322925, './addons/soo_mcrblog_link', 'N', '20160817011943', 21924371, '1.2.14'),
(19293487, 18322925, './addons/soo_mobile_top', 'N', '20160808185008', 20892008, '3'),
(18982221, 18322925, './addons/soo_parking', 'N', '20160817150843', 22755425, '0.25'),
(19549401, 18322925, './addons/source_marking', 'N', '20160810051453', 19549402, '0.3'),
(22753501, 18322925, './addons/ssl_support', 'N', '20160808151046', 22754509, '0.1'),
(18326038, 18322925, './addons/statistics', 'N', '20160816154452', 18327083, '1.0.1b'),
(22753550, 18322925, './addons/stats', 'N', '20160816213446', 22754602, '1.1'),
(22744282, 18322925, './addons/stop_spambot_xe', 'N', '20160817150751', 22755431, '0.9'),
(22753387, 18322925, './addons/sxe_bbcode_lite', 'N', '20160805201850', 22754233, '0.1'),
(22753381, 18322925, './addons/sxe_block_write', 'N', '20160815023825', 22754220, '0.2'),
(22753393, 18322925, './addons/sxe_ncenter_plus', 'N', '20160816193923', 22754245, '0.2'),
(22753382, 18322925, './addons/sxe_now_connected', 'N', '20160815235528', 22754221, '0.2'),
(22753390, 18322925, './addons/sxe_writing_format', 'N', '20160814032756', 22754246, '0.2'),
(18325813, 18322925, './addons/tag_relation', 'N', '20160817150504', 22274979, '1.4.1'),
(19555926, 18322925, './addons/tag_relation/skins/default', 'N', '20160817140438', 19915132, '0.9.5'),
(22753482, 18322925, './addons/tag_relation_add', 'N', '20160815224217', 22754457, '1.4.1'),
(18324247, 18322925, './addons/tccommentnotify', 'N', '20160810224302', 18365845, '1.0'),
(21189175, 18322925, './addons/texteffect', 'N', '20160816160925', 21197591, '0.2 beta'),
(21901097, 18322925, './addons/today_fortune', 'N', '20160817135545', 21908882, '1.0.1'),
(21933112, 18322925, './addons/to_sns', 'N', '20160817135450', 22104881, '0.2.1'),
(22594585, 18322925, './addons/trolley', 'N', '20160817144843', 22596756, '0.3'),
(19081914, 18322925, './addons/tweet_button', 'N', '20160816132140', 19083524, '0.1'),
(22640952, 18322925, './addons/twoc_memo_del', 'N', '20160814184823', 22640972, '1.1'),
(18338697, 18322925, './addons/uccup', 'N', '20160725154146', 18338747, 'v2.3'),
(22753373, 18322925, './addons/updatecategory', 'N', '20160813191303', 22754190, '1.0'),
(22497371, 18322925, './addons/url_shortener', 'N', '20160813032647', 22574332, '1.12'),
(20957609, 18322925, './addons/wating_message', 'N', '20160421111342', 20957612, '0.1.1'),
(19555878, 18322925, './addons/webfont', 'N', '20160817114336', 21378394, '1.1.3.1'),
(19202629, 18322925, './addons/webfontface', 'N', '20160811083535', 19206513, '0.1'),
(22753800, 18322925, './addons/web_fonts', 'N', '20160817094823', 22755550, '1.1'),
(19583417, 18322925, './addons/wiki-link', 'N', '20160802134949', 19600787, '0.2'),
(22223413, 18322925, './addons/wiki_extend', 'N', '20160816120723', 22223443, '0.1'),
(18324248, 18322925, './addons/wiki_link', 'N', '20160810223834', 21813902, '1.7.0'),
(18326353, 18322925, './addons/write_limit', 'N', '20160816233200', 18637861, '1.2.1'),
(21092346, 18322925, './addons/xdt_button', 'N', '20160812174430', 21739119, '2.1'),
(22553944, 18322925, './addons/xdt_css', 'N', '20160722171947', 22553960, '1.0'),
(22657234, 18322925, './addons/xdt_google_analytics', 'N', '20160816213639', 22754376, '1.1'),
(22456939, 18322925, './addons/xdt_scrollbar', 'N', '20160816204057', 22456955, '1.0'),
(22580059, 18322925, './addons/xesticky', 'N', '20160801064211', 22580144, '0.1'),
(22703904, 18322925, './addons/xetrace', 'N', '20160711153504', 22703936, '1.0.0'),
(22753449, 18322925, './addons/xss_session_protector', 'N', '20160811200700', 22754383, '0.1'),
(22753458, 18322925, './addons/youtube_control', 'N', '20160815224109', 22754991, '1.3'),
(22235916, 18322925, './addons/zipped_xe', 'N', '20160816193040', 22278143, '0.3'),
(22753658, 18322925, './addons/zipperupper', 'N', '20160816204723', 22755026, '0.3'),
(22572362, 18322954, './layout/book_layout', 'N', '20160809193136', 22572485, '1.0'),
(18649613, 18322954, './layouts/2010_jowrney', 'N', '20160803142820', 19060126, '0.2.5'),
(18347510, 18322954, './layouts/aginet_official_v2', 'N', '20160614235701', 18575161, '2.0.7'),
(22753576, 18322954, './layouts/ASXE_FLAT', 'N', '20160816202000', 22754715, '1.1'),
(22115065, 18322954, './layouts/awake', 'N', '20160817112817', 22754348, '1.0.4'),
(22678527, 18322954, './layouts/awake2', 'N', '20160816161840', 22678540, '1.6'),
(22753742, 18322954, './layouts/basic_tpl_c', 'N', '20160817100051', 22755404, '1.04'),
(18327285, 18322954, './layouts/bcptwta', 'N', '20160805174924', 18328111, '1.0'),
(18818977, 18322954, './layouts/blackcity', 'N', '20160809135016', 18832088, '1.0'),
(18662544, 18322954, './layouts/blooz_layout_ver3', 'N', '20160817141604', 18701665, '3.2'),
(22348667, 18322954, './layouts/blue', 'N', '20160807175924', 22348685, '1.0'),
(18716138, 18322954, './layouts/bom', 'N', '20160814134909', 18722236, '0.1'),
(21862798, 18322954, './layouts/brownwhite', 'N', '20160816110507', 21863022, '1.1'),
(22753386, 18322954, './layouts/b_black', 'N', '20160816190834', 22754231, '1.0'),
(18324292, 18322954, './layouts/cafeXE', 'N', '20160817145349', 21802168, '1.7.0'),
(20989209, 18322954, './layouts/Chemistry_lite', 'N', '20160815170500', 20989210, '1.0'),
(19532779, 18322954, './layouts/church_layout', 'N', '20160815182540', 19532784, '0.2'),
(19918823, 18322954, './layouts/cimple_plus', 'N', '20160815231517', 19921280, '1.3c'),
(19340331, 18322954, './layouts/CN_No1', 'N', '20160728153119', 19344956, '1.0.1'),
(19440527, 18322954, './layouts/CN_No2', 'N', '20160709115000', 19440528, '1.0.1'),
(19570840, 18322954, './layouts/CN_No3', 'N', '20160813235824', 19582438, '1.0.4'),
(19707750, 18322954, './layouts/CN_No4', 'N', '20160705171830', 19708324, '1.1'),
(19816429, 18322954, './layouts/CN_No5', 'N', '20160807043849', 19816430, '1.0'),
(19767397, 18322954, './layouts/columnist', 'N', '20160815191323', 20270404, '1.5.1'),
(22753710, 18322954, './layouts/creative_sim', 'N', '20160815185402', 22755295, '1.0.1'),
(19088764, 18322954, './layouts/crom_black_box_layout', 'N', '20160815164231', 19089573, '1.0'),
(19351727, 18322954, './layouts/crom_eco', 'N', '20160729130642', 19351728, '1.0'),
(19050369, 18322954, './layouts/crom_fixy_layout_private', 'N', '20160813190141', 19053826, '1.0'),
(19098862, 18322954, './layouts/crom_groove_eco_private', 'N', '20160727174431', 19099350, '1.0'),
(19529399, 18322954, './layouts/crom_iXE', 'N', '20160816024134', 19600243, '1.0.3'),
(22669010, 18322954, './layouts/css3_simple', 'N', '20160817151614', 22687348, '1.1'),
(22753476, 18322954, './layouts/CustomStrap', 'N', '20160816194519', 22754447, '1.0'),
(18748689, 18322954, './layouts/daerew_v4_layout', 'N', '20160816230839', 18926143, '1.2'),
(22473723, 18322954, './layouts/daol_official', 'N', '20160817072554', 22715041, '1.1'),
(19320728, 18322954, './layouts/darkdream', 'N', '20160815174710', 19320733, '1.0'),
(19322818, 18322954, './layouts/darkgrid', 'N', '20160812170525', 19322819, '1.0'),
(22501977, 18322954, './layouts/dark_white', 'N', '20160816230519', 22508454, 'v1.1'),
(22753660, 18322954, './layouts/ding_default_layout', 'N', '20160817102400', 22755044, '1.1'),
(22753538, 18322954, './layouts/doorweb_basic', 'N', '20160817135922', 22754722, '1.7.7'),
(22753316, 18322954, './layouts/doorweb_v4', 'N', '20160817135837', 22754256, '1.7'),
(19974913, 18322954, './layouts/Dynamic', 'N', '20160815191333', 20429124, '3.0'),
(18855088, 18322954, './layouts/elkha_dr4', 'N', '20160816122817', 19703575, '1.0.2'),
(18606308, 18322954, './layouts/elkha_fge', 'N', '20160816122919', 18657582, '1.2'),
(18642464, 18322954, './layouts/elkha_graystyle', 'N', '20160817093625', 19722768, '2.0.1'),
(18766685, 18322954, './layouts/elkha_graystyle2_lite', 'N', '20160817093625', 18844159, '1.0.3'),
(19700913, 18322954, './layouts/elkha_monochrome', 'N', '20160816122733', 19803893, '0.12'),
(19031365, 18322954, './layouts/elkha_neutral', 'N', '20160816122607', 20692034, '0.5'),
(19684891, 18322954, './layouts/elkha_pieces', 'N', '20160816122750', 19788968, '0.2'),
(18612951, 18322954, './layouts/elkha_simple', 'N', '20160817150431', 18633735, '1.1'),
(18606314, 18322954, './layouts/elkha_sky', 'N', '20160816122716', 19822870, '1.4.5'),
(18650492, 18322954, './layouts/elkha_sky2', 'N', '20160816122847', 18865308, '1.4.5'),
(20074878, 18322954, './layouts/elkha_tskorea', 'N', '20160816122628', 20691958, '0.2'),
(19034752, 18322954, './layouts/elkha_x610', 'N', '20160816122834', 19072093, '0.1'),
(22655078, 18322954, './layouts/emergence', 'N', '20160815234949', 22660012, '1.0.0'),
(21782412, 18322954, './layouts/eond_compact', 'N', '20160817092054', 21782413, '0.8.4'),
(19234197, 18322954, './layouts/eond_mynote', 'N', '20160816213659', 21723208, '1.4.4'),
(19230703, 18322954, './layouts/eond_official', 'N', '20160816211815', 21382865, '1.4.1'),
(18714842, 18322954, './layouts/eond_portal_main_2col_right', 'N', '20160815001132', 21776053, '0.7'),
(21761048, 18322954, './layouts/eond_rosso', 'N', '20160814155737', 21791719, '0.3.3'),
(21776217, 18322954, './layouts/eond_starter', 'N', '20160814195122', 21776218, '0.1'),
(21643233, 18322954, './layouts/Express999', 'N', '20160814172835', 21838875, '2.1'),
(22716306, 18322954, './layouts/firstkenta', 'N', '20160817134702', 22754179, '1.1'),
(22631837, 18322954, './layouts/five_start', 'N', '20160807172913', 22631859, '1.0'),
(22651543, 18322954, './layouts/flat_series', 'N', '20160817110015', 22754140, '1.0.22'),
(22753769, 18322954, './layouts/freelancer', 'N', '20160817133257', 22755465, '1.00'),
(22542943, 18322954, './layouts/Fresh', 'N', '20160816161534', 22543307, '1.0'),
(19073125, 18322954, './layouts/fsfsdas_neutral', 'N', '20160816122650', 19848942, '0.4.4'),
(19428586, 18322954, './layouts/fullmetal_by_daramkun', 'N', '20160609041111', 19432660, '1.0.0'),
(19510234, 18322954, './layouts/gallery_layout', 'N', '20160816160017', 19532739, '0.2'),
(19302110, 18322954, './layouts/gardenoforchids', 'N', '20160607021046', 19302111, '1.0'),
(18414428, 18322954, './layouts/Gom-e.net_Hankooktown2_Layout', 'N', '20160626182657', 18445386, '1.0.7'),
(18447927, 18322954, './layouts/Gom2netLayoutEngland', 'N', '20160812153143', 18454140, '1.0.1'),
(19226818, 18322954, './layouts/gom2net_2nd_layout', 'N', '20160812193028', 19273763, '2.0.6'),
(19283251, 18322954, './layouts/gom2net_3rd_layout', 'N', '20160804010922', 19283257, '3.0.1'),
(19202617, 18322954, './layouts/gom2net_layout', 'N', '20160619220358', 19204527, '1.0.2'),
(18424676, 18322954, './layouts/gomenet_xe_official_v2', 'N', '20160724224031', 18426534, '1.0.1'),
(18326553, 18322954, './layouts/habile_layout', 'N', '20160523142752', 18330571, '1.3'),
(19509849, 18322954, './layouts/hankooktown', 'N', '20160814204249', 19509864, '1.0'),
(18409541, 18322954, './layouts/hankooktown2', 'N', '20160809231230', 19512809, '1.2.2'),
(20259612, 18322954, './layouts/HappyTravel_v1', 'N', '20160817140314', 20261781, '1.0'),
(19512714, 18322954, './layouts/heaven', 'N', '20160809112332', 19514431, 'Alpha'),
(22377937, 18322954, './layouts/hestia', 'N', '20160816230633', 22754444, '2.1.4'),
(18703356, 18322954, './layouts/how', 'N', '20160814225627', 18707091, '0.1'),
(18324297, 18322954, './layouts/ideation', 'N', '20160814215709', 18325198, '0.1'),
(19818901, 18322954, './layouts/ikarusv1simple', 'N', '20160817095828', 19829113, '1.1.0'),
(22641332, 18322954, './layouts/Imagemonster', 'N', '20160817142159', 22754363, '2.1'),
(19456969, 18322954, './layouts/impress-06', 'N', '20160816155850', 19464583, '1.0.1'),
(18706109, 18322954, './layouts/jimseung_biz', 'N', '20160708134623', 18711864, '0.1'),
(18703085, 18322954, './layouts/jimseung_nate', 'N', '20160815034919', 18705555, '1.0'),
(18706113, 18322954, './layouts/jimseung_simplesub', 'N', '20160814135356', 18709461, '1'),
(18383233, 18322954, './layouts/Jungbok_layout_V3.0', 'N', '20160804005639', 18389790, 'V3.0'),
(22753353, 18322954, './layouts/kbfree', 'N', '20160816222911', 22754197, '1.2'),
(19219093, 18322954, './layouts/kia', 'N', '20160817092449', 19219094, '0.1'),
(22753820, 18322954, './layouts/kimtajo_onepage_widget_layout', 'N', '20160817133151', 22755601, '1.00'),
(22753787, 18322954, './layouts/kimtajo_responsive_one_page', 'N', '20160817003114', 22755594, '1.03'),
(18631835, 18322954, './layouts/kindguyLayout(201001_Kindguy4_1_xe1.3.1.2)', 'N', '20160726184841', 18634134, '201001'),
(18631838, 18322954, './layouts/kindguyLayout(201001_Kindguy4_2_xe1.3.1.2)', 'N', '20160724224530', 18634163, '201001'),
(18512505, 18322954, './layouts/kindguyLayout(BlueN_200912_1)', 'N', '20160726015341', 18516495, '200912'),
(18512506, 18322954, './layouts/kindguyLayout(BlueN_200912_2)', 'N', '20160626160806', 18516511, '200912'),
(18419537, 18322954, './layouts/kindguyLayout(joins_200911_1)', 'N', '20160809134739', 18422597, 'v.200911'),
(18454611, 18322954, './layouts/kindguyLayout(khan_200911_1)', 'N', '20160724040518', 18454709, 'v.200911'),
(18454629, 18322954, './layouts/kindguyLayout(khan_200911_2)', 'N', '20160804010549', 18454718, 'v.200911'),
(18432183, 18322954, './layouts/kindguyLayout(munhwa_200911_1)', 'N', '20160805003921', 18432699, 'v.200911'),
(18432187, 18322954, './layouts/kindguyLayout(munhwa_200911_2)', 'N', '20160809230952', 18432723, 'v.200911'),
(19201015, 18322954, './layouts/kinesis_cs01f', 'N', '20160814204708', 19201021, '1.0.1'),
(19280154, 18322954, './layouts/kinesis_pl001f', 'N', '20160807180050', 19280155, '1.0'),
(18968288, 18322954, './layouts/kinesis_sitelist', 'N', '20160802142210', 19348039, '0.1.1'),
(19044000, 18322954, './layouts/kom', 'N', '20160801132814', 19050135, '1.0'),
(18700386, 18322954, './layouts/koo', 'N', '20160816154909', 18707058, '0.1'),
(18677776, 18322954, './layouts/lay', 'N', '20160727012431', 18682153, '0.1'),
(18705012, 18322954, './layouts/layoutSkin(kindguy5.1_xe1.4.0.5)', 'N', '20160814205233', 18708750, '201002'),
(18705013, 18322954, './layouts/layoutSkin(kindguy5.2_xe1.4.0.5)', 'N', '20160814205245', 18708767, '201002'),
(18959079, 18322954, './layouts/layoutskin_wave_blue', 'N', '20160719095614', 21382225, '1.1.0'),
(20330088, 18322954, './layouts/layoutwotc_portal', 'N', '20160817040709', 20691619, '1.0.2'),
(19749792, 18322954, './layouts/layoutwotc_text', 'N', '20160810114208', 22596494, '1.0.7'),
(22470148, 18322954, './layouts/layout_intermission', 'N', '20160816160229', 22545808, '0.9.6'),
(19623994, 18322954, './layouts/layout_newsMagazine_free', 'N', '20160811195058', 19623995, '1.0'),
(19513978, 18322954, './layouts/layout_photoGalleryA_Free', 'N', '20160812161429', 19514630, '1.0'),
(19623904, 18322954, './layouts/layout_photoGalleyA_sub', 'N', '20160817142036', 19623910, '1.2'),
(18900548, 18322954, './layouts/layout_skin(kindguy1.0_type1_xe1.4.1.1)', 'N', '20160816155143', 18901309, '201005'),
(18900551, 18322954, './layouts/layout_skin(kindguy1.1_type2_xe1.4.1.1)', 'N', '20160814205036', 18901322, '201005'),
(18975451, 18322954, './layouts/layout_skin(kindguy5.0_type2_xe1.4.1.1)', 'N', '20160816155236', 18981166, '201006'),
(18975452, 18322954, './layouts/layout_skin(kindguy5.1_type2_xe1.4.1.1)', 'N', '20160814204928', 18981176, '201006'),
(18849332, 18322954, './layouts/layout_skin(xenara1.1_xe1.4.0.10)', 'N', '20160816155117', 18853151, '201004'),
(19360170, 18322954, './layouts/layout_skin(xenara_v1.0_type1_xe1.4.4.1)', 'N', '20160816155813', 19360187, '201010'),
(19360171, 18322954, './layouts/layout_skin(xenara_v1.1_type3_xe1.4.4.1)', 'N', '20160725161918', 19360205, '201010'),
(19712751, 18322954, './layouts/layout_skin(xenara_v1.2_type2_xe1.4.5.2)', 'N', '20160809232226', 19712752, '1.2'),
(19831182, 18322954, './layouts/layout_skin(xenara_v3.0_type2_xe1.4.4.4)', 'N', '20160816160408', 19831183, '3.0'),
(19831194, 18322954, './layouts/layout_skin(xenara_v3.1_type2_xe1.4.4.4)', 'N', '20160802144516', 19831195, '3.1'),
(21535219, 18322954, './layouts/live_login', 'N', '20160814195204', 21768603, '1.5.0.0'),
(22753553, 18322954, './layouts/material_xe', 'N', '20160817114112', 22754773, '1.0.1'),
(18929288, 18322954, './layouts/mcube', 'N', '20160612082920', 18957849, '0.2'),
(18735942, 18322954, './layouts/mediaOn', 'N', '20160724153556', 18746917, '1.02'),
(18330814, 18322954, './layouts/messenger', 'N', '20160701022740', 18331384, 'Messenger_v0.1'),
(18327419, 18322954, './layouts/mh_simple', 'N', '20160807175724', 18327611, '1.1'),
(22753587, 18322954, './layouts/miku_daisuki', 'N', '20160816155706', 22754733, '1.0'),
(19116278, 18322954, './layouts/modern_line', 'N', '20160816142946', 19135412, '1.0'),
(19090619, 18322954, './layouts/nabul2_milate_8T', 'N', '20160711193023', 19092504, '2.0'),
(19232784, 18322954, './layouts/nabul2_Wishful', 'N', '20160814204642', 19232785, '1.0'),
(18381054, 18322954, './layouts/naver_photo_style', 'N', '20160814171119', 18429470, '1.2.1'),
(19657758, 18322954, './layouts/NetCabin_X2', 'N', '20160802135235', 19657761, '0.1'),
(19655120, 18322954, './layouts/NetCabin_X3', 'N', '20160813150237', 20430977, '0.2.2'),
(22563158, 18322954, './layouts/nextep', 'N', '20160816161622', 22581078, 'nextep v1.2'),
(18712555, 18322954, './layouts/nom', 'N', '20160728130512', 18712759, '0.1'),
(22627992, 18322954, './layouts/orange_simple', 'N', '20160813171424', 22670250, '1.4'),
(18606318, 18322954, './layouts/paper_layer', 'N', '20160814205351', 18611976, '1.0'),
(19097462, 18322954, './layouts/pb', 'N', '20160815174729', 19125110, '1.2'),
(19711536, 18322954, './layouts/people blue', 'N', '20160807181427', 19744693, '0.5'),
(22583972, 18322954, './layouts/phizRWDThemes', 'N', '20160816191036', 22714063, '1.2'),
(21090780, 18322954, './layouts/pleasure', 'N', '20160722172831', 21092056, '1.2'),
(19532317, 18322954, './layouts/portal_layout', 'N', '20160810143953', 19533824, '0.3'),
(22730560, 18322954, './layouts/purexe', 'N', '20160804004452', 22754180, '1.1'),
(19506416, 18322954, './layouts/PXE_clio', 'N', '20160817002442', 19506418, '1.1'),
(19100570, 18322954, './layouts/PXE_koi', 'N', '20160730153613', 19504533, '1.0.1'),
(18328672, 18322954, './layouts/PXE_leaflet_lite', 'N', '20160803233048', 18339574, '1.02 Final'),
(21267409, 18322954, './layouts/qookrabbit', 'N', '20160816115851', 21363221, '1.9.8'),
(19624858, 18322954, './layouts/Quad', 'N', '20160717153201', 19630832, '1.0.3'),
(19133654, 18322954, './layouts/Rebirth_A', 'N', '20160811162023', 19224091, '1.1.2'),
(22753322, 18322954, './layouts/rkt001', 'N', '20160816153338', 22754084, '1.0.0'),
(22753339, 18322954, './layouts/rkt002', 'N', '20160815191545', 22754118, '1.0.0'),
(18832037, 18322954, './layouts/rom', 'N', '20160817141003', 18837238, '0.1'),
(22540074, 18322954, './layouts/s4us_1.0', 'N', '20160814195029', 22540131, '1.0'),
(19135133, 18322954, './layouts/seven', 'N', '20160812170258', 19955250, '1.2'),
(18663182, 18322954, './layouts/shx_chameleon', 'N', '20160809134325', 18668568, '0.1.1'),
(20579823, 18322954, './layouts/SilverCloud', 'N', '20160711101652', 20579824, '1.0'),
(22753720, 18322954, './layouts/simblog2', 'N', '20160817111839', 22755305, '1.0'),
(19630138, 18322954, './layouts/SimpleDropDown', 'N', '20160725120310', 20467486, '2.0.0'),
(22280542, 18322954, './layouts/simplestrap', 'N', '20160817151846', 22755655, '2.0.2'),
(22753344, 18322954, './layouts/simple_is_best', 'N', '20160816195441', 22754147, '1.0'),
(22753457, 18322954, './layouts/simplicity', 'N', '20160813161151', 22754391, '1.0'),
(22753711, 18322954, './layouts/sim_blog', 'N', '20160817144357', 22755296, '1.1.1'),
(19555890, 18322954, './layouts/sketchbook5', 'N', '20160817145242', 21336191, '1.6.3.6'),
(19712183, 18322954, './layouts/smart', 'N', '20160817020713', 20902184, '0.9.9'),
(18846103, 18322954, './layouts/SORRENT_LAYOUT_RELEASE', 'N', '20160731005927', 18851320, '1.0'),
(19891355, 18322954, './layouts/steelblue4_Basic', 'N', '20160721124355', 19891356, '4'),
(20401336, 18322954, './layouts/style_a_lite', 'N', '20160816211712', 22754751, '2.1.5'),
(21883072, 18322954, './layouts/the_bootstrap', 'N', '20160817134112', 22755641, '3.5.2'),
(22753341, 18322954, './layouts/The_Simple_Classic_Lite', 'N', '20160814154333', 22754141, '1.1'),
(19618448, 18322954, './layouts/Tony', 'N', '20160809175726', 19620083, '0.1.1'),
(18877427, 18322954, './layouts/Treasurej_Craftwork', 'N', '20160814204903', 19032188, '1.0.1'),
(19032971, 18322954, './layouts/Treasurej_Craftwork_C', 'N', '20160814204814', 19038047, '1.0.1'),
(18327743, 18322954, './layouts/Treasurej_Heart_Note', 'N', '20160817140805', 19334770, '1.6'),
(18866481, 18322954, './layouts/Treasurej_Lifestyle', 'N', '20160814195045', 21971882, '1.1'),
(22753561, 18322954, './layouts/ts_basic', 'N', '20160816191751', 22754619, '1.0'),
(18682907, 18322954, './layouts/ueo', 'N', '20160812170651', 19051858, '0.2'),
(19099015, 18322954, './layouts/ure', 'N', '20160722002108', 19099016, '0.1'),
(22753328, 18322954, './layouts/verti', 'N', '20160815142147', 22754108, '0.1.0'),
(18716480, 18322954, './layouts/voo', 'N', '20160816154958', 18722243, '0.1'),
(18634838, 18322954, './layouts/vz_clear_blue', 'N', '20160627081834', 18635623, '0.2'),
(22591861, 18322954, './layouts/webbuilder_layout', 'N', '20160815233719', 22610423, '1.0.3'),
(22610502, 18322954, './layouts/webbuilder_layout2', 'N', '20160816173606', 22614812, '1.0.3'),
(22488105, 18322954, './layouts/webengine_white', 'N', '20160816031151', 22602278, '1.2'),
(22753572, 18322954, './layouts/websitebuilder', 'N', '20160816234334', 22754679, '1.0.1'),
(20458826, 18322954, './layouts/we_home', 'N', '20160817013822', 20980624, '1.8'),
(20531619, 18322954, './layouts/white_square_layout', 'N', '20160816163718', 20882875, '1.3'),
(18572882, 18322954, './layouts/xdom_v2', 'N', '20160812191718', 19595474, '2.5.2.4'),
(21810388, 18322954, './layouts/xdt_black_time', 'N', '20160816202920', 22403080, '1.2'),
(20966755, 18322954, './layouts/xdt_community', 'N', '20160816235606', 21002067, '1.1'),
(21009029, 18322954, './layouts/xdt_community_2', 'N', '20160815233229', 21009030, '1.0'),
(22332211, 18322954, './layouts/xdt_cool', 'N', '20160816211625', 22595789, '1.2.2'),
(20687933, 18322954, './layouts/xdt_offical_2', 'N', '20160814195835', 20949015, '1.4'),
(21302525, 18322954, './layouts/xdt_pure', 'N', '20160817150916', 22755554, '1.6'),
(21428178, 18322954, './layouts/xdt_simple_home', 'N', '20160816221156', 22403086, '1.4'),
(22568598, 18322954, './layouts/xdt_simple_home2', 'N', '20160814193112', 22715996, '1.0.1'),
(22396862, 18322954, './layouts/xdt_style_b', 'N', '20160814172751', 22658304, '1.2.4'),
(22753713, 18322954, './layouts/xecafe', 'N', '20160816192127', 22755285, '1.0'),
(22017658, 18322954, './layouts/xecenter', 'N', '20160817020103', 22633469, '1.3.7'),
(22753801, 18322954, './layouts/xedition_r', 'N', '20160817151414', 22755551, '1.9'),
(19765252, 18322954, './layouts/XEgrid_Free', 'N', '20160817104425', 19765321, '1.0.3'),
(22711628, 18322954, './layouts/xelab_ll1', 'N', '20160816234557', 22712736, '1.0.2'),
(19138636, 18322954, './layouts/xenoriter_simple', 'N', '20160708000059', 19138637, '1.0'),
(22535332, 18322954, './layouts/xeschool_red', 'N', '20160810225856', 22535344, 'red'),
(22753559, 18322954, './layouts/xet_onecolor', 'N', '20160817113631', 22754842, '1.0.5'),
(18917848, 18322954, './layouts/xeVector', 'N', '20160805141653', 18918526, '0.2'),
(22631822, 18322954, './layouts/xeview_layout', 'N', '20160729052939', 22631830, '1.2'),
(18378357, 18322954, './layouts/xe_cafe', 'N', '20160817145350', 21803889, '1.7.0'),
(20276726, 18322954, './layouts/xe_cafe_hub', 'N', '20160817145351', 21803871, '1.7.0'),
(20168220, 18322954, './layouts/xe_cafe_site', 'N', '20160817145350', 21803913, '1.7.0'),
(22753662, 18322954, './layouts/xe_kimtajo_layout', 'N', '20160817122520', 22755545, '2.03'),
(18324299, 18322954, './layouts/xe_official_v2', 'N', '20160817141837', 20391868, '1.0'),
(21245296, 18322954, './layouts/xe_official_v2.2', 'N', '20160817135758', 21295736, 'v.2.2'),
(19178969, 18322954, './layouts/xe_official_v2_TmaKing', 'N', '20160815171458', 19186638, '0.1.1'),
(19248816, 18322954, './layouts/xe_official_v2_Toyou', 'N', '20160812171050', 19258583, 'c'),
(18595504, 18322954, './layouts/xe_official_v2_xgenesis', 'N', '20160815152455', 18596408, '0.1.1'),
(20472943, 18322954, './layouts/xe_solid_enterprise_LeCiel_v1', 'N', '20160808222027', 20613484, '1.7'),
(19515672, 18322954, './layouts/xe_sunooBCLg', 'N', '20160814204213', 19515673, '1.0'),
(18357476, 18322954, './layouts/xe_sunooDMLg', 'N', '20160814204547', 19462033, '1.0'),
(18362403, 18322954, './layouts/xe_sunooDMRg', 'N', '20160814204501', 19462101, '1.0'),
(18722759, 18322954, './layouts/xe_sunooEmLg', 'N', '20160814204516', 19462122, '1.0'),
(18790924, 18322954, './layouts/xe_sunooEmRg', 'N', '20160814204448', 19462147, '1.0'),
(19462173, 18322954, './layouts/xe_sunooNSLg', 'N', '20160814204307', 19462174, '1.0'),
(19491937, 18322954, './layouts/xe_sunooTALg', 'N', '20160814204345', 19491938, '1.0'),
(19462195, 18322954, './layouts/xe_sunooWALg', 'N', '20160816155900', 19462196, '1.0'),
(18637860, 18322954, './layouts/xgenesis_official', 'N', '20160817012807', 19516685, '0.2.2'),
(22753712, 18322954, './layouts/xit', 'N', '20160817081531', 22755284, '1.0'),
(19060827, 18322954, './layouts/xom', 'N', '20160727153503', 19092257, '0.2'),
(22753743, 18322954, './layouts/yourfoliomain', 'N', '20160817033701', 22755394, '0.1'),
(18607483, 18322954, './layouts/zirho_layout', 'N', '20160802221042', 18645390, '0.0.3'),
(19051939, 18322954, './layouts/zom', 'N', '20160817140907', 19087062, '0.2'),
(19060125, 18994172, './m.layouts/2010_jowrney_mobile', 'N', '20160817014311', 19063585, '0.1.3'),
(22753780, 18994172, './m.layouts/BlueRock', 'N', '20160817151842', 22755477, '0.1'),
(18998734, 18994172, './m.layouts/naverstyle', 'N', '20160817014907', 19000655, '1.0'),
(22660923, 18994172, './m.layouts/phizMobileThemes', 'N', '20160817004148', 22754202, '1.2'),
(22753835, 18994172, './m.layouts/phizmobile_m', 'N', '20160817151744', 22755630, '1.8.1'),
(22753345, 18994172, './m.layouts/simple_is_best_mobile', 'N', '20160815192641', 22754148, '1.0'),
(19594292, 18994172, './m.layouts/sketchbook5Mobile', 'N', '20160817140235', 20557098, '1.2.2.3'),
(22753542, 18994172, './m.layouts/sweetMobile', 'N', '20160817135152', 22754694, '1.4'),
(22589792, 18994172, './m.layouts/webbuilder', 'N', '20160816234718', 22589821, '1.0.1'),
(21290627, 18994172, './m.layouts/XenonMoblie', 'N', '20160817104911', 21815540, '1.9.1'),
(22753573, 18994172, './m.layouts/xenon_hs', 'N', '20160817113025', 22754659, '0.1.0'),
(22514693, 18994172, './m.layouts/xenon_nx', 'N', '20160817042614', 22754354, '0.9.3'),
(22454021, 18322923, './messageTalk', 'N', '20160816165245', 22460914, '2.0.1'),
(19431275, 18322943, './module/board/skins', 'N', '20160809224927', 19432793, '0.2'),
(18325790, 18322923, './modules/ad', 'N', '20160814042017', 19741760, '0.5.2'),
(22753677, 18322923, './modules/advanced_mailer', 'N', '20160817150013', 22755567, '1.8.1'),
(22753326, 18322923, './modules/ajaxboard', 'N', '20160817141501', 22754482, '2.1.1'),
(19497436, 18322923, './modules/analysis', 'N', '20160731105633', 19528063, '0.1.2'),
(19130198, 18322923, './modules/analytics', 'N', '20160817093658', 22755256, '1.0.1'),
(22753637, 18322923, './modules/androidpushapp', 'N', '20160817122505', 22755583, '2.0'),
(19323693, 18322923, './modules/antiaccess', 'N', '20160815211926', 20181898, '1.0.3.1'),
(22753563, 18322923, './modules/apporix', 'N', '20160810094939', 22754631, '1.0'),
(19519182, 18322923, './modules/aroundmap', 'N', '20160817142456', 19519377, '0.2'),
(22753313, 18322923, './modules/attendance', 'N', '20160815002306', 22755209, '7.0.1'),
(19030768, 18322943, './modules/attendance/skins/sky_at_board', 'N', '20160815095531', 19038444, '1'),
(20236415, 18322943, './modules/attendance/skins/sr_at_skin', 'N', '20160817140325', 20236418, '0.1'),
(21195185, 18322923, './modules/authentication', 'N', '20160817135121', 22754169, '3.1.2'),
(22617898, 18322923, './modules/automail', 'N', '20160816154316', 22617911, '0.1'),
(22753636, 18322923, './modules/auto_login', 'N', '20160815234847', 22754942, '1.1.4'),
(19522899, 18322923, './modules/bannermgm', 'N', '20160814042035', 19523059, '0.1'),
(22753655, 18322923, './modules/beluxe', 'N', '20160817142225', 22755255, '2.8.3'),
(22753674, 18322943, './modules/beluxe/skins/dxblog', 'N', '20160816153456', 22755246, '1.3'),
(22753680, 18322943, './modules/beluxe/skins/dxreview', 'N', '20160816153512', 22755245, '1.3');
INSERT INTO `xe_autoinstall_packages` (`package_srl`, `category_srl`, `path`, `have_instance`, `updatedate`, `latest_item_srl`, `version`) VALUES
(18773076, 18322923, './modules/blogshop', 'N', '20160816000924', 18920619, '1.1'),
(18324167, 18322923, './modules/board', 'N', '20160817140828', 21940502, '1.7.1.1'),
(19901434, 18994170, './modules/board/m.skins', 'N', '20160816171648', 19902394, '0.1'),
(22753779, 18994170, './modules/board/m.skins/BlueRock', 'N', '20160817151842', 22755476, '0.1'),
(22753497, 18994170, './modules/board/m.skins/ms_m_board', 'N', '20160817150919', 22755358, '1.5.1'),
(20290703, 18994170, './modules/board/m.skins/m_sr_memo', 'N', '20160816232121', 20300033, '0.3.6'),
(22753840, 18994170, './modules/board/m.skins/phiz_mboard', 'N', '20160817133859', 22755633, '1.8.1'),
(21378491, 18994170, './modules/board/m.skins/sketchbook5', 'N', '20160817144136', 22754337, '1.7.0'),
(19594435, 18994170, './modules/board/m.skins/sketchbook5Mobile', 'N', '20160817140043', 20973906, '1.2.3.3'),
(22587055, 18994170, './modules/board/m.skins/sm', 'N', '20160816203656', 22693248, '0.5.8'),
(22658404, 18994170, './modules/board/m.skins/sosifam_memo', 'N', '20160815110330', 22738369, '0.5'),
(22753558, 18994170, './modules/board/m.skins/sweetMobileBoard', 'N', '20160817103238', 22754647, '1.2'),
(21290615, 18994170, './modules/board/m.skins/xenon_m_board', 'N', '20160817103310', 21393065, '1.5'),
(19056755, 18994170, './modules/board/m.skins/xe_official_planner123', 'N', '20160817141956', 22755460, '5.0.3'),
(22753575, 18322943, './modules/board/skins/ASXE_FLAT', 'N', '20160816202104', 22754714, '1.1'),
(22753475, 18322943, './modules/board/skins/bbsmusic', 'N', '20160817134704', 22754834, '1.7.105'),
(19918081, 18322943, './modules/board/skins/CNboard', 'N', '20160816053430', 19918082, '1.0'),
(22530581, 18322943, './modules/board/skins/contact_write', 'N', '20160817142240', 22754505, '1.12'),
(18686122, 18322943, './modules/board/skins/elkha_xe_official', 'N', '20160815220124', 18687734, '1.0'),
(22753727, 18322943, './modules/board/skins/ena_board_set_simpledashed', 'N', '20160817103121', 22755328, '1.0.0'),
(19235403, 18322943, './modules/board/skins/eond_board', 'N', '20160816185944', 19235419, '0.2'),
(18632016, 18322943, './modules/board/skins/faq', 'N', '20160816154740', 18636828, '1.3'),
(22753833, 18322943, './modules/board/skins/Horizon', 'N', '20160817074830', 22755653, '1.2'),
(19637507, 18322943, './modules/board/skins/JB_erebus_board', 'N', '20160817133818', 22450338, '1.3.1'),
(18731809, 18322943, './modules/board/skins/loser_guestbook', 'N', '20160803101708', 19235463, '0.1'),
(19526573, 18322943, './modules/board/skins/lune_board', 'N', '20160817104107', 20290780, '1.04'),
(22753464, 18322943, './modules/board/skins/mixitup', 'N', '20160814172136', 22754418, '1.0'),
(19182698, 18322943, './modules/board/skins/new_faq', 'N', '20160812013722', 20467493, '2.1'),
(19020313, 18322943, './modules/board/skins/pastel_light_purple', 'N', '20160702015606', 19028626, '1.0'),
(22467273, 18322943, './modules/board/skins/phiz_A_zine2', 'N', '20160816113120', 22471747, '1.0'),
(22753841, 18322943, './modules/board/skins/phiz_mboard', 'N', '20160817003823', 22755634, '1.8.1'),
(18331803, 18322943, './modules/board/skins/p_board_p', 'N', '20160727233845', 18845219, '3.2.0'),
(18766699, 18322943, './modules/board/skins/quiet_board', 'N', '20160817094346', 18766890, '2.3'),
(22597855, 18322943, './modules/board/skins/rest_default', 'N', '20160817131129', 22723910, '1.2.1'),
(18980346, 18322943, './modules/board/skins/sejin7940_board', 'N', '20160817133703', 20120497, '3.7'),
(19348911, 18322943, './modules/board/skins/simpleborder_guestbook', 'N', '20160817140752', 19356183, '1.2'),
(22753817, 18322943, './modules/board/skins/simple_banner', 'N', '20160817120810', 22755613, '1.1'),
(19018202, 18322943, './modules/board/skins/simple_blue', 'N', '20160809001408', 19023717, '1.0'),
(20514706, 18322943, './modules/board/skins/simple_board', 'N', '20160817113530', 22754093, '1.3'),
(19555903, 18322943, './modules/board/skins/sketchbook5', 'N', '20160817144136', 22754336, '1.7.0'),
(22301990, 18322943, './modules/board/skins/sketchbook5_youtube', 'N', '20160817142123', 22304077, '0.3'),
(22585779, 18322943, './modules/board/skins/sm', 'N', '20160817013532', 22696276, '1.9.7'),
(22753429, 18322943, './modules/board/skins/sosi_memo', 'N', '20160817134013', 22754360, '0.1'),
(19885185, 18322943, './modules/board/skins/sr_memo', 'N', '20160817013557', 20959847, '0.9.1'),
(19197549, 18322943, './modules/board/skins/webhard', 'N', '20160816155657', 19291163, '0.2'),
(19285120, 18322943, './modules/board/skins/win_guestbook', 'N', '20160817140820', 19295125, '0.5'),
(22566102, 18322943, './modules/board/skins/wmboard', 'N', '20160812234201', 22573020, '2.1'),
(20279332, 18322943, './modules/board/skins/xe_auction', 'N', '20160813184949', 20369078, '0.1.1'),
(18324211, 18322943, './modules/board/skins/xe_board', 'N', '20160817011006', 18325569, '0.1'),
(19349000, 18322943, './modules/board/skins/xe_board_extended', 'N', '20160816193356', 19349001, '1.0'),
(18324212, 18322943, './modules/board/skins/xe_default', 'N', '20160813121714', 18325513, '0.1'),
(18335090, 18322943, './modules/board/skins/xe_naradesign', 'N', '20160816154611', 18335100, '1.0'),
(18448761, 18322943, './modules/board/skins/xe_official_hancoma_title_skin', 'N', '20160814024519', 18461302, '0.2'),
(18398352, 18322943, './modules/board/skins/xe_official_planner123', 'N', '20160817135954', 22755462, '5.0.3'),
(21802016, 18322943, './modules/board/skins/xe_official_planner123/colorset', 'N', '20160816214549', 22754341, '0.4'),
(18953963, 18322943, './modules/board/skins/xe_official_sky', 'N', '20160817144520', 18971884, '1.2'),
(18338699, 18322943, './modules/board/skins/xe_uccup', 'N', '20160801110252', 18338792, 'v2.3'),
(21813965, 18322943, './modules/board/skins/xe_v3_gallery_haan', 'N', '20160817135606', 21814028, '0.3.1'),
(20279228, 18322923, './modules/boardauction', 'N', '20160813184948', 20295567, '0.1.1'),
(22753397, 18322923, './modules/board_extend', 'N', '20160817120201', 22754254, '1.1'),
(18943118, 18322943, './modules/bodex/skins', 'N', '20160720223246', 18953950, '완성버전'),
(19894029, 18322943, './modules/bodex/skins/sw_contact', 'N', '20160817131953', 19902554, '0.9'),
(22753517, 18322923, './modules/bulkmsg', 'N', '20160817134758', 22754543, '1.0'),
(22073155, 18322923, './modules/cash', 'N', '20160815153204', 22074809, '0.1'),
(18589320, 18322923, './modules/cashbook', 'N', '20160730012640', 19603368, '0.3.7'),
(22753351, 18322923, './modules/cashpay', 'N', '20160816155433', 22754156, '1.0'),
(20710471, 18322923, './modules/checkip', 'N', '20160815211337', 20765854, '0.2.2'),
(22660953, 18994170, './modules/communication/m.skin/phizMobile', 'N', '20160817054210', 22660956, '1.0'),
(22646488, 18994170, './modules/communication/m.skins/sketchbook5_communication_m.skin', 'N', '20160817134430', 22755494, '0.4.21'),
(18595711, 18322943, './modules/communication/skins/name', 'N', '20160621151136', 18597241, '0.1'),
(22283657, 18322943, './modules/communication/skins/simplestrap', 'N', '20160817151846', 22755629, '2.0'),
(22646443, 18322943, './modules/communication/skins/sketchbook5_communication_skin', 'N', '20160817144021', 22755495, '0.4.21'),
(21861251, 18322943, './modules/communication/skins/tb', 'N', '20160817004003', 21861263, '1.0'),
(20155171, 18322943, './modules/communication/skins/XET_communication', 'N', '20160813000942', 21344485, '1.2.1'),
(20187450, 18322923, './modules/contact', 'N', '20160816161313', 21968983, '1.7.0.2'),
(20476937, 18322943, './modules/contact/skins/cameron', 'N', '20160816093912', 21970579, '1.5'),
(22540502, 18322943, './modules/contact/skins/phizContact', 'N', '20160817150141', 22540527, '1.0'),
(21411172, 18322943, './modules/contact/skins/tb', 'N', '20160812110428', 21411184, '1.0'),
(18997930, 18322923, './modules/coupon', 'N', '20160812224609', 21627586, '1.0'),
(22753346, 18322923, './modules/currency', 'N', '20160817144903', 22754151, '1.0'),
(22597112, 18322923, './modules/cympusadmin', 'N', '20160817144912', 22754161, '1.3'),
(20908270, 18322923, './modules/detail_search', 'N', '20160817145752', 20949711, '0.1.1'),
(19551431, 18322977, './modules/document/tpl/icons', 'N', '20160621142615', 19551432, '0.1'),
(22753465, 18322923, './modules/easyxe', 'N', '20160817092706', 22755347, '1.43.1'),
(22753689, 18322929, './modules/editor/components/btn_add', 'N', '20160815233532', 22755152, '0.3'),
(18324261, 18322929, './modules/editor/components/cc_license', 'N', '20160810053818', 18325227, '0.1'),
(19657941, 18322929, './modules/editor/components/chess', 'N', '20160807185724', 19688815, '1.1.2'),
(18325803, 18322929, './modules/editor/components/code_highlighter', 'N', '20160813111325', 22754829, '1.4'),
(19817434, 18322929, './modules/editor/components/eh_player', 'N', '20160816020254', 22755204, '1.7'),
(18324266, 18322929, './modules/editor/components/emoticon', 'N', '20160816180725', 18325232, '0.1'),
(19983564, 18322977, './modules/editor/components/emoticon/tpl/images', 'N', '20160809162841', 19984752, '1.4.5.10'),
(19009872, 18904838, './modules/editor/components/emoticon/tpl/images/congcon', 'N', '20160817140158', 19010544, '1.0'),
(19306873, 18904838, './modules/editor/components/emoticon/tpl/images/hicon', 'N', '20160811022824', 19310220, '1.0.0'),
(18994748, 18904838, './modules/editor/components/emoticon/tpl/images/pink', 'N', '20160814131156', 18995710, '1.0'),
(18325989, 18322929, './modules/editor/components/google_translate', 'N', '20160816154922', 18777700, '0.2'),
(18730576, 18322929, './modules/editor/components/interpark_book_search', 'N', '20160809154824', 18740294, '0.1'),
(18649607, 18322929, './modules/editor/components/jowrney_logmap', 'N', '20160816115818', 19533339, '0.4.0'),
(22753406, 18322929, './modules/editor/components/map_components', 'N', '20160817150913', 22755647, '1.4'),
(22753545, 18322929, './modules/editor/components/markdown', 'N', '20160813004607', 22754847, '0.6'),
(22540996, 18322929, './modules/editor/components/multimedia_link', 'N', '20160817120150', 22616932, '1.2.0'),
(18324273, 18322929, './modules/editor/components/quotation', 'N', '20160816195530', 18325248, '0.1'),
(21194822, 18322929, './modules/editor/components/simple_jw', 'N', '20160816020305', 21364752, '0.3.0'),
(18673912, 18322929, './modules/editor/components/soo_google_map', 'N', '20160817143440', 22231835, '0.9'),
(18650580, 18322929, './modules/editor/components/soo_naver_bookinfo', 'N', '20160809154614', 19044122, '0.3.1'),
(18679839, 18322929, './modules/editor/components/soo_naver_image', 'N', '20160814180839', 18690439, '1.0.2'),
(21014822, 18322929, './modules/editor/components/soo_youtube', 'N', '20160816210008', 21039496, '0.5.1'),
(22753654, 18322929, './modules/editor/components/srook_maker', 'N', '20160817075530', 22754966, '1.0'),
(18326005, 18322929, './modules/editor/components/textbox', 'N', '20160815224725', 18326938, '0.1'),
(22590697, 18322943, './modules/editor/skins/ckeditor', 'N', '20160816214853', 22590711, '1.0.0'),
(22753638, 18322943, './modules/editor/skins/ck_xpress', 'N', '20160816031013', 22754981, '1.0.2'),
(18324213, 18322943, './modules/editor/skins/dreditor', 'N', '20160817113131', 18865892, '1.3.0'),
(18773077, 18631347, './modules/editor/skins/dreditor/drcomponents/blogshop_writer', 'N', '20160816000924', 18920604, '1.1'),
(18652557, 18631347, './modules/editor/skins/dreditor/drcomponents/code', 'N', '20160812123647', 18652761, '0.1'),
(18646646, 18631347, './modules/editor/skins/dreditor/drcomponents/iframe', 'N', '20160814232537', 18646655, '0.1'),
(22610153, 18322943, './modules/editor/skins/dsori_ckeditor', 'N', '20160816191420', 22624901, '0.1740.3'),
(18324214, 18322943, './modules/editor/skins/fckeditor', 'N', '20160816172817', 18325501, '0.1'),
(20473328, 18904838, './modules/editor/skins/fckplus', 'N', '20160817144633', 20487316, '1.1a'),
(20476783, 18904838, './modules/editor/skins/fckplus_SimpleWhite', 'N', '20160817020216', 20487172, '1.1a'),
(19529916, 18322943, './modules/editor/skins/jowrneyEditor', 'N', '20160816155048', 19533373, '0.1.0'),
(22753568, 18322943, './modules/editor/skins/sejin7940_editor_blank', 'N', '20160815015734', 22754639, '0.5'),
(22753566, 18322943, './modules/editor/skins/sejin7940_editor_fileupload', 'N', '20160812220152', 22754637, '0.5'),
(19355511, 18904838, './modules/editor/skins/simple_editor', 'N', '20160814012740', 19355526, '1.0'),
(18809955, 18322943, './modules/editor/skins/tinyMCE', 'N', '20160808170520', 18810260, '1.4'),
(19197538, 18322950, './modules/editor/skins/webhard', 'N', '20160816155657', 19291157, '0.2'),
(20473753, 18322943, './modules/editor/skins/xeed', 'N', '20160808161602', 20473754, '0.2'),
(22450636, 18322943, './modules/editor/skins/xpresseditor_axupload5', 'N', '20160816225002', 22755307, '1.2.1'),
(22753334, 18322943, './modules/editor/skins/xpresseditor_datauri', 'N', '20160810183221', 22754114, '1.7'),
(18324221, 18322943, './modules/editor/skins/xquared', 'N', '20160730193026', 18325496, '0.1'),
(18910976, 18904838, './modules/editor/styles/dreditor', 'N', '20160811042223', 18910977, '0.1'),
(19674194, 18904838, './modules/editor/styles/misol', 'N', '20160804151336', 19674198, '0.1'),
(19673444, 18904838, './modules/editor/styles/NomarginPTag', 'N', '20160816002156', 19675462, '0.0.1.1'),
(22452877, 18904838, './modules/editor/styles/simplestrap', 'N', '20160817021409', 22452885, '0.1'),
(22753617, 18322923, './modules/encryption', 'N', '20160813132309', 22755121, '1.2'),
(22594556, 18322923, './modules/epay', 'N', '20160817144849', 22754921, '2.2'),
(22753571, 18322923, './modules/exam', 'N', '20160816172018', 22754771, '0.8'),
(20187411, 18322923, './modules/faq', 'N', '20160817135621', 21854296, '1.7.0.1'),
(21854312, 18322923, './modules/forum', 'N', '20160810233923', 21956789, '1.7.0.1'),
(22351328, 18322943, './modules/forum/skins/flat_forum_lite', 'N', '20160815162023', 22374400, '1.0.4'),
(22753724, 18322923, './modules/freedownload', 'N', '20160809130916', 22755331, '1.1'),
(18621989, 18322923, './modules/gagafilemd5', 'N', '20160808233445', 18684166, '1.0'),
(22753356, 18322923, './modules/gdata', 'N', '20160817142205', 22754185, '0.5'),
(22726124, 18322923, './modules/ggmailing', 'N', '20160817003317', 22755531, '0.4.4'),
(20187337, 18322923, './modules/guestbook', 'N', '20160817135516', 21962590, '1.7.0.1'),
(18324168, 18322923, './modules/homepage', 'N', '20160817145349', 21854391, '1.7.0.1'),
(20277082, 18322943, './modules/homepage/skins/xe_cafe_v2', 'N', '20160528180849', 20309227, '0.1.1'),
(18956310, 18322923, './modules/iconshop', 'N', '20160815133342', 18999633, '0.4'),
(22753726, 18322923, './modules/imageprocess', 'N', '20160817123335', 22755587, '2.1.1.1'),
(22753348, 18322923, './modules/inipay', 'N', '20160817002921', 22754422, '1.2'),
(22753349, 18322923, './modules/inipaymobile', 'N', '20160816155428', 22754154, '1.0'),
(22753783, 18322923, './modules/inipaystandard', 'N', '20160812091446', 22755496, '0.1'),
(18595500, 18322943, './modules/integration_search/skins/default_xgenesis', 'N', '20160811134741', 18596361, '0.1.1'),
(21861282, 18322943, './modules/integration_search/skins/tb', 'N', '20160814210138', 21861307, '1.0'),
(19473533, 18322943, './modules/integration_search/skins/xgenesis_official', 'N', '20160817012807', 19473716, '0.1.0'),
(22356670, 18322943, './modules/integration_search/skins/yjsoft_ggcse', 'N', '20160817114439', 22379825, '0.1.0'),
(19514473, 18322943, './modules/issuetracker', 'N', '20160729020336', 19539420, '1.1.0'),
(18335281, 18322923, './modules/join_extend', 'N', '20160816144746', 18988537, '0.5.3.4'),
(18366133, 18322943, './modules/join_extend/skins', 'N', '20160816193313', 18366143, '1'),
(22753350, 18322923, './modules/kcp', 'N', '20160816155400', 22754421, '1.1'),
(18334938, 18322923, './modules/kin', 'N', '20160816144736', 21965762, '1.7.0'),
(19073195, 18322923, './modules/krzip_popup', 'N', '20160814211317', 19073196, '0.1'),
(22753759, 18322923, './modules/laweb_xe', 'N', '20160815152822', 22755509, '2.00'),
(22597020, 18322923, './modules/license', 'N', '20160816155440', 22635123, '1.2.1'),
(20670102, 18322923, './modules/lisense', 'N', '20160814102146', 20692149, '0.1'),
(18324171, 18322923, './modules/livexe', 'N', '20160813210634', 19624726, '0.6'),
(18905882, 18322923, './modules/loginlog', 'N', '20160817151608', 22755589, '1.4.0beta'),
(19024107, 18322923, './modules/lottery', 'N', '20160817011202', 19027139, '0.1'),
(22753474, 18322943, './modules/lottery/skins/eond_v1', 'N', '20160811223148', 22754439, '0.1'),
(20415487, 18322943, './modules/lottery/skins/simple', 'N', '20160815154339', 20451828, '1.1'),
(19212262, 18322923, './modules/lucene', 'N', '20160717124251', 19315303, '1.2'),
(19202124, 18322923, './modules/lunar', 'N', '20160817140727', 19213083, '0.1.1'),
(22753806, 18322923, './modules/mailing', 'N', '20160815211239', 22755557, '0.5'),
(19201082, 18322923, './modules/mail_m9', 'N', '20160813192736', 19201083, '0.1'),
(22753459, 18322923, './modules/maps', 'N', '20160817103247', 22755385, '1.1.5'),
(22753541, 18322923, './modules/marketplace', 'N', '20160817091011', 22754737, '1.3'),
(18324175, 18322923, './modules/material', 'N', '20160817113131', 18669818, '1.0'),
(18929292, 18322923, './modules/mcubeimg', 'N', '20160813103147', 18983143, '0.3'),
(18334996, 18322923, './modules/media', 'N', '20160816154604', 18336696, 'v0.1'),
(22547855, 18994170, './modules/member/m.skins/Blouse', 'N', '20160816234911', 22568070, '1.3'),
(22660940, 18994170, './modules/member/m.skins/phizMobile', 'N', '20160816203548', 22660950, '1.0'),
(22646468, 18994170, './modules/member/m.skins/sketchbook5_member_m.skin', 'N', '20160817134413', 22755493, '0.4.21'),
(21290626, 18994170, './modules/member/m.skins/xenon_m_member', 'N', '20160817111944', 21429905, '1.0'),
(19344633, 18322943, './modules/member/skins', 'N', '20160814210528', 19349355, '1.0.0'),
(19202128, 18322943, './modules/member/skins/default(lunar)', 'N', '20160817140727', 19467792, '0.3'),
(19073227, 18322943, './modules/member/skins/default_krzip', 'N', '20160814211316', 19073228, '0.1'),
(22753555, 18322943, './modules/member/skins/material_xe', 'N', '20160817114113', 22754608, '1.0.0'),
(19962621, 18322943, './modules/member/skins/noangel_black', 'N', '20160816162641', 19962952, '1.0a'),
(19560898, 18322943, './modules/member/skins/photoGalleryA', 'N', '20160817142036', 19560902, '1.0'),
(20495669, 18322943, './modules/member/skins/simple', 'N', '20160814210348', 20507441, '0.1'),
(22283649, 18322943, './modules/member/skins/simplestrap', 'N', '20160817151846', 22755627, '2.0'),
(20519604, 18322943, './modules/member/skins/simple_for_14', 'N', '20160816001351', 21193099, '0.2'),
(22646356, 18322943, './modules/member/skins/sketchbook5_member_skin', 'N', '20160817134400', 22755492, '0.4.21'),
(21861240, 18322943, './modules/member/skins/tb', 'N', '20160817004003', 21861246, '1.0'),
(20155119, 18322943, './modules/member/skins/XET_member', 'N', '20160816020424', 21197586, '1.2'),
(22753624, 18322923, './modules/member_condition', 'N', '20160817002816', 22755317, '1.0.2'),
(22753717, 18322923, './modules/member_expire', 'N', '20160816172601', 22755574, '1.2.3'),
(20502461, 18322943, './modules/message/skins/cmd_message', 'N', '20160721224715', 20502462, '0.1'),
(21715889, 18322943, './modules/message/skins/eond', 'N', '20160813061003', 21715890, '0.1'),
(19976643, 18322950, './modules/message/skins/naruCD', 'N', '20160710225615', 19984421, '0.1.2'),
(21861272, 18322943, './modules/message/skins/tb', 'N', '20160812012308', 21861277, '1.0'),
(18325946, 18322923, './modules/minishop', 'N', '20160816150309', 22754398, '1.3.2'),
(21388442, 18322923, './modules/mobileex', 'N', '20160812222135', 22107721, '0.6.1'),
(22579388, 18322923, './modules/money', 'N', '20160816181411', 22702291, '0.1.3'),
(22753588, 18322923, './modules/moneyhistory', 'N', '20160815152400', 22754731, '0.1.4'),
(22705169, 18322923, './modules/moneysend', 'N', '20160815152337', 22705176, '0.0.1'),
(18610979, 18322923, './modules/msg_admin', 'N', '20160816163450', 18614159, '0.1'),
(21876980, 18322923, './modules/multidomain', 'N', '20160816164123', 22755400, '1.4.1'),
(22594549, 18322923, './modules/ncart', 'N', '20160817144758', 22754916, '1.7'),
(21374711, 18322923, './modules/ncenterlite', 'N', '20160817144403', 22755646, '3.0.0'),
(21798677, 18322943, './modules/ncenterlite/skins/playerplace', 'N', '20160816212251', 21798682, '1.0.1'),
(22753399, 18322943, './modules/ncenterlite/skins/wild_ones', 'N', '20160816214805', 22754258, '0.1'),
(20393822, 18322923, './modules/newposts', 'N', '20160817134530', 22755538, '2.4'),
(22594557, 18322923, './modules/nmileage', 'N', '20160817144912', 22754160, '1.5.4'),
(18335043, 18322923, './modules/nms', 'N', '20160708151833', 19520872, '0.9.0'),
(20324311, 18322923, './modules/notification', 'N', '20160817115554', 22755544, '2.4.1'),
(22594541, 18322923, './modules/nproduct', 'N', '20160817144829', 22754918, '1.7'),
(22594546, 18322923, './modules/nstore', 'N', '20160817144902', 22754920, '2.2'),
(22596809, 18322923, './modules/nstore_digital', 'N', '20160816154316', 22754165, '1.9'),
(22596810, 18322923, './modules/nstore_digital_contents', 'N', '20160816155453', 22597002, '1.1'),
(21717275, 18322923, './modules/okname', 'N', '20160817035510', 21726208, '0.2.0'),
(18527888, 18322923, './modules/oneban', 'N', '20160807190422', 18529981, '1.0'),
(22753811, 18322923, './modules/opensearch', 'N', '20160817121324', 22755570, '1.0'),
(22115651, 18322923, './modules/pa', 'N', '20160812051921', 22121058, '1.0'),
(22753552, 18322923, './modules/pado_ajax_newsModule', 'N', '20160816153707', 22754727, '1.5'),
(22753837, 18994170, './modules/page/m.skins/main02_MobileM', 'N', '20160816204740', 22755631, '1.0'),
(21290617, 18994170, './modules/page/m.skins/xenon_m_page', 'N', '20160809225659', 21295253, '1.1'),
(20509760, 18322943, './modules/page/skins/sejin7940_page', 'N', '20160816235638', 22572810, '1.4.1'),
(22597227, 18322923, './modules/paynoty', 'N', '20160817144849', 22597244, '1.1'),
(22753352, 18322923, './modules/paypal', 'N', '20160817113334', 22754157, '1.0'),
(22753838, 18322923, './modules/phizeditormobile', 'N', '20160817133859', 22755632, '1.8.0'),
(22753818, 18322923, './modules/phpexcel_module', 'N', '20160817101717', 22755598, '0.1'),
(19325680, 18322923, './modules/pipingxe', 'N', '20160816065733', 19546936, '1.0.5'),
(18324188, 18322923, './modules/planet', 'N', '20160816181052', 21015994, '0.1.4'),
(22466915, 18322923, './modules/plusad', 'N', '20160815042754', 22530791, '0.5'),
(18399622, 18322977, './modules/poin/954', 'N', '20160731230800', 18404551, '1.0.1'),
(19988049, 18322977, './modules/point/icons', 'N', '20160728103752', 19988222, '1.1.1'),
(22245529, 18322977, './modules/point/icons/2sis_icon', 'N', '20160815164143', 22245577, '1'),
(18997142, 18322977, './modules/point/icons/300', 'N', '20160813073003', 18998204, '1.0'),
(22402420, 18322977, './modules/point/icons/500-983', 'N', '20160804044938', 22402437, 'fort'),
(19754728, 18322977, './modules/point/icons/ca_ladder_60', 'N', '20160809160418', 19755182, '0.1'),
(19015269, 18322977, './modules/point/icons/CA_L_Mark', 'N', '20160814232957', 19026360, '0.1v'),
(19015265, 18322977, './modules/point/icons/cool', 'N', '20160526232343', 19026346, '0.1v'),
(18864982, 18322977, './modules/point/icons/cs_level', 'N', '20160725191827', 18866619, '0.1a'),
(22481310, 18322977, './modules/point/icons/Dandy_TJ', 'N', '20160803185138', 22481349, 'I\'m very Dandy'),
(18669571, 18322977, './modules/point/icons/dark', 'N', '20160811172607', 18672429, '1.0'),
(22266089, 18322977, './modules/point/icons/default_J', 'N', '20160809210301', 22266113, 'PK_CP'),
(22303618, 18322977, './modules/point/icons/donek', 'N', '20160710200244', 22303661, 'Acc'),
(19806836, 18322977, './modules/point/icons/elkha_poporina_zerostar50', 'N', '20160817111324', 19806837, '0.1'),
(19064264, 18322977, './modules/point/icons/getam', 'N', '20160728163126', 19064959, '0.1a'),
(22305559, 18322977, './modules/point/icons/KJA_Love', 'N', '20160810233253', 22305588, 'R'),
(21344825, 18322977, './modules/point/icons/level', 'N', '20160816191235', 21360732, '2.0'),
(22141994, 18322977, './modules/point/icons/level_icon', 'N', '20160816211622', 22734341, 'SSS'),
(18354463, 18322977, './modules/point/icons/lv', 'N', '20160722154111', 19013505, '0.2'),
(19566135, 18322977, './modules/point/icons/NetCabin_Lvic', 'N', '20160726160410', 19576465, '0.1'),
(19068106, 18322977, './modules/point/icons/nova2', 'N', '20160721024148', 19068107, '0.1a'),
(22535360, 18322977, './modules/point/icons/plusalpine', 'N', '20160813092716', 22535364, 'plusAlpha'),
(18904819, 18322977, './modules/point/icons/raycity_f', 'N', '20160804060523', 18908837, '0.1v'),
(18904767, 18322977, './modules/point/icons/raycity_m', 'N', '20160728163156', 18908827, '0.1v'),
(22535350, 18322977, './modules/point/icons/redskiicons', 'N', '20160817132636', 22535354, 'redski'),
(22737353, 18322977, './modules/point/icons/semo', 'N', '20160809160534', 22737363, 'Volkswagen'),
(19064410, 18322977, './modules/point/icons/simple_TS', 'N', '20160810093523', 19064414, '1.0'),
(22186881, 18322977, './modules/point/icons/star', 'N', '20160804041816', 22186890, 'S'),
(19299608, 18322977, './modules/point/icons/ToYou_level', 'N', '20160803125415', 19299609, 'ToYou_level_icon v1.'),
(22337183, 18322977, './modules/point/icons/typical-t', 'N', '20160805220545', 22337194, 'Timeless'),
(22160991, 18322977, './modules/point/icons/wf_lv', 'N', '20160816235128', 22161011, '0.2'),
(19533731, 18322977, './modules/point/icons/xeicon_coa', 'N', '20160813100620', 19736559, '3.0'),
(22356680, 18322977, './modules/point/icons/zanazana', 'N', '20160717194211', 22356690, 'I don\'t no'),
(22753420, 18322923, './modules/pointhistory', 'N', '20160816050029', 22754374, '0.1.4'),
(18410867, 18322923, './modules/pointsend', 'N', '20160816175854', 22755279, '1.2.5.2'),
(19426823, 18322943, './modules/poll/skins/clevis_poll', 'N', '20160816155754', 19440072, '0.3'),
(18640942, 18322923, './modules/pop_up', 'N', '20160817144205', 18646378, '0.0.4'),
(19510889, 18322923, './modules/portalpoint', 'N', '20160814041941', 19741258, '1.2'),
(22753314, 18322923, './modules/privilege', 'N', '20160816184213', 22754353, '0.1.2'),
(22753434, 18322923, './modules/profiler', 'N', '20160816192935', 22754941, '1.0'),
(18867310, 18322923, './modules/project', 'N', '20160810142402', 21278683, '1.3.1'),
(20882492, 18322923, './modules/purplebook', 'N', '20160817141435', 22755547, '4.8.1'),
(22590268, 18322923, './modules/quizgame', 'N', '20160816003511', 22590276, '0.1'),
(21933295, 18322923, './modules/realnotice', 'N', '20160809232616', 21933310, '0.5'),
(21412475, 18322923, './modules/recruit', 'N', '20160809133150', 21412476, '1.0'),
(20673970, 18322923, './modules/referer', 'N', '20160817150551', 22755654, '3.9.4'),
(18324189, 18322923, './modules/referer_old', 'N', '20160814020547', 18325389, '0.15'),
(21231044, 18322923, './modules/reset_password', 'N', '20160810141024', 22728311, '1.2'),
(18324191, 18322923, './modules/resource', 'N', '20160817135559', 21854259, '1.7.0'),
(22508537, 18322923, './modules/rockgame', 'N', '20160817021604', 22541336, '0.4'),
(19519188, 18322923, './modules/rssboard', 'N', '20160817103834', 19539111, '0.3'),
(18800584, 18322923, './modules/sboard', 'N', '20160817135826', 18878072, '2.1.0'),
(22753647, 18322923, './modules/schedule', 'N', '20160816213816', 22754990, '1.1'),
(21211103, 18322923, './modules/sejin7940_comment', 'N', '20160815093853', 22724164, '1.5'),
(22730395, 18994170, './modules/sejin7940_comment/m.skins/sketchbook5_mycomment_mskin', 'N', '20160817134448', 22755497, '1.0.4'),
(22730394, 18322943, './modules/sejin7940_comment/skins/sketchbook5_mycomment_skin', 'N', '20160817134454', 22755498, '1.0.4'),
(22577184, 18322923, './modules/sejin7940_copy', 'N', '20160817073059', 22755414, '1.3.3'),
(22753388, 18322923, './modules/sejin7940_nick', 'N', '20160814082126', 22754240, '1.0.2'),
(22690074, 18322923, './modules/sejin7940_vote', 'N', '20160817140015', 22755593, '1.3.1'),
(22753354, 18322923, './modules/seo', 'N', '20160817142411', 22755548, '1.8.19'),
(22753488, 18322923, './modules/sitemap', 'N', '20160816215636', 22755639, '1.3'),
(22753842, 18322923, './modules/sitemaplite', 'N', '20160817091311', 22755636, '1.1.0'),
(21370287, 18322923, './modules/smartux', 'N', '20160809232710', 21370289, '1.0.2'),
(22753565, 18322923, './modules/smith', 'N', '20160725210058', 22754636, '1.1'),
(18325941, 18322923, './modules/sms', 'N', '20160809140218', 18745231, '1.3.10'),
(18561875, 18322923, './modules/smsontextyle', 'N', '20160731085026', 18569729, '1.0.1'),
(19518187, 18322923, './modules/socialxe', 'N', '20160817135345', 22123379, '1.0.11'),
(20789735, 18322943, './modules/socialxe/skins/bootstrap.single', 'N', '20160809211453', 20789736, '1.0'),
(21411060, 18322943, './modules/socialxe/skins/tb', 'N', '20160815154528', 22122003, '1.1'),
(19518188, 18322923, './modules/socialxeserver', 'N', '20160815140406', 22120897, '1.0.11'),
(21411087, 18322943, './modules/socialxeserver/skins/tb', 'N', '20160814145443', 21411095, '1.0'),
(22753663, 18322923, './modules/speedlimiter', 'N', '20160810202012', 22755088, '1.3.1'),
(19519235, 18322923, './modules/sphinx', 'N', '20160607181844', 19519336, '0.2'),
(18326030, 18322923, './modules/statistics', 'N', '20160817095706', 18327023, '1.0.1b'),
(22753540, 18322923, './modules/stats', 'N', '20160816213446', 22754620, '1.1.1'),
(18666669, 18322923, './modules/stopsmoking', 'N', '20160813084633', 19493136, '0.2.2'),
(22594548, 18322923, './modules/store_review', 'N', '20160817144828', 22596375, '0.2'),
(22597120, 18322923, './modules/store_search', 'N', '20160816154158', 22597129, '0.9'),
(18745485, 18322923, './modules/syndication', 'N', '20160817152525', 22755525, '5.0.0'),
(18324199, 18322923, './modules/tccommentnotify', 'N', '20160811224203', 18365815, '1.1.0'),
(20324298, 18322923, './modules/textmessage', 'N', '20160817135121', 22755537, '3.1'),
(18324186, 18322923, './modules/textyle', 'N', '20160817113123', 21795348, '1.7.0'),
(21749702, 18994170, './modules/textyle/m.skins', 'N', '20160815223520', 21762837, '0.9'),
(18386463, 18322943, './modules/textyle/skins', 'N', '20160714175546', 19100013, '2.5'),
(18915805, 18322943, './modules/textyle/skins/babyBlack', 'N', '20160706150220', 18918781, 'v0.1'),
(19744664, 18322943, './modules/textyle/skins/BlueMood', 'N', '20160704180212', 19757584, '0.2'),
(18335356, 18322943, './modules/textyle/skins/corporate', 'N', '20160810035657', 18335357, '0.9'),
(19740680, 18322943, './modules/textyle/skins/DESIGNER', 'N', '20160727100023', 19757652, '0.2'),
(19740711, 18322943, './modules/textyle/skins/designspiration', 'N', '20160730021202', 19757610, '0.2'),
(18678675, 18322943, './modules/textyle/skins/Emplode', 'N', '20160816154845', 18700716, '0.6'),
(19525249, 18322943, './modules/textyle/skins/fotowallXE', 'N', '20160817112800', 19526784, '0.4.0'),
(19740666, 18322943, './modules/textyle/skins/PHOTOGRAPHER', 'N', '20160816160259', 19757669, '0.2'),
(18617496, 18322943, './modules/textyle/skins/Viewfinder', 'N', '20160712173405', 18678663, '0.3'),
(18324225, 18322943, './modules/textyle/skins/wordPressDefault', 'N', '20160810145941', 18325484, '0.1'),
(18510031, 18322943, './modules/textyle/skins/zirho', 'N', '20160703062128', 18569108, '0.0.1'),
(18324187, 18322923, './modules/textylehub', 'N', '20160815195658', 21795365, '1.7.0'),
(22753504, 18322923, './modules/timeline', 'N', '20160816164000', 22755266, '1.0.2'),
(20936395, 18322923, './modules/umessage', 'N', '20160811200717', 20943903, '1.1'),
(22446815, 18322923, './modules/upgletyle', 'N', '20160816161826', 22692647, '0.1.4'),
(22720710, 18322943, './modules/upgletyle/skins/emplode', 'N', '20160803192045', 22720745, '0.7'),
(22648755, 18322923, './modules/upgletyle_plugin_daumview', 'N', '20160812075435', 22648765, '0.1.0.b1'),
(20832931, 18322923, './modules/user_finder', 'N', '20160810222823', 20836347, '0.1'),
(22753651, 18322923, './modules/vote', 'N', '20160817011249', 22755019, '1.1.4'),
(18324210, 18322923, './modules/wiki', 'N', '20160816200938', 21985871, '1.7.0.1'),
(18607436, 18322923, './modules/wizardxe', 'N', '20160815121258', 19150177, '0.0.6'),
(21305881, 18322923, './modules/xewall', 'N', '20160811211120', 22754355, '0.3.1'),
(22753396, 18322923, './modules/ximember', 'N', '20160817032604', 22754333, '1.4'),
(22753791, 18322923, './modules/yeyak', 'N', '20160817105340', 22755652, '1.7.3'),
(22753675, 18322923, './modules/youtube', 'N', '20160817134531', 22755418, '1.1.1.'),
(18351409, 18322923, './modules/zzz_menu_new', 'N', '20160817120104', 21832040, '1.7.0'),
(19125571, 18322943, './moudles/board/skins', 'N', '20160809001344', 19128667, 'v2'),
(19130808, 18322927, './widgets/analytics_flash_counter', 'N', '20160816085139', 19157494, '0.2'),
(22753692, 18322927, './widgets/androidapp_login', 'N', '20160817122506', 22755388, '1.4'),
(18324320, 18322927, './widgets/archive_list', 'N', '20160724142844', 18325093, '0.1'),
(19027281, 18322950, './widgets/attendance_check/skins/sky_next_line', 'N', '20160812003625', 19029151, '1'),
(20185969, 18322927, './widgets/autoredirect', 'N', '20160812195135', 20185972, '1.0'),
(18607471, 18322927, './widgets/bangbang_alltogether', 'N', '20160811143531', 18645219, '0.0.3'),
(19522900, 18322927, './widgets/bannermgm_widget', 'N', '20160813115630', 19525794, '0.2'),
(18627986, 18322927, './widgets/banner_script', 'N', '20160630081820', 18634779, '0.1'),
(22753688, 18322927, './widgets/best_content', 'N', '20160817143435', 22755148, '1.0'),
(19270268, 18322950, './widgets/bgw_menu/skins/naradesign', 'N', '20160806084604', 19270269, '0.1'),
(19526505, 18322927, './widgets/bible_read', 'N', '20160817140215', 19585818, '1.1'),
(20522820, 18322950, './widgets/bible_read/skins/KnDol', 'N', '20160817140215', 20590447, '1.1.0'),
(19218468, 18322927, './widgets/birthday', 'N', '20160720151626', 19218473, '0.1'),
(22529898, 18322950, './widgets/browserWidget/skins/simplestrap', 'N', '20160716140620', 22529948, '0.1'),
(18324321, 18322927, './widgets/calendar', 'N', '20160817140224', 20591626, '0.2'),
(22753437, 18322950, './widgets/calendar/skins/UXF_CALENDER_TYPE_01', 'N', '20160816143829', 22754368, '1.1.0'),
(18697182, 18322927, './widgets/calendar_plannerXE123', 'N', '20160817144340', 22755461, '5.0.3'),
(22664861, 18322927, './widgets/cameronSlider', 'N', '20160817151304', 22754523, '1.0.2'),
(22665526, 18322950, './widgets/cameronSlider/skins/bxSlider', 'N', '20160817151327', 22754330, '1.0.1'),
(22664862, 18322950, './widgets/cameronSlider/skins/cameraSlider', 'N', '20160817143625', 22754329, '1.0.1'),
(22665670, 18322950, './widgets/cameronSlider/skins/FlexSlider2', 'N', '20160817151308', 22754331, '1.0.1'),
(21196855, 18322927, './widgets/camtv', 'N', '20160817135957', 21228634, '0.1'),
(18324326, 18322927, './widgets/category', 'N', '20160817142944', 18325077, '0.1'),
(19775958, 18322950, './widgets/category/skins/BlogskinDesigner', 'N', '20160704175709', 19775962, '0.1'),
(19775971, 18322950, './widgets/category/skins/default_new', 'N', '20160711110427', 19775972, '0.1'),
(19775942, 18322950, './widgets/category/skins/Designspiration', 'N', '20160714205740', 19775943, '0.1'),
(22594576, 18322927, './widgets/category_menu', 'N', '20160817113619', 22596721, '1.2'),
(18577507, 18322927, './widgets/chat25', 'N', '20160725035306', 18587408, '0.0.1'),
(19208301, 18322927, './widgets/coinslider', 'N', '20160817140400', 20182294, '1.5'),
(22753768, 18322927, './widgets/contactfree', 'N', '20160817131529', 22755456, '1.0'),
(19530900, 18322950, './widgets/content/skins/church_skin', 'N', '20160701020057', 19532808, '0.2'),
(18802611, 18322950, './widgets/content/skins/daerew_webzine_notice', 'N', '20160816155034', 18810316, '1.0'),
(19775816, 18322950, './widgets/content/skins/default2', 'N', '20160813193135', 19775820, '0.1'),
(19775788, 18322950, './widgets/content/skins/default_new', 'N', '20160811134223', 19775789, '0.1'),
(22753317, 18322950, './widgets/content/skins/doorweb', 'N', '20160817135838', 22754080, '1.7'),
(22440981, 18322950, './widgets/content/skins/eond_ygh', 'N', '20160816183506', 22440999, '0.3'),
(21643081, 18322950, './widgets/content/skins/mynote', 'N', '20160816213700', 21643082, '0.1'),
(18335369, 18322950, './widgets/content/skins/naradesign', 'N', '20160817101732', 18335372, '0.3'),
(22753645, 18322950, './widgets/content/skins/notice_slider', 'N', '20160817121756', 22754937, '1.1'),
(18631776, 18322950, './widgets/content/skins/official_board_style', 'N', '20160816154749', 18638860, '1.2'),
(22583905, 18322950, './widgets/content/skins/phiz_rwd_images', 'N', '20160817142144', 22583963, '1.0'),
(19775760, 18322950, './widgets/content/skins/Photographer', 'N', '20160816160259', 19775761, '0.1'),
(22563110, 18322950, './widgets/content/skins/s4utabview', 'N', '20160816183448', 22563143, '1.0'),
(22282486, 18322950, './widgets/content/skins/simplestrap_sb', 'N', '20160817151846', 22755643, '1.0.2'),
(21038825, 18322950, './widgets/content/skins/sketchbook5_style', 'N', '20160817151920', 22755640, '1.1'),
(20792413, 18322950, './widgets/content/skins/sticky_note', 'N', '20160817140138', 20792414, '1.0.3.0'),
(21648251, 18322950, './widgets/content/skins/tb_cw', 'N', '20160817122024', 21978061, '2.2'),
(21396254, 18322950, './widgets/content/skins/tb_sb', 'N', '20160817111433', 21396255, '1.0'),
(20493834, 18322950, './widgets/content/skins/updatenews', 'N', '20160817013822', 21134264, '1.8'),
(20557173, 18322950, './widgets/content/skins/xe2011_contributor_present', 'N', '20160817140243', 20557174, '0.1'),
(19705472, 18322927, './widgets/content/skins/XEgrid_content', 'N', '20160812190744', 19705666, '1.1'),
(18324391, 18322950, './widgets/content/skins/xeHome', 'N', '20160806131319', 18324681, '0.1'),
(21127741, 18322927, './widgets/contentextended', 'N', '20160817145037', 21189359, '2.45'),
(19260194, 18322927, './widgets/contentslider', 'N', '20160817123701', 20199435, '2.1.1'),
(20350195, 18322927, './widgets/contentslist', 'N', '20160817070905', 20350196, '0.5'),
(20612563, 18322927, './widgets/contentsmedia', 'N', '20160817095419', 20696865, '0.7'),
(19109313, 18322927, './widgets/content_specificdoc', 'N', '20160815094351', 19109314, '0.2'),
(18328243, 18322927, './widgets/CoolirisPlayer', 'N', '20160715112336', 18332482, '2.0'),
(18324327, 18322927, './widgets/counter_status', 'N', '20160812195959', 18325071, '0.1'),
(18802619, 18322950, './widgets/counter_status/skins/daerew_counter', 'N', '20160816155800', 19433478, '1.1'),
(19775924, 18322950, './widgets/counter_status/skins/default2', 'N', '20160809151732', 19775928, '0.1'),
(19775908, 18322950, './widgets/counter_status/skins/default_new', 'N', '20160809151658', 19775909, '0.1'),
(19775899, 18322950, './widgets/counter_status/skins/Designspiration', 'N', '20160809151707', 19775901, '0.1'),
(20079764, 18322950, './widgets/counter_status/skins/flash', 'N', '20160817140418', 20079797, '0.1'),
(18327995, 18322950, './widgets/counter_status/skins/miznkiz_simple_counter', 'N', '20160806225422', 18339071, '0.1'),
(19235579, 18322950, './widgets/counter_status/skins/mynote', 'N', '20160816213700', 19252856, '0.1'),
(21352246, 18322950, './widgets/counter_status/skins/qookrabbit_status', 'N', '20160815094149', 21352247, '0.1'),
(18555205, 18322950, './widgets/counter_status/skins/sworld_counter', 'N', '20160815225022', 18591528, '0.1'),
(18618046, 18322950, './widgets/counter_status/skins/tingenara', 'N', '20160817033525', 18620661, '1'),
(18957505, 18322927, './widgets/cu3er', 'N', '20160815235151', 18983161, '0.2'),
(22539420, 18322927, './widgets/cute_clock', 'N', '20160817135322', 22539425, '1.0'),
(22753721, 18322927, './widgets/daum_postcode', 'N', '20160813151441', 22755318, '0.1.1'),
(22753629, 18322927, './widgets/Ding_Button_Collection', 'N', '20160817095550', 22754874, '1.1'),
(22753582, 18322927, './widgets/ding_loginWidget', 'N', '20160817071544', 22755210, '0.6'),
(22753600, 18322927, './widgets/ding_member_ranking', 'N', '20160814203853', 22754905, '1.5'),
(18335021, 18322927, './widgets/division', 'N', '20160808170512', 20582119, '1.1'),
(22753535, 18322927, './widgets/doorweb_content', 'N', '20160817135922', 22754622, '1.7.2'),
(18324328, 18322927, './widgets/DroArc_clock', 'N', '20160812113234', 18325065, '0.1'),
(20908354, 18322950, './widgets/dswidget', 'N', '20160811203138', 20950044, '0.1.1'),
(22263678, 18322927, './widgets/eh_whcarousel', 'N', '20160810144018', 22754205, '0.4'),
(22753741, 18322927, './widgets/eond_fileboxBanner', 'N', '20160817070642', 22755364, '0.1'),
(19723352, 18322927, './widgets/facebook', 'N', '20160816212245', 19723353, '0.1'),
(22753620, 18322927, './widgets/fixedNotice', 'N', '20160817095351', 22754854, '0.3'),
(18360610, 18322927, './widgets/flowing_pictures', 'N', '20160815120128', 18648791, '1.1.7'),
(21838367, 18322927, './widgets/foodin', 'N', '20160815145210', 21845017, '0.0.3'),
(21838368, 18322950, './widgets/foodin/skin/simple', 'N', '20160815145210', 21845033, '0.0.1'),
(18324330, 18322927, './widgets/forum', 'N', '20160722195915', 18325054, '0.1'),
(22594571, 18322927, './widgets/frontdisplay', 'N', '20160817144837', 22596682, '1.0'),
(18327462, 18322927, './widgets/gagachat', 'N', '20160817135133', 22555267, '3.7'),
(18607444, 18322927, './widgets/gallery_frame', 'N', '20160817141045', 18619741, '0.0.2'),
(19527550, 18322927, './widgets/gallery_layout_widget', 'N', '20160816160010', 19532746, '1.0.0'),
(22753306, 18322927, './widgets/ggboardmailing_widget', 'N', '20160816214652', 22755528, '0.3'),
(22753799, 18322927, './widgets/ggnewsletter', 'N', '20160810203931', 22755533, '0.2'),
(22753798, 18322927, './widgets/ggward', 'N', '20160814155612', 22755532, '0.2'),
(22753478, 18322927, './widgets/ggwmmemberexcel_widget', 'N', '20160816144101', 22754450, '0.1'),
(19346257, 18322927, './widgets/googlesearch', 'N', '20160816155723', 19349099, '1.0.1'),
(19355038, 18322950, './widgets/googlesearch/skin/multi_box', 'N', '20160816155722', 19355039, '1.0'),
(19355521, 18322950, './widgets/googlesearch/skin/translate', 'N', '20160815160022', 19355602, '1.0'),
(19759864, 18322927, './widgets/google_map', 'N', '20160817143252', 19759892, '0.2'),
(22658524, 18322927, './widgets/hb_bank', 'N', '20160816140309', 22658668, '0.1'),
(22572346, 18322927, './widgets/hindole', 'N', '20160817124100', 22572496, '1.0'),
(18324331, 18322927, './widgets/ideationBanner', 'N', '20160816130331', 18325042, '0.1'),
(18324332, 18322927, './widgets/ideationPopular', 'N', '20160817144623', 18325026, '0.1'),
(18324335, 18322927, './widgets/image_counter', 'N', '20160817142356', 19099243, '0.2'),
(22753666, 18322927, './widgets/jwplayer', 'N', '20160816020315', 22755048, '2.0.0'),
(18712640, 18322927, './widgets/JW_player', 'N', '20160816200710', 18712773, '1.0'),
(22753733, 18322927, './widgets/kimtajo_subpage_widget', 'N', '20160817095101', 22755346, '1.0'),
(20168297, 18322950, './widgets/language_select/skins/cafe_site', 'N', '20160817145350', 21802140, '1.7.0'),
(19702419, 18322950, './widgets/language_select/skins/monochrome', 'N', '20160816122738', 19702444, '0.1'),
(20075809, 18322950, './widgets/language_select/skins/tskorea', 'N', '20160816122632', 20092424, '0.1'),
(20276676, 18322950, './widgets/language_select/skins/xe_cafe_language', 'N', '20160817145351', 20276677, '0.1'),
(20075810, 18322927, './widgets/layout_info', 'N', '20160627163809', 20092486, '0.1'),
(18435775, 18322927, './widgets/level_point', 'N', '20160815005612', 22595479, '1.0'),
(18634632, 18322927, './widgets/lnb_menu', 'N', '20160817012807', 20558937, '0.2.0'),
(20558958, 18322950, './widgets/lnb_menu/skins', 'N', '20160807003604', 20558964, '0.1.0'),
(18324336, 18322927, './widgets/logged_members', 'N', '20160817145349', 18325004, '0.1'),
(22245450, 18322943, './widgets/logged_members/skins/w_redtokbox', 'N', '20160730220049', 22277385, '1.2'),
(18649610, 18322950, './widgets/login_info/skins/2010_jowrney_release', 'N', '20160814142544', 18654744, '0.1.0'),
(20276661, 18322950, './widgets/login_info/skins/cafe_official', 'N', '20160817145350', 21801927, '1.7.0'),
(20168286, 18322950, './widgets/login_info/skins/cafe_site', 'N', '20160817145350', 21802090, '1.7.0'),
(19530901, 18322950, './widgets/login_info/skins/church_layout_login', 'N', '20160701020102', 19530913, '0.1'),
(19964934, 18322950, './widgets/login_info/skins/cronos_free', 'N', '20160812102957', 20187569, '1.1'),
(18750254, 18322950, './widgets/login_info/skins/daerew_v4_login', 'N', '20160817101817', 18751630, '1.0'),
(18378362, 18322950, './widgets/login_info/skins/default', 'N', '20160714194700', 20168245, '0.2'),
(19684961, 18322950, './widgets/login_info/skins/eond_gateway', 'N', '20160809191118', 19684962, '0.5'),
(19235552, 18322950, './widgets/login_info/skins/eond_mynote', 'N', '20160816213700', 21651021, '0.8'),
(22753498, 18322950, './widgets/login_info/skins/eond_ppomppu', 'N', '20160817143002', 22754494, '1.0'),
(22651552, 18322950, './widgets/login_info/skins/flat_series', 'N', '20160817110013', 22744104, '1.0.1'),
(19524346, 18322950, './widgets/login_info/skins/gallery_layout_login', 'N', '20160728111637', 19527566, '0.2'),
(18827207, 18322950, './widgets/login_info/skins/git_login_simple', 'N', '20160816155311', 18993961, '2.0'),
(19623082, 18322950, './widgets/login_info/skins/graystyle', 'N', '20160816122806', 20702518, '0.21'),
(18409634, 18322950, './widgets/login_info/skins/hk', 'N', '20160814204252', 18547214, '0.4'),
(18939397, 18322950, './widgets/login_info/skins/kan_login', 'N', '20160725194020', 18948357, '0.1'),
(18999302, 18322950, './widgets/login_info/skins/kan_login_v2', 'N', '20160816155342', 19002080, '0.1'),
(19702417, 18322950, './widgets/login_info/skins/monochrome', 'N', '20160816122736', 20803243, '0.2'),
(19623053, 18322950, './widgets/login_info/skins/neutral', 'N', '20160816122610', 20803425, '0.2'),
(20927819, 18322950, './widgets/login_info/skins/photo15', 'N', '20160817034436', 22253694, '1.1'),
(19624853, 18322950, './widgets/login_info/skins/Quad', 'N', '20160803102336', 19624859, '1.0.0'),
(18335028, 18322950, './widgets/login_info/skins/rnq_login', 'N', '20160813180944', 18337247, 'v0.2'),
(22753567, 18322950, './widgets/login_info/skins/simplicity_login', 'N', '20160815052729', 22754649, '1.7'),
(18330288, 18322950, './widgets/login_info/skins/sleepless_simple', 'N', '20160705173728', 18332123, '1.0.0'),
(18846109, 18322950, './widgets/login_info/skins/SORRENT_LOGIN', 'N', '20160730075831', 18851330, '1.0'),
(19044001, 18322950, './widgets/login_info/skins/tingenara', 'N', '20160814014044', 19050124, '1.0'),
(18579525, 18322950, './widgets/login_info/skins/tingenaralogin', 'N', '20160813092604', 18587232, '1'),
(19618480, 18322950, './widgets/login_info/skins/Tony', 'N', '20160809175726', 19618481, '0.1.0'),
(18328730, 18322950, './widgets/login_info/skins/treasurej_simple150px', 'N', '20160817140806', 18953730, '1.5.3'),
(19807569, 18322950, './widgets/login_info/skins/webengine_black', 'N', '20160816160414', 19827659, '1.2'),
(18335382, 18322950, './widgets/login_info/skins/webmini', 'N', '20160811224421', 18336191, '3.1'),
(18572883, 18322950, './widgets/login_info/skins/xdom_login_v2', 'N', '20160812191719', 19051343, '2.3.1'),
(18635216, 18322950, './widgets/login_info/skins/xgenesis_login', 'N', '20160817012807', 18638870, '0.1.0'),
(19462008, 18322927, './widgets/login_sunoo', 'N', '20160817130949', 19462009, '1.0'),
(22753512, 18322927, './widgets/magiccontentWidget', 'N', '20160816215110', 22754746, '1.1'),
(22753460, 18322927, './widgets/maps_widget', 'N', '20160817103246', 22755384, '1.1.5'),
(22634955, 18322950, './widgets/mcontent/skins/m_cronos_w', 'N', '20160814225031', 22647135, '1.1'),
(22753543, 18322950, './widgets/mcontent/skins/sweetMobileContent', 'N', '20160817122046', 22754588, '1.0'),
(18324337, 18322927, './widgets/member_group', 'N', '20160817145349', 18324998, '0.1'),
(19515289, 18322927, './widgets/minion4', 'N', '20160810153041', 19635737, '2.0.1'),
(18636930, 18322927, './widgets/MinionInXE', 'N', '20160817140953', 18835506, '1.4'),
(22556480, 18322927, './widgets/moonchat', 'N', '20160815185630', 22755337, '2.0.2'),
(19692489, 18322927, './widgets/music24_kr_clock', 'N', '20160817140620', 19692490, '1.0.0'),
(19708869, 18322927, './widgets/navigation', 'N', '20160815181645', 19712189, '0.4'),
(18324338, 18322927, './widgets/navigator', 'N', '20160817145349', 21801528, '1.7.0'),
(18324343, 18322927, './widgets/newest_comment', 'N', '20160815144748', 18324984, '0.1'),
(18411910, 18322950, './widgets/newest_comment/skins', 'N', '20160809153348', 18413214, '1.0'),
(19816486, 18322950, './widgets/newest_comment/skins/CN_No5', 'N', '20160816160331', 19816487, '1.0'),
(19136412, 18322950, './widgets/newest_comment/skins/factory_basic_2', 'N', '20160617104510', 19136413, '2.0'),
(22572358, 18322950, './widgets/newest_comment/skins/hindole_v1_com', 'N', '20160815144747', 22572455, '1.0'),
(22505945, 18322950, './widgets/newest_comment/skins/luke_doc', 'N', '20160815144824', 22505955, 'v1.0'),
(21364832, 18322950, './widgets/newest_comment/skins/mynote', 'N', '20160725194137', 21364833, '0.1'),
(21369690, 18322950, './widgets/newest_comment/skins/xenon_m_com', 'N', '20160801120118', 21370425, '1.1'),
(18324344, 18322927, './widgets/newest_document', 'N', '20160817140110', 20893807, '1.0'),
(19816467, 18322950, './widgets/newest_document/skins/CN_No5', 'N', '20160816202543', 19816468, '1.0'),
(19707673, 18322950, './widgets/newest_document/skins/CN_No_series', 'N', '20160816160228', 19707678, '1.1'),
(19135768, 18322950, './widgets/newest_document/skins/factory_basic_2', 'N', '20160816142117', 19135769, '2.0'),
(22572375, 18322950, './widgets/newest_document/skins/hindole_v1_doc', 'N', '20160817122031', 22572430, '1.0'),
(19081557, 18322950, './widgets/newest_document/skins/layoutskin_webzine_v2', 'N', '20160817113110', 21596748, '1.2'),
(22501400, 18322950, './widgets/newest_document/skins/luke_doc', 'N', '20160816220409', 22502529, 'v1.0'),
(21369691, 18322950, './widgets/newest_document/skins/xenon_m_doc', 'N', '20160815190525', 21369734, '1.0'),
(21369692, 18322950, './widgets/newest_document/skins/xenon_m_gel', 'N', '20160816001751', 21369738, '1.0'),
(19133209, 18322927, './widgets/newest_document_category', 'N', '20160816155455', 19134377, '0.1'),
(19548524, 18322927, './widgets/newest_document_tab', 'N', '20160817140049', 19548663, '0.2'),
(18328356, 18322927, './widgets/newest_medias', 'N', '20160816154529', 18330464, 'v0.1');
INSERT INTO `xe_autoinstall_packages` (`package_srl`, `category_srl`, `path`, `have_instance`, `updatedate`, `latest_item_srl`, `version`) VALUES
(18324345, 18322927, './widgets/newest_trackback', 'N', '20160703230920', 18324957, '0.1'),
(22753615, 18322927, './widgets/nkoclock', 'N', '20160814002023', 22754823, '0.1'),
(18335048, 18322927, './widgets/nms_info', 'N', '20160705195941', 18349106, '0.1.3'),
(20796792, 18322927, './widgets/notice', 'N', '20160817103311', 22755365, '1.0.6'),
(22753822, 18322927, './widgets/onepage_about', 'N', '20160817142544', 22755603, '1.00'),
(22753823, 18322927, './widgets/onepage_features', 'N', '20160817084713', 22755604, '1.00'),
(22753824, 18322927, './widgets/onepage_pricing', 'N', '20160816202255', 22755605, '1.00'),
(22753825, 18322927, './widgets/onepage_service', 'N', '20160816202241', 22755606, '1.00'),
(22753826, 18322927, './widgets/onepage_team', 'N', '20160816202249', 22755607, '1.00'),
(22753827, 18322927, './widgets/onepage_testimonial', 'N', '20160816202235', 22755608, '1.00'),
(22753828, 18322927, './widgets/onepage_work', 'N', '20160817142602', 22755609, '1.00'),
(22753403, 18322927, './widgets/opageWidget', 'N', '20160816153940', 22754271, '1.0'),
(22753605, 18322927, './widgets/padoLittleBanner', 'N', '20160817104526', 22754817, '0.4'),
(22753556, 18322927, './widgets/pado_ajax_newsWidget', 'N', '20160816153707', 22754726, '1.9'),
(22753560, 18322927, './widgets/pado_board_rankingWidget', 'N', '20160816170940', 22755211, '1.2'),
(22753725, 18322927, './widgets/pado_comment_rankingWidget', 'N', '20160816010739', 22755325, '1.0'),
(22753614, 18322927, './widgets/pado_image_news', 'N', '20160817142115', 22755163, '0.3'),
(22641961, 18322927, './widgets/photoslider', 'N', '20160817142315', 22641966, '1.0'),
(22753358, 18322927, './widgets/picasa_recent_images', 'N', '20160816162040', 22754183, '0.1'),
(18324346, 18322927, './widgets/planet_document', 'N', '20160816154444', 18327255, '0.2'),
(19231437, 18322950, './widgets/planet_document/skins/eond', 'N', '20160717005242', 19283934, '1.0'),
(22753699, 18322950, './widgets/planet_document/skins/eond_on', 'N', '20160815233119', 22755212, '0.3'),
(22466916, 18322927, './widgets/plusadWidget', 'N', '20160815042753', 22530804, '0.6'),
(21038796, 18322950, './widgets/point_status/skins/bootstrap', 'N', '20160816083838', 21146775, '1.2'),
(19071245, 18322950, './widgets/point_status/skins/cloverworld_skin', 'N', '20160816085111', 19071386, '1.0.0.0'),
(19271512, 18322950, './widgets/point_status/skins/eond_official_login', 'N', '20160815053247', 19271513, '0.1'),
(18325755, 18322927, './widgets/popular_planet_document', 'N', '20160815174349', 18325772, '0.1'),
(19854096, 18322927, './widgets/qrcode_creator', 'N', '20160812125911', 19854097, '0.1'),
(18634568, 18322927, './widgets/quick_menu', 'N', '20160807002334', 18638902, '0.1.0'),
(18346921, 18322927, './widgets/randomchat', 'N', '20160802153121', 18517236, '1.2'),
(18324348, 18322927, './widgets/rank_count', 'N', '20160816164507', 18324851, '1.5'),
(18324352, 18322927, './widgets/rank_point', 'N', '20160815020336', 18324818, '1.0'),
(19080637, 18322950, './widgets/rank_point/skins/elkha', 'N', '20160813184859', 19080640, '0.1'),
(18335009, 18322927, './widgets/rnq_newest_document', 'N', '20160817090101', 18336745, '1.1.5'),
(18335040, 18322950, './widgets/rnq_newest_document/skins/rnq_newest_default', 'N', '20160809034732', 18798214, '0.3'),
(18335034, 18322950, './widgets/rnq_newest_document/skins/rnq_newest_integrate', 'N', '20160809034727', 18798607, '0.3.1'),
(18337279, 18322950, './widgets/rnq_newest_document/skins/rnq_newest_notice', 'N', '20160817003119', 18798196, '0.3'),
(18324353, 18322927, './widgets/rss_reader', 'N', '20160817142307', 18324791, '#7'),
(19076083, 18322927, './widgets/sayradio', 'N', '20160807190650', 19077336, '1.0.1'),
(19534671, 18322927, './widgets/sejin7940_calendar', 'N', '20160816155957', 19534672, '1.0'),
(22753428, 18322927, './widgets/sejin7940_navermap', 'N', '20160817082723', 22754347, '0.2.1'),
(21855754, 18322927, './widgets/server_status', 'N', '20160815141417', 21885905, '0.2'),
(20091784, 18322927, './widgets/shopxeslider', 'N', '20160816160518', 20123108, 'V1.1'),
(22529686, 18322927, './widgets/simple_calendar', 'N', '20160817142258', 22579892, '1.3'),
(22526030, 18322927, './widgets/simple_clock', 'N', '20160817135327', 22537348, '1.1'),
(19527787, 18322927, './widgets/sitemap', 'N', '20160817142900', 19527788, '0.1.0'),
(22753698, 18322950, './widgets/sitemap/skins/eond_hmap', 'N', '20160809133740', 22755200, '0.1'),
(22562932, 18322950, './widgets/sitemap/skins/select', 'N', '20160816141936', 22585636, '0.3.3'),
(22753413, 18322927, './widgets/sitemap_selectbox', 'N', '20160816162138', 22754293, '0.1.0'),
(18324355, 18322927, './widgets/site_info', 'N', '20160817145350', 21801496, '1.7.0'),
(22753342, 18322927, './widgets/slideimg', 'N', '20160817143406', 22754339, '1.1.2'),
(18325952, 18322927, './widgets/sms', 'N', '20160701201636', 18326180, '1.1'),
(18561895, 18322927, './widgets/sms_textyle', 'N', '20160715193335', 18569743, '1.0.1'),
(19518201, 18322927, './widgets/socialxe_comment', 'N', '20160817135344', 20361452, '1.0.8'),
(19555927, 18322950, './widgets/socialxe_comment/skins/sketchbook5', 'N', '20160817135344', 22509535, '1.7.0'),
(19518204, 18322927, './widgets/socialxe_info', 'N', '20160815001428', 19679127, '1.0.6'),
(19213125, 18322927, './widgets/solarlunar', 'N', '20160817140836', 19213126, '0.1'),
(22753634, 18322927, './widgets/soo_kma_rss', 'N', '20160817134513', 22755438, '0.3.1'),
(18835470, 18322927, './widgets/splanner', 'N', '20160817140126', 18878338, '0.3.0'),
(19219428, 18322927, './widgets/srchat', 'N', '20160815171726', 22754692, '219.48'),
(22692901, 18322927, './widgets/srchat_count', 'N', '20160809112844', 22692906, '1.0'),
(19476930, 18322927, './widgets/stopsmoking_status', 'N', '20160623223435', 19476931, '0.1.0'),
(20999893, 18322927, './widgets/sys_status', 'N', '20160810153258', 21005314, '3.1.1'),
(21004386, 18322950, './widgets/sys_status/skin/simple', 'N', '20160720104036', 21004387, '0.1'),
(21146815, 18322950, './widgets/sys_status/skins/tb', 'N', '20160808142011', 21146816, '1.0'),
(18324359, 18322927, './widgets/tab_newest_document', 'N', '20160816140600', 18324658, '0.1'),
(19330741, 18322950, './widgets/tab_newest_document/skins/colorful', 'N', '20160815152834', 19330742, '1.0'),
(18324395, 18322950, './widgets/tab_newest_document/skins/ideationTab', 'N', '20160815130710', 18324647, '0.1'),
(19353209, 18322950, './widgets/tab_newest_document/skins/tab_flash', 'N', '20160727190743', 19353210, '1.0'),
(19030767, 18322950, './widgets/tab_newest_document/skins/tab_sky', 'N', '20160812142554', 19039476, '0.2'),
(19519171, 18322950, './widgets/tab_newest_document/skins/xe_official', 'N', '20160815143447', 19519369, 'xe_official'),
(18324360, 18322927, './widgets/tag_list', 'N', '20160817152138', 18324768, '0.1'),
(19775829, 18322950, './widgets/tag_list/skins/default1', 'N', '20160816160259', 19775830, '0.1'),
(19775849, 18322950, './widgets/tag_list/skins/default2', 'N', '20160803234427', 19775850, '0.1'),
(19775878, 18322950, './widgets/tag_list/skins/default3', 'N', '20160803234328', 19775879, '0.1'),
(18327287, 18322950, './widgets/tag_list/skins/tagcloud', 'N', '20160817020234', 18328078, '1.0'),
(18330513, 18322950, './widgets/tag_list/skins/treasurej_tagcloud', 'N', '20160817140806', 18778301, '1.2'),
(22288778, 18322927, './widgets/talkbox', 'N', '20160816165245', 22460980, '1.1'),
(22753439, 18322927, './widgets/tocplus', 'N', '20160817095357', 22754373, '0.3'),
(22581369, 18322927, './widgets/towc_new_docu', 'N', '20160817150846', 22638452, '1.9'),
(22069845, 18322927, './widgets/traffic_status', 'N', '20160814164836', 22069874, '1.0'),
(20120961, 18322927, './widgets/treasurej_popular', 'N', '20160817140006', 22550390, '1.0.5'),
(22531811, 18322950, './widgets/treasurej_popular/skins/neat_popular_tabs', 'N', '20160817102244', 22754295, '1.1'),
(22753422, 18322950, './widgets/treasurej_popular/skins/smart_popular_tabs', 'N', '20160817102046', 22754327, '1.1'),
(20122381, 18322950, './widgets/treasurej_popular/skins/treasurej_popular_tabr', 'N', '20160817102335', 21972737, '1.1'),
(20186750, 18322950, './widgets/treasurej_popular/skins/treasurej_popular_tabs', 'N', '20160817140006', 21972593, '1.1'),
(19674471, 18322927, './widgets/twitter', 'N', '20160816160152', 19676523, '0.2'),
(19077792, 18322927, './widgets/twitter_follow', 'N', '20160809020300', 19077793, '1.0'),
(21393465, 18322927, './widgets/uchat', 'N', '20160816212325', 22755319, '1.1.8'),
(22753616, 18322927, './widgets/uhachat', 'N', '20160817120523', 22755376, '0.3'),
(22753802, 18322950, './widgets/uhachat/skins/pinklet', 'N', '20160817120529', 22755553, '0.1'),
(20832909, 18322927, './widgets/user_finder', 'N', '20160810222824', 20836373, '0.1'),
(20464644, 18322927, './widgets/vanner', 'N', '20160816231601', 20464663, '0.2'),
(22699529, 18322927, './widgets/webcon_carousel', 'N', '20160817142709', 22699542, '1.0'),
(22718180, 18322927, './widgets/webcon_effectSlider', 'N', '20160817000248', 22718196, '1.0'),
(22735793, 18322927, './widgets/webcon_mosaicContents', 'N', '20160817142218', 22735808, '1.0'),
(22692696, 18322927, './widgets/webcon_mosaicGallery', 'N', '20160817142247', 22692724, '1.0'),
(22668729, 18322927, './widgets/webcon_newswidget', 'N', '20160816201510', 22700746, '1.0.1'),
(22703498, 18322927, './widgets/webcon_N_newsSearch', 'N', '20160817113447', 22703507, '1.0'),
(22678118, 18322927, './widgets/webcon_smartTab', 'N', '20160817111627', 22680181, '1.0'),
(22703903, 18322927, './widgets/webcon_verticalTab', 'N', '20160816183840', 22708158, '1.0.1'),
(18324361, 18322927, './widgets/webzine', 'N', '20160817143824', 18324711, '0.1'),
(19141813, 18322950, './widgets/webzine/skins', 'N', '20160816142202', 19141814, '1.0'),
(18330488, 18322927, './widgets/webzine/skins/LILY_GoodStyle', 'N', '20160817090053', 18333192, '1.0'),
(19122280, 18322952, './widgets/widgetstyles', 'N', '20160817093640', 19122812, '1.0.0'),
(20070033, 18322927, './widgets/widget_kgcalendar', 'N', '20160817131113', 20117642, '1.1'),
(20070206, 18322927, './widgets/widget_kgcontent', 'N', '20160817150551', 20315271, '1.2'),
(20605745, 18322927, './widgets/widget_kgmedia', 'N', '20160817093718', 20695833, '1.1'),
(22753603, 18322927, './widgets/widget_marketplace', 'N', '20160816215438', 22754783, '0.1.1'),
(19310933, 18322927, './widgets/xclient', 'N', '20160817140606', 19660872, '1.2.0'),
(18324362, 18322927, './widgets/xeBanner', 'N', '20160817144301', 18324697, '0.1'),
(20533710, 18322950, './widgets/xeBanner/skins', 'N', '20160816225041', 20533711, '1.0.0'),
(21413017, 18322927, './widgets/xegallery', 'N', '20160817135652', 21433519, '0.3'),
(21807603, 18322927, './widgets/xehoverdir', 'N', '20160817100117', 21807604, '0.1'),
(22753374, 18322927, './widgets/xelayout_weather', 'N', '20160812213953', 22754198, '0.2'),
(21003996, 18322927, './widgets/xestream', 'N', '20160816080552', 21014531, '0.2'),
(19514688, 18322927, './widgets/xgenesis_login', 'N', '20160817012807', 19539957, '0.1.1'),
(22753678, 18322927, './widgets/youtube', 'N', '20160816205429', 22755381, '1.3.0.'),
(18852198, 18322952, './widgetstyle', 'N', '20160817042406', 18853308, '1.0.0'),
(20427455, 18322952, './widgetstyles/admin_ws', 'N', '20160817093602', 20454155, '0.2'),
(22753845, 18322952, './widgetstyles/clearstrap_ws', 'N', '20160817093552', 22755645, '1.0'),
(19707730, 18322952, './widgetstyles/CN_No_series', 'N', '20160817093607', 19707731, '1.1'),
(18324396, 18322952, './widgetstyles/colorbox', 'N', '20160816154342', 18324641, '0.1'),
(19231756, 18322952, './widgetstyles/eond_doubleline', 'N', '20160816155602', 19231762, '0.1'),
(19231709, 18322952, './widgetstyles/eond_webzine', 'N', '20160817093635', 19231710, '0.2'),
(18642836, 18322952, './widgetstyles/gray_style', 'N', '20160817093625', 18826509, '1.2.1'),
(22572365, 18322952, './widgetstyles/hindole_box', 'N', '20160817105920', 22600170, '1.1'),
(19639463, 18322952, './widgetstyles/lineBox', 'N', '20160817080026', 19639464, '0.1'),
(18324398, 18322952, './widgetstyles/memo', 'N', '20160817141149', 18324622, '0.1'),
(18647145, 18322952, './widgetstyles/mo_colorline', 'N', '20160817093646', 18654291, '0.3'),
(22634927, 18322952, './widgetstyles/m_cronos_ws', 'N', '20160815160954', 22647143, '1.1'),
(21305288, 18322952, './widgetstyles/nico', 'N', '20160816183810', 21532773, '2.0'),
(18324401, 18322952, './widgetstyles/postitWire', 'N', '20160816171623', 18324610, '0.1'),
(18324402, 18322952, './widgetstyles/roundFace', 'N', '20160809150641', 18324603, '0.1'),
(18324403, 18322952, './widgetstyles/roundWire', 'N', '20160816171632', 18324590, '0.1'),
(19833041, 18322952, './widgetstyles/sctb', 'N', '20160816142318', 20213631, '6.0'),
(22572369, 18322952, './widgetstyles/simple-style', 'N', '20160817144012', 22572466, '1.0'),
(18324404, 18322952, './widgetstyles/simpleRound', 'N', '20160817093700', 18324575, '0.1'),
(18324405, 18322952, './widgetstyles/simpleSquare', 'N', '20160816113018', 18324565, '0.1'),
(18324406, 18322952, './widgetstyles/simpleTitle', 'N', '20160817145806', 18324546, '0.1'),
(20520233, 18322952, './widgetstyles/sketchbook5_wincomi', 'N', '20160817140124', 20798858, '3.0'),
(18995899, 18322952, './widgetstyles/sorrent_simplebox', 'N', '20160817093621', 18998803, '0.1'),
(19849619, 18322952, './widgetstyles/SteelblueRound', 'N', '20160817093611', 19849620, '0.1'),
(22753562, 18322952, './widgetstyles/sweetMobileWidgetStyle', 'N', '20160817103250', 22754626, '1.7'),
(18354173, 18322952, './widgetstyles/sz_gradient', 'N', '20160809181855', 18354312, '0.1.0'),
(18555654, 18322952, './widgetstyles/tingenara', 'N', '20160817093650', 18557124, '1'),
(18334573, 18322952, './widgetstyles/webslice', 'N', '20160817093654', 18338237, '0.0.1'),
(21410063, 18322952, './widgetstyles/xdt_windless', 'N', '20160816201545', 21410071, '1.0'),
(18536532, 18322952, './widgetstyles/xe_official', 'N', '20160817093548', 22755434, '1.1'),
(18655593, 18322954, './xe/layouts', 'N', '20160809184152', 18667484, '1.0'),
(20117694, 18322943, '.modules/board/skins', 'N', '20160816181132', 20117695, '1.0'),
(18354979, 18322977, '/ modules / point / icons', 'N', '20160816235327', 18355002, 'SuddenAttack + 확장'),
(18832352, 18322923, '/editer/skins', 'N', '20160811145858', 18838645, '1.0'),
(21367559, 18322954, '/layout', 'N', '20160815184026', 21389903, '0.0.2'),
(22337993, 18322954, '/layouts', 'N', '20160816153755', 22337998, '1.0.0'),
(22208650, 18322923, '/messageTalk', 'N', '20160817135434', 22208679, '1.1'),
(20707031, 18322943, '/modules/contact/skins', 'N', '20160817131948', 20707032, '1.0'),
(20242228, 18322943, '/modules/editor/skins', 'N', '20160808185051', 20624981, '0.1'),
(19456847, 18322977, 'modules/point/icons', 'N', '20160712134709', 19456896, '0.2'),
(20092690, 18322950, 'widgets/content/skins/elkha_nivo', 'N', '20160810131213', 20092697, '0.1'),
(18739967, 18322950, 'widgets/content/skins/YGH_line', 'N', '20160816215155', 18741565, '0.1'),
(22393789, 18322950, 'widgets/counter_status/skins/hestia_status', 'N', '20160817141339', 22393813, '1.0'),
(19834157, 18322954, 'xe/layouts', 'N', '20160708011003', 19834158, '0.2.1'),
(18775186, 18322950, 'xe/modules/member/skins/default', 'N', '20160815211245', 18784334, '0.2'),
(20003560, 18322977, '레이아웃에서 직접 업로드', 'N', '20160605094717', 20003621, '1.0'),
(19529917, 18322977, '해당사항없음', 'N', '20160803224943', 19533355, '0.1.0');

-- --------------------------------------------------------

--
-- 테이블 구조 `xe_comment_declared`
--

CREATE TABLE `xe_comment_declared` (
  `comment_srl` bigint(11) NOT NULL,
  `declared_count` bigint(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 테이블 구조 `xe_comment_declared_log`
--

CREATE TABLE `xe_comment_declared_log` (
  `comment_srl` bigint(11) NOT NULL,
  `member_srl` bigint(11) NOT NULL,
  `ipaddress` varchar(128) NOT NULL,
  `regdate` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 테이블 구조 `xe_comment_voted_log`
--

CREATE TABLE `xe_comment_voted_log` (
  `comment_srl` bigint(11) NOT NULL,
  `member_srl` bigint(11) NOT NULL,
  `ipaddress` varchar(128) NOT NULL,
  `regdate` varchar(14) DEFAULT NULL,
  `point` bigint(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 테이블 구조 `xe_comments`
--

CREATE TABLE `xe_comments` (
  `comment_srl` bigint(11) NOT NULL,
  `module_srl` bigint(11) NOT NULL DEFAULT '0',
  `document_srl` bigint(11) NOT NULL DEFAULT '0',
  `parent_srl` bigint(11) NOT NULL DEFAULT '0',
  `is_secret` char(1) NOT NULL DEFAULT 'N',
  `content` longtext NOT NULL,
  `voted_count` bigint(11) NOT NULL DEFAULT '0',
  `blamed_count` bigint(11) NOT NULL DEFAULT '0',
  `notify_message` char(1) NOT NULL DEFAULT 'N',
  `password` varchar(60) DEFAULT NULL,
  `user_id` varchar(80) DEFAULT NULL,
  `user_name` varchar(80) NOT NULL,
  `nick_name` varchar(80) NOT NULL,
  `member_srl` bigint(11) NOT NULL,
  `email_address` varchar(250) NOT NULL,
  `homepage` varchar(250) NOT NULL,
  `uploaded_count` bigint(11) NOT NULL DEFAULT '0',
  `regdate` varchar(14) DEFAULT NULL,
  `last_update` varchar(14) DEFAULT NULL,
  `ipaddress` varchar(128) NOT NULL,
  `list_order` bigint(11) NOT NULL,
  `status` bigint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 테이블 구조 `xe_comments_list`
--

CREATE TABLE `xe_comments_list` (
  `comment_srl` bigint(11) NOT NULL,
  `document_srl` bigint(11) NOT NULL DEFAULT '0',
  `head` bigint(11) NOT NULL DEFAULT '0',
  `arrange` bigint(11) NOT NULL DEFAULT '0',
  `module_srl` bigint(11) NOT NULL DEFAULT '0',
  `regdate` varchar(14) DEFAULT NULL,
  `depth` bigint(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 테이블 구조 `xe_counter_log`
--

CREATE TABLE `xe_counter_log` (
  `site_srl` bigint(11) NOT NULL DEFAULT '0',
  `ipaddress` varchar(250) NOT NULL,
  `regdate` varchar(14) DEFAULT NULL,
  `user_agent` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 테이블 구조 `xe_counter_site_status`
--

CREATE TABLE `xe_counter_site_status` (
  `site_srl` bigint(11) NOT NULL,
  `regdate` bigint(11) NOT NULL,
  `unique_visitor` bigint(11) DEFAULT '0',
  `pageview` bigint(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 테이블 구조 `xe_counter_status`
--

CREATE TABLE `xe_counter_status` (
  `regdate` bigint(11) NOT NULL,
  `unique_visitor` bigint(11) DEFAULT '0',
  `pageview` bigint(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 테이블 구조 `xe_document_aliases`
--

CREATE TABLE `xe_document_aliases` (
  `alias_srl` bigint(11) NOT NULL DEFAULT '0',
  `module_srl` bigint(11) NOT NULL DEFAULT '0',
  `document_srl` bigint(11) NOT NULL DEFAULT '0',
  `alias_title` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 테이블 구조 `xe_document_categories`
--

CREATE TABLE `xe_document_categories` (
  `category_srl` bigint(11) NOT NULL DEFAULT '0',
  `module_srl` bigint(11) NOT NULL DEFAULT '0',
  `parent_srl` bigint(12) NOT NULL DEFAULT '0',
  `title` varchar(250) DEFAULT NULL,
  `expand` char(1) DEFAULT 'N',
  `document_count` bigint(11) NOT NULL DEFAULT '0',
  `regdate` varchar(14) DEFAULT NULL,
  `last_update` varchar(14) DEFAULT NULL,
  `list_order` bigint(11) NOT NULL,
  `group_srls` text,
  `color` varchar(11) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 테이블 구조 `xe_document_declared`
--

CREATE TABLE `xe_document_declared` (
  `document_srl` bigint(11) NOT NULL,
  `declared_count` bigint(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 테이블 구조 `xe_document_declared_log`
--

CREATE TABLE `xe_document_declared_log` (
  `document_srl` bigint(11) NOT NULL,
  `member_srl` bigint(11) NOT NULL,
  `ipaddress` varchar(128) NOT NULL,
  `regdate` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 테이블 구조 `xe_document_extra_keys`
--

CREATE TABLE `xe_document_extra_keys` (
  `module_srl` bigint(11) NOT NULL,
  `var_idx` bigint(11) NOT NULL,
  `var_name` varchar(250) NOT NULL,
  `var_type` varchar(50) NOT NULL,
  `var_is_required` char(1) NOT NULL DEFAULT 'N',
  `var_search` char(1) NOT NULL DEFAULT 'N',
  `var_default` text,
  `var_desc` text,
  `eid` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 테이블 구조 `xe_document_extra_vars`
--

CREATE TABLE `xe_document_extra_vars` (
  `module_srl` bigint(11) NOT NULL,
  `document_srl` bigint(11) NOT NULL,
  `var_idx` bigint(11) NOT NULL,
  `lang_code` varchar(10) NOT NULL,
  `value` longtext,
  `eid` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 테이블 구조 `xe_document_histories`
--

CREATE TABLE `xe_document_histories` (
  `history_srl` bigint(11) NOT NULL DEFAULT '0',
  `module_srl` bigint(11) NOT NULL DEFAULT '0',
  `document_srl` bigint(11) NOT NULL DEFAULT '0',
  `content` longtext,
  `nick_name` varchar(80) NOT NULL,
  `member_srl` bigint(11) DEFAULT NULL,
  `regdate` varchar(14) DEFAULT NULL,
  `ipaddress` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 테이블 구조 `xe_document_readed_log`
--

CREATE TABLE `xe_document_readed_log` (
  `document_srl` bigint(11) NOT NULL,
  `member_srl` bigint(11) NOT NULL,
  `ipaddress` varchar(128) NOT NULL,
  `regdate` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 테이블 구조 `xe_document_trash`
--

CREATE TABLE `xe_document_trash` (
  `trash_srl` bigint(11) NOT NULL DEFAULT '0',
  `document_srl` bigint(11) NOT NULL DEFAULT '0',
  `module_srl` bigint(11) NOT NULL DEFAULT '0',
  `trash_date` varchar(14) DEFAULT NULL,
  `description` text,
  `ipaddress` varchar(128) NOT NULL,
  `user_id` varchar(80) DEFAULT NULL,
  `user_name` varchar(80) NOT NULL,
  `nick_name` varchar(80) NOT NULL,
  `member_srl` bigint(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 테이블 구조 `xe_document_voted_log`
--

CREATE TABLE `xe_document_voted_log` (
  `document_srl` bigint(11) NOT NULL,
  `member_srl` bigint(11) NOT NULL,
  `ipaddress` varchar(128) NOT NULL,
  `regdate` varchar(14) DEFAULT NULL,
  `point` bigint(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 테이블 구조 `xe_documents`
--

CREATE TABLE `xe_documents` (
  `document_srl` bigint(11) NOT NULL,
  `module_srl` bigint(11) NOT NULL DEFAULT '0',
  `category_srl` bigint(11) NOT NULL DEFAULT '0',
  `lang_code` varchar(10) NOT NULL DEFAULT '',
  `is_notice` char(1) NOT NULL DEFAULT 'N',
  `title` varchar(250) DEFAULT NULL,
  `title_bold` char(1) NOT NULL DEFAULT 'N',
  `title_color` varchar(7) DEFAULT NULL,
  `content` longtext NOT NULL,
  `readed_count` bigint(11) NOT NULL DEFAULT '0',
  `voted_count` bigint(11) NOT NULL DEFAULT '0',
  `blamed_count` bigint(11) NOT NULL DEFAULT '0',
  `comment_count` bigint(11) NOT NULL DEFAULT '0',
  `trackback_count` bigint(11) NOT NULL DEFAULT '0',
  `uploaded_count` bigint(11) NOT NULL DEFAULT '0',
  `password` varchar(60) DEFAULT NULL,
  `user_id` varchar(80) DEFAULT NULL,
  `user_name` varchar(80) NOT NULL,
  `nick_name` varchar(80) NOT NULL,
  `member_srl` bigint(11) NOT NULL,
  `email_address` varchar(250) NOT NULL,
  `homepage` varchar(250) NOT NULL,
  `tags` text,
  `extra_vars` text,
  `regdate` varchar(14) DEFAULT NULL,
  `last_update` varchar(14) DEFAULT NULL,
  `last_updater` varchar(80) DEFAULT NULL,
  `ipaddress` varchar(128) NOT NULL,
  `list_order` bigint(11) NOT NULL,
  `update_order` bigint(11) NOT NULL,
  `allow_trackback` char(1) NOT NULL DEFAULT 'Y',
  `notify_message` char(1) NOT NULL DEFAULT 'N',
  `status` varchar(20) DEFAULT 'PUBLIC',
  `comment_status` varchar(20) DEFAULT 'ALLOW'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 테이블의 덤프 데이터 `xe_documents`
--

INSERT INTO `xe_documents` (`document_srl`, `module_srl`, `category_srl`, `lang_code`, `is_notice`, `title`, `title_bold`, `title_color`, `content`, `readed_count`, `voted_count`, `blamed_count`, `comment_count`, `trackback_count`, `uploaded_count`, `password`, `user_id`, `user_name`, `nick_name`, `member_srl`, `email_address`, `homepage`, `tags`, `extra_vars`, `regdate`, `last_update`, `last_updater`, `ipaddress`, `list_order`, `update_order`, `allow_trackback`, `notify_message`, `status`, `comment_status`) VALUES
(91, 66, 0, 'ko', 'N', 'Welcome XE', 'N', 'N', '<link rel="stylesheet" href="./layouts/xedition/css/welcome.css" />\n<div class="welcomeXE">\n	<section class="intro">\n		<span class="noti">WELCOME TO</span>\n		<h1 class="tit">WELCOME TO XPRESSENGINE</h1>\n		<P class="cont">XpressEngine은 자유로운 웹 콘텐츠 발행을 돕는 CMS입니다.<br />간편한 설치와 다양한 추가 프로그램을 활용하여<br /> 자신만의 웹페이지를 쉽고 빠르게 만들 수 있습니다.</P>\n		<a href="/xe/index.php?module=admin" target="_blank" class="btn_start">XE 시작하기</a>\n	</section>\n</div>\n', 0, 0, 0, 0, 0, 0, NULL, 'josungdong', 'admin', 'admin', 4, 'josungdong@naver.com', '', NULL, 'N;', '20160816232832', '20160816232832', NULL, '127.0.0.1', -91, -91, 'N', 'N', 'PUBLIC', 'DENY'),
(92, 66, 0, 'ko', 'N', 'Welcome mobile XE', 'N', 'N', '<link rel="stylesheet" href="./layouts/xedition/css/welcome.css" />\n<div class="welcomeXE">\n	<section class="intro">\n		<span class="noti">WELCOME TO</span>\n		<h1 class="tit">WELCOME TO XPRESSENGINE</h1>\n		<P class="cont">XpressEngine은 자유로운 웹 콘텐츠 발행을 돕는 CMS입니다.<br />간편한 설치와 다양한 추가 프로그램을 활용하여<br /> 자신만의 웹페이지를 쉽고 빠르게 만들 수 있습니다.</P>\n		<a href="/xe/index.php?module=admin" target="_blank" class="btn_start">XE 시작하기</a>\n	</section>\n</div>\n', 0, 0, 0, 0, 0, 0, NULL, 'josungdong', 'admin', 'admin', 4, 'josungdong@naver.com', '', NULL, 'N;', '20160816232832', '20160816232832', NULL, '127.0.0.1', -92, -92, 'N', 'N', 'PUBLIC', 'DENY'),
(93, 66, 0, 'ko', 'N', 'XEIcon (1)', 'N', 'N', '<section class="main_title fixedwidth">\n	<h1>Beautiful iconic font &amp; CSS toolkit</h1>\n	<p>\n		XEIcon은 웹사이트 제작에 최적화된 백터 그래픽 아이콘 툴킷입니다.<br />\n		한국 웹서비스 문화에 적합한 디자인과 카테고리를 고려하여 제작되었습니다.<br />\n		XEIcon으로 아름답고 직관적인 웹페이지를 만들어보세요!<br />\n	</p>\n</section>\n', 0, 0, 0, 0, 0, 0, NULL, 'josungdong', 'admin', 'admin', 4, 'josungdong@naver.com', '', NULL, 'N;', '20160816232832', '20160816232832', NULL, '127.0.0.1', -93, -93, 'N', 'N', 'PUBLIC', 'DENY'),
(94, 66, 0, 'ko', 'N', 'XEIcon (2)', 'N', 'N', '<section class="feature fixedwidth">\n	<div class="tit"><h1>FEATURE</h1></div>\n	<ul>\n	<li>\n		<div class="ico"><i class="xi-cube"></i></div>\n		<h2>한개의 폰트, 680개의 아이콘</h2>\n		<p>웹 콘텐츠의 목적에 맞는 아이콘을 다양한 구성에서 찾아볼 수 있습니다.<br /><a href="https://xpressengine.github.io/XEIcon/library_common.html" target="_blank">라이브러리</a>에서 필요한 아이콘을 찾아보세요!</p>\n	</li>\n	<li>\n		<div class="ico"><i class="xi-sitemap"></i></div>\n		<h2>호환성</h2>\n		<p>XEIcon은 자바스크립트 없이 구현됩니다. <br />또한 다양한 브라우저에서도 동일한 뷰로 웹 페이지를 노출합니다.</p>\n	</li>\n	<li>\n		<div class="ico"><i class="xi-layout-top-left"></i></div>\n		<h2>최적화</h2>\n		<p>XpressEngine 뿐 아니라, 다양한 프레임워크에서 동일하게 구현됩니다. 여러 환경에서 자유롭게 이용해보세요!</p>\n	</li>\n	<li>\n		<div class="ico"><i class="xi-arrows-alt"></i></div>\n		<h2>확장성</h2>\n		<p>백터 아이콘으로 만들어진 XEIcon은 어떤 크기로도 확장이 가능하며 높은 해상도의 화면에서도 선명한 형태를 유지합니다.</p>\n	</li>\n	<li>\n		<div class="ico"><i class="xi-pen"></i></div>\n		<h2>자유로운 변형</h2>\n		<p>CSS를 통해 아이콘의 색상, 크기 등을 손쉽게 변형할 수 있습니다. <a href="https://xpressengine.github.io/XEIcon/examples.html" target="_blank">LESS SASS</a>로 더 넓어진 활용 범위를 확인하세요!</p>\n	</li>\n	<li>\n		<div class="ico"><i class="xi-present"></i></div>\n		<h2>오픈소스</h2>\n		<p>XEIcon은 OFL 라이선스를 따르는 오픈소스로 모든 사용자에게 무료로 제공됩니다. <a href="https://xpressengine.github.io/XEIcon/license.html" target="_blank">라이선스</a>를 확인해 보세요!</p>\n	</li>\n	</ul>\n</section>\n', 0, 0, 0, 0, 0, 0, NULL, 'josungdong', 'admin', 'admin', 4, 'josungdong@naver.com', '', NULL, 'N;', '20160816232832', '20160816232832', NULL, '127.0.0.1', -94, -94, 'N', 'N', 'PUBLIC', 'DENY'),
(95, 66, 0, 'ko', 'N', 'XEIcon (3)', 'N', 'N', '<section class="get_started">\n	<div class="fixedwidth">\n		<div class="tit"><h1>GET STARTED</h1></div>\n		<p class="cont">XEIcon 사용과 설치 방법은 매우 간단합니다. 자세한 사용방법을 <a href="http://xpressengine.github.io/XEIcon/">XEIcon 공식사이트</a>에서 확인해보세요!</p>\n		<ul>\n			<li>\n				<h2>최신버전 다운로드</h2>\n				<p>가장 최신버전 구성을 압축파일로<br />다운로드 받아볼 수 있습니다.</p>\n				<a href="https://github.com/xpressengine/XEIcon/archive/master.zip"><i class="xeicon xi-download"></i> Download</a>\n			</li>\n			<li>\n				<h2>Git 저장소 복제</h2>\n				<p>Github에서 로컬 저장소로 복제하여 사용할 수 있습니다.</p>\n				<a href="https://xpressengine.github.io/XEIcon/started.html#installation" target="_blank"><i class="xeicon xi-arrow-right"></i> check out</a>\n			</li>\n			<li>\n				<h2>CDN by jsDelivr</h2>\n				<p>한줄의 코드만 작성하면 다운로드 없이 XEIcon을 사용할 수 있습니다.</p>\n				<a href="https://xpressengine.github.io/XEIcon/started.html#cdn" target="_blank"><i class="xeicon xi-arrow-right"></i> check out</a>\n			</li>\n			<li>\n				<h2>Install with Bower</h2>\n				<p>Bower 서비스에서 XEIcon 패키지를 바로 설치할 수 있습니다.</p>\n				<a href="https://xpressengine.github.io/XEIcon/started.html#bower"><i class="xeicon xi-arrow-right"></i> check out</a>\n			</li>\n		</ul>\n	</div>\n</section>\n', 0, 0, 0, 0, 0, 0, NULL, 'josungdong', 'admin', 'admin', 4, 'josungdong@naver.com', '', NULL, 'N;', '20160816232832', '20160816232832', NULL, '127.0.0.1', -95, -95, 'N', 'N', 'PUBLIC', 'DENY'),
(96, 66, 0, 'ko', 'N', 'XEIcon (4)', 'N', 'N', '<section class="contribution fixedwidth">\n	<div class="tit"><h1>CONTRIBUTION</h1></div>\n	<p class="cont">새로운 아이콘 요청이나 XEICON에 대한 제안이 있다면 자유롭게 이야기해주세요!<br />앞으로의 이야기들을 함께 만들어갈 third party 참여 또한 환영합니다.</p>\n	<a href="https://github.com/xpressengine/XEIcon" target="_blank" class="btn_github">github</a>\n</section>\n', 0, 0, 0, 0, 0, 0, NULL, 'josungdong', 'admin', 'admin', 4, 'josungdong@naver.com', '', NULL, 'N;', '20160816232832', '20160816232832', NULL, '127.0.0.1', -96, -96, 'N', 'N', 'PUBLIC', 'DENY');

-- --------------------------------------------------------

--
-- 테이블 구조 `xe_editor_autosave`
--

CREATE TABLE `xe_editor_autosave` (
  `member_srl` bigint(11) DEFAULT '0',
  `ipaddress` varchar(128) DEFAULT NULL,
  `module_srl` bigint(11) DEFAULT NULL,
  `document_srl` bigint(11) NOT NULL DEFAULT '0',
  `title` varchar(250) DEFAULT NULL,
  `content` longtext NOT NULL,
  `regdate` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 테이블 구조 `xe_editor_components`
--

CREATE TABLE `xe_editor_components` (
  `component_name` varchar(250) NOT NULL,
  `enabled` char(1) NOT NULL DEFAULT 'N',
  `extra_vars` text,
  `list_order` bigint(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 테이블의 덤프 데이터 `xe_editor_components`
--

INSERT INTO `xe_editor_components` (`component_name`, `enabled`, `extra_vars`, `list_order`) VALUES
('colorpicker_bg', 'Y', NULL, 44),
('colorpicker_text', 'Y', NULL, 42),
('emoticon', 'Y', NULL, 46),
('image_gallery', 'Y', NULL, 60),
('image_link', 'Y', NULL, 50),
('multimedia_link', 'Y', NULL, 52),
('poll_maker', 'Y', NULL, 58),
('quotation', 'Y', NULL, 54),
('table_maker', 'Y', NULL, 56),
('url_link', 'Y', NULL, 48);

-- --------------------------------------------------------

--
-- 테이블 구조 `xe_editor_components_site`
--

CREATE TABLE `xe_editor_components_site` (
  `site_srl` bigint(11) NOT NULL DEFAULT '0',
  `component_name` varchar(250) NOT NULL,
  `enabled` char(1) NOT NULL DEFAULT 'N',
  `extra_vars` text,
  `list_order` bigint(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 테이블 구조 `xe_files`
--

CREATE TABLE `xe_files` (
  `file_srl` bigint(11) NOT NULL,
  `upload_target_srl` bigint(11) NOT NULL DEFAULT '0',
  `upload_target_type` char(3) DEFAULT NULL,
  `sid` varchar(60) DEFAULT NULL,
  `module_srl` bigint(11) NOT NULL DEFAULT '0',
  `member_srl` bigint(11) NOT NULL,
  `download_count` bigint(11) NOT NULL DEFAULT '0',
  `direct_download` char(1) NOT NULL DEFAULT 'N',
  `source_filename` varchar(250) DEFAULT NULL,
  `uploaded_filename` varchar(250) DEFAULT NULL,
  `file_size` bigint(11) NOT NULL DEFAULT '0',
  `comment` varchar(250) DEFAULT NULL,
  `isvalid` char(1) DEFAULT 'N',
  `cover_image` char(1) NOT NULL DEFAULT 'N',
  `regdate` varchar(14) DEFAULT NULL,
  `ipaddress` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 테이블 구조 `xe_lang`
--

CREATE TABLE `xe_lang` (
  `site_srl` bigint(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `lang_code` varchar(10) NOT NULL,
  `value` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 테이블 구조 `xe_layouts`
--

CREATE TABLE `xe_layouts` (
  `layout_srl` bigint(12) NOT NULL,
  `site_srl` bigint(11) NOT NULL DEFAULT '0',
  `layout` varchar(250) DEFAULT NULL,
  `title` varchar(250) DEFAULT NULL,
  `extra_vars` text,
  `layout_path` varchar(250) DEFAULT NULL,
  `module_srl` bigint(12) DEFAULT '0',
  `regdate` varchar(14) DEFAULT NULL,
  `layout_type` char(1) DEFAULT 'P'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 테이블의 덤프 데이터 `xe_layouts`
--

INSERT INTO `xe_layouts` (`layout_srl`, `site_srl`, `layout`, `title`, `extra_vars`, `layout_path`, `module_srl`, `regdate`, `layout_type`) VALUES
(89, 0, 'xedition', 'XEDITION', 'O:8:"stdClass":3:{s:3:"GNB";i:65;s:3:"UNB";i:76;s:3:"FNB";i:79;}', NULL, 0, '20160816232832', 'P'),
(90, 0, 'default', 'welcome_mobile_layout', 'O:8:"stdClass":4:{s:3:"GNB";i:65;s:3:"UNB";i:76;s:3:"FNB";i:79;s:9:"main_menu";i:65;}', NULL, 0, '20160816232832', 'M');

-- --------------------------------------------------------

--
-- 테이블 구조 `xe_member`
--

CREATE TABLE `xe_member` (
  `member_srl` bigint(11) NOT NULL,
  `user_id` varchar(80) NOT NULL,
  `email_address` varchar(250) NOT NULL,
  `password` varchar(60) NOT NULL,
  `email_id` varchar(80) NOT NULL,
  `email_host` varchar(160) DEFAULT NULL,
  `user_name` varchar(40) NOT NULL,
  `nick_name` varchar(40) NOT NULL,
  `find_account_question` bigint(11) DEFAULT NULL,
  `find_account_answer` varchar(250) DEFAULT NULL,
  `homepage` varchar(250) DEFAULT NULL,
  `blog` varchar(250) DEFAULT NULL,
  `birthday` char(8) DEFAULT NULL,
  `allow_mailing` char(1) NOT NULL DEFAULT 'Y',
  `allow_message` char(1) NOT NULL DEFAULT 'Y',
  `denied` char(1) DEFAULT 'N',
  `limit_date` varchar(14) DEFAULT NULL,
  `regdate` varchar(14) DEFAULT NULL,
  `last_login` varchar(14) DEFAULT NULL,
  `change_password_date` varchar(14) DEFAULT NULL,
  `is_admin` char(1) DEFAULT 'N',
  `description` text,
  `extra_vars` text,
  `list_order` bigint(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 테이블의 덤프 데이터 `xe_member`
--

INSERT INTO `xe_member` (`member_srl`, `user_id`, `email_address`, `password`, `email_id`, `email_host`, `user_name`, `nick_name`, `find_account_question`, `find_account_answer`, `homepage`, `blog`, `birthday`, `allow_mailing`, `allow_message`, `denied`, `limit_date`, `regdate`, `last_login`, `change_password_date`, `is_admin`, `description`, `extra_vars`, `list_order`) VALUES
(4, 'josungdong', 'josungdong@naver.com', 'sha256:0008192:YsSJ3GSzZIqt:Nhd7ZGeXuDnrA0N2XH6SZFILcEAf2ZjY', 'josungdong', 'naver.com', 'admin', 'admin', NULL, NULL, '', '', NULL, 'N', 'Y', 'N', NULL, '20160816232827', '20160816232827', '20160816232827', 'Y', NULL, NULL, -4);

-- --------------------------------------------------------

--
-- 테이블 구조 `xe_member_auth_mail`
--

CREATE TABLE `xe_member_auth_mail` (
  `auth_key` varchar(60) NOT NULL,
  `member_srl` bigint(11) NOT NULL,
  `user_id` varchar(80) NOT NULL,
  `new_password` varchar(80) NOT NULL,
  `is_register` char(1) DEFAULT 'N',
  `regdate` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 테이블 구조 `xe_member_autologin`
--

CREATE TABLE `xe_member_autologin` (
  `autologin_key` varchar(80) NOT NULL,
  `member_srl` bigint(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 테이블 구조 `xe_member_count_history`
--

CREATE TABLE `xe_member_count_history` (
  `member_srl` bigint(11) NOT NULL,
  `content` longtext NOT NULL,
  `last_update` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 테이블 구조 `xe_member_denied_nick_name`
--

CREATE TABLE `xe_member_denied_nick_name` (
  `nick_name` varchar(80) NOT NULL,
  `regdate` varchar(14) DEFAULT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 테이블 구조 `xe_member_denied_user_id`
--

CREATE TABLE `xe_member_denied_user_id` (
  `user_id` varchar(80) NOT NULL,
  `regdate` varchar(14) DEFAULT NULL,
  `description` text,
  `list_order` bigint(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 테이블의 덤프 데이터 `xe_member_denied_user_id`
--

INSERT INTO `xe_member_denied_user_id` (`user_id`, `regdate`, `description`, `list_order`) VALUES
('addon', '20160816232827', '', -5),
('admin', '20160816232827', '', -6),
('administrator', '20160816232827', '', -38),
('adminlogging', '20160816232827', '', -7),
('autoinstall', '20160816232827', '', -8),
('board', '20160816232827', '', -9),
('comment', '20160816232827', '', -10),
('communication', '20160816232827', '', -11),
('counter', '20160816232827', '', -12),
('document', '20160816232827', '', -13),
('editor', '20160816232827', '', -14),
('file', '20160816232827', '', -15),
('ftp', '20160816232827', '', -40),
('http', '20160816232827', '', -41),
('importer', '20160816232827', '', -16),
('install', '20160816232827', '', -17),
('integration_search', '20160816232827', '', -18),
('krzip', '20160816232827', '', -19),
('layout', '20160816232827', '', -20),
('member', '20160816232827', '', -21),
('menu', '20160816232827', '', -22),
('message', '20160816232827', '', -23),
('module', '20160816232827', '', -24),
('page', '20160816232827', '', -25),
('point', '20160816232827', '', -26),
('poll', '20160816232827', '', -27),
('root', '20160816232827', '', -37),
('rss', '20160816232827', '', -28),
('seo', '20160816232827', '', -29),
('session', '20160816232827', '', -30),
('spamfilter', '20160816232827', '', -31),
('syndication', '20160816232827', '', -32),
('tag', '20160816232827', '', -33),
('telnet', '20160816232827', '', -39),
('trash', '20160816232827', '', -34),
('widget', '20160816232827', '', -35),
('www', '20160816232827', '', -36);

-- --------------------------------------------------------

--
-- 테이블 구조 `xe_member_friend`
--

CREATE TABLE `xe_member_friend` (
  `friend_srl` bigint(11) NOT NULL,
  `friend_group_srl` bigint(11) NOT NULL DEFAULT '0',
  `member_srl` bigint(11) NOT NULL,
  `target_srl` bigint(11) NOT NULL,
  `list_order` bigint(11) NOT NULL,
  `regdate` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 테이블 구조 `xe_member_friend_group`
--

CREATE TABLE `xe_member_friend_group` (
  `friend_group_srl` bigint(11) NOT NULL,
  `member_srl` bigint(11) NOT NULL,
  `title` varchar(250) NOT NULL,
  `regdate` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 테이블 구조 `xe_member_group`
--

CREATE TABLE `xe_member_group` (
  `site_srl` bigint(11) NOT NULL DEFAULT '0',
  `group_srl` bigint(11) NOT NULL,
  `list_order` bigint(11) NOT NULL,
  `title` varchar(80) NOT NULL,
  `regdate` varchar(14) DEFAULT NULL,
  `is_default` char(1) DEFAULT 'N',
  `is_admin` char(1) DEFAULT 'N',
  `image_mark` text,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 테이블의 덤프 데이터 `xe_member_group`
--

INSERT INTO `xe_member_group` (`site_srl`, `group_srl`, `list_order`, `title`, `regdate`, `is_default`, `is_admin`, `image_mark`, `description`) VALUES
(0, 1, 1, '관리그룹', '20160816232827', 'N', 'Y', '', ''),
(0, 2, 2, '준회원', '20160816232827', 'Y', 'N', '', ''),
(0, 3, 3, '정회원', '20160816232827', 'N', 'N', '', '');

-- --------------------------------------------------------

--
-- 테이블 구조 `xe_member_group_member`
--

CREATE TABLE `xe_member_group_member` (
  `site_srl` bigint(11) NOT NULL DEFAULT '0',
  `group_srl` bigint(11) NOT NULL,
  `member_srl` bigint(11) NOT NULL,
  `regdate` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 테이블의 덤프 데이터 `xe_member_group_member`
--

INSERT INTO `xe_member_group_member` (`site_srl`, `group_srl`, `member_srl`, `regdate`) VALUES
(0, 1, 4, '20160816232827');

-- --------------------------------------------------------

--
-- 테이블 구조 `xe_member_join_form`
--

CREATE TABLE `xe_member_join_form` (
  `member_join_form_srl` bigint(11) NOT NULL,
  `column_type` varchar(60) NOT NULL,
  `column_name` varchar(60) NOT NULL,
  `column_title` varchar(60) NOT NULL,
  `required` char(1) NOT NULL DEFAULT 'N',
  `default_value` text,
  `is_active` char(1) DEFAULT 'Y',
  `description` text,
  `list_order` bigint(11) NOT NULL DEFAULT '1',
  `regdate` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 테이블 구조 `xe_member_login_count`
--

CREATE TABLE `xe_member_login_count` (
  `ipaddress` varchar(128) NOT NULL,
  `count` bigint(11) NOT NULL,
  `regdate` varchar(14) DEFAULT NULL,
  `last_update` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 테이블 구조 `xe_member_message`
--

CREATE TABLE `xe_member_message` (
  `message_srl` bigint(11) NOT NULL,
  `related_srl` bigint(11) NOT NULL,
  `sender_srl` bigint(11) NOT NULL,
  `receiver_srl` bigint(11) NOT NULL,
  `message_type` char(1) NOT NULL DEFAULT 'S',
  `title` varchar(250) NOT NULL,
  `content` text NOT NULL,
  `readed` char(1) NOT NULL DEFAULT 'N',
  `list_order` bigint(11) NOT NULL,
  `regdate` varchar(14) DEFAULT NULL,
  `readed_date` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 테이블 구조 `xe_member_scrap`
--

CREATE TABLE `xe_member_scrap` (
  `member_srl` bigint(11) NOT NULL,
  `document_srl` bigint(11) NOT NULL,
  `title` varchar(250) DEFAULT NULL,
  `user_id` varchar(80) DEFAULT NULL,
  `user_name` varchar(80) NOT NULL,
  `nick_name` varchar(80) NOT NULL,
  `target_member_srl` bigint(11) NOT NULL,
  `regdate` varchar(14) DEFAULT NULL,
  `list_order` bigint(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 테이블 구조 `xe_menu`
--

CREATE TABLE `xe_menu` (
  `menu_srl` bigint(12) NOT NULL,
  `site_srl` bigint(11) NOT NULL DEFAULT '0',
  `title` varchar(250) DEFAULT NULL,
  `listorder` bigint(11) DEFAULT '0',
  `regdate` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 테이블의 덤프 데이터 `xe_menu`
--

INSERT INTO `xe_menu` (`menu_srl`, `site_srl`, `title`, `listorder`, `regdate`) VALUES
(65, 0, 'Main menu', -65, '20160816232831'),
(76, 0, 'Utility menu', -76, '20160816232831'),
(79, 0, 'Footer Menu', -79, '20160816232831'),
(97, 0, '__ADMINMENU_V17__', -97, '20160816233122');

-- --------------------------------------------------------

--
-- 테이블 구조 `xe_menu_item`
--

CREATE TABLE `xe_menu_item` (
  `menu_item_srl` bigint(12) NOT NULL,
  `parent_srl` bigint(12) NOT NULL DEFAULT '0',
  `menu_srl` bigint(12) NOT NULL,
  `name` text,
  `desc` varchar(250) DEFAULT NULL,
  `url` varchar(250) DEFAULT NULL,
  `is_shortcut` char(1) DEFAULT 'N',
  `open_window` char(1) DEFAULT 'N',
  `expand` char(1) DEFAULT 'N',
  `normal_btn` varchar(255) DEFAULT NULL,
  `hover_btn` varchar(255) DEFAULT NULL,
  `active_btn` varchar(255) DEFAULT NULL,
  `group_srls` text,
  `listorder` bigint(11) DEFAULT '0',
  `regdate` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 테이블의 덤프 데이터 `xe_menu_item`
--

INSERT INTO `xe_menu_item` (`menu_item_srl`, `parent_srl`, `menu_srl`, `name`, `desc`, `url`, `is_shortcut`, `open_window`, `expand`, `normal_btn`, `hover_btn`, `active_btn`, `group_srls`, `listorder`, `regdate`) VALUES
(67, 0, 65, 'Welcome Page', '', 'index', 'N', 'N', 'N', NULL, NULL, NULL, NULL, -67, '20160816232831'),
(69, 0, 65, 'Board', '', 'board', 'N', 'N', 'N', NULL, NULL, NULL, NULL, -69, '20160816232831'),
(70, 69, 65, 'SAMPLE 1', '', '#', 'Y', 'N', 'N', NULL, NULL, NULL, NULL, -70, '20160816232831'),
(71, 70, 65, 'SAMPLE 1-1', '', '#', 'Y', 'N', 'N', NULL, NULL, NULL, NULL, -71, '20160816232831'),
(72, 69, 65, 'SAMPLE 2', '', '#', 'Y', 'N', 'N', NULL, NULL, NULL, NULL, -72, '20160816232831'),
(73, 69, 65, 'SAMPLE 3', '', '#', 'Y', 'N', 'N', NULL, NULL, NULL, NULL, -73, '20160816232831'),
(75, 0, 65, 'XEIcon', '', 'xeicon', 'N', 'N', 'N', NULL, NULL, NULL, NULL, -75, '20160816232831'),
(77, 0, 76, 'XE Official Site', '', 'http://www.xpressengine.com', 'Y', 'N', 'N', NULL, NULL, NULL, NULL, -77, '20160816232831'),
(78, 0, 76, 'GitHub', '', 'https://github.com/xpressengine', 'Y', 'N', 'N', NULL, NULL, NULL, NULL, -78, '20160816232831'),
(80, 0, 79, 'Welcome Page', '', '#', 'Y', 'N', 'N', NULL, NULL, NULL, NULL, -80, '20160816232831'),
(81, 80, 79, 'SAMPLE 1', '', '#', 'Y', 'N', 'N', NULL, NULL, NULL, NULL, -81, '20160816232831'),
(82, 80, 79, 'SAMPLE 2', '', '#', 'Y', 'N', 'N', NULL, NULL, NULL, NULL, -82, '20160816232831'),
(83, 80, 79, 'SAMPLE 3', '', '#', 'Y', 'N', 'N', NULL, NULL, NULL, NULL, -83, '20160816232831'),
(84, 0, 79, 'Board', '', '#', 'Y', 'N', 'N', NULL, NULL, NULL, NULL, -84, '20160816232831'),
(85, 84, 79, 'SAMPLE 1', '', '#', 'Y', 'N', 'N', NULL, NULL, NULL, NULL, -85, '20160816232831'),
(86, 84, 79, 'SAMPLE 2', '', '#', 'Y', 'N', 'N', NULL, NULL, NULL, NULL, -86, '20160816232831'),
(87, 0, 79, 'XEIcon', '', '#', 'Y', 'N', 'N', NULL, NULL, NULL, NULL, -87, '20160816232831'),
(88, 87, 79, 'SAMPLE 1', '', '#', 'Y', 'N', 'N', NULL, NULL, NULL, NULL, -88, '20160816232832'),
(98, 0, 97, '{$lang->menu_gnb[\'dashboard\']}', NULL, 'index.php?module=admin', 'N', 'N', 'N', NULL, NULL, NULL, NULL, -98, '20160816233122'),
(99, 0, 97, '{$lang->menu_gnb[\'menu\']}', NULL, '#', 'N', 'N', 'N', NULL, NULL, NULL, NULL, -99, '20160816233122'),
(100, 0, 97, '{$lang->menu_gnb[\'user\']}', NULL, '#', 'N', 'N', 'N', NULL, NULL, NULL, NULL, -100, '20160816233122'),
(101, 0, 97, '{$lang->menu_gnb[\'content\']}', NULL, '#', 'N', 'N', 'N', NULL, NULL, NULL, NULL, -101, '20160816233122'),
(102, 0, 97, '{$lang->menu_gnb[\'configuration\']}', NULL, '#', 'N', 'N', 'N', NULL, NULL, NULL, NULL, -102, '20160816233122'),
(103, 0, 97, '{$lang->menu_gnb[\'advanced\']}', NULL, '#', 'N', 'N', 'N', NULL, NULL, NULL, NULL, -103, '20160816233122'),
(104, 99, 97, '{$lang->menu_gnb_sub[\'siteMap\']}', NULL, 'index.php?module=admin&act=dispMenuAdminSiteMap', 'N', 'N', 'N', '', '', '', '1', -104, '20160816233122'),
(105, 99, 97, '{$lang->menu_gnb_sub[\'siteDesign\']}', NULL, 'index.php?module=admin&act=dispMenuAdminSiteDesign', 'N', 'N', 'N', '', '', '', '1', -105, '20160816233122'),
(106, 100, 97, '{$lang->menu_gnb_sub[\'userList\']}', NULL, 'index.php?module=admin&act=dispMemberAdminList', 'N', 'N', 'N', '', '', '', '1', -106, '20160816233122'),
(107, 100, 97, '{$lang->menu_gnb_sub[\'userSetting\']}', NULL, 'index.php?module=admin&act=dispMemberAdminConfig', 'N', 'N', 'N', '', '', '', '1', -107, '20160816233122'),
(108, 100, 97, '{$lang->menu_gnb_sub[\'userGroup\']}', NULL, 'index.php?module=admin&act=dispMemberAdminGroupList', 'N', 'N', 'N', '', '', '', '1', -108, '20160816233122'),
(109, 101, 97, '{$lang->menu_gnb_sub[\'document\']}', NULL, 'index.php?module=admin&act=dispDocumentAdminList', 'N', 'N', 'N', '', '', '', '1', -109, '20160816233122'),
(110, 101, 97, '{$lang->menu_gnb_sub[\'comment\']}', NULL, 'index.php?module=admin&act=dispCommentAdminList', 'N', 'N', 'N', '', '', '', '1', -110, '20160816233122'),
(111, 101, 97, '{$lang->menu_gnb_sub[\'file\']}', NULL, 'index.php?module=admin&act=dispFileAdminList', 'N', 'N', 'N', '', '', '', '1', -111, '20160816233122'),
(112, 101, 97, '{$lang->menu_gnb_sub[\'poll\']}', NULL, 'index.php?module=admin&act=dispPollAdminList', 'N', 'N', 'N', '', '', '', '1', -112, '20160816233122'),
(113, 101, 97, '{$lang->menu_gnb_sub[\'rss\']}', NULL, 'index.php?module=admin&act=dispRssAdminIndex', 'N', 'N', 'N', '', '', '', '1', -113, '20160816233122'),
(114, 101, 97, '{$lang->menu_gnb_sub[\'multilingual\']}', NULL, 'index.php?module=admin&act=dispModuleAdminLangcode', 'N', 'N', 'N', '', '', '', '1', -114, '20160816233122'),
(115, 101, 97, '{$lang->menu_gnb_sub[\'importer\']}', NULL, 'index.php?module=admin&act=dispImporterAdminImportForm', 'N', 'N', 'N', '', '', '', '1', -115, '20160816233122'),
(116, 101, 97, '{$lang->menu_gnb_sub[\'trash\']}', NULL, 'index.php?module=admin&act=dispTrashAdminList', 'N', 'N', 'N', '', '', '', '1', -116, '20160816233122'),
(117, 103, 97, '{$lang->menu_gnb_sub[\'easyInstall\']}', NULL, 'index.php?module=admin&act=dispAutoinstallAdminIndex', 'N', 'N', 'N', '', '', '', '1', -117, '20160816233122'),
(118, 103, 97, '{$lang->menu_gnb_sub[\'installedLayout\']}', NULL, 'index.php?module=admin&act=dispLayoutAdminInstalledList', 'N', 'N', 'N', '', '', '', '1', -118, '20160816233122'),
(119, 103, 97, '{$lang->menu_gnb_sub[\'installedModule\']}', NULL, 'index.php?module=admin&act=dispModuleAdminContent', 'N', 'N', 'N', '', '', '', '1', -119, '20160816233122'),
(120, 103, 97, '{$lang->menu_gnb_sub[\'installedWidget\']}', NULL, 'index.php?module=admin&act=dispWidgetAdminDownloadedList', 'N', 'N', 'N', '', '', '', '1', -120, '20160816233122'),
(121, 103, 97, '{$lang->menu_gnb_sub[\'installedAddon\']}', NULL, 'index.php?module=admin&act=dispAddonAdminIndex', 'N', 'N', 'N', '', '', '', '1', -121, '20160816233122'),
(122, 103, 97, '{$lang->menu_gnb_sub[\'editor\']}', NULL, 'index.php?module=admin&act=dispEditorAdminIndex', 'N', 'N', 'N', '', '', '', '1', -122, '20160816233122'),
(123, 101, 97, '{$lang->menu_gnb_sub[\'spamFilter\']}', NULL, 'index.php?module=admin&act=dispSpamfilterAdminDeniedIPList', 'N', 'N', 'N', '', '', '', '1', -123, '20160816233122'),
(124, 102, 97, '{$lang->menu_gnb_sub[\'adminConfigurationGeneral\']}', NULL, 'index.php?module=admin&act=dispAdminConfigGeneral', 'N', 'N', 'N', '', '', '', '1', -124, '20160816233122'),
(125, 102, 97, '{$lang->menu_gnb_sub[\'adminConfigurationFtp\']}', NULL, 'index.php?module=admin&act=dispAdminConfigFtp', 'N', 'N', 'N', '', '', '', '1', -125, '20160816233122'),
(126, 102, 97, '{$lang->menu_gnb_sub[\'adminMenuSetup\']}', NULL, 'index.php?module=admin&act=dispAdminSetup', 'N', 'N', 'N', '', '', '', '1', -126, '20160816233122'),
(127, 102, 97, '{$lang->menu_gnb_sub[\'fileUpload\']}', NULL, 'index.php?module=admin&act=dispFileAdminConfig', 'N', 'N', 'N', '', '', '', '1', -127, '20160816233122'),
(128, 102, 97, '{$lang->menu_gnb_sub[\'filebox\']}', NULL, 'index.php?module=admin&act=dispModuleAdminFileBox', 'N', 'N', 'N', '', '', '', '1', -128, '20160816233122'),
(129, 100, 97, '{$lang->menu_gnb_sub[\'point\']}', NULL, 'index.php?module=admin&act=dispPointAdminConfig', 'N', 'N', 'N', '', '', '', '1', -129, '20160816233122');

-- --------------------------------------------------------

--
-- 테이블 구조 `xe_menu_layout`
--

CREATE TABLE `xe_menu_layout` (
  `menu_srl` bigint(12) NOT NULL,
  `layout_srl` bigint(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 테이블 구조 `xe_module_admins`
--

CREATE TABLE `xe_module_admins` (
  `module_srl` bigint(11) NOT NULL,
  `member_srl` bigint(11) NOT NULL,
  `regdate` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 테이블 구조 `xe_module_categories`
--

CREATE TABLE `xe_module_categories` (
  `module_category_srl` bigint(11) NOT NULL DEFAULT '0',
  `title` varchar(250) DEFAULT NULL,
  `regdate` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 테이블 구조 `xe_module_config`
--

CREATE TABLE `xe_module_config` (
  `module` varchar(250) NOT NULL,
  `site_srl` bigint(11) NOT NULL,
  `config` text,
  `regdate` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 테이블의 덤프 데이터 `xe_module_config`
--

INSERT INTO `xe_module_config` (`module`, `site_srl`, `config`, `regdate`) VALUES
('autoinstall', 0, 'O:8:"stdClass":1:{s:14:"downloadServer";s:33:"http://download.xpressengine.com/";}', '20160816232817'),
('comment', 0, 'N;', '20160816232816'),
('editor', 0, 'N;', '20160816232816'),
('file', 0, 'O:8:"stdClass":3:{s:16:"allowed_filesize";s:1:"2";s:19:"allowed_attach_size";s:1:"2";s:17:"allowed_filetypes";s:3:"*.*";}', '20160816232823'),
('layout', 0, 'N;', '20160816232816'),
('member', 0, 'O:8:"stdClass":26:{s:11:"enable_join";s:1:"Y";s:13:"enable_openid";s:1:"N";s:16:"enable_auth_mail";s:1:"N";s:10:"image_name";s:1:"N";s:10:"image_mark";s:1:"N";s:13:"profile_image";s:1:"N";s:20:"image_name_max_width";N;s:21:"image_name_max_height";N;s:20:"image_mark_max_width";N;s:21:"image_mark_max_height";N;s:23:"profile_image_max_width";N;s:24:"profile_image_max_height";N;s:16:"group_image_mark";s:1:"N";s:17:"password_strength";s:6:"normal";s:26:"password_hashing_algorithm";s:6:"pbkdf2";s:28:"password_hashing_work_factor";i:8;s:29:"password_hashing_auto_upgrade";s:1:"Y";s:10:"signupForm";a:13:{i:0;O:8:"stdClass":9:{s:12:"isIdentifier";b:1;s:13:"isDefaultForm";b:1;s:4:"name";s:13:"email_address";s:5:"title";s:16:"이메일 주소";s:12:"mustRequired";b:1;s:9:"imageType";b:0;s:8:"required";b:1;s:5:"isUse";b:1;s:8:"isPublic";s:1:"N";}i:1;O:8:"stdClass":9:{s:12:"isIdentifier";b:0;s:13:"isDefaultForm";b:1;s:4:"name";s:7:"user_id";s:5:"title";s:9:"아이디";s:12:"mustRequired";b:0;s:9:"imageType";b:0;s:8:"required";b:1;s:5:"isUse";b:1;s:8:"isPublic";s:1:"N";}i:2;O:8:"stdClass":9:{s:12:"isIdentifier";b:0;s:13:"isDefaultForm";b:1;s:4:"name";s:8:"password";s:5:"title";s:12:"비밀번호";s:12:"mustRequired";b:1;s:9:"imageType";b:0;s:8:"required";b:1;s:5:"isUse";b:1;s:8:"isPublic";s:1:"N";}i:3;O:8:"stdClass":9:{s:12:"isIdentifier";b:0;s:13:"isDefaultForm";b:1;s:4:"name";s:9:"user_name";s:5:"title";s:6:"이름";s:12:"mustRequired";b:0;s:9:"imageType";b:0;s:8:"required";b:0;s:5:"isUse";b:1;s:8:"isPublic";s:1:"N";}i:4;O:8:"stdClass":9:{s:12:"isIdentifier";b:0;s:13:"isDefaultForm";b:1;s:4:"name";s:9:"nick_name";s:5:"title";s:9:"닉네임";s:12:"mustRequired";b:1;s:9:"imageType";b:0;s:8:"required";b:1;s:5:"isUse";b:1;s:8:"isPublic";s:1:"Y";}i:5;O:8:"stdClass":9:{s:12:"isIdentifier";b:0;s:13:"isDefaultForm";b:1;s:4:"name";s:21:"find_account_question";s:5:"title";s:33:"비밀번호 찾기 질문/답변";s:12:"mustRequired";b:1;s:9:"imageType";b:0;s:8:"required";b:1;s:5:"isUse";b:1;s:8:"isPublic";s:1:"N";}i:6;O:8:"stdClass":9:{s:12:"isIdentifier";b:0;s:13:"isDefaultForm";b:1;s:4:"name";s:8:"homepage";s:5:"title";s:12:"홈페이지";s:12:"mustRequired";b:0;s:9:"imageType";b:0;s:8:"required";b:0;s:5:"isUse";b:0;s:8:"isPublic";s:1:"N";}i:7;O:8:"stdClass":9:{s:12:"isIdentifier";b:0;s:13:"isDefaultForm";b:1;s:4:"name";s:4:"blog";s:5:"title";s:9:"블로그";s:12:"mustRequired";b:0;s:9:"imageType";b:0;s:8:"required";b:0;s:5:"isUse";b:0;s:8:"isPublic";s:1:"N";}i:8;O:8:"stdClass":9:{s:12:"isIdentifier";b:0;s:13:"isDefaultForm";b:1;s:4:"name";s:8:"birthday";s:5:"title";s:6:"생일";s:12:"mustRequired";b:0;s:9:"imageType";b:0;s:8:"required";b:0;s:5:"isUse";b:0;s:8:"isPublic";s:1:"N";}i:9;O:8:"stdClass":9:{s:12:"isIdentifier";b:0;s:13:"isDefaultForm";b:1;s:4:"name";s:9:"signature";s:5:"title";s:6:"서명";s:12:"mustRequired";b:0;s:9:"imageType";b:0;s:8:"required";b:0;s:5:"isUse";b:0;s:8:"isPublic";s:1:"N";}i:10;O:8:"stdClass":11:{s:12:"isIdentifier";b:0;s:13:"isDefaultForm";b:1;s:4:"name";s:13:"profile_image";s:5:"title";s:16:"프로필 사진";s:12:"mustRequired";b:0;s:9:"imageType";b:1;s:8:"required";b:0;s:5:"isUse";b:0;s:8:"isPublic";s:1:"N";s:9:"max_width";N;s:10:"max_height";N;}i:11;O:8:"stdClass":11:{s:12:"isIdentifier";b:0;s:13:"isDefaultForm";b:1;s:4:"name";s:10:"image_name";s:5:"title";s:16:"이미지 이름";s:12:"mustRequired";b:0;s:9:"imageType";b:1;s:8:"required";b:0;s:5:"isUse";b:0;s:8:"isPublic";s:1:"N";s:9:"max_width";N;s:10:"max_height";N;}i:12;O:8:"stdClass":11:{s:12:"isIdentifier";b:0;s:13:"isDefaultForm";b:1;s:4:"name";s:10:"image_mark";s:5:"title";s:16:"이미지 마크";s:12:"mustRequired";b:0;s:9:"imageType";b:1;s:8:"required";b:0;s:5:"isUse";b:0;s:8:"isPublic";s:1:"N";s:9:"max_width";N;s:10:"max_height";N;}}s:10:"identifier";s:13:"email_address";s:9:"limit_day";i:0;s:21:"limit_day_description";N;s:9:"agreement";N;s:12:"redirect_url";N;s:21:"signature_editor_skin";s:8:"ckeditor";s:19:"sel_editor_colorset";s:5:"moono";s:9:"signature";s:1:"N";}', '20160816233719'),
('module', 0, 'O:8:"stdClass":1:{s:18:"isUpdateFixedValue";b:1;}', '20160816232817'),
('point', 0, 'O:8:"stdClass":22:{s:11:"able_module";s:1:"N";s:9:"max_level";i:30;s:10:"level_step";a:30:{i:1;i:90;i:2;i:360;i:3;i:810;i:4;i:1440;i:5;i:2250;i:6;i:3240;i:7;i:4410;i:8;i:5760;i:9;i:7290;i:10;i:9000;i:11;i:10890;i:12;i:12960;i:13;i:15210;i:14;i:17640;i:15;i:20250;i:16;i:23040;i:17;i:26010;i:18;i:29160;i:19;i:32490;i:20;i:36000;i:21;i:39690;i:22;i:43560;i:23;i:47610;i:24;i:51840;i:25;i:56250;i:26;i:60840;i:27;i:65610;i:28;i:70560;i:29;i:75690;i:30;i:81000;}s:12:"signup_point";i:10;s:11:"login_point";i:5;s:10:"point_name";s:5:"point";s:10:"level_icon";s:7:"default";s:16:"disable_download";b:0;s:15:"insert_document";i:10;s:19:"insert_document_act";s:23:"procBoardInsertDocument";s:19:"delete_document_act";s:23:"procBoardDeleteDocument";s:14:"insert_comment";i:5;s:18:"insert_comment_act";s:44:"procBoardInsertComment,procBlogInsertComment";s:18:"delete_comment_act";s:44:"procBoardDeleteComment,procBlogDeleteComment";s:11:"upload_file";i:5;s:15:"upload_file_act";s:14:"procFileUpload";s:15:"delete_file_act";s:14:"procFileDelete";s:13:"download_file";i:-5;s:17:"download_file_act";s:16:"procFileDownload";s:13:"read_document";i:0;s:5:"voted";i:0;s:6:"blamed";i:0;}', '20160816232828'),
('poll', 0, 'O:8:"stdClass":2:{s:4:"skin";s:7:"default";s:8:"colorset";s:6:"normal";}', '20160816232824'),
('rss', 0, 'N;', '20160816232816');

-- --------------------------------------------------------

--
-- 테이블 구조 `xe_module_extend`
--

CREATE TABLE `xe_module_extend` (
  `parent_module` varchar(80) NOT NULL,
  `extend_module` varchar(80) NOT NULL,
  `type` varchar(15) NOT NULL,
  `kind` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 테이블 구조 `xe_module_extra_vars`
--

CREATE TABLE `xe_module_extra_vars` (
  `module_srl` bigint(11) NOT NULL,
  `name` varchar(80) NOT NULL,
  `value` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 테이블의 덤프 데이터 `xe_module_extra_vars`
--

INSERT INTO `xe_module_extra_vars` (`module_srl`, `name`, `value`) VALUES
(66, 'page_type', 'WIDGET'),
(66, 'regdate', '20160816232831'),
(74, 'page_type', 'WIDGET'),
(74, 'regdate', '20160816232831');

-- --------------------------------------------------------

--
-- 테이블 구조 `xe_module_filebox`
--

CREATE TABLE `xe_module_filebox` (
  `module_filebox_srl` bigint(11) NOT NULL,
  `member_srl` bigint(11) NOT NULL,
  `filename` varchar(250) NOT NULL,
  `fileextension` varchar(4) NOT NULL,
  `filesize` bigint(11) NOT NULL DEFAULT '0',
  `comment` varchar(250) DEFAULT NULL,
  `regdate` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 테이블 구조 `xe_module_grants`
--

CREATE TABLE `xe_module_grants` (
  `module_srl` bigint(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `group_srl` bigint(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 테이블 구조 `xe_module_locks`
--

CREATE TABLE `xe_module_locks` (
  `lock_name` varchar(40) NOT NULL,
  `deadline` varchar(14) DEFAULT NULL,
  `member_srl` bigint(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 테이블 구조 `xe_module_mobile_skins`
--

CREATE TABLE `xe_module_mobile_skins` (
  `module_srl` bigint(11) NOT NULL,
  `name` varchar(80) NOT NULL,
  `value` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 테이블 구조 `xe_module_part_config`
--

CREATE TABLE `xe_module_part_config` (
  `module` varchar(250) NOT NULL,
  `module_srl` bigint(11) NOT NULL,
  `config` text,
  `regdate` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 테이블 구조 `xe_module_skins`
--

CREATE TABLE `xe_module_skins` (
  `module_srl` bigint(11) NOT NULL,
  `name` varchar(80) NOT NULL,
  `value` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 테이블 구조 `xe_module_trigger`
--

CREATE TABLE `xe_module_trigger` (
  `trigger_name` varchar(80) NOT NULL,
  `called_position` varchar(15) NOT NULL,
  `module` varchar(80) NOT NULL,
  `type` varchar(15) NOT NULL,
  `called_method` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 테이블의 덤프 데이터 `xe_module_trigger`
--

INSERT INTO `xe_module_trigger` (`trigger_name`, `called_position`, `module`, `type`, `called_method`) VALUES
('comment.deleteComment', 'after', 'file', 'controller', 'triggerCommentDeleteAttached'),
('comment.deleteComment', 'after', 'poll', 'controller', 'triggerDeleteCommentPoll'),
('comment.getCommentMenu', 'after', 'member', 'controller', 'triggerGetCommentMenu'),
('comment.insertComment', 'after', 'file', 'controller', 'triggerCommentAttachFiles'),
('comment.insertComment', 'after', 'poll', 'controller', 'triggerInsertCommentPoll'),
('comment.insertComment', 'before', 'file', 'controller', 'triggerCommentCheckAttached'),
('comment.insertComment', 'before', 'spamfilter', 'controller', 'triggerInsertComment'),
('comment.updateComment', 'after', 'file', 'controller', 'triggerCommentAttachFiles'),
('comment.updateComment', 'after', 'poll', 'controller', 'triggerUpdateCommentPoll'),
('comment.updateComment', 'before', 'file', 'controller', 'triggerCommentCheckAttached'),
('comment.updateComment', 'before', 'spamfilter', 'controller', 'triggerInsertComment'),
('communication.sendMessage', 'before', 'spamfilter', 'controller', 'triggerSendMessage'),
('display', 'before', 'editor', 'controller', 'triggerEditorComponentCompile'),
('display', 'before', 'seo', 'controller', 'triggerBeforeDisplay'),
('display', 'before', 'widget', 'controller', 'triggerWidgetCompile'),
('document.deleteDocument', 'after', 'comment', 'controller', 'triggerDeleteDocumentComments'),
('document.deleteDocument', 'after', 'file', 'controller', 'triggerDeleteAttached'),
('document.deleteDocument', 'after', 'poll', 'controller', 'triggerDeleteDocumentPoll'),
('document.deleteDocument', 'after', 'seo', 'controller', 'triggerAfterDocumentDeleteDocument'),
('document.deleteDocument', 'after', 'syndication', 'controller', 'triggerDeleteDocument'),
('document.deleteDocument', 'after', 'tag', 'controller', 'triggerDeleteTag'),
('document.getDocumentMenu', 'after', 'member', 'controller', 'triggerGetDocumentMenu'),
('document.insertDocument', 'after', 'editor', 'controller', 'triggerDeleteSavedDoc'),
('document.insertDocument', 'after', 'file', 'controller', 'triggerAttachFiles'),
('document.insertDocument', 'after', 'poll', 'controller', 'triggerInsertDocumentPoll'),
('document.insertDocument', 'after', 'syndication', 'controller', 'triggerInsertDocument'),
('document.insertDocument', 'after', 'tag', 'controller', 'triggerInsertTag'),
('document.insertDocument', 'before', 'file', 'controller', 'triggerCheckAttached'),
('document.insertDocument', 'before', 'spamfilter', 'controller', 'triggerInsertDocument'),
('document.insertDocument', 'before', 'tag', 'controller', 'triggerArrangeTag'),
('document.moveDocumentModule', 'after', 'syndication', 'controller', 'triggerMoveDocumentModule'),
('document.moveDocumentToTrash', 'after', 'syndication', 'controller', 'triggerMoveDocumentToTrash'),
('document.restoreTrash', 'after', 'syndication', 'controller', 'triggerRestoreTrash'),
('document.updateDocument', 'after', 'editor', 'controller', 'triggerDeleteSavedDoc'),
('document.updateDocument', 'after', 'file', 'controller', 'triggerAttachFiles'),
('document.updateDocument', 'after', 'poll', 'controller', 'triggerUpdateDocumentPoll'),
('document.updateDocument', 'after', 'seo', 'controller', 'triggerAfterDocumentUpdateDocument'),
('document.updateDocument', 'after', 'syndication', 'controller', 'triggerUpdateDocument'),
('document.updateDocument', 'after', 'tag', 'controller', 'triggerInsertTag'),
('document.updateDocument', 'before', 'file', 'controller', 'triggerCheckAttached'),
('document.updateDocument', 'before', 'spamfilter', 'controller', 'triggerInsertDocument'),
('document.updateDocument', 'before', 'tag', 'controller', 'triggerArrangeTag'),
('editor.deleteSavedDoc', 'after', 'file', 'controller', 'triggerDeleteAttached'),
('file.deleteFile', 'after', 'seo', 'controller', 'triggerAfterFileDeleteFile'),
('member.getMemberMenu', 'after', 'board', 'controller', 'triggerMemberMenu'),
('menu.getModuleListInSitemap', 'after', 'board', 'model', 'triggerModuleListInSitemap'),
('module.deleteModule', 'after', 'comment', 'controller', 'triggerDeleteModuleComments'),
('module.deleteModule', 'after', 'document', 'controller', 'triggerDeleteModuleDocuments'),
('module.deleteModule', 'after', 'file', 'controller', 'triggerDeleteModuleFiles'),
('module.deleteModule', 'after', 'syndication', 'controller', 'triggerDeleteModule'),
('module.deleteModule', 'after', 'tag', 'controller', 'triggerDeleteModuleTags'),
('module.dispAdditionSetup', 'before', 'comment', 'view', 'triggerDispCommentAdditionSetup'),
('module.dispAdditionSetup', 'before', 'document', 'view', 'triggerDispDocumentAdditionSetup'),
('module.dispAdditionSetup', 'before', 'editor', 'view', 'triggerDispEditorAdditionSetup'),
('module.dispAdditionSetup', 'before', 'file', 'view', 'triggerDispFileAdditionSetup'),
('module.dispAdditionSetup', 'before', 'rss', 'view', 'triggerDispRssAdditionSetup'),
('module.procModuleAdminCopyModule', 'after', 'comment', 'controller', 'triggerCopyModule'),
('module.procModuleAdminCopyModule', 'after', 'document', 'controller', 'triggerCopyModule'),
('module.procModuleAdminCopyModule', 'after', 'document', 'controller', 'triggerCopyModuleExtraKeys'),
('module.procModuleAdminCopyModule', 'after', 'editor', 'controller', 'triggerCopyModule'),
('module.procModuleAdminCopyModule', 'after', 'file', 'controller', 'triggerCopyModule'),
('module.procModuleAdminCopyModule', 'after', 'rss', 'controller', 'triggerCopyModule'),
('moduleHandler.proc', 'after', 'rss', 'controller', 'triggerRssUrlInsert'),
('trackback.insertTrackback', 'before', 'spamfilter', 'controller', 'triggerInsertTrackback');

-- --------------------------------------------------------

--
-- 테이블 구조 `xe_modules`
--

CREATE TABLE `xe_modules` (
  `module_srl` bigint(11) NOT NULL,
  `module` varchar(80) NOT NULL,
  `module_category_srl` bigint(11) DEFAULT '0',
  `layout_srl` bigint(11) DEFAULT '0',
  `use_mobile` char(1) DEFAULT 'N',
  `mlayout_srl` bigint(11) DEFAULT '0',
  `menu_srl` bigint(11) DEFAULT '0',
  `site_srl` bigint(11) NOT NULL DEFAULT '0',
  `mid` varchar(40) NOT NULL,
  `is_skin_fix` char(1) NOT NULL DEFAULT 'Y',
  `skin` varchar(250) DEFAULT NULL,
  `is_mskin_fix` char(1) NOT NULL DEFAULT 'Y',
  `mskin` varchar(250) DEFAULT NULL,
  `browser_title` varchar(250) NOT NULL,
  `description` text,
  `is_default` char(1) NOT NULL DEFAULT 'N',
  `content` longtext,
  `mcontent` longtext,
  `open_rss` char(1) NOT NULL DEFAULT 'Y',
  `header_text` text,
  `footer_text` text,
  `regdate` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 테이블의 덤프 데이터 `xe_modules`
--

INSERT INTO `xe_modules` (`module_srl`, `module`, `module_category_srl`, `layout_srl`, `use_mobile`, `mlayout_srl`, `menu_srl`, `site_srl`, `mid`, `is_skin_fix`, `skin`, `is_mskin_fix`, `mskin`, `browser_title`, `description`, `is_default`, `content`, `mcontent`, `open_rss`, `header_text`, `footer_text`, `regdate`) VALUES
(66, 'page', 0, -1, 'Y', -1, 65, 0, 'index', 'N', '/USE_DEFAULT/', 'N', '/USE_DEFAULT/', 'Welcome Page', '', 'N', '<img hasContent="true" class="zbxe_widget_output" widget="widgetContent" style="width: 100%; float: left;" body="" document_srl="91" widget_padding_left="0" widget_padding_right="0" widget_padding_top="0" widget_padding_bottom="0"  />', '<img hasContent="true" class="zbxe_widget_output" widget="widgetContent" style="width: 100%; float: left;" body="" document_srl="92" widget_padding_left="0" widget_padding_right="0" widget_padding_top="0" widget_padding_bottom="0"  />', 'Y', '', '', '20160816232831'),
(68, 'board', 0, -1, 'Y', -1, 65, 0, 'board', 'N', NULL, 'N', NULL, 'Board', NULL, 'N', NULL, NULL, 'Y', NULL, NULL, '20160816232831'),
(74, 'page', 0, -1, 'Y', -1, 65, 0, 'xeicon', 'N', '/USE_DEFAULT/', 'N', '/USE_DEFAULT/', 'XEIcon', '', 'N', '<div widget="widgetBox" style="float:left;width:100%;" widget_padding_left="0" widget_padding_right="0" widget_padding_top="0" widget_padding_bottom="0" css_class="XEicon" ><div><div><img hasContent="true" class="zbxe_widget_output" widget="widgetContent" style="float:left;padding:none;margin:none;width:100%;" document_srl="93" widget_padding_left="0" widget_padding_right="0" widget_padding_top="0" widget_padding_bottom="0" /><img hasContent="true" class="zbxe_widget_output" widget="widgetContent" style="float:left;padding:none;margin:none;width:100%;" document_srl="94" widget_padding_left="0" widget_padding_right="0" widget_padding_top="0" widget_padding_bottom="0" /><img hasContent="true" class="zbxe_widget_output" widget="widgetContent" style="float:left;padding:none;margin:none;width:100%;" document_srl="95" widget_padding_left="0" widget_padding_right="0" widget_padding_top="0" widget_padding_bottom="0" /><img hasContent="true" class="zbxe_widget_output" widget="widgetContent" style="float:left;padding:none;margin:none;width:100%;" document_srl="96" widget_padding_left="0" widget_padding_right="0" widget_padding_top="0" widget_padding_bottom="0" /></div></div></div>', NULL, 'Y', '', '', '20160816232831');

-- --------------------------------------------------------

--
-- 테이블 구조 `xe_point`
--

CREATE TABLE `xe_point` (
  `member_srl` bigint(11) NOT NULL,
  `point` bigint(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 테이블 구조 `xe_poll`
--

CREATE TABLE `xe_poll` (
  `poll_srl` bigint(11) NOT NULL,
  `stop_date` varchar(14) DEFAULT NULL,
  `upload_target_srl` bigint(11) NOT NULL,
  `poll_count` bigint(11) NOT NULL,
  `member_srl` bigint(11) NOT NULL,
  `ipaddress` varchar(128) NOT NULL,
  `regdate` varchar(14) DEFAULT NULL,
  `list_order` bigint(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 테이블 구조 `xe_poll_item`
--

CREATE TABLE `xe_poll_item` (
  `poll_item_srl` bigint(11) NOT NULL,
  `poll_srl` bigint(11) NOT NULL,
  `poll_index_srl` bigint(11) NOT NULL,
  `upload_target_srl` bigint(11) NOT NULL,
  `title` varchar(250) NOT NULL,
  `poll_count` bigint(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 테이블 구조 `xe_poll_log`
--

CREATE TABLE `xe_poll_log` (
  `poll_srl` bigint(11) NOT NULL,
  `member_srl` bigint(11) NOT NULL,
  `ipaddress` varchar(128) NOT NULL,
  `regdate` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 테이블 구조 `xe_poll_title`
--

CREATE TABLE `xe_poll_title` (
  `poll_srl` bigint(11) NOT NULL,
  `poll_index_srl` bigint(11) NOT NULL,
  `title` varchar(250) NOT NULL,
  `checkcount` bigint(11) NOT NULL DEFAULT '1',
  `poll_count` bigint(11) NOT NULL,
  `upload_target_srl` bigint(11) NOT NULL,
  `member_srl` bigint(11) NOT NULL,
  `ipaddress` varchar(128) NOT NULL,
  `regdate` varchar(14) DEFAULT NULL,
  `list_order` bigint(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 테이블 구조 `xe_sequence`
--

CREATE TABLE `xe_sequence` (
  `seq` bigint(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 테이블의 덤프 데이터 `xe_sequence`
--

INSERT INTO `xe_sequence` (`seq`) VALUES
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(9),
(10),
(11),
(12),
(13),
(14),
(15),
(16),
(17),
(18),
(19),
(20),
(21),
(22),
(23),
(24),
(25),
(26),
(27),
(28),
(29),
(30),
(31),
(32),
(33),
(34),
(35),
(36),
(37),
(38),
(39),
(40),
(41),
(42),
(43),
(44),
(45),
(46),
(47),
(48),
(49),
(50),
(51),
(52),
(53),
(54),
(55),
(56),
(57),
(58),
(59),
(60),
(61),
(62),
(63),
(64),
(65),
(66),
(67),
(68),
(69),
(70),
(71),
(72),
(73),
(74),
(75),
(76),
(77),
(78),
(79),
(80),
(81),
(82),
(83),
(84),
(85),
(86),
(87),
(88),
(89),
(90),
(91),
(92),
(93),
(94),
(95),
(96),
(97),
(98),
(99),
(100),
(101),
(102),
(103),
(104),
(105),
(106),
(107),
(108),
(109),
(110),
(111),
(112),
(113),
(114),
(115),
(116),
(117),
(118),
(119),
(120),
(121),
(122),
(123),
(124),
(125),
(126),
(127),
(128),
(129);

-- --------------------------------------------------------

--
-- 테이블 구조 `xe_session`
--

CREATE TABLE `xe_session` (
  `session_key` varchar(255) NOT NULL,
  `member_srl` bigint(11) NOT NULL,
  `expired` varchar(14) DEFAULT NULL,
  `val` longtext,
  `ipaddress` varchar(128) NOT NULL,
  `last_update` varchar(14) DEFAULT NULL,
  `cur_mid` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 테이블 구조 `xe_site_admin`
--

CREATE TABLE `xe_site_admin` (
  `site_srl` bigint(11) NOT NULL,
  `member_srl` bigint(11) NOT NULL,
  `regdate` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 테이블 구조 `xe_sites`
--

CREATE TABLE `xe_sites` (
  `site_srl` bigint(11) NOT NULL,
  `index_module_srl` bigint(11) DEFAULT '0',
  `domain` varchar(255) NOT NULL,
  `default_language` varchar(255) DEFAULT NULL,
  `regdate` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 테이블의 덤프 데이터 `xe_sites`
--

INSERT INTO `xe_sites` (`site_srl`, `index_module_srl`, `domain`, `default_language`, `regdate`) VALUES
(0, 66, '127.0.0.1:8080/xe/', 'ko', '20160816232814');

-- --------------------------------------------------------

--
-- 테이블 구조 `xe_spamfilter_denied_ip`
--

CREATE TABLE `xe_spamfilter_denied_ip` (
  `ipaddress` varchar(250) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `regdate` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 테이블 구조 `xe_spamfilter_denied_word`
--

CREATE TABLE `xe_spamfilter_denied_word` (
  `word` varchar(250) NOT NULL,
  `hit` bigint(20) NOT NULL DEFAULT '0',
  `latest_hit` varchar(14) DEFAULT NULL,
  `regdate` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 테이블 구조 `xe_spamfilter_log`
--

CREATE TABLE `xe_spamfilter_log` (
  `spamfilter_log_srl` bigint(11) NOT NULL,
  `ipaddress` varchar(250) NOT NULL,
  `regdate` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 테이블 구조 `xe_syndication_except_modules`
--

CREATE TABLE `xe_syndication_except_modules` (
  `module_srl` bigint(11) NOT NULL,
  `regdate` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 테이블 구조 `xe_syndication_logs`
--

CREATE TABLE `xe_syndication_logs` (
  `log_srl` bigint(11) NOT NULL,
  `module_srl` bigint(11) DEFAULT '0',
  `document_srl` bigint(11) DEFAULT '0',
  `title` varchar(255) DEFAULT NULL,
  `summary` varchar(255) DEFAULT NULL,
  `regdate` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 테이블 구조 `xe_tags`
--

CREATE TABLE `xe_tags` (
  `tag_srl` bigint(11) NOT NULL,
  `module_srl` bigint(11) NOT NULL DEFAULT '0',
  `document_srl` bigint(11) NOT NULL DEFAULT '0',
  `tag` varchar(240) NOT NULL,
  `regdate` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 테이블 구조 `xe_trash`
--

CREATE TABLE `xe_trash` (
  `trash_srl` bigint(11) NOT NULL,
  `title` varchar(250) DEFAULT NULL,
  `origin_module` varchar(250) NOT NULL DEFAULT 'document',
  `serialized_object` longtext NOT NULL,
  `description` text,
  `ipaddress` varchar(128) NOT NULL,
  `remover_srl` bigint(11) NOT NULL,
  `regdate` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 덤프된 테이블의 인덱스
--

--
-- 테이블의 인덱스 `account_info`
--
ALTER TABLE `account_info`
  ADD PRIMARY KEY (`memberSeq`);

--
-- 테이블의 인덱스 `account_info1`
--
ALTER TABLE `account_info1`
  ADD PRIMARY KEY (`memberSeq`);

--
-- 테이블의 인덱스 `arrival_info`
--
ALTER TABLE `arrival_info`
  ADD PRIMARY KEY (`arrivalSeq`);

--
-- 테이블의 인덱스 `board_info`
--
ALTER TABLE `board_info`
  ADD PRIMARY KEY (`boardSeq`);

--
-- 테이블의 인덱스 `bus_info`
--
ALTER TABLE `bus_info`
  ADD PRIMARY KEY (`busSeq`);

--
-- 테이블의 인덱스 `city_info`
--
ALTER TABLE `city_info`
  ADD PRIMARY KEY (`citySeq`);

--
-- 테이블의 인덱스 `mail_code`
--
ALTER TABLE `mail_code`
  ADD PRIMARY KEY (`codeSeq`);

--
-- 테이블의 인덱스 `sales_info`
--
ALTER TABLE `sales_info`
  ADD PRIMARY KEY (`salesSeq`);

--
-- 테이블의 인덱스 `univ_info`
--
ALTER TABLE `univ_info`
  ADD PRIMARY KEY (`univSeq`);

--
-- 테이블의 인덱스 `xe_action_forward`
--
ALTER TABLE `xe_action_forward`
  ADD UNIQUE KEY `idx_foward` (`act`);

--
-- 테이블의 인덱스 `xe_addons`
--
ALTER TABLE `xe_addons`
  ADD PRIMARY KEY (`addon`),
  ADD KEY `idx_regdate` (`regdate`);

--
-- 테이블의 인덱스 `xe_addons_site`
--
ALTER TABLE `xe_addons_site`
  ADD UNIQUE KEY `unique_addon_site` (`site_srl`,`addon`),
  ADD KEY `idx_regdate` (`regdate`);

--
-- 테이블의 인덱스 `xe_admin_favorite`
--
ALTER TABLE `xe_admin_favorite`
  ADD PRIMARY KEY (`admin_favorite_srl`);

--
-- 테이블의 인덱스 `xe_admin_log`
--
ALTER TABLE `xe_admin_log`
  ADD KEY `idx_admin_ip` (`ipaddress`),
  ADD KEY `idx_admin_date` (`regdate`);

--
-- 테이블의 인덱스 `xe_ai_installed_packages`
--
ALTER TABLE `xe_ai_installed_packages`
  ADD KEY `idx_package_srl` (`package_srl`);

--
-- 테이블의 인덱스 `xe_ai_remote_categories`
--
ALTER TABLE `xe_ai_remote_categories`
  ADD PRIMARY KEY (`category_srl`),
  ADD KEY `idx_parent_srl` (`parent_srl`),
  ADD KEY `idx_list_order` (`list_order`);

--
-- 테이블의 인덱스 `xe_autoinstall_packages`
--
ALTER TABLE `xe_autoinstall_packages`
  ADD UNIQUE KEY `unique_path` (`path`),
  ADD KEY `idx_package_srl` (`package_srl`),
  ADD KEY `idx_category_srl` (`category_srl`),
  ADD KEY `idx_regdate` (`updatedate`);

--
-- 테이블의 인덱스 `xe_comment_declared`
--
ALTER TABLE `xe_comment_declared`
  ADD PRIMARY KEY (`comment_srl`),
  ADD KEY `idx_declared_count` (`declared_count`);

--
-- 테이블의 인덱스 `xe_comment_declared_log`
--
ALTER TABLE `xe_comment_declared_log`
  ADD KEY `idx_comment_srl` (`comment_srl`),
  ADD KEY `idx_member_srl` (`member_srl`),
  ADD KEY `idx_ipaddress` (`ipaddress`),
  ADD KEY `idx_regdate` (`regdate`);

--
-- 테이블의 인덱스 `xe_comment_voted_log`
--
ALTER TABLE `xe_comment_voted_log`
  ADD KEY `idx_comment_srl` (`comment_srl`),
  ADD KEY `idx_member_srl` (`member_srl`),
  ADD KEY `idx_ipaddress` (`ipaddress`),
  ADD KEY `idx_regdate` (`regdate`);

--
-- 테이블의 인덱스 `xe_comments`
--
ALTER TABLE `xe_comments`
  ADD PRIMARY KEY (`comment_srl`),
  ADD UNIQUE KEY `idx_module_list_order` (`module_srl`,`list_order`),
  ADD KEY `idx_module_srl` (`module_srl`),
  ADD KEY `idx_document_srl` (`document_srl`),
  ADD KEY `idx_voted_count` (`voted_count`),
  ADD KEY `idx_blamed_count` (`blamed_count`),
  ADD KEY `idx_member_srl` (`member_srl`),
  ADD KEY `idx_uploaded_count` (`uploaded_count`),
  ADD KEY `idx_regdate` (`regdate`),
  ADD KEY `idx_last_update` (`last_update`),
  ADD KEY `idx_ipaddress` (`ipaddress`),
  ADD KEY `idx_list_order` (`list_order`),
  ADD KEY `idx_status` (`status`);

--
-- 테이블의 인덱스 `xe_comments_list`
--
ALTER TABLE `xe_comments_list`
  ADD PRIMARY KEY (`comment_srl`),
  ADD KEY `idx_list` (`document_srl`,`head`,`arrange`),
  ADD KEY `idx_date` (`module_srl`,`regdate`);

--
-- 테이블의 인덱스 `xe_counter_log`
--
ALTER TABLE `xe_counter_log`
  ADD KEY `idx_site_counter_log` (`site_srl`,`ipaddress`),
  ADD KEY `idx_counter_log` (`regdate`);

--
-- 테이블의 인덱스 `xe_counter_site_status`
--
ALTER TABLE `xe_counter_site_status`
  ADD UNIQUE KEY `site_status` (`site_srl`,`regdate`);

--
-- 테이블의 인덱스 `xe_counter_status`
--
ALTER TABLE `xe_counter_status`
  ADD PRIMARY KEY (`regdate`);

--
-- 테이블의 인덱스 `xe_document_aliases`
--
ALTER TABLE `xe_document_aliases`
  ADD PRIMARY KEY (`alias_srl`),
  ADD UNIQUE KEY `idx_module_title` (`module_srl`,`alias_title`),
  ADD KEY `idx_module_srl` (`module_srl`),
  ADD KEY `idx_document_srl` (`document_srl`),
  ADD KEY `idx_alias_title` (`alias_title`);

--
-- 테이블의 인덱스 `xe_document_categories`
--
ALTER TABLE `xe_document_categories`
  ADD PRIMARY KEY (`category_srl`),
  ADD KEY `idx_module_srl` (`module_srl`),
  ADD KEY `idx_regdate` (`regdate`);

--
-- 테이블의 인덱스 `xe_document_declared`
--
ALTER TABLE `xe_document_declared`
  ADD PRIMARY KEY (`document_srl`),
  ADD KEY `idx_declared_count` (`declared_count`);

--
-- 테이블의 인덱스 `xe_document_declared_log`
--
ALTER TABLE `xe_document_declared_log`
  ADD KEY `idx_document_srl` (`document_srl`),
  ADD KEY `idx_member_srl` (`member_srl`),
  ADD KEY `idx_ipaddress` (`ipaddress`),
  ADD KEY `idx_regdate` (`regdate`);

--
-- 테이블의 인덱스 `xe_document_extra_keys`
--
ALTER TABLE `xe_document_extra_keys`
  ADD UNIQUE KEY `unique_module_keys` (`module_srl`,`var_idx`);

--
-- 테이블의 인덱스 `xe_document_extra_vars`
--
ALTER TABLE `xe_document_extra_vars`
  ADD UNIQUE KEY `unique_extra_vars` (`module_srl`,`document_srl`,`var_idx`,`lang_code`),
  ADD KEY `idx_document_list_order` (`document_srl`,`module_srl`,`var_idx`);

--
-- 테이블의 인덱스 `xe_document_histories`
--
ALTER TABLE `xe_document_histories`
  ADD PRIMARY KEY (`history_srl`),
  ADD KEY `idx_module_srl` (`module_srl`),
  ADD KEY `idx_document_srl` (`document_srl`),
  ADD KEY `idx_regdate` (`regdate`),
  ADD KEY `idx_ipaddress` (`ipaddress`);

--
-- 테이블의 인덱스 `xe_document_readed_log`
--
ALTER TABLE `xe_document_readed_log`
  ADD KEY `idx_document_srl` (`document_srl`),
  ADD KEY `idx_member_srl` (`member_srl`),
  ADD KEY `idx_ipaddress` (`ipaddress`),
  ADD KEY `idx_regdate` (`regdate`);

--
-- 테이블의 인덱스 `xe_document_trash`
--
ALTER TABLE `xe_document_trash`
  ADD PRIMARY KEY (`trash_srl`),
  ADD KEY `idx_document_srl` (`document_srl`),
  ADD KEY `idx_module_srl` (`module_srl`),
  ADD KEY `idx_trash_date` (`trash_date`),
  ADD KEY `idx_ipaddress` (`ipaddress`),
  ADD KEY `idx_member_srl` (`member_srl`);

--
-- 테이블의 인덱스 `xe_document_voted_log`
--
ALTER TABLE `xe_document_voted_log`
  ADD KEY `idx_document_srl` (`document_srl`),
  ADD KEY `idx_member_srl` (`member_srl`),
  ADD KEY `idx_ipaddress` (`ipaddress`),
  ADD KEY `idx_regdate` (`regdate`);

--
-- 테이블의 인덱스 `xe_documents`
--
ALTER TABLE `xe_documents`
  ADD PRIMARY KEY (`document_srl`),
  ADD KEY `idx_module_srl` (`module_srl`),
  ADD KEY `idx_category_srl` (`category_srl`),
  ADD KEY `idx_is_notice` (`is_notice`),
  ADD KEY `idx_readed_count` (`readed_count`),
  ADD KEY `idx_voted_count` (`voted_count`),
  ADD KEY `idx_blamed_count` (`blamed_count`),
  ADD KEY `idx_comment_count` (`comment_count`),
  ADD KEY `idx_trackback_count` (`trackback_count`),
  ADD KEY `idx_uploaded_count` (`uploaded_count`),
  ADD KEY `idx_member_srl` (`member_srl`),
  ADD KEY `idx_regdate` (`regdate`),
  ADD KEY `idx_last_update` (`last_update`),
  ADD KEY `idx_ipaddress` (`ipaddress`),
  ADD KEY `idx_list_order` (`list_order`),
  ADD KEY `idx_update_order` (`update_order`),
  ADD KEY `idx_module_list_order` (`module_srl`,`list_order`),
  ADD KEY `idx_module_update_order` (`module_srl`,`update_order`),
  ADD KEY `idx_module_readed_count` (`module_srl`,`readed_count`),
  ADD KEY `idx_module_voted_count` (`module_srl`,`voted_count`),
  ADD KEY `idx_module_notice` (`module_srl`,`is_notice`),
  ADD KEY `idx_module_document_srl` (`module_srl`,`document_srl`),
  ADD KEY `idx_module_blamed_count` (`module_srl`,`blamed_count`),
  ADD KEY `idx_module_status` (`module_srl`,`status`);

--
-- 테이블의 인덱스 `xe_editor_autosave`
--
ALTER TABLE `xe_editor_autosave`
  ADD KEY `idx_member_srl` (`member_srl`),
  ADD KEY `idx_ipaddress` (`ipaddress`),
  ADD KEY `idx_module_srl` (`module_srl`),
  ADD KEY `idx_regdate` (`regdate`);

--
-- 테이블의 인덱스 `xe_editor_components`
--
ALTER TABLE `xe_editor_components`
  ADD PRIMARY KEY (`component_name`),
  ADD KEY `idx_list_order` (`list_order`);

--
-- 테이블의 인덱스 `xe_editor_components_site`
--
ALTER TABLE `xe_editor_components_site`
  ADD UNIQUE KEY `unique_component_site` (`site_srl`,`component_name`),
  ADD KEY `idx_list_order` (`list_order`);

--
-- 테이블의 인덱스 `xe_files`
--
ALTER TABLE `xe_files`
  ADD PRIMARY KEY (`file_srl`),
  ADD KEY `idx_upload_target_srl` (`upload_target_srl`),
  ADD KEY `idx_upload_target_type` (`upload_target_type`),
  ADD KEY `idx_module_srl` (`module_srl`),
  ADD KEY `idx_member_srl` (`member_srl`),
  ADD KEY `idx_download_count` (`download_count`),
  ADD KEY `idx_file_size` (`file_size`),
  ADD KEY `idx_is_valid` (`isvalid`),
  ADD KEY `idx_list_order` (`cover_image`),
  ADD KEY `idx_regdate` (`regdate`),
  ADD KEY `idx_ipaddress` (`ipaddress`);

--
-- 테이블의 인덱스 `xe_lang`
--
ALTER TABLE `xe_lang`
  ADD KEY `idx_lang` (`site_srl`,`name`,`lang_code`);

--
-- 테이블의 인덱스 `xe_layouts`
--
ALTER TABLE `xe_layouts`
  ADD PRIMARY KEY (`layout_srl`),
  ADD KEY `menu_site_srl` (`site_srl`),
  ADD KEY `idx_module_srl` (`module_srl`),
  ADD KEY `idx_regdate` (`regdate`);

--
-- 테이블의 인덱스 `xe_member`
--
ALTER TABLE `xe_member`
  ADD PRIMARY KEY (`member_srl`),
  ADD UNIQUE KEY `unique_user_id` (`user_id`),
  ADD UNIQUE KEY `unique_email_address` (`email_address`),
  ADD UNIQUE KEY `unique_nick_name` (`nick_name`),
  ADD KEY `idx_email_host` (`email_host`),
  ADD KEY `idx_allow_mailing` (`allow_mailing`),
  ADD KEY `idx_is_denied` (`denied`),
  ADD KEY `idx_regdate` (`regdate`),
  ADD KEY `idx_last_login` (`last_login`),
  ADD KEY `idx_is_admin` (`is_admin`),
  ADD KEY `idx_list_order` (`list_order`);

--
-- 테이블의 인덱스 `xe_member_auth_mail`
--
ALTER TABLE `xe_member_auth_mail`
  ADD UNIQUE KEY `unique_key` (`auth_key`,`member_srl`),
  ADD KEY `idx_regdate` (`regdate`);

--
-- 테이블의 인덱스 `xe_member_autologin`
--
ALTER TABLE `xe_member_autologin`
  ADD UNIQUE KEY `unique_key` (`autologin_key`,`member_srl`);

--
-- 테이블의 인덱스 `xe_member_count_history`
--
ALTER TABLE `xe_member_count_history`
  ADD PRIMARY KEY (`member_srl`),
  ADD KEY `idx_last_update` (`last_update`);

--
-- 테이블의 인덱스 `xe_member_denied_nick_name`
--
ALTER TABLE `xe_member_denied_nick_name`
  ADD PRIMARY KEY (`nick_name`);

--
-- 테이블의 인덱스 `xe_member_denied_user_id`
--
ALTER TABLE `xe_member_denied_user_id`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `idx_list_order` (`list_order`);

--
-- 테이블의 인덱스 `xe_member_friend`
--
ALTER TABLE `xe_member_friend`
  ADD PRIMARY KEY (`friend_srl`),
  ADD KEY `idx_friend_group_srl` (`friend_group_srl`),
  ADD KEY `idx_member_srl` (`member_srl`),
  ADD KEY `idx_target_srl` (`target_srl`),
  ADD KEY `idx_list_order` (`list_order`);

--
-- 테이블의 인덱스 `xe_member_friend_group`
--
ALTER TABLE `xe_member_friend_group`
  ADD PRIMARY KEY (`friend_group_srl`),
  ADD KEY `index_owner_member_srl` (`member_srl`);

--
-- 테이블의 인덱스 `xe_member_group`
--
ALTER TABLE `xe_member_group`
  ADD PRIMARY KEY (`group_srl`),
  ADD UNIQUE KEY `idx_site_title` (`site_srl`,`title`),
  ADD KEY `idx_list_order` (`list_order`);

--
-- 테이블의 인덱스 `xe_member_group_member`
--
ALTER TABLE `xe_member_group_member`
  ADD KEY `idx_site_srl` (`site_srl`),
  ADD KEY `idx_group_member` (`group_srl`,`member_srl`);

--
-- 테이블의 인덱스 `xe_member_join_form`
--
ALTER TABLE `xe_member_join_form`
  ADD PRIMARY KEY (`member_join_form_srl`),
  ADD KEY `idx_list_order` (`list_order`);

--
-- 테이블의 인덱스 `xe_member_login_count`
--
ALTER TABLE `xe_member_login_count`
  ADD KEY `idx_ipaddress` (`ipaddress`),
  ADD KEY `idx_regdate` (`regdate`),
  ADD KEY `idx_last_update` (`last_update`);

--
-- 테이블의 인덱스 `xe_member_message`
--
ALTER TABLE `xe_member_message`
  ADD PRIMARY KEY (`message_srl`),
  ADD KEY `idx_related_srl` (`related_srl`),
  ADD KEY `idx_sender_srl` (`sender_srl`),
  ADD KEY `idx_receiver_srl` (`receiver_srl`),
  ADD KEY `idx_list_order` (`list_order`);

--
-- 테이블의 인덱스 `xe_member_scrap`
--
ALTER TABLE `xe_member_scrap`
  ADD UNIQUE KEY `unique_scrap` (`member_srl`,`document_srl`),
  ADD KEY `idx_regdate` (`regdate`),
  ADD KEY `idx_list_order` (`list_order`);

--
-- 테이블의 인덱스 `xe_menu`
--
ALTER TABLE `xe_menu`
  ADD PRIMARY KEY (`menu_srl`),
  ADD KEY `menu_site_srl` (`site_srl`),
  ADD KEY `idx_title` (`title`),
  ADD KEY `idx_listorder` (`listorder`),
  ADD KEY `idx_regdate` (`regdate`);

--
-- 테이블의 인덱스 `xe_menu_item`
--
ALTER TABLE `xe_menu_item`
  ADD PRIMARY KEY (`menu_item_srl`),
  ADD KEY `idx_menu_srl` (`menu_srl`),
  ADD KEY `idx_listorder` (`listorder`),
  ADD KEY `idx_regdate` (`regdate`);

--
-- 테이블의 인덱스 `xe_menu_layout`
--
ALTER TABLE `xe_menu_layout`
  ADD PRIMARY KEY (`menu_srl`);

--
-- 테이블의 인덱스 `xe_module_admins`
--
ALTER TABLE `xe_module_admins`
  ADD UNIQUE KEY `unique_module_admin` (`module_srl`,`member_srl`),
  ADD KEY `idx_regdate` (`regdate`);

--
-- 테이블의 인덱스 `xe_module_categories`
--
ALTER TABLE `xe_module_categories`
  ADD PRIMARY KEY (`module_category_srl`),
  ADD KEY `idx_regdate` (`regdate`);

--
-- 테이블의 인덱스 `xe_module_config`
--
ALTER TABLE `xe_module_config`
  ADD PRIMARY KEY (`module`);

--
-- 테이블의 인덱스 `xe_module_extra_vars`
--
ALTER TABLE `xe_module_extra_vars`
  ADD UNIQUE KEY `unique_module_vars` (`module_srl`,`name`);

--
-- 테이블의 인덱스 `xe_module_filebox`
--
ALTER TABLE `xe_module_filebox`
  ADD PRIMARY KEY (`module_filebox_srl`),
  ADD KEY `idx_member_srl` (`member_srl`),
  ADD KEY `idx_fileextension` (`fileextension`);

--
-- 테이블의 인덱스 `xe_module_grants`
--
ALTER TABLE `xe_module_grants`
  ADD UNIQUE KEY `unique_module` (`module_srl`,`name`,`group_srl`);

--
-- 테이블의 인덱스 `xe_module_locks`
--
ALTER TABLE `xe_module_locks`
  ADD UNIQUE KEY `unique_lock_name` (`lock_name`),
  ADD KEY `idx_deadline` (`deadline`);

--
-- 테이블의 인덱스 `xe_module_mobile_skins`
--
ALTER TABLE `xe_module_mobile_skins`
  ADD UNIQUE KEY `unique_module_mobile_skins` (`module_srl`,`name`);

--
-- 테이블의 인덱스 `xe_module_part_config`
--
ALTER TABLE `xe_module_part_config`
  ADD KEY `idx_module_part_config` (`module`,`module_srl`);

--
-- 테이블의 인덱스 `xe_module_skins`
--
ALTER TABLE `xe_module_skins`
  ADD UNIQUE KEY `unique_module_skins` (`module_srl`,`name`);

--
-- 테이블의 인덱스 `xe_module_trigger`
--
ALTER TABLE `xe_module_trigger`
  ADD UNIQUE KEY `idx_trigger` (`trigger_name`,`called_position`,`module`,`type`,`called_method`);

--
-- 테이블의 인덱스 `xe_modules`
--
ALTER TABLE `xe_modules`
  ADD PRIMARY KEY (`module_srl`),
  ADD UNIQUE KEY `idx_site_mid` (`site_srl`,`mid`),
  ADD KEY `idx_module` (`module`),
  ADD KEY `idx_module_category` (`module_category_srl`);

--
-- 테이블의 인덱스 `xe_point`
--
ALTER TABLE `xe_point`
  ADD PRIMARY KEY (`member_srl`),
  ADD KEY `idx_point` (`point`);

--
-- 테이블의 인덱스 `xe_poll`
--
ALTER TABLE `xe_poll`
  ADD PRIMARY KEY (`poll_srl`),
  ADD KEY `idx_upload_target_srl` (`upload_target_srl`),
  ADD KEY `idx_member_srl` (`member_srl`),
  ADD KEY `idx_ipaddress` (`ipaddress`),
  ADD KEY `idx_regdate` (`regdate`),
  ADD KEY `idx_list_order` (`list_order`);

--
-- 테이블의 인덱스 `xe_poll_item`
--
ALTER TABLE `xe_poll_item`
  ADD PRIMARY KEY (`poll_item_srl`),
  ADD KEY `index_poll_srl` (`poll_srl`),
  ADD KEY `idx_poll_index_srl` (`poll_index_srl`),
  ADD KEY `idx_upload_target_srl` (`upload_target_srl`);

--
-- 테이블의 인덱스 `xe_poll_log`
--
ALTER TABLE `xe_poll_log`
  ADD KEY `idx_poll_srl` (`poll_srl`),
  ADD KEY `idx_member_srl` (`member_srl`),
  ADD KEY `idx_ipaddress` (`ipaddress`),
  ADD KEY `idx_regdate` (`regdate`);

--
-- 테이블의 인덱스 `xe_poll_title`
--
ALTER TABLE `xe_poll_title`
  ADD KEY `idx_poll_srl` (`poll_srl`,`poll_index_srl`),
  ADD KEY `idx_upload_target_srl` (`upload_target_srl`),
  ADD KEY `idx_member_srl` (`member_srl`),
  ADD KEY `idx_ipaddress` (`ipaddress`),
  ADD KEY `idx_regdate` (`regdate`),
  ADD KEY `idx_list_order` (`list_order`);

--
-- 테이블의 인덱스 `xe_sequence`
--
ALTER TABLE `xe_sequence`
  ADD PRIMARY KEY (`seq`);

--
-- 테이블의 인덱스 `xe_session`
--
ALTER TABLE `xe_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `idx_session_member_srl` (`member_srl`),
  ADD KEY `idx_session_expired` (`expired`),
  ADD KEY `idx_session_update` (`last_update`),
  ADD KEY `idx_session_cur_mid` (`cur_mid`),
  ADD KEY `idx_session_update_mid` (`member_srl`,`last_update`,`cur_mid`);

--
-- 테이블의 인덱스 `xe_site_admin`
--
ALTER TABLE `xe_site_admin`
  ADD UNIQUE KEY `idx_site_admin` (`site_srl`,`member_srl`);

--
-- 테이블의 인덱스 `xe_sites`
--
ALTER TABLE `xe_sites`
  ADD PRIMARY KEY (`site_srl`),
  ADD UNIQUE KEY `unique_domain` (`domain`);

--
-- 테이블의 인덱스 `xe_spamfilter_denied_ip`
--
ALTER TABLE `xe_spamfilter_denied_ip`
  ADD PRIMARY KEY (`ipaddress`),
  ADD KEY `idx_regdate` (`regdate`);

--
-- 테이블의 인덱스 `xe_spamfilter_denied_word`
--
ALTER TABLE `xe_spamfilter_denied_word`
  ADD PRIMARY KEY (`word`),
  ADD KEY `idx_hit` (`hit`),
  ADD KEY `idx_latest_hit` (`latest_hit`),
  ADD KEY `idx_regdate` (`regdate`);

--
-- 테이블의 인덱스 `xe_spamfilter_log`
--
ALTER TABLE `xe_spamfilter_log`
  ADD PRIMARY KEY (`spamfilter_log_srl`),
  ADD KEY `idx_ipaddress` (`ipaddress`),
  ADD KEY `idx_regdate` (`regdate`);

--
-- 테이블의 인덱스 `xe_syndication_except_modules`
--
ALTER TABLE `xe_syndication_except_modules`
  ADD PRIMARY KEY (`module_srl`);

--
-- 테이블의 인덱스 `xe_syndication_logs`
--
ALTER TABLE `xe_syndication_logs`
  ADD UNIQUE KEY `primary_key` (`log_srl`),
  ADD KEY `idx_regdate` (`regdate`);

--
-- 테이블의 인덱스 `xe_tags`
--
ALTER TABLE `xe_tags`
  ADD PRIMARY KEY (`tag_srl`),
  ADD KEY `idx_module_srl` (`module_srl`),
  ADD KEY `idx_document_srl` (`document_srl`),
  ADD KEY `idx_regdate` (`regdate`),
  ADD KEY `idx_tag` (`document_srl`,`tag`);

--
-- 테이블의 인덱스 `xe_trash`
--
ALTER TABLE `xe_trash`
  ADD PRIMARY KEY (`trash_srl`),
  ADD KEY `idx_regdate` (`regdate`);

--
-- 덤프된 테이블의 AUTO_INCREMENT
--

--
-- 테이블의 AUTO_INCREMENT `account_info`
--
ALTER TABLE `account_info`
  MODIFY `memberSeq` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- 테이블의 AUTO_INCREMENT `account_info1`
--
ALTER TABLE `account_info1`
  MODIFY `memberSeq` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;
--
-- 테이블의 AUTO_INCREMENT `arrival_info`
--
ALTER TABLE `arrival_info`
  MODIFY `arrivalSeq` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- 테이블의 AUTO_INCREMENT `board_info`
--
ALTER TABLE `board_info`
  MODIFY `boardSeq` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- 테이블의 AUTO_INCREMENT `bus_info`
--
ALTER TABLE `bus_info`
  MODIFY `busSeq` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- 테이블의 AUTO_INCREMENT `city_info`
--
ALTER TABLE `city_info`
  MODIFY `citySeq` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- 테이블의 AUTO_INCREMENT `mail_code`
--
ALTER TABLE `mail_code`
  MODIFY `codeSeq` int(11) NOT NULL AUTO_INCREMENT COMMENT '시퀀스';
--
-- 테이블의 AUTO_INCREMENT `sales_info`
--
ALTER TABLE `sales_info`
  MODIFY `salesSeq` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
--
-- 테이블의 AUTO_INCREMENT `univ_info`
--
ALTER TABLE `univ_info`
  MODIFY `univSeq` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- 테이블의 AUTO_INCREMENT `xe_sequence`
--
ALTER TABLE `xe_sequence`
  MODIFY `seq` bigint(64) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=130;--
-- 데이터베이스: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
