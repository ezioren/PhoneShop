-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: 2019-01-31 17:30:38
-- 服务器版本： 5.7.25-0ubuntu0.18.04.2
-- PHP Version: 7.2.10-0ubuntu0.18.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ps`
--

-- --------------------------------------------------------

--
-- 表的结构 `app_goodsinfo`
--

CREATE TABLE `app_goodsinfo` (
  `id` int(11) NOT NULL,
  `g_id` varchar(20) NOT NULL,
  `g_name` varchar(30) NOT NULL,
  `g_pic` varchar(30) NOT NULL,
  `g_jianjie` varchar(200) NOT NULL,
  `g_color` varchar(10) NOT NULL,
  `g_colorType` varchar(20) NOT NULL,
  `g_version` varchar(30) NOT NULL,
  `g_type` varchar(30) NOT NULL,
  `g_price` decimal(5,2) NOT NULL,
  `g_click` int(11) NOT NULL,
  `g_kucun` int(11) NOT NULL,
  `g_isDelete` tinyint(1) NOT NULL,
  `g_cp_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `app_goodsinfo`
--

INSERT INTO `app_goodsinfo` (`id`, `g_id`, `g_name`, `g_pic`, `g_jianjie`, `g_color`, `g_colorType`, `g_version`, `g_type`, `g_price`, `g_click`, `g_kucun`, `g_isDelete`, `g_cp_id`) VALUES
(1, 'XM#0001', '红米6', 'xiaomi6_pink', '小屏高性能的双摄手机,后置1200万,AI双摄,12nm八核处理器,AI,人脸解锁', '#E5BDBD', '樱花粉', '4GB+64GB', 'SmallScreen', '799.00', 1, 100, 0, 1),
(2, 'XM#0001', '红米6', 'xiaomi6_jing', '小屏高性能的双摄手机,后置1200万,AI双摄,12nm八核处理器,AI,人脸解锁', '#DFCAB0', '流沙金', '4GB+64GB', 'SmallScreen', '799.00', 1, 100, 0, 1),
(3, 'XM#0001', '红米6', 'xiaomi6_pink', '小屏高性能的双摄手机,后置1200万,AI双摄,12nm八核处理器,AI,人脸解锁', '#E5BDBD', '樱花粉', '3GB+32GB', 'SmallScreen', '799.00', 1, 100, 0, 1),
(4, 'XM#0001', '红米6', 'xiaomi6_jing', '小屏高性能的双摄手机,后置1200万,AI双摄,12nm八核处理器,AI,人脸解锁', '#DFCAB0', '流沙金', '3GB+32GB', 'SmallScreen', '799.00', 1, 100, 0, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `app_goodsinfo`
--
ALTER TABLE `app_goodsinfo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `app_goodsinfo_g_cp_id_69ad96d0_fk_app_companyinfo_id` (`g_cp_id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `app_goodsinfo`
--
ALTER TABLE `app_goodsinfo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- 限制导出的表
--

--
-- 限制表 `app_goodsinfo`
--
ALTER TABLE `app_goodsinfo`
  ADD CONSTRAINT `app_goodsinfo_g_cp_id_69ad96d0_fk_app_companyinfo_id` FOREIGN KEY (`g_cp_id`) REFERENCES `app_companyinfo` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
