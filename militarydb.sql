-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 12, 2020 at 10:17 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `militarydb`
--

CREATE DATABASE IF NOT EXISTS `militarydb` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `militarydb`;

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `Extend Contracts 4 Years` ()  NO SQL
UPDATE contracts SET endDate = endDate + INTERVAL 4 YEAR$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Set Unit NULL for Expired Contracts` ()  NO SQL
UPDATE personnel p INNER JOIN contracts c ON p.contractNo = c.contractNo SET p.unitID = NULL WHERE c.endDate < CURDATE()$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `bases`
--

CREATE TABLE `bases` (
  `baseID` varchar(100) NOT NULL,
  `baseName` varchar(100) NOT NULL,
  `baseLoc` varchar(100) DEFAULT NULL,
  `baseType` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bases`
--

INSERT INTO `bases` (`baseID`, `baseName`, `baseLoc`, `baseType`) VALUES
('CM1', 'Camp Mujuk', 'Pohang, South Korea', 'Foreign'),
('HQMFR', 'Headquarters, Marine Forces Reserve, Naval Support Activity, New Orleans', 'New Orleans, Lousiana', 'Domestic'),
('MBWDC', 'Marine Barracks, Washington, D.C.', 'Washington, D.C.', 'Domestic'),
('MCAGCCTP', 'Marine Corps Air Ground Combat Center Twentynine Palms', 'Twentynine Palms, California', 'Domestic'),
('MCASY', 'Marine Corps Air Station Yuma', 'Yuma, Arizona', 'Domestic'),
('MCBCL', 'Marine Corps Base Camp Lejeune', 'Jacksonville, North Carolina', 'Domestic'),
('MCBCP1', 'Marine Corps Base Camp Pendleton', 'Oceanside, California', 'Domestic'),
('MCBCSDB', 'Marine Corps Base Camp Smedley D. Butler', 'Okinawa, Japan', 'Foreign'),
('MCBH', 'Marine Corps Base Hawaii', 'Kāne\'ohe Bay, Hawaii', 'Domestic'),
('MCBQ', 'Marine Corps Base Quantico', 'Quantico, Virginia', 'Domestic'),
('MCRDPI', 'Marine Corps Recruit Depot Parris Island', 'Beaufort, South Carolina', 'Domestic'),
('MCRDSD', 'Marine Corps Recruit Depot San Diego', 'San Diego, California', 'Domestic'),
('MWTC', 'Mountain Warfare Training Center', 'Bridgeport, California', 'Domestic');

-- --------------------------------------------------------

--
-- Table structure for table `contracts`
--

CREATE TABLE `contracts` (
  `contractNo` varchar(100) NOT NULL,
  `startDate` date DEFAULT NULL,
  `endDate` date DEFAULT NULL,
  `idNo` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contracts`
--

INSERT INTO `contracts` (`contractNo`, `startDate`, `endDate`, `idNo`) VALUES
('0171194265', '2020-05-01', '2024-05-01', '4055434249'),
('0182796145', '2017-12-25', '2021-12-25', '5941229540'),
('0192759320', '2000-01-19', '2008-01-19', '8727498382'),
('1301945459', '2001-07-08', '2005-07-08', '0396359991'),
('1542362989', '2017-01-01', '2021-01-01', '9943932602'),
('2986995351', '2017-01-04', '2021-01-04', '0522364338'),
('3091471951', '2018-07-06', '2021-01-14', '0625170653'),
('3707050213', '2014-02-03', '2018-02-03', '1928352910'),
('3796495409', '2003-06-15', '2011-06-15', '1928382110'),
('4034558839', '2008-06-07', '2032-06-07', '8203476654'),
('4628325240', '2019-03-29', '2023-03-29', '2080541443'),
('4821488668', '1999-09-11', '2005-09-11', '2194620093'),
('4995409304', '2015-05-18', '2021-05-18', '7825217576'),
('5742319283', '2016-11-24', '2020-11-24', '0123456789'),
('5805005633', '2019-05-09', '2027-05-09', '2598380217'),
('5991111846', '2020-11-12', '2026-11-11', '8456824919'),
('6164695883', '2010-04-06', '2018-04-06', '9786970697'),
('7109392999', '2019-05-06', '2023-05-06', '9876543210'),
('7511631655', '2019-02-27', '2023-02-27', '6340101189'),
('9634967133', '2020-10-31', '2026-10-31', '3280147211'),
('9806236901', '2012-04-01', '2020-12-17', '9999999991');

-- --------------------------------------------------------

--
-- Table structure for table `equipment`
--

CREATE TABLE `equipment` (
  `equipmentID` varchar(100) NOT NULL,
  `itemName` varchar(100) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `unitID` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `equipment`
--

INSERT INTO `equipment` (`equipmentID`, `itemName`, `quantity`, `unitID`) VALUES
('02036', 'MREs - Meals Ready to Eat', 3250, '2MD'),
('10202', 'Marine Corps Combat Utility Uniforms (MCCUUs)', 5000, '2MD'),
('15306', 'Fragmentation Grenades', 37, '2MD'),
('17457', 'M-16 Service Rifles', 250, '1MD'),
('28414', 'Humvees', 10, '3MD'),
('29463', 'MREs - Meals Ready to Eat', 150, '3MD'),
('30925', 'FILBE Main Pack', 50, '4MD'),
('34959', 'Kevlar Helmets', 75, '1MD'),
('41608', 'MREs - Meals Ready to Eat', 2350, '4MD'),
('42287', 'Standard Issue Boots', 300, '4MD'),
('53512', '8 Point Covers', 93, '4MD'),
('56054', 'MREs - Meals Ready to Eat', 3500, '3MD'),
('57273', 'Kevlar Vests', 75, '3MD'),
('78310', 'M1A1 Abrams Tank', 5, '2MD'),
('85844', 'Beretta M9 Sidearms', 20, '1MD'),
('91546', 'Assault Packs', 80, '1MD'),
('96440', 'MREs - Meals Ready to Eat', 3750, '1MD');

-- --------------------------------------------------------

--
-- Table structure for table `mos`
--

CREATE TABLE `mos` (
  `mosID` varchar(100) NOT NULL,
  `mosName` varchar(100) DEFAULT NULL,
  `mosField` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mos`
--

INSERT INTO `mos` (`mosID`, `mosName`, `mosField`) VALUES
('0100', 'Basic Administrative Marine', 'Personnel & Administration'),
('0101', 'Basic Manpower Officer', 'Personnel & Administration'),
('0102', 'Manpower Officer', 'Personnel & Administration'),
('0111', 'Administrative Specialist', 'Personnel & Administration'),
('0160', 'Postal Officer', 'Personnel & Administration'),
('0161', 'Postal Clerk', 'Personnel & Administration'),
('0170', 'Personnel Officer', 'Personnel & Administration'),
('0200', 'Basic Intelligence Marine', 'Intelligence'),
('0201', 'Basic Intelligence Officer', 'Intelligence'),
('0203', 'Ground Intelligence Officer', 'Intelligence'),
('0207', 'Air Intelligence Officer', 'Intelligence'),
('0211', 'Counterintelligence/Human Source Intelligence Specialist', 'Intelligence'),
('0231', 'Intelligence Specialist', 'Intelligence'),
('0239', 'Intelligence Analyst', 'Intelligence'),
('0241', 'Imagery Analysis Specialist', 'Intelligence'),
('0251', 'Interrogator/Debriefer', 'Intelligence'),
('0261', 'Geographic Intelligence Specialist', 'Intelligence'),
('0300', 'Basic Infantry Marine', 'Infantry'),
('0302', 'Infantry Officer', 'Infantry'),
('0311', 'Rifleman', 'Infantry'),
('0317', 'Scout Sniper', 'Infantry'),
('0321', 'Reconnaissance Marine', 'Infantry'),
('0331', 'Machine Gunner', 'Infantry'),
('0341', 'Mortarman', 'Infantry'),
('0365', 'Infantry Squad Leader', 'Infantry'),
('0400', 'Basic Logistics Marine', 'Logistics'),
('0402', 'Logistics Officer', 'Logistics'),
('0411', 'Maintenance Management Specialist', 'Logistics'),
('0431', 'Logistics/Embarkation Specialist', 'Logistics'),
('0500', 'Basic MAGTF Marine', 'Marine Air-Ground Task Force (MAGTF) Plans'),
('0511', 'MAGTF Planning Specialist', 'Marine Air-Ground Task Force (MAGTF) Plans'),
('0520', 'Military Information Support Operations (MISO) Officer', 'Marine Air-Ground Task Force (MAGTF) Plans'),
('0530', 'Civil Affairs Officer', 'Marine Air-Ground Task Force (MAGTF) Plans'),
('0540', 'Space Operations Staff Officer', 'Marine Air-Ground Task Force (MAGTF) Plans'),
('0551', 'Information Operations Specialist', 'Marine Air-Ground Task Force (MAGTF) Plans'),
('0600', 'Basic Communications Marine', 'Communications'),
('0602', 'Communications Officer', 'Communications'),
('0605', 'Cyber Network Operations Officer', 'Communications'),
('0627', 'Satellite Communications Operator', 'Communications'),
('0631', 'Network Administrator', 'Communications'),
('0670', 'Data Systems Engineering Officer', 'Communications'),
('0671', 'Data Systems Administrator', 'Communications'),
('0688', 'Cyber Security Technician', 'Communications'),
('0800', 'Basic Field Artillery Marine', 'Artillery'),
('0802', 'Field Artillery Officer', 'Artillery'),
('0811', 'Field Artillery Cannoneer', 'Artillery'),
('0911', 'Marine Corps Drill Instructor', 'Training'),
('0913', 'Marine Combat Instructor', 'Training'),
('0930', 'Range Officer', 'Training'),
('1100', 'Basic Utilities Marine', 'Utilities'),
('1120', 'Utilities Officer', 'Utilities'),
('1141', 'Electrician', 'Utilities'),
('1171', 'Water Support Technician', 'Utilities'),
('1300', 'Basic Engineer, Construction, Facilities, & Equipment Marine', 'Engineer, Construction, Facilities, & Equipment'),
('1302', 'Combat Engineer Officer', 'Engineer, Construction, Facilities, & Equipment'),
('1316', 'Metal Worker', 'Engineer, Construction, Facilities, & Equipment'),
('1330', 'Facilities Management Officer', 'Engineer, Construction, Facilities, & Equipment'),
('1346', 'Engineer Equipment Operator', 'Engineer, Construction, Facilities, & Equipment'),
('1371', 'Combat Engineer', 'Engineer, Construction, Facilities, & Equipment'),
('1391', 'Bulk Fuel Specialist', 'Engineer, Construction, Facilities, & Equipment'),
('1702', 'Cyberspace Officer', 'Cyberspace Operations'),
('1711', 'Cyberspace Exploitation Operator', 'Cyberspace Operations'),
('1721', 'Cyberspace Defensive Operator', 'Cyberspace Operations'),
('1800', 'Basic Tank and Assault Amphibious Vehicle (AAV) Marine', 'Tank and Assault Amphibious Vehicle'),
('1802', 'Tank Officer', 'Tank and Assault Amphibious Vehicle'),
('1803', 'Assault Amphibious Vehicle Officer', 'Tank and Assault Amphibious Vehicle'),
('1812', 'M1A1 Tank Crewman', 'Tank and Assault Amphibious Vehicle'),
('2100', 'Basic Ground Ordnance Maintenance Marine', 'Ground Ordnance Maintenance'),
('2102', 'Ordnance Officer', 'Ground Ordnance Maintenance'),
('2111', 'Small Arms Repairer/Technician', 'Ground Ordnance Maintenance'),
('2161', 'Machinist', 'Ground Ordnance Maintenance'),
('2305', 'Explosive Ordnance Disposal Officer', 'Ammunition and Explosive Ordinance Disposal'),
('2311', 'Ammunition Technician', 'Ammunition and Explosive Ordinance Disposal'),
('2336', 'Explosive Ordnance Disposal (EOD) Technician', 'Ammunition and Explosive Ordinance Disposal'),
('2602', 'Signals Intelligence/Ground Electronic Warfare (SIGINT/EW) Officer', 'Signals Intelligence/Ground Electronic Warfare'),
('2629', 'Signals Intelligence Analyst', 'Signals Intelligence/Ground Electronic Warfare'),
('2671', 'Middle East Cryptologic Linguist', 'Signals Intelligence/Ground Electronic Warfare'),
('2674', 'European Cryptologic Linguist', 'Signals Intelligence/Ground Electronic Warfare'),
('2800', 'Basic Data/Communications Maintenance Marine', 'Ground Electronics Maintenance'),
('2805', 'Data/Communications Maintenance Officer', 'Ground Electronics Maintenance'),
('2811', 'Telephone Technician', 'Ground Electronics Maintenance'),
('3002', 'Ground Supply Officer', 'Supply Chain Material Management'),
('3043', 'Supply Administration and Operations Specialist', 'Supply Chain Material Management'),
('3044', 'Contract Specialist', 'Supply Chain Material Management'),
('3051', 'Warehouse Clerk', 'Supply Chain Material Management'),
('3302', 'Food Service Officer', 'Food Service'),
('3381', 'Food Service Specialist', 'Food Service'),
('3404', 'Financial Management Officer', 'Financial Management'),
('3432', 'Finance Technician', 'Financial Management'),
('3510', 'Motor Transport Maintenance Officer', 'Motor Transport'),
('3513', 'Body Repair Mechanic', 'Motor Transport'),
('3531', 'Motor Vehicle Operator', 'Motor Transport'),
('4130', 'Marine Corps Community Services Officer', 'Morale, Welfare, and Recreation'),
('4133', 'Morale, Welfare, Recreation (MWR) Specialist', 'Morale, Welfare, and Recreation'),
('4312', 'Basic Military Journalism', 'Public Affairs'),
('4341', 'Combat Correspondent', 'Public Affairs'),
('4402', 'Judge Advocate', 'Legal Services'),
('4421', 'Legal Services Specialist', 'Legal Services'),
('4502', 'Communication Strategy & Operations Officer', 'Communication Strategy and Operations'),
('4541', 'Combat Photographer', 'Communication Strategy and Operations'),
('4571', 'Combat Videographer', 'Communication Strategy and Operations'),
('5502', 'Band Officer', 'Music'),
('5524', 'Musician', 'Music'),
('5702', 'Chemical, Biological, Radiological, and Nuclear (CBRN) Defense Officer', 'Chemical, Biological, Radiological, and Nuclear (CBRN) Defense'),
('5711', 'Chemical, Biological, Radiological, and Nuclear (CBRN) Defense Specialist', 'Chemical, Biological, Radiological, and Nuclear (CBRN) Defense'),
('5803', 'Military Police Officer', 'Military Police and Corrections'),
('5804', 'Corrections Officer', 'Military Police and Corrections'),
('5811', 'Military Police', 'Military Police and Corrections'),
('5812', 'Working Dog Handler', 'Military Police and Corrections'),
('5831', 'Correctional Specialist', 'Military Police and Corrections'),
('7597', 'Pilot, Basic Rotary Wing', 'Pilots/Naval Flight Officers'),
('7598', 'Pilot, Basic Fixed Wing', 'Pilots/Naval Flight Officers');

-- --------------------------------------------------------

--
-- Table structure for table `personnel`
--

CREATE TABLE `personnel` (
  `idNo` varchar(100) NOT NULL,
  `firstName` varchar(100) DEFAULT NULL,
  `lastName` varchar(100) DEFAULT NULL,
  `contractNo` varchar(100) DEFAULT NULL,
  `rankID` varchar(100) DEFAULT NULL,
  `mosID` varchar(100) DEFAULT NULL,
  `unitID` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `personnel`
--

INSERT INTO `personnel` (`idNo`, `firstName`, `lastName`, `contractNo`, `rankID`, `mosID`, `unitID`) VALUES
('0123456789', 'Nicolas', 'Layne', '5742319283', 'E-5', '1371', '4MD'),
('0396359991', 'Richard', 'Smith', '1301945459', 'O-1', '0302', '2MD'),
('0522364338', 'Johnathan', 'Kingsman', '2986995351', 'O-2', '1302', '3MD'),
('0625170653', 'John', 'Trello', '3091471951', 'E-8B', '0311', '3MD'),
('1928352910', 'Trey', 'Johnson', '3707050213', 'O-5', '4402', '3MD'),
('1928382110', 'Tom', 'Daily', '3796495409', 'E-4', '0411', '3MD'),
('2080541443', 'Talia', 'Hightower', '4628325240', 'W-1', '3381', '3MD'),
('2194620093', 'John', 'Smith', '4821488668', 'E-3', '0311', '1MD'),
('2598380217', 'Nathaniel', 'Tanner', '5805005633', 'E-2', '0811', '3MD'),
('3280147211', 'David', 'Setter', '9634967133', 'E-9B', '0365', '3MD'),
('4055434249', 'Gomer', 'Pyle', '0171194265', 'E-1', '0311', '3MD'),
('5941229540', 'Chante', 'Coleman', '0182796145', 'O-3', '4502', '2MD'),
('6340101189', 'Jeffrey', 'Steele', '7511631655', 'E-2', '0311', '3MD'),
('7825217576', 'Elliot', 'Zeal', '4995409304', 'E-3', '1171', '3MD'),
('8203476654', 'Wade', 'OrangeBeef', '4034558839', 'W-5', '0311', '3MD'),
('8456824919', 'Thomas', 'Jefferson', '5991111846', 'E-4', '0317', '3MD'),
('8727498382', 'Tyler', 'Ronaldson', '0192759320', 'E-1', '0311', '1MD'),
('9786970697', 'Kylie', 'Turner', '6164695883', 'E-7', '0111', '3MD'),
('9876543210', 'Garret', 'Powell', '7109392999', 'O-10', '0302', '1MD'),
('9943932602', 'Cameron', 'Johnson', '1542362989', 'E-9C', '3381', '3MD'),
('9999999991', 'Steven', 'Bills', '9806236901', 'O-7', '0911', '3MD');

--
-- Triggers `personnel`
--
DELIMITER $$
CREATE TRIGGER `SMMC Limit` AFTER INSERT ON `personnel` FOR EACH ROW BEGIN
DECLARE num_SMMC INTEGER;
DECLARE msg varchar(100);
SELECT count(*) INTO num_SMMC FROM personnel WHERE rankID = 'E-9C';
IF num_SMMC > 1 THEN SET msg = 'There can only be 1 Sergeant Major of the Marine Corps.'; SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `Unit Personnel Limit` AFTER INSERT ON `personnel` FOR EACH ROW BEGIN
DECLARE num_over INTEGER;
DECLARE msg varchar(100);
SELECT count(*) INTO num_over FROM (SELECT unitID, count(*) AS numUnits FROM personnel GROUP BY unitID) a WHERE a.numUnits > 15;
IF num_over >= 1 THEN SET msg = 'There can only be 15 Marines in a unit.'; SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `personnelview`
-- (See below for the actual view)
--
CREATE TABLE `personnelview` (
`ID No.` varchar(100)
,`Rank` varchar(100)
,`Last Name` varchar(100)
,`First Name` varchar(100)
,`MOS` varchar(100)
,`Unit` varchar(100)
,`Base` varchar(100)
);

-- --------------------------------------------------------

--
-- Table structure for table `ranks`
--

CREATE TABLE `ranks` (
  `rankID` varchar(100) NOT NULL,
  `rankName` varchar(100) DEFAULT NULL,
  `rankAbbrev` varchar(100) NOT NULL,
  `rankType` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ranks`
--

INSERT INTO `ranks` (`rankID`, `rankName`, `rankAbbrev`, `rankType`) VALUES
('E-1', 'Private', 'Pvt', 'Enlisted'),
('E-2', 'Private First Class', 'PFC', 'Enlisted'),
('E-3', 'Lance Corporal', 'LCpl', 'Enlisted'),
('E-4', 'Corporal', 'Cpl', 'Enlisted'),
('E-5', 'Sergeant', 'Sgt', 'Enlisted'),
('E-6', 'Staff Sergeant', 'SSgt', 'Enlisted'),
('E-7', 'Gunnery Sergeant', 'GySgt', 'Enlisted'),
('E-8A', 'Master Sergeant', 'MSgt', 'Enlisted'),
('E-8B', 'First Sergeant', '1stSgt', 'Enlisted'),
('E-9A', 'Master Gunnery Sergeant', 'MGySgt', 'Enlisted'),
('E-9B', 'Sergeant Major', 'SgtMaj', 'Enlisted'),
('E-9C', 'Sergeant Major of the Marine Corps', 'SMMC', 'Enlisted'),
('O-1', 'Second Lieutenant', '2ndLt', 'Commissioned Officer'),
('O-10', 'General', 'Gen', 'Commissioned Officer'),
('O-2', 'First Lieutenant', '1stLt', 'Commissioned Officer'),
('O-3', 'Captain', 'Capt', 'Commissioned Officer'),
('O-4', 'Major', 'Maj', 'Commissioned Officer'),
('O-5', 'Lieutenant Colonel', 'LtCol', 'Commissioned Officer'),
('O-6', 'Colonel', 'Col', 'Commissioned Officer'),
('O-7', 'Brigadier General', 'BGen', 'Commissioned Officer'),
('O-8', 'Major General', 'MajGen', 'Commissioned Officer'),
('O-9', 'Lieutenant General', 'LtGen', 'Commissioned Officer'),
('W-1', 'Warrant Officer 1', 'WO1', 'Warrant Officer'),
('W-2', 'Chief Warrant Officer 2', 'CWO2', 'Warrant Officer'),
('W-3', 'Chief Warrant Officer 3', 'CWO3', 'Warrant Officer'),
('W-4', 'Chief Warrant Officer 4', 'CWO4', 'Warrant Officer'),
('W-5', 'Chief Warrant Officer 5', 'CWO5', 'Warrant Officer');

--
-- Triggers `ranks`
--
DELIMITER $$
CREATE TRIGGER `Rank Control` AFTER INSERT ON `ranks` FOR EACH ROW BEGIN
DECLARE num_ranks INTEGER;
DECLARE msg varchar(100);
SELECT count(*) INTO num_ranks FROM ranks;
IF num_ranks != 27 THEN SET msg = 'Ranks cannot be added or deleted'; SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `Rank Control - DEL` AFTER DELETE ON `ranks` FOR EACH ROW BEGIN
DECLARE num_ranks INTEGER;
DECLARE msg varchar(100);
SELECT count(*) INTO num_ranks FROM ranks;
IF num_ranks != 27 THEN SET msg = 'Ranks cannot be added or deleted'; SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `unitID` varchar(100) NOT NULL,
  `unitName` varchar(100) DEFAULT NULL,
  `baseID` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`unitID`, `unitName`, `baseID`) VALUES
('1MD', '1st Marine Division', 'MCBCP1'),
('2MD', '2nd Marine Division', 'MCBCL'),
('3MD', '3rd Marine Division', 'MCBCSDB'),
('4MD', '4th Marine Division', 'HQMFR');

-- --------------------------------------------------------

--
-- Structure for view `personnelview`
--
DROP TABLE IF EXISTS `personnelview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `personnelview`  AS  select `p`.`idNo` AS `ID No.`,`r`.`rankAbbrev` AS `Rank`,`p`.`lastName` AS `Last Name`,`p`.`firstName` AS `First Name`,`m`.`mosName` AS `MOS`,`u`.`unitName` AS `Unit`,`b`.`baseName` AS `Base` from ((((`personnel` `p` join `ranks` `r` on(`p`.`rankID` = `r`.`rankID`)) join `mos` `m` on(`p`.`mosID` = `m`.`mosID`)) join `units` `u` on(`p`.`unitID` = `u`.`unitID`)) join `bases` `b` on(`u`.`baseID` = `b`.`baseID`)) order by `p`.`lastName` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bases`
--
ALTER TABLE `bases`
  ADD PRIMARY KEY (`baseID`);

--
-- Indexes for table `contracts`
--
ALTER TABLE `contracts`
  ADD PRIMARY KEY (`contractNo`),
  ADD KEY `idNo` (`idNo`);

--
-- Indexes for table `equipment`
--
ALTER TABLE `equipment`
  ADD PRIMARY KEY (`equipmentID`),
  ADD KEY `unitID` (`unitID`);

--
-- Indexes for table `mos`
--
ALTER TABLE `mos`
  ADD PRIMARY KEY (`mosID`);

--
-- Indexes for table `personnel`
--
ALTER TABLE `personnel`
  ADD PRIMARY KEY (`idNo`),
  ADD KEY `contractNo` (`contractNo`),
  ADD KEY `rankID` (`rankID`),
  ADD KEY `mosID` (`mosID`),
  ADD KEY `unitID` (`unitID`);

--
-- Indexes for table `ranks`
--
ALTER TABLE `ranks`
  ADD PRIMARY KEY (`rankID`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`unitID`),
  ADD KEY `baseID` (`baseID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `contracts`
--
ALTER TABLE `contracts`
  ADD CONSTRAINT `contracts_ibfk_1` FOREIGN KEY (`idNo`) REFERENCES `personnel` (`idNo`);

--
-- Constraints for table `equipment`
--
ALTER TABLE `equipment`
  ADD CONSTRAINT `equipment_ibfk_1` FOREIGN KEY (`unitID`) REFERENCES `units` (`unitID`);

--
-- Constraints for table `personnel`
--
ALTER TABLE `personnel`
  ADD CONSTRAINT `personnel_ibfk_1` FOREIGN KEY (`contractNo`) REFERENCES `contracts` (`contractNo`),
  ADD CONSTRAINT `personnel_ibfk_2` FOREIGN KEY (`rankID`) REFERENCES `ranks` (`rankID`),
  ADD CONSTRAINT `personnel_ibfk_3` FOREIGN KEY (`mosID`) REFERENCES `mos` (`mosID`),
  ADD CONSTRAINT `personnel_ibfk_4` FOREIGN KEY (`unitID`) REFERENCES `units` (`unitID`);

--
-- Constraints for table `units`
--
ALTER TABLE `units`
  ADD CONSTRAINT `units_ibfk_1` FOREIGN KEY (`baseID`) REFERENCES `bases` (`baseID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
