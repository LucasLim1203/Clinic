-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 07, 2024 at 12:23 AM
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
-- Database: `clinic`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `id` int(30) NOT NULL,
  `patient_id` int(30) NOT NULL,
  `date_sched` datetime NOT NULL,
  `ailment` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`id`, `patient_id`, `date_sched`, `ailment`, `status`, `date_created`) VALUES
(131, 11, '2024-12-03 12:03:00', 'Facial', 1, '2024-11-07 04:17:56'),
(136, 11, '2024-12-02 16:00:00', '', 2, '2024-11-07 04:23:09');

-- --------------------------------------------------------

--
-- Table structure for table `article`
--

CREATE TABLE `article` (
  `id` int(100) NOT NULL,
  `title` text NOT NULL,
  `category` varchar(100) NOT NULL,
  `article` longtext NOT NULL,
  `image` varchar(100) NOT NULL,
  `author` varchar(100) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `isActive` tinyint(10) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `article`
--

INSERT INTO `article` (`id`, `title`, `category`, `article`, `image`, `author`, `date`, `isActive`) VALUES
(28, 'Skin Tightening', 'Skin', 'As people age, sagging skin is a prevalent issue that affects many individuals. This condition can manifest in different parts of the body, with the face, neck, arms, and legs being the most commonly affected areas. This can make us feel self-conscious and less confident in our appearance.\r\n\r\nFortunately, there are skin tightening treatments available to help address sagging skin, such as surgical procedures or non-invasive treatments like laser therapy or radiofrequency. These treatments can help to restore elasticity and tighten the skin, which can improve our confidence and overall sense of well-being.', 'image (3).png', 'Ronaldo Lim', '2024-10-31 21:55:26', 0),
(29, 'If you have to pop a pimple, this is how to do it', 'Face', '1. Cleanse thoroughly\r\nBegin by cleansing your skin with a gentle wash like Azclear Action Foaming Wash. This will help sweep away any surface impurities like excess oil and bacteria, leaving you prepped for the next step.\r\n\r\n2. Steam your skin\r\nIt’s a beauty myth that steaming ‘opens’ the pores but it does still offer many benefits. Steaming the complexion helps to soften the skin and allows blocked pores to be more unclogged2.\r\n\r\nIf you don’t own a facial steamer, that’s no problem. Try positioning your face around 30cm above a bowl of hot water and drape a towel over your head to keep the steam in. Pop your favourite podcast on and relax for five to ten minutes. If, at any time, the steam becomes uncomfortable or feels too hot, stop right away.\r\n\r\n3. It’s pimple popping time\r\nGrab some cotton pads and position one over each of your pointer fingers. Place your pointer fingers either side of the pimple and gently push downwards. If the pimple isn’t easily popped after around five seconds, it’s time to stop. This means that the blockage isn’t ready to come out yet, and if you force it, you’ll damage your skin.', 'how-to-pop-a-pimple.jpeg', 'Alice Chew', '2024-10-31 23:08:08', 0),
(30, '‘Ozempic Face’: How Weight Loss Changes the Skin, and the Treatments That Can Help', 'Face', 'Ozempic, a type 2 diabetes medication, has picked up plenty of steam on social media as a weight loss trend. Sudden demand has led to shortages of the prescription-only drug and its obesity treatment counterpart Wegovy. But using it may lead to “Ozempic face.” The term, coined by Paul Jarrod Frank, MD, a New York City–based dermatologist, refers to a side effect of the drug and of rapid weight loss in general: facial aging, including gauntness and skin sagging.\r\n\r\nDavid Shafer, MD, a plastic surgeon in New York City, argues that “Ozempic face” is a term coined for media shock value and attention but, at its root, is nothing new. “As we age and when we lose weight, often we also lose weight in our face, leading to skin laxity,” Dr. Shafer says. “This is not anything specific to Ozempic. Any method of weight loss would lead to the same issue.”', 'face.jpg', 'Amanda Neo', '2024-11-06 20:27:38', 0);

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `pid` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` int(10) NOT NULL,
  `quantity` int(10) NOT NULL,
  `image` varchar(100) NOT NULL,
  `discount` int(10) NOT NULL,
  `stock` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `user_id`, `pid`, `name`, `price`, `quantity`, `image`, `discount`, `stock`) VALUES
(38, 11, 16, 'MAYCHEER® Body Scar Repair Cream 50G(1.7oz)', 128, 1, '5ed25ad307b7842dbf7516bc887b132b.png', 0, 76);

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `message` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `name`, `email`, `subject`, `message`, `status`) VALUES
(8, 'Lucas', 'lucas@gmail.com', 'skin', 'Skin Sensitive. Red Dots. Pain.', 0),
(9, 'Amanda', 'amandawong@gmail.com', 'Body', 'I was interested in keeping my body fit. Any supplement suggested?', 0);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(100) NOT NULL,
  `reference_number` varchar(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `name` varchar(20) NOT NULL,
  `number` varchar(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `method` varchar(50) NOT NULL,
  `address` varchar(500) NOT NULL,
  `total_products` varchar(1000) NOT NULL,
  `total_price` int(100) NOT NULL,
  `placed_on` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` varchar(20) NOT NULL DEFAULT '2',
  `s_status` int(15) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `reference_number`, `user_id`, `name`, `number`, `email`, `method`, `address`, `total_products`, `total_price`, `placed_on`, `status`, `s_status`) VALUES
(7, '610470067166', 11, 'Lucas', '0125201314', 'lucas@gmail.com', 'cash on delivery', 'No.18, Jalan Penang 1, George Town, Penang, Malaysia ， 11700', 'Skintific 5X Ceramide Barrier Repair Moisturize Gel (199 x 1) - ', 199, '2024-11-06 20:42:46', '1', 0),
(8, '702082485694', 11, 'Lucas', '0125201314', 'lucas@gmail.com', 'cash on delivery', 'No.18, Jalan Penang 1, George Town, Penang, Malaysia ， 11700', 'Eucerin Spotless Brightening Body Lotion (289 x 1) - Olay Luminous Niacinamide AHA Face Super Serum 30ml (178 x 1) - ', 344, '2024-11-06 20:50:31', '2', 0);

-- --------------------------------------------------------

--
-- Table structure for table `patient_list`
--

CREATE TABLE `patient_list` (
  `id` int(30) NOT NULL,
  `name` varchar(50) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patient_list`
--

INSERT INTO `patient_list` (`id`, `name`, `date_created`) VALUES
(3, 'yinqinn', '2023-11-09 00:45:21'),
(5, 'test', '2024-10-31 01:59:10'),
(11, 'Lucas', '2024-11-07 04:11:56');

-- --------------------------------------------------------

--
-- Table structure for table `patient_meta`
--

CREATE TABLE `patient_meta` (
  `patient_id` int(30) NOT NULL,
  `meta_field` text DEFAULT NULL,
  `meta_value` text DEFAULT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patient_meta`
--

INSERT INTO `patient_meta` (`patient_id`, `meta_field`, `meta_value`, `date_created`) VALUES
(3, 'name', 'yinqinn', '2023-11-09 00:45:36'),
(3, 'email', 'weiyi1089@gmail.com   ', '2023-11-09 00:45:36'),
(3, 'gender', 'Male', '2023-11-09 00:45:36'),
(3, 'contact', '0123456789   ', '2023-11-09 00:45:36'),
(3, 'dob', '2023-11-02', '2023-11-09 00:45:36'),
(3, 'id', '', '2023-11-09 00:45:36'),
(3, 'patient_id', '', '2023-11-09 00:45:36'),
(3, 'submit', '', '2023-11-09 00:45:36'),
(3, 'name', 'yinqinn', '2023-11-10 04:48:15'),
(3, 'email', 'weiyi1089@gmail.com   ', '2023-11-10 04:48:15'),
(3, 'gender', 'Male', '2023-11-10 04:48:15'),
(3, 'contact', '0123456789   ', '2023-11-10 04:48:15'),
(3, 'dob', '2023-11-09', '2023-11-10 04:48:15'),
(3, 'id', '', '2023-11-10 04:48:15'),
(3, 'patient_id', '', '2023-11-10 04:48:15'),
(3, 'submit', '', '2023-11-10 04:48:15'),
(5, 'name', 'test', '2024-10-31 02:00:00'),
(5, 'email', 'test@gmail.com   ', '2024-10-31 02:00:00'),
(5, 'gender', 'Male', '2024-10-31 02:00:00'),
(5, 'contact', '0128888888   ', '2024-10-31 02:00:00'),
(5, 'dob', '2006-01-11', '2024-10-31 02:00:00'),
(5, 'id', '', '2024-10-31 02:00:00'),
(5, 'patient_id', '', '2024-10-31 02:00:00'),
(5, 'submit', '', '2024-10-31 02:00:00'),
(11, 'name', 'Lucas', '2024-11-07 04:16:03'),
(11, 'email', 'lucas@gmail.com   ', '2024-11-07 04:16:03'),
(11, 'gender', 'Male', '2024-11-07 04:16:03'),
(11, 'contact', '0125201314   ', '2024-11-07 04:16:03'),
(11, 'dob', '2000-12-03', '2024-11-07 04:16:03'),
(11, 'id', '', '2024-11-07 04:16:03'),
(11, 'patient_id', '', '2024-11-07 04:16:03'),
(11, 'submit', '', '2024-11-07 04:16:03'),
(11, 'name', 'Lucas', '2024-11-07 04:17:56'),
(11, 'email', 'lucas@gmail.com   ', '2024-11-07 04:17:56'),
(11, 'gender', 'Male', '2024-11-07 04:17:56'),
(11, 'contact', '0125201314   ', '2024-11-07 04:17:56'),
(11, 'dob', '2000-12-03', '2024-11-07 04:17:56'),
(11, 'id', '', '2024-11-07 04:17:56'),
(11, 'patient_id', '', '2024-11-07 04:17:56'),
(11, 'submit', '', '2024-11-07 04:17:56'),
(11, 'name', 'Lucas', '2024-11-07 04:18:48'),
(11, 'email', 'lucas@gmail.com   ', '2024-11-07 04:18:48'),
(11, 'gender', 'Male', '2024-11-07 04:18:48'),
(11, 'contact', '0125201314   ', '2024-11-07 04:18:48'),
(11, 'dob', '2000-12-03', '2024-11-07 04:18:48'),
(11, 'id', '', '2024-11-07 04:18:48'),
(11, 'patient_id', '', '2024-11-07 04:18:48'),
(11, 'submit', '', '2024-11-07 04:18:48'),
(11, 'name', 'Lucas', '2024-11-07 04:20:24'),
(11, 'email', 'lucas@gmail.com   ', '2024-11-07 04:20:24'),
(11, 'gender', 'Male', '2024-11-07 04:20:24'),
(11, 'contact', '0125201314   ', '2024-11-07 04:20:24'),
(11, 'dob', '2000-12-03', '2024-11-07 04:20:24'),
(11, 'id', '', '2024-11-07 04:20:24'),
(11, 'patient_id', '', '2024-11-07 04:20:24'),
(11, 'submit', '', '2024-11-07 04:20:24'),
(11, 'name', 'Lucas', '2024-11-07 04:20:34'),
(11, 'email', 'lucas@gmail.com   ', '2024-11-07 04:20:34'),
(11, 'gender', 'Male', '2024-11-07 04:20:34'),
(11, 'contact', '0125201314   ', '2024-11-07 04:20:34'),
(11, 'dob', '2000-12-03', '2024-11-07 04:20:34'),
(11, 'id', '', '2024-11-07 04:20:34'),
(11, 'patient_id', '', '2024-11-07 04:20:34'),
(11, 'submit', '', '2024-11-07 04:20:34'),
(11, 'name', 'Lucas', '2024-11-07 04:21:21'),
(11, 'email', 'lucas@gmail.com   ', '2024-11-07 04:21:21'),
(11, 'gender', 'Male', '2024-11-07 04:21:21'),
(11, 'contact', '0125201314   ', '2024-11-07 04:21:21'),
(11, 'dob', '2000-12-03', '2024-11-07 04:21:21'),
(11, 'id', '', '2024-11-07 04:21:21'),
(11, 'patient_id', '', '2024-11-07 04:21:21'),
(11, 'submit', '', '2024-11-07 04:21:21'),
(11, 'name', 'Lucas', '2024-11-07 04:23:09'),
(11, 'email', 'lucas@gmail.com   ', '2024-11-07 04:23:09'),
(11, 'gender', 'Male', '2024-11-07 04:23:09'),
(11, 'contact', '0125201314   ', '2024-11-07 04:23:09'),
(11, 'dob', '2000-12-03', '2024-11-07 04:23:09'),
(11, 'id', '', '2024-11-07 04:23:09'),
(11, 'patient_id', '', '2024-11-07 04:23:09'),
(11, 'submit', '', '2024-11-07 04:23:09');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `details` varchar(500) NOT NULL,
  `price` int(10) NOT NULL,
  `image_01` varchar(100) NOT NULL,
  `image_02` varchar(100) NOT NULL,
  `image_03` varchar(100) NOT NULL,
  `category` varchar(100) NOT NULL,
  `discount` int(10) DEFAULT NULL,
  `stock` int(100) NOT NULL,
  `isActive` tinyint(10) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `details`, `price`, `image_01`, `image_02`, `image_03`, `category`, `discount`, `stock`, `isActive`) VALUES
(13, 'Skintific 5X Ceramide Barrier Repair Moisturize Gel', 'Moisturizer that combines 3 active ingredients Ceramide, Hyaluronic Acid, and Centella Asiatica, to overcome skin barrier problems such as acne, redness, textured skin, and dry skin quickly but still safe for the skin barrier. Enriched with 5X Ceramide technology, which is a combination of 5 types of Ceramide to deeply moisturize and strengthen the skin layer. 5X Ceramide helps to improve and protect the skin barrier by maintaining moisture and protecting the skin from external factors.', 199, 'skintific2.png', 'Skintific-5X-Ceramide-Barrier-Repair-Moisturize-Gel.png', 'skintific.png', 'Face', NULL, 100, 0),
(14, 'Olay Luminous Niacinamide AHA Face Super Serum 30ml', 'Olay Luminous Niacinamide + AHA Face Super Serum Reduce Acne Marks 30 ml\r\n', 178, 'olay 1.png', 'olay 2.png', '', 'Face', 4, 99, 0),
(15, 'Eucerin Spotless Brightening Body Lotion', 'Repairs and strengthens sensitive damaged skin.\r\n\r\nContaining a special UV Protection Complex and Vitamin E safeguards the skin from damaging UV-induced free radicals.', 289, 'images.jfif', '04_Ingredients - Copy 1.png', '', 'Body', 40, 100, 0),
(16, 'MAYCHEER® Body Scar Repair Cream 50G(1.7oz)', 'Scar Cream: It is easy to penetrate the cortex soften the scar tissue promote the skin&#39;s natural renewal and healing quickly heal the scars. it also has the anti-inflammatory ,beauty and skin nourishing function.\r\n\r\nScar Repairing: It contains crocodile peptide extract and other ingredients ; effectively removes scars while balance the skin color, softening the cuticle , to reduce scar surface tension, thereby reducing the synthesis of collagen fibers .\r\n\r\nRemoving Pigment Precipitation: Slo', 128, '5ed25ad307b7842dbf7516bc887b132b.png', '357bd80734533b7b75b695123df05b06.png_720x720q80.png', '', 'Skin', 0, 76, 0);

-- --------------------------------------------------------

--
-- Table structure for table `schedule_settings`
--

CREATE TABLE `schedule_settings` (
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL,
  `date_create` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `schedule_settings`
--

INSERT INTO `schedule_settings` (`meta_field`, `meta_value`, `date_create`) VALUES
('day_schedule', 'Monday,Tuesday,Wednesday,Thursday,Friday', '2024-11-07 04:21:27'),
('morning_schedule', '09:00,11:59', '2024-11-07 04:21:27'),
('afternoon_schedule', '13:00,18:00', '2024-11-07 04:21:27'),
('update_schedule', '', '2024-11-07 04:21:27');

-- --------------------------------------------------------

--
-- Table structure for table `system_info`
--

CREATE TABLE `system_info` (
  `id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `system_info`
--

INSERT INTO `system_info` (`id`, `meta_field`, `meta_value`) VALUES
(1, 'name', 'Patient Appointment Scheduler System - PHP'),
(6, 'short_name', 'PASS-PHP'),
(11, 'logo', 'uploads/1630631400_clinic-logo.png'),
(13, 'user_avatar', 'uploads/user_avatar.jpg'),
(14, 'cover', 'uploads/1630631400_clinic-cover.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(100) NOT NULL,
  `role_id` int(10) NOT NULL DEFAULT 3 COMMENT '1=admin,2=doctor,3=user',
  `name` varchar(20) NOT NULL,
  `dname` varchar(250) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `avatar` text DEFAULT NULL,
  `phone` varchar(50) NOT NULL,
  `address` varchar(100) NOT NULL,
  `type` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `dname`, `email`, `password`, `avatar`, `phone`, `address`, `type`) VALUES
(1, 1, 'admin', '', 'admin@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', NULL, '0123456789', '', 0),
(11, 3, 'Lucas', '', 'lucas@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', NULL, '0125201314', '', 0),
(12, 2, 'doctor', 'Amanda Neo', 'neo@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', '../assets/img/doctors/1730923380_1730407200_image.png', '0123456789', '', 0),
(13, 2, 'Alice', 'Alice Chew', 'alice@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', '../assets/img/doctors/1730411460_image (1).png', '01275734253', '', 0),
(14, 2, 'Ronaldo', 'Ronaldo Lim', 'ronaldo@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', '../assets/img/doctors/1730411580_image (2).png', '0198765234', '', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `patient_list`
--
ALTER TABLE `patient_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `patient_meta`
--
ALTER TABLE `patient_meta`
  ADD KEY `patient_id` (`patient_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_info`
--
ALTER TABLE `system_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointments`
--
ALTER TABLE `appointments`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=137;

--
-- AUTO_INCREMENT for table `article`
--
ALTER TABLE `article`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `patient_list`
--
ALTER TABLE `patient_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `system_info`
--
ALTER TABLE `system_info`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `patient_meta`
--
ALTER TABLE `patient_meta`
  ADD CONSTRAINT `patient_meta_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patient_list` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
