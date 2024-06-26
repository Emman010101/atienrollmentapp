-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 26, 2024 at 04:18 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `atiesdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `enrolltbl`
--

CREATE TABLE `enrolltbl` (
  `id` int(11) NOT NULL,
  `gradeLevelToEnroll` varchar(50) DEFAULT NULL,
  `withLrn` varchar(50) DEFAULT NULL,
  `balikAral` varchar(50) DEFAULT NULL,
  `psaBirthCertNo` varchar(50) DEFAULT NULL,
  `lrn` varchar(50) DEFAULT NULL,
  `lastName` varchar(100) DEFAULT NULL,
  `firstName` varchar(100) DEFAULT NULL,
  `middleName` varchar(100) DEFAULT NULL,
  `extensionName` varchar(50) DEFAULT NULL,
  `birthDate` date DEFAULT NULL,
  `pRegion` varchar(100) DEFAULT NULL,
  `pProvince` varchar(100) DEFAULT NULL,
  `pMunicipality` varchar(100) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `motherTongue` varchar(100) DEFAULT NULL,
  `indigenousPeople` varchar(100) DEFAULT NULL,
  `fourPsBeneficiary` varchar(50) DEFAULT NULL,
  `cRegion` varchar(100) DEFAULT NULL,
  `cProvince` varchar(100) DEFAULT NULL,
  `cMunicipality` varchar(100) DEFAULT NULL,
  `cBarangay` varchar(100) DEFAULT NULL,
  `cZipCode` varchar(10) DEFAULT NULL,
  `cStreetName` varchar(200) DEFAULT NULL,
  `cHouseNoStreet` varchar(200) DEFAULT NULL,
  `sameWithCurrentAddress` varchar(50) DEFAULT NULL,
  `perRegion` varchar(100) DEFAULT NULL,
  `perProvince` varchar(100) DEFAULT NULL,
  `perMunicipality` varchar(100) DEFAULT NULL,
  `perBarangay` varchar(100) DEFAULT NULL,
  `perZipCode` varchar(10) DEFAULT NULL,
  `perStreetName` varchar(200) DEFAULT NULL,
  `perHouseNoStreet` varchar(200) DEFAULT NULL,
  `fatherLastName` varchar(100) DEFAULT NULL,
  `fatherFirstName` varchar(100) DEFAULT NULL,
  `fatherMiddleName` varchar(100) DEFAULT NULL,
  `fatherContactNum` varchar(15) DEFAULT NULL,
  `motherLastName` varchar(100) DEFAULT NULL,
  `motherFirstName` varchar(100) DEFAULT NULL,
  `motherMiddleName` varchar(100) DEFAULT NULL,
  `motherContactNum` varchar(15) DEFAULT NULL,
  `lastGradeLevelCompleted` varchar(50) DEFAULT NULL,
  `lastSchoolYearCompleted` varchar(50) DEFAULT NULL,
  `lastSchoolAttended` varchar(200) DEFAULT NULL,
  `lastSchoolID` varchar(50) DEFAULT NULL,
  `semester` varchar(50) DEFAULT NULL,
  `track` varchar(50) DEFAULT NULL,
  `strand` varchar(50) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `schoolYear` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `enrolltbl`
--
ALTER TABLE `enrolltbl`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `enrolltbl`
--
ALTER TABLE `enrolltbl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
