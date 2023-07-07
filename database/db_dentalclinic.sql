-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 07, 2023 at 04:46 AM
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
-- Database: `db_dentalclinic`
--

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `start_event` datetime NOT NULL DEFAULT current_timestamp(),
  `end_event` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `title`, `start_event`, `end_event`) VALUES
(23, 'Ngan, Nguyen Ngoc / x-rays', '2023-06-27 17:00:00', '2023-06-27 17:00:00'),
(24, 'Ngan, Nguyen Ngoc / Fillings', '2023-06-30 17:00:00', '2023-06-30 17:00:00'),
(25, 'Tuoi, Nguyen Thi / Complete exams', '2023-06-27 17:02:00', '2023-06-27 17:02:00'),
(27, 'Dang, Tran Hai / Fillings', '2023-06-27 17:08:00', '2023-06-27 17:08:00');

-- --------------------------------------------------------

--
-- Table structure for table `tblappointments`
--

CREATE TABLE `tblappointments` (
  `AppoinmentID` int(11) NOT NULL,
  `Fname` varchar(90) NOT NULL,
  `Mname` varchar(90) NOT NULL,
  `Lname` varchar(90) NOT NULL,
  `Services` varchar(90) NOT NULL,
  `A_Date` date NOT NULL,
  `A_Time` varchar(30) NOT NULL,
  `Status` varchar(90) NOT NULL DEFAULT 'Approved'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblautonumbers`
--

CREATE TABLE `tblautonumbers` (
  `AUTOID` int(11) NOT NULL,
  `AUTOSTART` varchar(90) NOT NULL,
  `AUTOEND` int(11) NOT NULL,
  `AUTOINC` int(11) NOT NULL,
  `AUTOKEY` varchar(90) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblautonumbers`
--

INSERT INTO `tblautonumbers` (`AUTOID`, `AUTOSTART`, `AUTOEND`, `AUTOINC`, `AUTOKEY`) VALUES
(2, 'USER_0', 4, 1, 'USERID'),
(3, 'INV_0', 77, 1, 'INVOICENO'),
(4, '0000', 15, 1, 'SKU'),
(5, 'QUOTE_00', 5, 1, 'QUOTENO'),
(6, 'PR00', 10, 1, 'PROID');

-- --------------------------------------------------------

--
-- Table structure for table `tblbulkpricing`
--

CREATE TABLE `tblbulkpricing` (
  `BulkID` int(11) NOT NULL,
  `SKU` varchar(90) NOT NULL,
  `QTY` int(11) NOT NULL,
  `Price` double NOT NULL,
  `ModifiedDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblbulkpricing`
--

INSERT INTO `tblbulkpricing` (`BulkID`, `SKU`, `QTY`, `Price`, `ModifiedDate`) VALUES
(10, '00003', 3, 890, '2019-07-10'),
(11, '00003', 5, 1450, '2019-07-10'),
(12, '00002', 2, 60, '2019-07-10'),
(16, '00002', 3, 80, '2020-12-08'),
(17, '00002', 5, 100, '2020-12-08'),
(18, '000013', 2, 500, '2020-12-10'),
(19, '000013', 3, 700, '2020-12-10');

-- --------------------------------------------------------

--
-- Table structure for table `tblcurrency`
--

CREATE TABLE `tblcurrency` (
  `CurrencyID` int(11) NOT NULL,
  `CurrencySymbol` varchar(90) NOT NULL,
  `ActiveCurrency` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblcurrency`
--

INSERT INTO `tblcurrency` (`CurrencyID`, `CurrencySymbol`, `ActiveCurrency`) VALUES
(1, 'USD', 0),
(3, 'VND', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbldiscountrate`
--

CREATE TABLE `tbldiscountrate` (
  `DiscountRateID` int(11) NOT NULL,
  `DiscountRate` varchar(90) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblinvoice`
--

CREATE TABLE `tblinvoice` (
  `InvoiceID` int(11) NOT NULL,
  `InvoiceNo` varchar(90) NOT NULL,
  `SKU` varchar(90) NOT NULL,
  `ToothNumber` int(11) DEFAULT 0,
  `Services` varchar(255) NOT NULL,
  `Price` double NOT NULL,
  `QTY` int(11) NOT NULL,
  `SubTotal` double NOT NULL,
  `Remarks` text NOT NULL,
  `UserID` varchar(90) NOT NULL,
  `Class` varchar(90) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblpatients`
--

CREATE TABLE `tblpatients` (
  `PatientID` int(11) NOT NULL,
  `Fname` varchar(90) NOT NULL,
  `Lname` varchar(90) NOT NULL,
  `Mname` varchar(90) NOT NULL,
  `F_Address` text NOT NULL,
  `Sex` varchar(90) NOT NULL,
  `Age` int(11) NOT NULL,
  `ContactNo` varchar(90) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblpatients`
--

INSERT INTO `tblpatients` (`PatientID`, `Fname`, `Lname`, `Mname`, `F_Address`, `Sex`, `Age`, `ContactNo`) VALUES
(24, 'Tran', 'Dang', 'Hai', '456 Bui Vien Street, District 1, Ho Chi Minh City', 'Male', 21, '787878789'),
(27, 'Nguyen', 'Ngan', 'Ngoc', '123 Tran Hung Dao Street, District 5, Ho Chi Minh City', 'Male', 24, '23412334'),
(28, 'Nguyen', 'Tuoi', 'Thi', '234 Le Loi Street, District 7, Ho Chi Minh City', 'Female', 20, '123122256'),
(30, 'Bui', 'Nam', 'Phuong', '256 Le Duan Street, District 3, Ho Chi Minh City', 'Male', 25, '486538933'),
(31, 'Kieu', 'Giang', 'Dai', '157 Dinh Tien Hoang Street, District 6, Ho Chi Minh City', 'Male', 29, '984555625');

-- --------------------------------------------------------

--
-- Table structure for table `tblpayments`
--

CREATE TABLE `tblpayments` (
  `PaymentID` int(11) NOT NULL,
  `ORNO` varchar(90) NOT NULL,
  `InvoiceDate` date NOT NULL,
  `DateDue` date NOT NULL,
  `InvoiceNo` varchar(90) NOT NULL,
  `TotalQTY` int(11) NOT NULL,
  `TotalAmount` double NOT NULL,
  `Payment` double NOT NULL,
  `Balance` double NOT NULL,
  `PaymentDate` datetime NOT NULL,
  `Patients` varchar(90) NOT NULL,
  `UserID` varchar(90) NOT NULL,
  `Status` text NOT NULL,
  `Class` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblprintfooter`
--

CREATE TABLE `tblprintfooter` (
  `PFID` int(11) NOT NULL,
  `FirstLine` varchar(255) NOT NULL,
  `SecondLine` varchar(255) NOT NULL,
  `ThirdLine` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblprintfooter`
--

INSERT INTO `tblprintfooter` (`PFID`, `FirstLine`, `SecondLine`, `ThirdLine`) VALUES
(1, 'Prices includes Dental Clinic where applicable', '', 'Thank you for your business.');

-- --------------------------------------------------------

--
-- Table structure for table `tblprintheader`
--

CREATE TABLE `tblprintheader` (
  `PHID` int(11) NOT NULL,
  `FirstLine` varchar(255) NOT NULL,
  `SecondLine` varchar(255) NOT NULL,
  `ThirdLine` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblprintheader`
--

INSERT INTO `tblprintheader` (`PHID`, `FirstLine`, `SecondLine`, `ThirdLine`) VALUES
(1, 'Welcome to ', 'FPT Dental Clinic', 'FPT University, Ho Chi Minh City');

-- --------------------------------------------------------

--
-- Table structure for table `tblservices`
--

CREATE TABLE `tblservices` (
  `ServiceID` int(11) NOT NULL,
  `SKU` varchar(90) NOT NULL,
  `ToothNumber` int(11) NOT NULL DEFAULT 0,
  `Services` text NOT NULL,
  `Description` text NOT NULL,
  `OriginalPrice` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblservices`
--

INSERT INTO `tblservices` (`ServiceID`, `SKU`, `ToothNumber`, `Services`, `Description`, `OriginalPrice`) VALUES
(8, '00008', 1, 'Complete exams', '', 210),
(9, '00009', 1, 'Fillings', '', 2000),
(10, '000010', 2, 'x-rays', '', 322),
(11, '000011', 1, 'Dental cleanings', '', 321),
(12, '000012', 0, 'root canals', '', 100);

-- --------------------------------------------------------

--
-- Table structure for table `tblstocks`
--

CREATE TABLE `tblstocks` (
  `StocksID` int(11) NOT NULL,
  `ProductID` varchar(90) NOT NULL,
  `Products` varchar(90) NOT NULL,
  `Brand` varchar(90) NOT NULL,
  `Category` varchar(90) NOT NULL,
  `Description` text NOT NULL,
  `Price` double NOT NULL,
  `Stocks` int(11) NOT NULL,
  `DateReceived` datetime NOT NULL DEFAULT current_timestamp(),
  `Sold` int(11) NOT NULL,
  `DateSold` datetime NOT NULL DEFAULT current_timestamp(),
  `Expired` double NOT NULL,
  `DateExpired` datetime NOT NULL DEFAULT current_timestamp(),
  `Balance` double NOT NULL,
  `Remarks` text NOT NULL,
  `Status` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblstocks`
--

INSERT INTO `tblstocks` (`StocksID`, `ProductID`, `Products`, `Brand`, `Category`, `Description`, `Price`, `Stocks`, `DateReceived`, `Sold`, `DateSold`, `Expired`, `DateExpired`, `Balance`, `Remarks`, `Status`) VALUES
(139, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:39', 1, '2021-02-22 18:34:14', 0, '2021-02-22 18:33:39', 0, '', ''),
(140, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:56', 1, '2021-02-22 18:34:14', 0, '2021-02-22 18:33:56', 0, '', ''),
(141, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:56', 1, '2021-02-22 18:34:14', 0, '2021-02-22 18:33:56', 0, '', ''),
(142, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:56', 0, '2021-02-22 18:33:56', 0, '2021-02-22 18:33:56', 0, '', ''),
(143, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:56', 0, '2021-02-22 18:33:56', 0, '2021-02-22 18:33:56', 0, '', ''),
(144, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:56', 0, '2021-02-22 18:33:56', 0, '2021-02-22 18:33:56', 0, '', ''),
(145, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:56', 0, '2021-02-22 18:33:56', 0, '2021-02-22 18:33:56', 0, '', ''),
(146, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:56', 0, '2021-02-22 18:33:56', 0, '2021-02-22 18:33:56', 0, '', ''),
(147, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:56', 0, '2021-02-22 18:33:56', 0, '2021-02-22 18:33:56', 0, '', ''),
(148, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:56', 0, '2021-02-22 18:33:56', 0, '2021-02-22 18:33:56', 0, '', ''),
(149, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:57', 0, '2021-02-22 18:33:57', 0, '2021-02-22 18:33:57', 0, '', ''),
(150, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:57', 0, '2021-02-22 18:33:57', 0, '2021-02-22 18:33:57', 0, '', ''),
(151, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:57', 0, '2021-02-22 18:33:57', 0, '2021-02-22 18:33:57', 0, '', ''),
(152, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:57', 0, '2021-02-22 18:33:57', 0, '2021-02-22 18:33:57', 0, '', ''),
(153, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:57', 0, '2021-02-22 18:33:57', 0, '2021-02-22 18:33:57', 0, '', ''),
(154, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:57', 0, '2021-02-22 18:33:57', 0, '2021-02-22 18:33:57', 0, '', ''),
(155, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:57', 0, '2021-02-22 18:33:57', 0, '2021-02-22 18:33:57', 0, '', ''),
(156, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:57', 0, '2021-02-22 18:33:57', 0, '2021-02-22 18:33:57', 0, '', ''),
(157, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:57', 0, '2021-02-22 18:33:57', 0, '2021-02-22 18:33:57', 0, '', ''),
(158, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:57', 0, '2021-02-22 18:33:57', 0, '2021-02-22 18:33:57', 0, '', ''),
(159, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:57', 0, '2021-02-22 18:33:57', 0, '2021-02-22 18:33:57', 0, '', ''),
(160, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:57', 0, '2021-02-22 18:33:57', 0, '2021-02-22 18:33:57', 0, '', ''),
(161, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:57', 0, '2021-02-22 18:33:57', 0, '2021-02-22 18:33:57', 0, '', ''),
(162, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:57', 0, '2021-02-22 18:33:57', 0, '2021-02-22 18:33:57', 0, '', ''),
(163, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:57', 0, '2021-02-22 18:33:57', 0, '2021-02-22 18:33:57', 0, '', ''),
(164, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:57', 0, '2021-02-22 18:33:57', 0, '2021-02-22 18:33:57', 0, '', ''),
(165, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:57', 0, '2021-02-22 18:33:57', 0, '2021-02-22 18:33:57', 0, '', ''),
(166, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:57', 0, '2021-02-22 18:33:57', 0, '2021-02-22 18:33:57', 0, '', ''),
(167, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:57', 0, '2021-02-22 18:33:57', 0, '2021-02-22 18:33:57', 0, '', ''),
(168, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:57', 0, '2021-02-22 18:33:57', 0, '2021-02-22 18:33:57', 0, '', ''),
(169, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:57', 0, '2021-02-22 18:33:57', 0, '2021-02-22 18:33:57', 0, '', ''),
(170, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:57', 0, '2021-02-22 18:33:57', 0, '2021-02-22 18:33:57', 0, '', ''),
(171, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:57', 0, '2021-02-22 18:33:57', 0, '2021-02-22 18:33:57', 0, '', ''),
(172, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:57', 0, '2021-02-22 18:33:57', 0, '2021-02-22 18:33:57', 0, '', ''),
(173, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:57', 0, '2021-02-22 18:33:57', 0, '2021-02-22 18:33:57', 0, '', ''),
(174, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:57', 0, '2021-02-22 18:33:57', 0, '2021-02-22 18:33:57', 0, '', ''),
(175, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:57', 0, '2021-02-22 18:33:57', 0, '2021-02-22 18:33:57', 0, '', ''),
(176, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:57', 0, '2021-02-22 18:33:57', 0, '2021-02-22 18:33:57', 0, '', ''),
(177, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:57', 0, '2021-02-22 18:33:57', 0, '2021-02-22 18:33:57', 0, '', ''),
(178, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:57', 0, '2021-02-22 18:33:57', 0, '2021-02-22 18:33:57', 0, '', ''),
(179, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:57', 0, '2021-02-22 18:33:57', 0, '2021-02-22 18:33:57', 0, '', ''),
(180, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:57', 0, '2021-02-22 18:33:57', 0, '2021-02-22 18:33:57', 0, '', ''),
(181, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:57', 0, '2021-02-22 18:33:57', 0, '2021-02-22 18:33:57', 0, '', ''),
(182, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:57', 0, '2021-02-22 18:33:57', 0, '2021-02-22 18:33:57', 0, '', ''),
(183, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:57', 0, '2021-02-22 18:33:57', 0, '2021-02-22 18:33:57', 0, '', ''),
(184, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:57', 0, '2021-02-22 18:33:57', 0, '2021-02-22 18:33:57', 0, '', ''),
(185, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:57', 0, '2021-02-22 18:33:57', 0, '2021-02-22 18:33:57', 0, '', ''),
(186, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:57', 0, '2021-02-22 18:33:57', 0, '2021-02-22 18:33:57', 0, '', ''),
(187, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:57', 0, '2021-02-22 18:33:57', 0, '2021-02-22 18:33:57', 0, '', ''),
(188, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:57', 0, '2021-02-22 18:33:57', 0, '2021-02-22 18:33:57', 0, '', ''),
(189, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:57', 0, '2021-02-22 18:33:57', 0, '2021-02-22 18:33:57', 0, '', ''),
(190, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:57', 0, '2021-02-22 18:33:57', 0, '2021-02-22 18:33:57', 0, '', ''),
(191, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:57', 0, '2021-02-22 18:33:57', 0, '2021-02-22 18:33:57', 0, '', ''),
(192, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:57', 0, '2021-02-22 18:33:57', 0, '2021-02-22 18:33:57', 0, '', ''),
(193, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:57', 0, '2021-02-22 18:33:57', 0, '2021-02-22 18:33:57', 0, '', ''),
(194, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:57', 0, '2021-02-22 18:33:57', 0, '2021-02-22 18:33:57', 0, '', ''),
(195, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:57', 0, '2021-02-22 18:33:57', 0, '2021-02-22 18:33:57', 0, '', ''),
(196, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:57', 0, '2021-02-22 18:33:57', 0, '2021-02-22 18:33:57', 0, '', ''),
(197, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:57', 0, '2021-02-22 18:33:57', 0, '2021-02-22 18:33:57', 0, '', ''),
(198, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:57', 0, '2021-02-22 18:33:57', 0, '2021-02-22 18:33:57', 0, '', ''),
(199, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:57', 0, '2021-02-22 18:33:57', 0, '2021-02-22 18:33:57', 0, '', ''),
(200, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:57', 0, '2021-02-22 18:33:57', 0, '2021-02-22 18:33:57', 0, '', ''),
(201, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:57', 0, '2021-02-22 18:33:57', 0, '2021-02-22 18:33:57', 0, '', ''),
(202, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:57', 0, '2021-02-22 18:33:57', 0, '2021-02-22 18:33:57', 0, '', ''),
(203, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:57', 0, '2021-02-22 18:33:57', 0, '2021-02-22 18:33:57', 0, '', ''),
(204, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:57', 0, '2021-02-22 18:33:57', 0, '2021-02-22 18:33:57', 0, '', ''),
(205, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:57', 0, '2021-02-22 18:33:57', 0, '2021-02-22 18:33:57', 0, '', ''),
(206, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:57', 0, '2021-02-22 18:33:57', 0, '2021-02-22 18:33:57', 0, '', ''),
(207, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:57', 0, '2021-02-22 18:33:57', 0, '2021-02-22 18:33:57', 0, '', ''),
(208, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:57', 0, '2021-02-22 18:33:57', 0, '2021-02-22 18:33:57', 0, '', ''),
(209, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:57', 0, '2021-02-22 18:33:57', 0, '2021-02-22 18:33:57', 0, '', ''),
(210, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:57', 0, '2021-02-22 18:33:57', 0, '2021-02-22 18:33:57', 0, '', ''),
(211, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:57', 0, '2021-02-22 18:33:57', 0, '2021-02-22 18:33:57', 0, '', ''),
(212, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:57', 0, '2021-02-22 18:33:57', 0, '2021-02-22 18:33:57', 0, '', ''),
(213, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:57', 0, '2021-02-22 18:33:57', 0, '2021-02-22 18:33:57', 0, '', ''),
(214, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:57', 0, '2021-02-22 18:33:57', 0, '2021-02-22 18:33:57', 0, '', ''),
(215, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:57', 0, '2021-02-22 18:33:57', 0, '2021-02-22 18:33:57', 0, '', ''),
(216, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:57', 0, '2021-02-22 18:33:57', 0, '2021-02-22 18:33:57', 0, '', ''),
(217, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '', ''),
(218, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '', ''),
(219, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '', ''),
(220, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '', ''),
(221, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '', ''),
(222, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '', ''),
(223, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '', ''),
(224, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '', ''),
(225, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '', ''),
(226, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '', ''),
(227, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '', ''),
(228, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '', ''),
(229, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '', ''),
(230, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '', ''),
(231, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '', ''),
(232, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '', ''),
(233, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '', ''),
(234, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '', ''),
(235, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '', ''),
(236, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '', ''),
(237, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '', ''),
(238, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '', ''),
(239, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '', ''),
(240, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '', ''),
(241, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '', ''),
(242, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '', ''),
(243, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '', ''),
(244, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '', ''),
(245, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '', ''),
(246, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '', ''),
(247, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '', ''),
(248, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '', ''),
(249, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '', ''),
(250, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '', ''),
(251, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '', ''),
(252, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '', ''),
(253, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '', ''),
(254, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '', ''),
(255, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '', ''),
(256, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '', ''),
(257, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '', ''),
(258, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '', ''),
(259, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '', ''),
(260, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '', ''),
(261, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '', ''),
(262, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '', ''),
(263, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '', ''),
(264, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '', ''),
(265, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '', ''),
(266, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '', ''),
(267, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '', ''),
(268, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '', ''),
(269, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '', ''),
(270, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '', ''),
(271, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '', ''),
(272, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '', ''),
(273, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '', ''),
(274, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '', ''),
(275, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '', ''),
(276, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '', ''),
(277, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '', ''),
(278, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '', ''),
(279, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '', ''),
(280, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '', ''),
(281, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '', ''),
(282, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '', ''),
(283, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '', ''),
(284, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '', ''),
(285, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '', ''),
(286, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '', ''),
(287, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '', ''),
(288, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '', ''),
(289, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '', ''),
(290, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '', ''),
(291, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '2021-02-22 18:33:58', 0, '', ''),
(292, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:59', 0, '2021-02-22 18:33:59', 0, '2021-02-22 18:33:59', 0, '', ''),
(293, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:59', 0, '2021-02-22 18:33:59', 0, '2021-02-22 18:33:59', 0, '', ''),
(294, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:59', 0, '2021-02-22 18:33:59', 0, '2021-02-22 18:33:59', 0, '', ''),
(295, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:59', 0, '2021-02-22 18:33:59', 0, '2021-02-22 18:33:59', 0, '', ''),
(296, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:59', 0, '2021-02-22 18:33:59', 0, '2021-02-22 18:33:59', 0, '', ''),
(297, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:59', 0, '2021-02-22 18:33:59', 0, '2021-02-22 18:33:59', 0, '', ''),
(298, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:59', 0, '2021-02-22 18:33:59', 0, '2021-02-22 18:33:59', 0, '', ''),
(299, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:59', 0, '2021-02-22 18:33:59', 0, '2021-02-22 18:33:59', 0, '', ''),
(300, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:59', 0, '2021-02-22 18:33:59', 0, '2021-02-22 18:33:59', 0, '', ''),
(301, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:59', 0, '2021-02-22 18:33:59', 0, '2021-02-22 18:33:59', 0, '', ''),
(302, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:59', 0, '2021-02-22 18:33:59', 0, '2021-02-22 18:33:59', 0, '', ''),
(303, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:59', 0, '2021-02-22 18:33:59', 0, '2021-02-22 18:33:59', 0, '', ''),
(304, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:59', 0, '2021-02-22 18:33:59', 0, '2021-02-22 18:33:59', 0, '', ''),
(305, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:59', 0, '2021-02-22 18:33:59', 0, '2021-02-22 18:33:59', 0, '', ''),
(306, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:59', 0, '2021-02-22 18:33:59', 0, '2021-02-22 18:33:59', 0, '', ''),
(307, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:59', 0, '2021-02-22 18:33:59', 0, '2021-02-22 18:33:59', 0, '', ''),
(308, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:59', 0, '2021-02-22 18:33:59', 0, '2021-02-22 18:33:59', 0, '', ''),
(309, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:59', 0, '2021-02-22 18:33:59', 0, '2021-02-22 18:33:59', 0, '', ''),
(310, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:59', 0, '2021-02-22 18:33:59', 0, '2021-02-22 18:33:59', 0, '', ''),
(311, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:59', 0, '2021-02-22 18:33:59', 0, '2021-02-22 18:33:59', 0, '', ''),
(312, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:59', 0, '2021-02-22 18:33:59', 0, '2021-02-22 18:33:59', 0, '', ''),
(313, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:59', 0, '2021-02-22 18:33:59', 0, '2021-02-22 18:33:59', 0, '', ''),
(314, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:59', 0, '2021-02-22 18:33:59', 0, '2021-02-22 18:33:59', 0, '', ''),
(315, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:59', 0, '2021-02-22 18:33:59', 0, '2021-02-22 18:33:59', 0, '', ''),
(316, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:59', 0, '2021-02-22 18:33:59', 0, '2021-02-22 18:33:59', 0, '', ''),
(317, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:59', 0, '2021-02-22 18:33:59', 0, '2021-02-22 18:33:59', 0, '', ''),
(318, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:59', 0, '2021-02-22 18:33:59', 0, '2021-02-22 18:33:59', 0, '', ''),
(319, 'PR009', 'Anti Biotic', '', 'General', '', 0, 1, '2021-02-22 18:33:59', 0, '2021-02-22 18:33:59', 0, '2021-02-22 18:33:59', 0, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `tbltaxrate`
--

CREATE TABLE `tbltaxrate` (
  `TaxID` int(11) NOT NULL,
  `TaxRate` double NOT NULL,
  `ActiveTax` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbltaxrate`
--

INSERT INTO `tbltaxrate` (`TaxID`, `TaxRate`, `ActiveTax`) VALUES
(2, 123, 0),
(5, 116, 1),
(6, 16.5, 0),
(7, 25, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tblunit`
--

CREATE TABLE `tblunit` (
  `UnitID` int(11) NOT NULL,
  `Units` varchar(90) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblunit`
--

INSERT INTO `tblunit` (`UnitID`, `Units`) VALUES
(2, 'UNIT');

-- --------------------------------------------------------

--
-- Table structure for table `tblusers`
--

CREATE TABLE `tblusers` (
  `UserID` varchar(90) NOT NULL,
  `FullName` varchar(90) NOT NULL,
  `Username` varchar(90) NOT NULL,
  `Pass` varchar(90) NOT NULL,
  `Role` varchar(90) NOT NULL,
  `PicLoc` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblusers`
--

INSERT INTO `tblusers` (`UserID`, `FullName`, `Username`, `Pass`, `Role`, `PicLoc`) VALUES
('USER_01', 'Tien Khoa', 'admin', 'ed775fc7100d30f0ff6c1dbff1a6fb11f349a17a', 'Administrator', 'photos/favicon.png'),
('USER_02', 'Tran Binh', 'doctor1', '5c2dd944dde9e08881bef0894fe7b22a5c9c4b06', 'Staff', ''),
('USER_03', 'Bui Hieu', 'doctor2', '8cb2237d0679ca88db6464eac60da96345513964', 'Staff', 'photos/staysafe.png');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblappointments`
--
ALTER TABLE `tblappointments`
  ADD PRIMARY KEY (`AppoinmentID`);

--
-- Indexes for table `tblautonumbers`
--
ALTER TABLE `tblautonumbers`
  ADD PRIMARY KEY (`AUTOID`);

--
-- Indexes for table `tblbulkpricing`
--
ALTER TABLE `tblbulkpricing`
  ADD PRIMARY KEY (`BulkID`) USING BTREE;

--
-- Indexes for table `tblcurrency`
--
ALTER TABLE `tblcurrency`
  ADD PRIMARY KEY (`CurrencyID`);

--
-- Indexes for table `tbldiscountrate`
--
ALTER TABLE `tbldiscountrate`
  ADD PRIMARY KEY (`DiscountRateID`);

--
-- Indexes for table `tblinvoice`
--
ALTER TABLE `tblinvoice`
  ADD PRIMARY KEY (`InvoiceID`);

--
-- Indexes for table `tblpatients`
--
ALTER TABLE `tblpatients`
  ADD PRIMARY KEY (`PatientID`);

--
-- Indexes for table `tblpayments`
--
ALTER TABLE `tblpayments`
  ADD PRIMARY KEY (`PaymentID`);

--
-- Indexes for table `tblservices`
--
ALTER TABLE `tblservices`
  ADD PRIMARY KEY (`ServiceID`);

--
-- Indexes for table `tblstocks`
--
ALTER TABLE `tblstocks`
  ADD PRIMARY KEY (`StocksID`);

--
-- Indexes for table `tbltaxrate`
--
ALTER TABLE `tbltaxrate`
  ADD PRIMARY KEY (`TaxID`);

--
-- Indexes for table `tblunit`
--
ALTER TABLE `tblunit`
  ADD PRIMARY KEY (`UnitID`);

--
-- Indexes for table `tblusers`
--
ALTER TABLE `tblusers`
  ADD PRIMARY KEY (`UserID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `tblappointments`
--
ALTER TABLE `tblappointments`
  MODIFY `AppoinmentID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblautonumbers`
--
ALTER TABLE `tblautonumbers`
  MODIFY `AUTOID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tblbulkpricing`
--
ALTER TABLE `tblbulkpricing`
  MODIFY `BulkID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `tblcurrency`
--
ALTER TABLE `tblcurrency`
  MODIFY `CurrencyID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbldiscountrate`
--
ALTER TABLE `tbldiscountrate`
  MODIFY `DiscountRateID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblinvoice`
--
ALTER TABLE `tblinvoice`
  MODIFY `InvoiceID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `tblpatients`
--
ALTER TABLE `tblpatients`
  MODIFY `PatientID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `tblpayments`
--
ALTER TABLE `tblpayments`
  MODIFY `PaymentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `tblservices`
--
ALTER TABLE `tblservices`
  MODIFY `ServiceID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `tblstocks`
--
ALTER TABLE `tblstocks`
  MODIFY `StocksID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=320;

--
-- AUTO_INCREMENT for table `tbltaxrate`
--
ALTER TABLE `tbltaxrate`
  MODIFY `TaxID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tblunit`
--
ALTER TABLE `tblunit`
  MODIFY `UnitID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
