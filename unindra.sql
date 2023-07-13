-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 12, 2023 at 05:29 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `unindra`
--

-- --------------------------------------------------------

--
-- Table structure for table `beasiswa`
--

CREATE TABLE `beasiswa` (
  `kd_beasiswa` int(11) NOT NULL,
  `nama` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `beasiswa`
--

INSERT INTO `beasiswa` (`kd_beasiswa`, `nama`) VALUES
(1, 'Beasiswa UKT'),
(2, 'Beasiswa BIDIKMISI'),
(3, 'Beasiswa PPA'),
(4, 'Beasiswa DATAPRINT'),
(5, 'Beasiswa KIP');

-- --------------------------------------------------------

--
-- Table structure for table `hasil`
--

CREATE TABLE `hasil` (
  `kd_hasil` int(11) NOT NULL,
  `kd_beasiswa` int(11) NOT NULL,
  `nim` char(9) NOT NULL,
  `nilai` float DEFAULT NULL,
  `tahun` char(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `hasil`
--

INSERT INTO `hasil` (`kd_hasil`, `kd_beasiswa`, `nim`, `nilai`, `tahun`) VALUES
(1, 1, '121434143', 0.95, '2023'),
(2, 1, '123213142', 0.6, '2023'),
(3, 1, '123342495', 0.566667, '2023'),
(4, 2, '121434143', 0.95, '2023'),
(5, 2, '123213142', 0.666667, '2023'),
(6, 2, '123342495', 0.5, '2023'),
(7, 3, '121434143', 0.866667, '2023'),
(8, 3, '123342495', 0.733333, '2023'),
(9, 3, '123213142', 0.533333, '2023'),
(10, 4, '121434143', 0.975, '2023'),
(11, 4, '123213142', 0.583333, '2023'),
(12, 4, '123342495', 0.516667, '2023'),
(13, 5, '121434143', 0.925, '2023'),
(14, 5, '123213142', 0.65, '2023'),
(15, 5, '123342495', 0.55, '2023'),
(16, 1, '125610098', 0.866667, '2023'),
(17, 2, '125610098', 0.733333, '2023'),
(18, 3, '125610098', 0.6, '2023'),
(19, 4, '125610098', 0.633333, '2023'),
(20, 5, '125610098', 0.9, '2023');

-- --------------------------------------------------------

--
-- Table structure for table `kriteria`
--

CREATE TABLE `kriteria` (
  `kd_kriteria` int(11) NOT NULL,
  `kd_beasiswa` int(11) NOT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `sifat` enum('min','max') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `kriteria`
--

INSERT INTO `kriteria` (`kd_kriteria`, `kd_beasiswa`, `nama`, `sifat`) VALUES
(1, 1, 'IPK', 'max'),
(2, 1, 'Semester', 'max'),
(3, 1, 'Penghasilan Orangtua', 'min'),
(4, 2, 'IPK', 'max'),
(5, 2, 'Semester', 'max'),
(6, 2, 'Penghasilan Orangtua', 'min'),
(7, 3, 'Semester', 'min'),
(8, 3, 'Penghasilan Orang Tua', 'min'),
(9, 3, 'Tanggungan Orang Tua', 'max'),
(10, 4, 'IPK', 'max'),
(11, 4, 'Semester', 'max'),
(12, 4, 'Penghasilan Orang Tua', 'min'),
(13, 4, 'KTP jogja', 'max'),
(14, 5, 'IPK', 'max'),
(15, 5, 'Semester', 'max');

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `nim` char(9) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `alamat` varchar(100) DEFAULT NULL,
  `jenis_kelamin` enum('Laki-laki','Perempuan') DEFAULT NULL,
  `tahun_mengajukan` char(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `mahasiswa`
--

INSERT INTO `mahasiswa` (`nim`, `nama`, `alamat`, `jenis_kelamin`, `tahun_mengajukan`) VALUES
('121434143', 'Arief Fadhila', 'Depok', 'Laki-laki', '2023'),
('123213142', 'Vicky Geraldy', 'Depok', 'Laki-laki', '2023'),
('123342495', 'Didah Rosidah', 'Bekasi', 'Perempuan', '2023'),
('125610098', 'Melly Kristina', 'Jakarta ', 'Perempuan', '2023');

-- --------------------------------------------------------

--
-- Table structure for table `model`
--

CREATE TABLE `model` (
  `kd_model` int(11) NOT NULL,
  `kd_beasiswa` int(11) NOT NULL,
  `kd_kriteria` int(11) NOT NULL,
  `bobot` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `model`
--

INSERT INTO `model` (`kd_model`, `kd_beasiswa`, `kd_kriteria`, `bobot`) VALUES
(1, 1, 1, '0.50'),
(2, 1, 2, '0.20'),
(3, 1, 3, '0.30'),
(4, 2, 4, '0.40'),
(5, 2, 5, '0.20'),
(6, 2, 6, '0.40'),
(9, 3, 9, '0.20'),
(10, 4, 10, '0.20'),
(11, 4, 11, '0.10'),
(12, 4, 12, '0.30'),
(13, 4, 13, '0.40'),
(15, 5, 15, '0.30'),
(17, 3, 7, '0.20'),
(18, 5, 14, '0.40');

-- --------------------------------------------------------

--
-- Table structure for table `nilai`
--

CREATE TABLE `nilai` (
  `kd_nilai` int(11) NOT NULL,
  `kd_beasiswa` int(11) DEFAULT NULL,
  `kd_kriteria` int(11) NOT NULL,
  `nim` char(9) NOT NULL,
  `nilai` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `nilai`
--

INSERT INTO `nilai` (`kd_nilai`, `kd_beasiswa`, `kd_kriteria`, `nim`, `nilai`) VALUES
(1, 1, 1, '121434143', 2),
(2, 1, 2, '121434143', 3),
(3, 1, 3, '121434143', 2),
(4, 1, 1, '123213142', 1),
(5, 1, 2, '123213142', 4),
(6, 1, 3, '123213142', 4),
(7, 1, 1, '123342495', 1),
(8, 1, 2, '123342495', 2),
(9, 2, 4, '121434143', 3),
(10, 1, 3, '123342495', 3),
(11, 2, 5, '121434143', 3),
(12, 2, 6, '121434143', 2),
(13, 2, 4, '123213142', 2),
(14, 2, 5, '123213142', 4),
(15, 2, 6, '123213142', 4),
(16, 2, 4, '123342495', 1),
(17, 2, 5, '123342495', 2),
(18, 2, 6, '123342495', 3),
(19, 3, 7, '121434143', 3),
(20, 3, 8, '121434143', 2),
(21, 3, 9, '121434143', 3),
(22, 3, 7, '123213142', 4),
(23, 3, 8, '123213142', 4),
(24, 3, 9, '123213142', 2),
(25, 3, 7, '123342495', 2),
(26, 3, 8, '123342495', 3),
(27, 3, 9, '123342495', 1),
(28, 4, 10, '121434143', 3),
(29, 4, 11, '121434143', 3),
(30, 4, 12, '121434143', 2),
(31, 4, 13, '121434143', 2),
(32, 4, 10, '123213142', 2),
(33, 4, 11, '123213142', 4),
(34, 4, 12, '123213142', 4),
(35, 4, 13, '123213142', 1),
(36, 4, 10, '123342495', 1),
(37, 4, 11, '123342495', 2),
(38, 4, 12, '123342495', 3),
(39, 4, 13, '123342495', 1),
(40, 5, 14, '121434143', 2),
(41, 5, 15, '121434143', 3),
(43, 5, 14, '123213142', 1),
(44, 5, 15, '123213142', 4),
(46, 5, 14, '123342495', 1),
(47, 5, 15, '123342495', 2),
(49, 1, 1, '125610098', 2),
(50, 1, 2, '125610098', 4),
(51, 1, 3, '125610098', 3),
(52, 2, 4, '125610098', 2),
(53, 2, 5, '125610098', 4),
(54, 2, 6, '125610098', 3),
(55, 3, 7, '125610098', 4),
(56, 3, 8, '125610098', 3),
(57, 3, 9, '125610098', 2),
(58, 4, 10, '125610098', 2),
(59, 4, 11, '125610098', 4),
(60, 4, 12, '125610098', 3),
(61, 4, 13, '125610098', 1),
(62, 5, 14, '125610098', 2),
(63, 5, 15, '125610098', 4);

-- --------------------------------------------------------

--
-- Table structure for table `penilaian`
--

CREATE TABLE `penilaian` (
  `kd_penilaian` int(11) NOT NULL,
  `kd_beasiswa` int(11) DEFAULT NULL,
  `kd_kriteria` int(11) NOT NULL,
  `keterangan` varchar(20) NOT NULL,
  `bobot` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `penilaian`
--

INSERT INTO `penilaian` (`kd_penilaian`, `kd_beasiswa`, `kd_kriteria`, `keterangan`, `bobot`) VALUES
(1, 1, 1, '3.00 - 3.20', 1),
(2, 1, 1, '3.21 - 3.40', 2),
(3, 1, 1, '3.41 - 3.40', 3),
(4, 1, 1, '>= 3.61', 4),
(5, 1, 2, '2 - 3', 1),
(6, 1, 2, '4 - 5', 2),
(7, 1, 2, '6 - 7', 3),
(8, 1, 2, '8', 4),
(9, 1, 3, '<= 500000', 1),
(10, 1, 3, '600000 - 1500000', 2),
(11, 1, 3, '1600000 - 2500000', 3),
(12, 1, 3, '>= 2600000', 4),
(13, 2, 4, '2.75 - 3.00', 1),
(14, 2, 4, '3.10 - 3.35', 2),
(15, 2, 4, '3.36 - 3.60', 3),
(16, 2, 4, '>= 3.61', 4),
(17, 2, 5, '2 - 3', 1),
(18, 2, 5, '4 - 5', 2),
(19, 2, 5, '6 - 7', 3),
(20, 2, 5, '8', 4),
(21, 2, 6, '<= 500000', 1),
(22, 2, 6, '600000 - 1500000', 2),
(23, 2, 6, '1600000 - 2500000', 3),
(24, 2, 6, '>= 2600000', 4),
(25, 3, 7, '2 - 3', 1),
(26, 3, 7, '4 - 5', 2),
(27, 3, 7, '6 - 7', 3),
(28, 3, 7, '8', 4),
(29, 3, 8, '<= 500000', 1),
(30, 3, 8, '600000 - 1500000', 2),
(31, 3, 8, '1600000 - 2500000', 3),
(32, 3, 8, '>= 2600000', 4),
(33, 3, 9, '1 - 2', 1),
(34, 3, 9, '3 - 4', 2),
(35, 3, 9, '5 - 6', 3),
(36, 3, 9, '>= 7', 4),
(37, 4, 10, '2.75 - 3.00', 1),
(38, 4, 10, '3.10 - 3.35', 2),
(39, 4, 10, '3.36 - 3.60', 3),
(40, 4, 10, '>= 3.61', 4),
(41, 4, 11, '2 - 3', 1),
(42, 4, 11, '4 - 5', 2),
(43, 4, 11, '6 - 7', 3),
(44, 4, 11, '8', 4),
(45, 4, 12, '<= 500000', 1),
(46, 4, 12, '600000 - 1500000', 2),
(47, 4, 12, '1600000 - 2500000', 3),
(48, 4, 12, '>= 2600000', 4),
(49, 4, 13, 'Ya', 2),
(50, 4, 13, 'Tidak', 1),
(51, 5, 14, '3.00 - 3.20', 1),
(52, 5, 14, '3.21 - 3.40', 2),
(53, 5, 14, '3.41 - 3.40', 3),
(54, 5, 14, '>= 3.61', 4),
(55, 5, 15, '2 - 3', 1),
(56, 5, 15, '4 - 5', 2),
(57, 5, 15, '6 - 7', 3),
(58, 5, 15, '8', 4);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `beasiswa`
--
ALTER TABLE `beasiswa`
  ADD PRIMARY KEY (`kd_beasiswa`);

--
-- Indexes for table `hasil`
--
ALTER TABLE `hasil`
  ADD PRIMARY KEY (`kd_hasil`),
  ADD KEY `fk_mahasiswa` (`nim`),
  ADD KEY `fk_beasiswa` (`kd_beasiswa`);

--
-- Indexes for table `kriteria`
--
ALTER TABLE `kriteria`
  ADD PRIMARY KEY (`kd_kriteria`),
  ADD KEY `kd_beasiswa` (`kd_beasiswa`),
  ADD KEY `kd_beasiswa_2` (`kd_beasiswa`);

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`nim`);

--
-- Indexes for table `model`
--
ALTER TABLE `model`
  ADD PRIMARY KEY (`kd_model`),
  ADD KEY `fk_kriteria` (`kd_kriteria`),
  ADD KEY `fk_beasiswa` (`kd_beasiswa`);

--
-- Indexes for table `nilai`
--
ALTER TABLE `nilai`
  ADD PRIMARY KEY (`kd_nilai`),
  ADD KEY `fk_kriteria` (`kd_kriteria`),
  ADD KEY `fk_mahasiswa` (`nim`),
  ADD KEY `fk_beasiswa` (`kd_beasiswa`);

--
-- Indexes for table `penilaian`
--
ALTER TABLE `penilaian`
  ADD PRIMARY KEY (`kd_penilaian`),
  ADD KEY `fk_kriteria` (`kd_kriteria`),
  ADD KEY `fk_beasiswa` (`kd_beasiswa`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `beasiswa`
--
ALTER TABLE `beasiswa`
  MODIFY `kd_beasiswa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `hasil`
--
ALTER TABLE `hasil`
  MODIFY `kd_hasil` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `kriteria`
--
ALTER TABLE `kriteria`
  MODIFY `kd_kriteria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `model`
--
ALTER TABLE `model`
  MODIFY `kd_model` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `nilai`
--
ALTER TABLE `nilai`
  MODIFY `kd_nilai` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `penilaian`
--
ALTER TABLE `penilaian`
  MODIFY `kd_penilaian` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `hasil`
--
ALTER TABLE `hasil`
  ADD CONSTRAINT `hasil_ibfk_1` FOREIGN KEY (`nim`) REFERENCES `mahasiswa` (`nim`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `hasil_ibfk_2` FOREIGN KEY (`kd_beasiswa`) REFERENCES `beasiswa` (`kd_beasiswa`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `kriteria`
--
ALTER TABLE `kriteria`
  ADD CONSTRAINT `fk_beasiswa` FOREIGN KEY (`kd_beasiswa`) REFERENCES `beasiswa` (`kd_beasiswa`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `model`
--
ALTER TABLE `model`
  ADD CONSTRAINT `model_ibfk_1` FOREIGN KEY (`kd_kriteria`) REFERENCES `kriteria` (`kd_kriteria`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `model_ibfk_2` FOREIGN KEY (`kd_beasiswa`) REFERENCES `beasiswa` (`kd_beasiswa`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `nilai`
--
ALTER TABLE `nilai`
  ADD CONSTRAINT `nilai_ibfk_1` FOREIGN KEY (`kd_kriteria`) REFERENCES `kriteria` (`kd_kriteria`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `nilai_ibfk_2` FOREIGN KEY (`nim`) REFERENCES `mahasiswa` (`nim`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `nilai_ibfk_3` FOREIGN KEY (`kd_beasiswa`) REFERENCES `beasiswa` (`kd_beasiswa`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `penilaian`
--
ALTER TABLE `penilaian`
  ADD CONSTRAINT `penilaian_ibfk_1` FOREIGN KEY (`kd_kriteria`) REFERENCES `kriteria` (`kd_kriteria`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `penilaian_ibfk_2` FOREIGN KEY (`kd_beasiswa`) REFERENCES `beasiswa` (`kd_beasiswa`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
