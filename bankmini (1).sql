-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 29, 2019 at 10:57 AM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 5.6.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bankmini`
--

-- --------------------------------------------------------

--
-- Table structure for table `gammu`
--

CREATE TABLE `gammu` (
  `Version` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `gammu`
--

INSERT INTO `gammu` (`Version`) VALUES
(11);

-- --------------------------------------------------------

--
-- Table structure for table `inbox`
--

CREATE TABLE `inbox` (
  `UpdatedInDB` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ReceivingDateTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Text` text NOT NULL,
  `SenderNumber` varchar(20) NOT NULL DEFAULT '',
  `Coding` enum('Default_No_Compression','Unicode_No_Compression','8bit','Default_Compression','Unicode_Compression') NOT NULL DEFAULT 'Default_No_Compression',
  `UDH` text NOT NULL,
  `SMSCNumber` varchar(20) NOT NULL DEFAULT '',
  `Class` int(11) NOT NULL DEFAULT '-1',
  `TextDecoded` text NOT NULL,
  `ID` int(10) UNSIGNED NOT NULL,
  `RecipientID` text NOT NULL,
  `Processed` enum('false','true') NOT NULL DEFAULT 'false'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `inbox`
--

INSERT INTO `inbox` (`UpdatedInDB`, `ReceivingDateTime`, `Text`, `SenderNumber`, `Coding`, `UDH`, `SMSCNumber`, `Class`, `TextDecoded`, `ID`, `RecipientID`, `Processed`) VALUES
('2018-10-05 08:19:50', '2018-10-03 09:10:20', '0053006100680061006200610074002C00700061007300740069006B0061006E0020006E006F006D006F00720020006B0061006D0075002000730075006400610068002000740065007200640061006600740061007200200075006E00740075006B00200074006500720075007300200064007000740020006D0065006E0069006B006D0061007400690020006C006100790061006E0061006E0020006B0061006D0069002E004B006500740069006B0020004E0049004B0023004E006F002E004B004B00230020006B006900720069006D00200053004D00530020006B006500200034003400340034002E0041006200610069006B0061006E00200053004D005300200069006E00690020006A0069006B006100200073007500640061006800200072006500670069007300740072006100730069', 'INDOSAT', 'Default_No_Compression', '', '+62816124', -1, 'Sahabat,pastikan nomor kamu sudah terdaftar untuk terus dpt menikmati layanan kami.Ketik NIK#No.KK# kirim SMS ke 4444.Abaikan SMS ini jika sudah registrasi', 1, 'teslah', 'false'),
('2018-10-05 08:54:20', '2018-10-05 08:19:58', '004B0061006D007500200062006100720075002000730061006A006100200053004D0053002000670061006B002000680061006200690073002D006800610062006900730020006B0065002000530065006D007500610020004F00700065007200610074006F0072002E0020005300690073006100200062006F006E007500730020003900200053004D005300200073002E0064002E002000700075006B0075006C002000320034003A00300030002E002000430065006B00200062006F006E007500730020002A003500350035002A00370023002E002000410079006F00200053004D00530020006C006100670069002C002000640069006A0061006D0069006E00200062006500620061007300200053004D0053002000640067006E00200049004D00330020004F006F007200650064006F006F0021', 'INDOSAT', 'Default_No_Compression', '', '+62816124', -1, 'Kamu baru saja SMS gak habis-habis ke Semua Operator. Sisa bonus 9 SMS s.d. pukul 24:00. Cek bonus *555*7#. Ayo SMS lagi, dijamin bebas SMS dgn IM3 Ooredoo!', 2, 'jita', 'false'),
('2018-10-05 10:10:25', '2018-10-05 10:10:18', '004B0061006D007500200062006100720075002000730061006A006100200053004D0053002000670061006B002000680061006200690073002D006800610062006900730020006B006500200049004D00330020004F006F007200650064006F006F002E0020005300690073006100200062006F006E00750073002000390039003900200053004D005300200073002E0064002E002000700075006B0075006C002000320034003A00300030002E002000430065006B00200062006F006E007500730020002A003500350035002A00370023002E002000410079006F00200053004D00530020006C006100670069002C002000640069006A0061006D0069006E00200062006500620061007300200053004D0053002000640067006E00200049004D00330020004F006F007200650064006F006F0021', 'INDOSAT', 'Default_No_Compression', '', '+62816124', -1, 'Kamu baru saja SMS gak habis-habis ke IM3 Ooredoo. Sisa bonus 999 SMS s.d. pukul 24:00. Cek bonus *555*7#. Ayo SMS lagi, dijamin bebas SMS dgn IM3 Ooredoo!', 3, 'bank', 'false');

-- --------------------------------------------------------

--
-- Table structure for table `outbox`
--

CREATE TABLE `outbox` (
  `UpdatedInDB` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `InsertIntoDB` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `SendingDateTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Text` text,
  `DestinationNumber` varchar(20) NOT NULL DEFAULT '',
  `Coding` enum('Default_No_Compression','Unicode_No_Compression','8bit','Default_Compression','Unicode_Compression') NOT NULL DEFAULT 'Default_No_Compression',
  `UDH` text,
  `Class` int(11) DEFAULT '-1',
  `TextDecoded` text NOT NULL,
  `ID` int(10) UNSIGNED NOT NULL,
  `MultiPart` enum('false','true') DEFAULT 'false',
  `RelativeValidity` int(11) DEFAULT '-1',
  `SenderID` varchar(255) DEFAULT NULL,
  `SendingTimeOut` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `DeliveryReport` enum('default','yes','no') DEFAULT 'default',
  `CreatorID` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `outbox`
--

INSERT INTO `outbox` (`UpdatedInDB`, `InsertIntoDB`, `SendingDateTime`, `Text`, `DestinationNumber`, `Coding`, `UDH`, `Class`, `TextDecoded`, `ID`, `MultiPart`, `RelativeValidity`, `SenderID`, `SendingTimeOut`, `DeliveryReport`, `CreatorID`) VALUES
('2018-10-05 09:05:59', '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, '085878661836', 'Default_No_Compression', NULL, -1, 'wedusss', 21, 'false', -1, 'teslah', '0000-00-00 00:00:00', 'default', 'Gammu 1.28.90'),
('2018-10-05 08:15:10', '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, '085878661836', 'Default_No_Compression', NULL, -1, 'sdsdsdsdsdsdsd', 17, 'false', -1, 'teslah', '0000-00-00 00:00:00', 'default', 'Gammu 1.28.90');

-- --------------------------------------------------------

--
-- Table structure for table `outbox_multipart`
--

CREATE TABLE `outbox_multipart` (
  `Text` text,
  `Coding` enum('Default_No_Compression','Unicode_No_Compression','8bit','Default_Compression','Unicode_Compression') NOT NULL DEFAULT 'Default_No_Compression',
  `UDH` text,
  `Class` int(11) DEFAULT '-1',
  `TextDecoded` text,
  `ID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `SequencePosition` int(11) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pbk`
--

CREATE TABLE `pbk` (
  `ID` int(11) NOT NULL,
  `GroupID` int(11) NOT NULL DEFAULT '-1',
  `Name` text NOT NULL,
  `Number` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pbk_groups`
--

CREATE TABLE `pbk_groups` (
  `Name` text NOT NULL,
  `ID` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `phones`
--

CREATE TABLE `phones` (
  `ID` text NOT NULL,
  `UpdatedInDB` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `InsertIntoDB` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `TimeOut` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Send` enum('yes','no') NOT NULL DEFAULT 'no',
  `Receive` enum('yes','no') NOT NULL DEFAULT 'no',
  `IMEI` varchar(35) NOT NULL,
  `Client` text NOT NULL,
  `Battery` int(11) NOT NULL DEFAULT '0',
  `Signal` int(11) NOT NULL DEFAULT '0',
  `Sent` int(11) NOT NULL DEFAULT '0',
  `Received` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `phones`
--

INSERT INTO `phones` (`ID`, `UpdatedInDB`, `InsertIntoDB`, `TimeOut`, `Send`, `Receive`, `IMEI`, `Client`, `Battery`, `Signal`, `Sent`, `Received`) VALUES
('bank', '2018-10-05 11:23:21', '2018-10-05 10:15:06', '2018-10-05 11:23:31', 'yes', 'yes', '355435041364810', 'Gammu 1.28.90, Windows Server 2007, GCC 4.4, MinGW 3.13', 100, 45, 6, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sentitems`
--

CREATE TABLE `sentitems` (
  `UpdatedInDB` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `InsertIntoDB` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `SendingDateTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `DeliveryDateTime` timestamp NULL DEFAULT NULL,
  `Text` text NOT NULL,
  `DestinationNumber` varchar(20) NOT NULL DEFAULT '',
  `Coding` enum('Default_No_Compression','Unicode_No_Compression','8bit','Default_Compression','Unicode_Compression') NOT NULL DEFAULT 'Default_No_Compression',
  `UDH` text NOT NULL,
  `SMSCNumber` varchar(20) NOT NULL DEFAULT '',
  `Class` int(11) NOT NULL DEFAULT '-1',
  `TextDecoded` text NOT NULL,
  `ID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `SenderID` varchar(255) NOT NULL,
  `SequencePosition` int(11) NOT NULL DEFAULT '1',
  `Status` enum('SendingOK','SendingOKNoReport','SendingError','DeliveryOK','DeliveryFailed','DeliveryPending','DeliveryUnknown','Error') NOT NULL DEFAULT 'SendingOK',
  `StatusError` int(11) NOT NULL DEFAULT '-1',
  `TPMR` int(11) NOT NULL DEFAULT '-1',
  `RelativeValidity` int(11) NOT NULL DEFAULT '-1',
  `CreatorID` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sentitems`
--

INSERT INTO `sentitems` (`UpdatedInDB`, `InsertIntoDB`, `SendingDateTime`, `DeliveryDateTime`, `Text`, `DestinationNumber`, `Coding`, `UDH`, `SMSCNumber`, `Class`, `TextDecoded`, `ID`, `SenderID`, `SequencePosition`, `Status`, `StatusError`, `TPMR`, `RelativeValidity`, `CreatorID`) VALUES
('2018-10-05 09:59:35', '0000-00-00 00:00:00', '2018-10-05 09:59:35', NULL, '', '', '8bit', '', '', 0, '', 17, 'bank', 1, 'Error', -1, -1, 255, 'Gammu 1.28.90'),
('2018-10-05 10:10:16', '0000-00-00 00:00:00', '2018-10-05 10:10:16', NULL, '00740065007300740069006E006700200064006100720069002000620061006E00670020006D0069006E0069', '085878661836', 'Default_No_Compression', '', '+62816124', -1, 'testing dari bang mini', 26, 'bank', 1, 'SendingOKNoReport', -1, 22, 255, 'Gammu 1.28.90'),
('2018-10-05 10:10:24', '0000-00-00 00:00:00', '2018-10-05 10:10:24', NULL, '0053004D00530020006B00650064007500610020002E002E002E002E002E002E002E002E002E002E002E002E002E002E002E002E002E002E002E002E002E002E002E002E002E002E002E002E002E002E002E002000740065007300740069006E006700200064006100720069002000620061006E00670020006D0069006E0069', '085878661836', 'Default_No_Compression', '', '+62816124', -1, 'SMS kedua ............................... testing dari bang mini', 27, 'bank', 1, 'SendingOKNoReport', -1, 23, 255, 'Gammu 1.28.90'),
('2018-10-05 10:10:27', '0000-00-00 00:00:00', '2018-10-05 10:10:27', NULL, '00740065007300740069006E006700200064006100720069002000620061006E00670020006D0069006E0069', '085878661836', 'Default_No_Compression', '', '+62816124', -1, 'testing dari bang mini', 25, 'bank', 1, 'SendingOKNoReport', -1, 24, 255, 'Gammu 1.28.90'),
('2018-10-05 10:10:29', '0000-00-00 00:00:00', '2018-10-05 10:10:29', NULL, '00740065007300740069006E006700200064006100720069002000620061006E00670020006D0069006E0069', '085878661836', 'Default_No_Compression', '', '+62816124', -1, 'testing dari bang mini', 24, 'bank', 1, 'SendingOKNoReport', -1, -1, 255, 'Gammu 1.28.90'),
('2018-10-05 10:10:31', '0000-00-00 00:00:00', '2018-10-05 10:10:31', NULL, '00740065007300740069006E006700200064006100720069002000620061006E00670020006D0069006E0069', '085878661836', 'Default_No_Compression', '', '+62816124', -1, 'testing dari bang mini', 23, 'bank', 1, 'SendingOKNoReport', -1, 25, 255, 'Gammu 1.28.90'),
('2018-10-05 10:15:11', '0000-00-00 00:00:00', '2018-10-05 10:15:11', NULL, '0053004D00530020006B00650064007500610020002E002E002E002E002E002E002E002E002E002E002E002E002E002E002E002E002E002E002E002E002E002E002E002E002E002E002E002E002E002E002E002000740065007300740069006E0067003C00620072003E00200064006100720069003C00620072003E002000620061006E0067003C00620072003E0020006D0069006E0069', '085878661836', 'Default_No_Compression', '', '+62816124', -1, 'SMS kedua ............................... testing<br> dari<br> bang<br> mini', 29, 'bank', 1, 'SendingOKNoReport', -1, 27, 255, 'Gammu 1.28.90'),
('2018-10-05 10:15:15', '0000-00-00 00:00:00', '2018-10-05 10:15:15', NULL, '0053004D00530020006B00650064007500610020002E002E002E002E002E002E002E002E002E002E002E002E002E002E002E002E002E002E002E002E002E002E002E002E002E002E002E002E002E002E002E002000740065007300740069006E0067003C00620072003E00200064006100720069003C00620072003E002000620061006E0067003C00620072003E0020006D0069006E0069', '085878661836', 'Default_No_Compression', '', '+62816124', -1, 'SMS kedua ............................... testing<br> dari<br> bang<br> mini', 28, 'bank', 1, 'SendingOKNoReport', -1, 28, 255, 'Gammu 1.28.90'),
('2018-10-05 10:24:50', '0000-00-00 00:00:00', '2018-10-05 10:24:50', NULL, '0041006E006400610020007300750064006100680020007400650072006400610066007400610072002000640069002000420061006E006B0020004D0049004E004900200053004D004B0020004D0041006000410052004900460020004E005500200054004900520054004F002E', '085743363636', 'Default_No_Compression', '', '+62816124', -1, 'Anda sudah terdaftar di Bank MINI SMK MA`ARIF NU TIRTO.', 30, 'bank', 1, 'SendingOKNoReport', -1, 29, 255, 'Gammu 1.28.90'),
('2018-10-05 10:29:00', '0000-00-00 00:00:00', '2018-10-05 10:29:00', NULL, '0041006E006400610020007300750064006100680020007400650072006400610066007400610072002000640069002000420061006E006B0020004D0049004E004900200053004D004B0020004D004100410052004900460020004E005500200054004900520054004F002E', '085731366550', 'Default_No_Compression', '', '+62816124', -1, 'Anda sudah terdaftar di Bank MINI SMK MAARIF NU TIRTO.', 31, 'bank', 1, 'SendingOKNoReport', -1, 30, 255, 'Gammu 1.28.90'),
('2018-10-05 10:38:36', '0000-00-00 00:00:00', '2018-10-05 10:38:36', NULL, '004900520059004100440049002000530049004D004F004E00200041006E006400610020007300750064006100680020007400650072006400610066007400610072002000640069002000420061006E006B0020004D0049004E004900200053004D004B0020004D004100410052004900460020004E005500200054004900520054004F002E', '085878661836', 'Default_No_Compression', '', '+62816124', -1, 'IRYADI SIMON Anda sudah terdaftar di Bank MINI SMK MAARIF NU TIRTO.', 32, 'bank', 1, 'SendingOKNoReport', -1, 31, 255, 'Gammu 1.28.90'),
('2018-10-05 11:05:43', '0000-00-00 00:00:00', '2018-10-05 11:05:43', NULL, '00530065006C0061006D00610074002000440048004900590041004E00200049005200590041004400490020006E006F006D006F007200200061006E006400610020007300750064006100680020007400650072006400610066007400610072002000640069002000420061006E006B0020004D0049004E004900200053004D004B0020004D004100410052004900460020004E005500200054004900520054004F002E00200075006E006400750068002000610070006C0069006B00610073006900200061006E00640072006F00690064002000640061006E0020006E0069006B006D00610074006900200066006100730069006C00690074006100730020006B0065006D00750064006100680061006E002000640061006C0061006D0020006200650072007400720061006E00730061006B00730069', '085878661836', 'Default_No_Compression', '', '+62816124', -1, 'Selamat DHIYAN IRYADI nomor anda sudah terdaftar di Bank MINI SMK MAARIF NU TIRTO. unduh aplikasi android dan nikmati fasilitas kemudahan dalam bertransaksi', 33, 'bank', 1, 'SendingOKNoReport', -1, 32, 255, 'Gammu 1.28.90');

-- --------------------------------------------------------

--
-- Table structure for table `tblanggota`
--

CREATE TABLE `tblanggota` (
  `id_anggota` int(11) NOT NULL,
  `no_rekening` int(11) NOT NULL,
  `pasword` varchar(25) NOT NULL,
  `nama` text NOT NULL,
  `alamat` text NOT NULL,
  `tgl_lahir` varchar(25) NOT NULL,
  `tmp_lahir` text NOT NULL,
  `pekerjaan` varchar(25) NOT NULL,
  `j_kel` varchar(10) NOT NULL,
  `jurusan` varchar(20) NOT NULL,
  `no_hp` varchar(15) NOT NULL,
  `kode_pin` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblanggota`
--

INSERT INTO `tblanggota` (`id_anggota`, `no_rekening`, `pasword`, `nama`, `alamat`, `tgl_lahir`, `tmp_lahir`, `pekerjaan`, `j_kel`, `jurusan`, `no_hp`, `kode_pin`) VALUES
(7652, 123456, '123456', 'Dhiyan Iryadi', 'jl wonoprojo', '5 Aprill 1998', 'Pekalongan', 'kkk', 'L', 'PKL', '085878661836', 123456);

-- --------------------------------------------------------

--
-- Table structure for table `tbljenissimpanan`
--

CREATE TABLE `tbljenissimpanan` (
  `id_j_simpanan` varchar(6) NOT NULL,
  `nama_simpanan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbljenissimpanan`
--

INSERT INTO `tbljenissimpanan` (`id_j_simpanan`, `nama_simpanan`) VALUES
('t01', 'Tabungan Umum'),
('t02', 'Tabungan KI');

-- --------------------------------------------------------

--
-- Table structure for table `tblpetugas`
--

CREATE TABLE `tblpetugas` (
  `id_petugas` int(11) NOT NULL,
  `username` varchar(6) NOT NULL,
  `nama_petugas` text NOT NULL,
  `level` int(11) NOT NULL,
  `password` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblpetugas`
--

INSERT INTO `tblpetugas` (`id_petugas`, `username`, `nama_petugas`, `level`, `password`) VALUES
(1, 'admin', 'Dhiyan Iryadi', 1, 'admin'),
(2, 'nimda', 'Nimda', 2, 'nimda');

-- --------------------------------------------------------

--
-- Table structure for table `tblsimpanan`
--

CREATE TABLE `tblsimpanan` (
  `id_simpanan` varchar(10) NOT NULL,
  `nama_simpanan` text NOT NULL,
  `id_anggota` varchar(10) NOT NULL,
  `tgl_simpanan` varchar(15) NOT NULL,
  `besar_simpanan` int(11) NOT NULL,
  `ket` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `inbox`
--
ALTER TABLE `inbox`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `outbox`
--
ALTER TABLE `outbox`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `outbox_date` (`SendingDateTime`,`SendingTimeOut`),
  ADD KEY `outbox_sender` (`SenderID`);

--
-- Indexes for table `outbox_multipart`
--
ALTER TABLE `outbox_multipart`
  ADD PRIMARY KEY (`ID`,`SequencePosition`);

--
-- Indexes for table `pbk`
--
ALTER TABLE `pbk`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `pbk_groups`
--
ALTER TABLE `pbk_groups`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `phones`
--
ALTER TABLE `phones`
  ADD PRIMARY KEY (`IMEI`);

--
-- Indexes for table `sentitems`
--
ALTER TABLE `sentitems`
  ADD PRIMARY KEY (`ID`,`SequencePosition`),
  ADD KEY `sentitems_date` (`DeliveryDateTime`),
  ADD KEY `sentitems_tpmr` (`TPMR`),
  ADD KEY `sentitems_dest` (`DestinationNumber`),
  ADD KEY `sentitems_sender` (`SenderID`);

--
-- Indexes for table `tblanggota`
--
ALTER TABLE `tblanggota`
  ADD PRIMARY KEY (`id_anggota`);

--
-- Indexes for table `tblpetugas`
--
ALTER TABLE `tblpetugas`
  ADD PRIMARY KEY (`id_petugas`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `inbox`
--
ALTER TABLE `inbox`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `outbox`
--
ALTER TABLE `outbox`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `pbk`
--
ALTER TABLE `pbk`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pbk_groups`
--
ALTER TABLE `pbk_groups`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblanggota`
--
ALTER TABLE `tblanggota`
  MODIFY `id_anggota` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7653;

--
-- AUTO_INCREMENT for table `tblpetugas`
--
ALTER TABLE `tblpetugas`
  MODIFY `id_petugas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
