-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 15, 2021 at 07:57 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hotel_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `checked`
--

CREATE TABLE `checked` (
  `id` int(30) NOT NULL,
  `ref_no` varchar(100) NOT NULL,
  `room_id` int(30) NOT NULL,
  `name` text NOT NULL,
  `contact_no` varchar(20) NOT NULL,
  `date_in` datetime NOT NULL,
  `date_out` datetime NOT NULL,
  `booked_cid` int(30) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 = pending, 1=checked in , 2 = checked out',
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `checked`
--

INSERT INTO `checked` (`id`, `ref_no`, `room_id`, `name`, `contact_no`, `date_in`, `date_out`, `booked_cid`, `status`, `date_updated`) VALUES
(4, '0000\n', 1, 'John Smith', '+14526-5455-44', '2020-09-19 11:48:09', '2020-09-22 11:48:09', 0, 2, '2020-09-19 13:11:34'),
(5, '9564082520\n', 1, 'John Smith', '+14526-5455-44', '2020-09-19 11:48:33', '2020-09-22 11:48:33', 0, 2, '2020-09-19 13:12:19'),
(6, '2765813481\n', 1, 'asdasd asdas as', '8747808787', '2020-09-19 13:16:00', '2020-09-24 13:16:00', 0, 2, '2020-09-19 13:43:21'),
(7, '4392831400\n', 3, 'Sample', '5205525544', '2020-09-19 13:00:00', '2020-09-23 13:00:00', 0, 2, '2020-09-19 16:00:55'),
(10, '6479004224\n', 1, 'John Smith', '+14526-5455-44', '2020-09-23 10:31:00', '2020-09-29 10:31:00', 3, 1, '2020-09-19 16:39:59'),
(11, '5414167556\n', 4, 'Dion Tambunan', '0812345678912', '2021-10-24 16:28:00', '2021-10-27 16:28:00', 3, 2, '2021-10-24 18:31:09'),
(12, '3661059209\n', 3, '', '', '2021-10-24 13:30:00', '2021-10-25 13:30:00', 0, 2, '2021-11-13 00:18:28'),
(13, '6688876890\n', 0, 'Caca', '0812345678912', '2021-11-12 18:14:00', '2021-11-15 18:14:00', 3, 0, '2021-11-13 00:14:54'),
(14, '253274753\n', 0, 'Asasa', '+62 21 57999999', '2021-11-12 18:16:00', '2021-11-15 18:16:00', 2, 0, '2021-11-13 00:16:27'),
(15, '4166705060\n', 0, 'Asasa', '0812345678912', '2021-11-12 18:17:00', '2021-11-15 18:17:00', 2, 0, '2021-11-13 00:18:04'),
(16, '3166296393\n', 0, 'ADDDDD', '+62 21 57999999', '2021-11-12 18:18:00', '2021-11-15 18:18:00', 3, 0, '2021-11-13 00:18:51'),
(17, '9971869964\n', 0, 'Tamb', '08888888888', '2021-11-24 23:28:00', '2021-11-27 23:28:00', 3, 0, '2021-11-13 05:28:32'),
(18, '8517689137\n', 0, 'Jojo', '123456666', '2021-11-14 21:03:00', '2021-11-17 21:03:00', 3, 0, '2021-11-15 03:03:34');

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_user` int(11) NOT NULL,
  `nama_user` varchar(100) NOT NULL,
  `email_user` varchar(50) NOT NULL,
  `password_user` varchar(100) NOT NULL,
  `kontak_user` varchar(25) NOT NULL,
  `alamat_user` text NOT NULL,
  `tgl_daftar` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`id_user`, `nama_user`, `email_user`, `password_user`, `kontak_user`, `alamat_user`, `tgl_daftar`) VALUES
(1, 'Dion', 'diontambz@gmail.com', '123', '081111111111', '', '2021-11-15 00:39:53'),
(2, 'Yanto', 'yanto@gmail.com', '321', '0822222222', '', '2021-11-15 00:39:53'),
(4, 'Budi', 'budi@gmail.com', '321', '0822222222', 'Jalan Merpati No 2', '2021-11-15 01:38:58');

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id_pembayaran` int(11) NOT NULL,
  `nama` int(11) NOT NULL,
  `id_pembelian` int(11) NOT NULL,
  `via` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `tanggal` int(11) NOT NULL,
  `bukti` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `id` int(30) NOT NULL,
  `room` varchar(30) NOT NULL,
  `category_id` int(30) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 = Available , 1= Unvailables'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`id`, `room`, `category_id`, `status`) VALUES
(1, 'Room-101', 3, 1),
(3, 'Room-102', 2, 0),
(4, 'Room-103', 3, 0);

-- --------------------------------------------------------

--
-- Table structure for table `room_categories`
--

CREATE TABLE `room_categories` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `price` float NOT NULL,
  `cover_img` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `room_categories`
--

INSERT INTO `room_categories` (`id`, `name`, `price`, `cover_img`) VALUES
(2, 'Deluxe Room', 5500, '1600480260_4.jpg'),
(3, 'Single Room', 1300, '1600480680_2.jpg'),
(4, 'Family Room', 3700, '1600480680_room-1.jpg'),
(6, 'Twin Bed Room', 2200, '1600482780_3.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `system_settings`
--

CREATE TABLE `system_settings` (
  `id` int(30) NOT NULL,
  `hotel_name` text NOT NULL,
  `email` varchar(200) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `cover_img` text NOT NULL,
  `about_content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `system_settings`
--

INSERT INTO `system_settings` (`id`, `hotel_name`, `email`, `contact`, `cover_img`, `about_content`) VALUES
(1, 'Grand Amethyst', 'info@grandamethyst.com', '+62 21 57999999', '1600478940_hotel-cover.jpg', '&lt;h1 style=&quot;text-align: center; background: transparent; position: relative;&quot;&gt;&lt;p&gt;&lt;/p&gt;&lt;p style=&quot;text-align: center; background: transparent; position: relative;&quot;&gt;&lt;/p&gt;&lt;h2 style=&quot;text-align: center; background: transparent; position: relative; font-size: 20px;&quot;&gt;&lt;span style=&quot;color: rgb(33, 37, 41); font-family: Merriweather, -apple-system, BlinkMacSystemFont, &amp;quot;Segoe UI&amp;quot;, Roboto, &amp;quot;Helvetica Neue&amp;quot;, Arial, &amp;quot;Noto Sans&amp;quot;, sans-serif, &amp;quot;Apple Color Emoji&amp;quot;, &amp;quot;Segoe UI Emoji&amp;quot;, &amp;quot;Segoe UI Symbol&amp;quot;, &amp;quot;Noto Color Emoji&amp;quot;; font-size: 20px; text-align: left;&quot;&gt;&lt;b style=&quot;color: rgb(33, 37, 41); font-family: Merriweather, -apple-system, BlinkMacSystemFont, &amp;quot;Segoe UI&amp;quot;, Roboto, &amp;quot;Helvetica Neue&amp;quot;, Arial, &amp;quot;Noto Sans&amp;quot;, sans-serif, &amp;quot;Apple Color Emoji&amp;quot;, &amp;quot;Segoe UI Emoji&amp;quot;, &amp;quot;Segoe UI Symbol&amp;quot;, &amp;quot;Noto Color Emoji&amp;quot;; font-size: 20px; text-align: left;&quot;&gt;Grand Amethyst &lt;/b&gt;dengan bangga disandang oleh koleksi properti terkemuka yang terus bertambah di seluruh penjuru kota di Indonesia dan Asia. Sebagai grup hotel mewah baru di Indonesia, kami berkomitmen untuk menyediakan perjalanan tak terlupakan bagi para tamu kami yang terinspirasi oleh gaya Eropa yang indah. Kami percaya hidup harus dijalani dengan gaya.&lt;/span&gt;&lt;/h2&gt;&lt;h2 style=&quot;text-align: center; background: transparent; position: relative; font-size: 20px;&quot;&gt;&lt;span style=&quot;color: rgb(33, 37, 41); font-family: Merriweather, -apple-system, BlinkMacSystemFont, &amp;quot;Segoe UI&amp;quot;, Roboto, &amp;quot;Helvetica Neue&amp;quot;, Arial, &amp;quot;Noto Sans&amp;quot;, sans-serif, &amp;quot;Apple Color Emoji&amp;quot;, &amp;quot;Segoe UI Emoji&amp;quot;, &amp;quot;Segoe UI Symbol&amp;quot;, &amp;quot;Noto Color Emoji&amp;quot;; font-size: 20px; text-align: left;&quot;&gt;&lt;br&gt;&lt;/span&gt;&lt;h2&gt;&lt;span style=&quot;color: rgb(33, 37, 41); font-family: Merriweather, -apple-system, BlinkMacSystemFont, &amp;quot;Segoe UI&amp;quot;, Roboto, &amp;quot;Helvetica Neue&amp;quot;, Arial, &amp;quot;Noto Sans&amp;quot;, sans-serif, &amp;quot;Apple Color Emoji&amp;quot;, &amp;quot;Segoe UI Emoji&amp;quot;, &amp;quot;Segoe UI Symbol&amp;quot;, &amp;quot;Noto Color Emoji&amp;quot;; font-size: 20px; text-align: left; background-color: transparent;&quot;&gt;Setiap tahun, semakin banyak tamu yang datang untuk menghargai kualitas ini, karena Grand Amethyst menambahkan destinasi baru yang menarik di Indonesia dan Asia. Sementara pertumbuhan ini mencerminkan kekuatan dan kesuksesan merek Grand Amethyst, koleksinya akan tetap terbatas, di mana eksklusivitas dapat dipelihara dan individualitas dapat berkembang.&amp;nbsp;&lt;/span&gt;&lt;/h2&gt;&lt;h2&gt;&lt;span style=&quot;color: rgb(33, 37, 41); font-family: Merriweather, -apple-system, BlinkMacSystemFont, &amp;quot;Segoe UI&amp;quot;, Roboto, &amp;quot;Helvetica Neue&amp;quot;, Arial, &amp;quot;Noto Sans&amp;quot;, sans-serif, &amp;quot;Apple Color Emoji&amp;quot;, &amp;quot;Segoe UI Emoji&amp;quot;, &amp;quot;Segoe UI Symbol&amp;quot;, &amp;quot;Noto Color Emoji&amp;quot;; font-size: 20px; text-align: left; background-color: transparent;&quot;&gt;&lt;br&gt;&lt;/span&gt;&lt;h2&gt;&lt;span style=&quot;background-color: transparent; color: rgb(33, 37, 41); font-family: Merriweather, -apple-system, BlinkMacSystemFont, &amp;quot;Segoe UI&amp;quot;, Roboto, &amp;quot;Helvetica Neue&amp;quot;, Arial, &amp;quot;Noto Sans&amp;quot;, sans-serif, &amp;quot;Apple Color Emoji&amp;quot;, &amp;quot;Segoe UI Emoji&amp;quot;, &amp;quot;Segoe UI Symbol&amp;quot;, &amp;quot;Noto Color Emoji&amp;quot;; font-size: 20px; text-align: left;&quot;&gt;Kami percaya bahwa warisan Eropa yang bergengsi menempatkan Grand Amethyst pada posisi yang unik untuk memenuhi harapan para pelancong yang penuh gaya dan cerdas. Bukan hanya sekadar menyediakan tempat tidur hotel dan makanan, di Grand Amethyst ini semua tentang menghidupkan cerita.&lt;/span&gt;&lt;/h2&gt;&lt;h2&gt;&lt;span style=&quot;background-color: transparent; color: rgb(33, 37, 41); font-family: Merriweather, -apple-system, BlinkMacSystemFont, &amp;quot;Segoe UI&amp;quot;, Roboto, &amp;quot;Helvetica Neue&amp;quot;, Arial, &amp;quot;Noto Sans&amp;quot;, sans-serif, &amp;quot;Apple Color Emoji&amp;quot;, &amp;quot;Segoe UI Emoji&amp;quot;, &amp;quot;Segoe UI Symbol&amp;quot;, &amp;quot;Noto Color Emoji&amp;quot;; font-size: 20px; text-align: left;&quot;&gt;&lt;br&gt;&lt;/span&gt;&lt;span style=&quot;color: rgb(33, 37, 41); font-family: Merriweather, -apple-system, BlinkMacSystemFont, &amp;quot;Segoe UI&amp;quot;, Roboto, &amp;quot;Helvetica Neue&amp;quot;, Arial, &amp;quot;Noto Sans&amp;quot;, sans-serif, &amp;quot;Apple Color Emoji&amp;quot;, &amp;quot;Segoe UI Emoji&amp;quot;, &amp;quot;Segoe UI Symbol&amp;quot;, &amp;quot;Noto Color Emoji&amp;quot;; font-size: 20px; text-align: left;&quot;&gt;Sejak 2019, karyawan kami telah menjadi bagian dari penciptaan sejarah di seluruh dunia. Dari bangunan bersejarah hingga arsitektur modern paling avant-garde, properti kami adalah tempat untuk beberapa momen terbesar dalam hidup. Kami telah menyaksikan pertemuan bersejarah antara para pemimpin dunia, selebritas yang berlindung di dunia privasi yang kami ciptakan untuk mereka, dan menciptakan kenangan luar biasa bagi para tamu dalam perjalanan &rsquo;sekali seumur hidup&rsquo;.&lt;br&gt;&lt;/span&gt;&lt;span style=&quot;color: rgb(33, 37, 41); font-family: Merriweather, -apple-system, BlinkMacSystemFont, &amp;quot;Segoe UI&amp;quot;, Roboto, &amp;quot;Helvetica Neue&amp;quot;, Arial, &amp;quot;Noto Sans&amp;quot;, sans-serif, &amp;quot;Apple Color Emoji&amp;quot;, &amp;quot;Segoe UI Emoji&amp;quot;, &amp;quot;Segoe UI Symbol&amp;quot;, &amp;quot;Noto Color Emoji&amp;quot;; font-size: 20px; text-align: left;&quot;&gt;&lt;br&gt;&lt;/span&gt;&lt;/h2&gt;&lt;h2&gt;&lt;span style=&quot;color: rgb(33, 37, 41); font-family: Merriweather, -apple-system, BlinkMacSystemFont, &amp;quot;Segoe UI&amp;quot;, Roboto, &amp;quot;Helvetica Neue&amp;quot;, Arial, &amp;quot;Noto Sans&amp;quot;, sans-serif, &amp;quot;Apple Color Emoji&amp;quot;, &amp;quot;Segoe UI Emoji&amp;quot;, &amp;quot;Segoe UI Symbol&amp;quot;, &amp;quot;Noto Color Emoji&amp;quot;; font-size: 20px; text-align: left;&quot;&gt;Kami dengan sepenuh hati berkomitmen untuk memberikan kesempurnaan bagi para tamu kami di setiap saat dan dalam segala hal. Mungkin itu sesuatu yang mengubah hidup seperti perayaan pernikahan, di mana perhatian kami terhadap detail dan layanan sempurna berarti bahwa hari istimewa Anda berjalan tanpa hambatan. Atau mungkin sesederhana catatan yang tertinggal di bantal Anda di malam hari, yang dengan cermat memberi tahu Anda cuaca besok sehingga Anda tahu cara berpakaian di pagi hari. Di Grand Amethyst, kami masing-masing secara pribadi bertanggung jawab untuk menciptakan pengalaman yang kaya dan bermakna bagi para tamu kami.&lt;/span&gt;&lt;/h2&gt;&lt;/h2&gt;&lt;/h2&gt;&lt;p&gt;&lt;/p&gt;&lt;p&gt;&lt;/p&gt;&lt;p&gt;&lt;/p&gt;&lt;/h1&gt;');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(30) NOT NULL,
  `name` varchar(200) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(200) NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 2 COMMENT '1=admin , 2 = staff'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `password`, `type`) VALUES
(1, 'Administrator', 'admin', 'admin123', 1),
(6, 'Admin', 'admin', 'admin123', 1),
(7, '', 'dion', '86974fc9f4de093dd28f5bb2131b3cc4', 2);

-- --------------------------------------------------------

--
-- Table structure for table `usertable`
--

CREATE TABLE `usertable` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `code` mediumint(50) NOT NULL,
  `status` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `usertable`
--

INSERT INTO `usertable` (`id`, `name`, `email`, `password`, `code`, `status`) VALUES
(3, 'Dion', 'diontambz@gmail.com', '$2y$10$U5roe9heV2XTeZ.WAQJEAuFGSKNaJnQACsW6apRihoWziRidPQ/3u', 0, 'verified'),
(4, 'Yanto', 'dionsandytambz@gmail.com', '$2y$10$fHrQmYx10jsteKFtFL/Xhu3jTcSyfqEYaPDcXXlttj2BjjgIyfz5S', 696557, 'notverified');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `checked`
--
ALTER TABLE `checked`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id_user`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `room_categories`
--
ALTER TABLE `room_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_settings`
--
ALTER TABLE `system_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `usertable`
--
ALTER TABLE `usertable`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `checked`
--
ALTER TABLE `checked`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `room_categories`
--
ALTER TABLE `room_categories`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `system_settings`
--
ALTER TABLE `system_settings`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `usertable`
--
ALTER TABLE `usertable`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
