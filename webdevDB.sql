-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Waktu pembuatan: 06 Bulan Mei 2024 pada 16.15
-- Versi server: 10.4.28-MariaDB
-- Versi PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `webdevDB`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `Customers`
--

CREATE TABLE `Customers` (
  `CustomerID` int(11) NOT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `Customers`
--

INSERT INTO `Customers` (`CustomerID`, `FirstName`, `LastName`, `Email`) VALUES
(1, 'Yaya', 'yuyu', 'yayayuyu@mail.com'),
(2, 'Baba', 'bubu', 'bababubu@mail.com'),
(3, 'Caca', 'cucu', 'cacu@mail.com'),
(4, 'Haha', 'huhu', 'hahu@mail.com'),
(5, 'Nana', 'nunu', 'nanu@mail.com');

-- --------------------------------------------------------

--
-- Struktur dari tabel `Orders`
--

CREATE TABLE `Orders` (
  `OrderID` int(11) NOT NULL,
  `CustomerFirstName` varchar(50) DEFAULT NULL,
  `CustomerLastName` varchar(50) DEFAULT NULL,
  `ProductName` varchar(100) DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `OrderDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `OrdersNDua`
--

CREATE TABLE `OrdersNDua` (
  `OrderID` int(11) NOT NULL,
  `CustomerID` int(11) DEFAULT NULL,
  `ProductID` int(11) DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `OrderDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `OrdersNDua`
--

INSERT INTO `OrdersNDua` (`OrderID`, `CustomerID`, `ProductID`, `Quantity`, `OrderDate`) VALUES
(1, 1, 1, 3, '2023-01-15'),
(2, 1, 2, 2, '2023-01-20'),
(3, 2, 1, 3, '2023-02-15'),
(4, 3, 4, 2, '2023-03-15'),
(5, 4, 5, 3, '2023-01-18');

-- --------------------------------------------------------

--
-- Struktur dari tabel `OrdersNSatu`
--

CREATE TABLE `OrdersNSatu` (
  `OrderID` int(11) NOT NULL,
  `CustomerID` int(11) DEFAULT NULL,
  `ProductID` int(11) DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `OrderDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `Products`
--

CREATE TABLE `Products` (
  `ProductID` int(11) NOT NULL,
  `ProductName` varchar(50) DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  `Currency` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `Products`
--

INSERT INTO `Products` (`ProductID`, `ProductName`, `Price`, `Currency`) VALUES
(1, 'Laptop', 100.00, 'USD'),
(2, 'HP', 50.00, 'SGD'),
(3, 'Table', 75000.00, 'IDR'),
(4, 'Headphone', 25.00, 'USD'),
(5, 'Watch', 75.00, 'SGD');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `Customers`
--
ALTER TABLE `Customers`
  ADD PRIMARY KEY (`CustomerID`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- Indeks untuk tabel `Orders`
--
ALTER TABLE `Orders`
  ADD PRIMARY KEY (`OrderID`);

--
-- Indeks untuk tabel `OrdersNDua`
--
ALTER TABLE `OrdersNDua`
  ADD PRIMARY KEY (`OrderID`),
  ADD KEY `CustomerID` (`CustomerID`),
  ADD KEY `ProductID` (`ProductID`);

--
-- Indeks untuk tabel `OrdersNSatu`
--
ALTER TABLE `OrdersNSatu`
  ADD PRIMARY KEY (`OrderID`);

--
-- Indeks untuk tabel `Products`
--
ALTER TABLE `Products`
  ADD PRIMARY KEY (`ProductID`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `OrdersNDua`
--
ALTER TABLE `OrdersNDua`
  ADD CONSTRAINT `ordersndua_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `Customers` (`CustomerID`),
  ADD CONSTRAINT `ordersndua_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `Products` (`ProductID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
