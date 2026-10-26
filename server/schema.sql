-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 26, 2026 at 08:48 PM
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
-- Database: `tech_job_scanner`
--

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` int(11) NOT NULL,
  `title` varchar(150) NOT NULL,
  `company` varchar(100) NOT NULL,
  `location` varchar(100) DEFAULT 'Remote',
  `tech_stack` varchar(255) NOT NULL,
  `salary_range` varchar(50) DEFAULT 'Competitive',
  `application_link` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`id`, `title`, `company`, `location`, `tech_stack`, `salary_range`, `application_link`, `created_at`) VALUES
(1, 'Junior Frontend Developer', 'Unturned', 'Remote (Global)', 'React, JavaScript, CSS', '$50k - $65k', 'https://example.com/apply', '2026-10-24 18:41:51'),
(2, 'Full Stack Developer', 'Cluster Protocol', 'Remote', 'React, Node.js, MySQL', 'Competitive', 'https://example.com/apply', '2026-10-24 18:41:51'),
(3, 'Sales Development Representative German Speaking', 'Huzzle', 'Remote', 'saas, sys admin, dev, marketing, finance, c, exec, sales, medical, ecommerce, digital nomad', '$0 - $0', 'https://remoteOK.com/remote-jobs/remote-sales-development-representative-german-speaking-huzzle-1137563', '2026-10-24 19:14:45'),
(4, 'Senior Frontend Engineer', 'B2spin', 'Remote', 'front end, design, react, embedded, sys admin, game dev, technical, dev, testing, marketing, web dev, javascript, finance, css, html, typescript, seo, mobile, senior, stats, engineer, backend, digital nomad', '$0 - $0', 'https://remoteOK.com/remote-jobs/remote-senior-frontend-engineer-b2spin-1137562', '2026-10-24 19:14:45'),
(5, 'Sales Development Representative B2B', 'Huzzle', 'Remote', 'saas, salesforce, education, customer support, marketing, finance, exec, sales, full time', '$0 - $0', 'https://remoteOK.com/remote-jobs/remote-sales-development-representative-b2b-huzzle-1137561', '2026-10-24 19:14:45'),
(6, 'Accounting and Implementation Manager', 'Aprio', 'Remote', 'exec, accounting, design, sys admin, education, consulting, customer support, testing, marketing, payroll, finance, ops, stats, sales, golang, full time, digital nomad', '$0 - $0', 'https://remoteOK.com/remote-jobs/remote-accounting-and-implementation-manager-aprio-1137560', '2026-10-24 19:14:45'),
(7, 'Travel Support Specialist', 'Aisles &amp; Abroad', 'Seattle, Washington', 'travel, education, customer support, non tech', '$0 - $0', 'https://remoteOK.com/remote-jobs/remote-travel-support-specialist-aisles-amp-abroad-1137559', '2026-10-24 19:14:45'),
(8, 'Senior DevOps Engineer', 'Lemon.io', 'Remote', 'devops, engineer, dev, python, golang, aws, gcp, kubernetes, sql, linux, ansible, ai, full time, full stack, remote, remote work', '$50,000 - $150,000', 'https://remoteOK.com/remote-jobs/remote-senior-devops-engineer-lemon-io-1137557', '2026-10-24 19:14:45'),
(9, 'Senior Finance Manager Management Accountant', 'D2B', 'Remote', 'exec, accounting, saas, technical, customer support, dev, marketing, controller, payroll, finance, education, php, senior, ops, excel, digital nomad', '$0 - $0', 'https://remoteOK.com/remote-jobs/remote-senior-finance-manager-management-accountant-d2b-1137556', '2026-10-24 19:14:45'),
(10, 'Accounting & Finance Manager', 'Political Asylum Lawyers', 'Remote', 'exec, accounting, design, sys admin, infosec, education, technical, customer support, dev, testing, marketing, controller, payroll, finance, microsoft, content writing, senior, ops, excel, legal, medical, digital nomad', '$0 - $0', 'https://remoteOK.com/remote-jobs/remote-accounting-finance-manager-political-asylum-lawyers-1137555', '2026-10-24 19:14:45'),
(11, 'Accounting Operations', 'Plaid', 'Remote', 'accounting, technical, customer support, marketing, finance, c, exec, ops, legal, recruiter', '$110,000 - $170,000', 'https://remoteOK.com/remote-jobs/remote-accounting-operations-plaid-1137554', '2026-10-24 19:14:45'),
(12, 'Senior Backend Engineer', 'DuckDuckGo', 'Remote', 'backend, perl, golang, javascript, node', '$190,000 - $190,000', 'https://remoteOK.com/remote-jobs/remote-senior-backend-engineer-duckduckgo-1137551', '2026-10-24 19:14:45'),
(13, 'Clinical Data Manager', 'Penumbra', 'Your Remote US Home Office', 'exec, sys admin, infosec, education, technical, customer support, travel, excel, sales, biotech, medical', '$0 - $0', 'https://remoteOK.com/remote-jobs/remote-clinical-data-manager-penumbra-1137550', '2026-10-24 19:14:45'),
(14, 'Risk Analyst', 'Pavago', 'Remote', 'analyst, saas, sys admin, infosec, python, technical, recruiter, customer support, testing, marketing, exec, finance, video, microsoft, senior, ops, excel, stats, legal, medical, full time', '$0 - $0', 'https://remoteOK.com/remote-jobs/remote-risk-analyst-pavago-1137548', '2026-10-24 19:14:45'),
(15, 'Customer Support Consultant hospitality', 'SupportYourApp', 'Remote', 'consulting, customer support, saas, infosec, technical, dev, travel, exec, medical, digital nomad', '$0 - $0', 'https://remoteOK.com/remote-jobs/remote-customer-support-consultant-hospitality-supportyourapp-1137547', '2026-10-24 19:14:45'),
(16, 'Senior Software Engineer', 'Sothebyâs', 'Remote', 'golang, dev, senior, sales, engineer, digital nomad', '$0 - $0', 'https://remoteOK.com/remote-jobs/remote-senior-software-engineer-sothebys-1137545', '2026-10-24 19:14:45'),
(17, 'Senior Backend Engineer', 'Rain', 'Remote', 'golang, finance, mobile, senior, medical, engineer, backend', '$0 - $0', 'https://remoteOK.com/remote-jobs/remote-senior-backend-engineer-rain-1137544', '2026-10-24 19:14:45'),
(18, 'Graduate Transport Planner', 'Curtins', 'Remote', 'hr, education, consulting, technical, customer support, marketing, travel, medical, engineer', '$0 - $0', 'https://remoteOK.com/remote-jobs/remote-graduate-transport-planner-curtins-1137542', '2026-10-24 19:14:45'),
(19, 'Key Account Manager Danish Market Native Speaker Copenhagen', 'Packmatic GmbH', 'Copenhagen', 'exec, saas, technical, marketing, travel, senior, sales, golang', '$0 - $0', 'https://remoteOK.com/remote-jobs/remote-key-account-manager-danish-market-native-speaker-copenhagen-packmatic-gmbh-1137541', '2026-10-24 19:14:45'),
(20, 'Technical Account Manager', 'Yuno', 'Brazil', 'exec, design, hr, python, technical, customer support, marketing, web dev, speech, javascript, finance, css, html, sql, postgres, node, node.js, mongo, api, senior, ops, sales, sys admin, golang, medical, engineer, apache, nginx, digital nomad', '$0 - $0', 'https://remoteOK.com/remote-jobs/remote-technical-account-manager-yuno-1137540', '2026-10-24 19:14:45'),
(21, 'Commercial Account Manager LATAM', 'Apryse', 'Remote', 'exec', '$0 - $0', 'https://remoteOK.com/remote-jobs/remote-commercial-account-manager-latam-apryse-1137539', '2026-10-24 19:14:45'),
(22, 'Software Engineer AI Coding Tasks', 'Askable', 'Remote', 'dev, python, javascript, typescript, golang, java, c plus plus', '$10,000 - $10,000', 'https://remoteOK.com/remote-jobs/remote-software-engineer-ai-coding-tasks-askable-1137538', '2026-10-24 19:14:46'),
(23, 'Head of Technology', 'Sanctuary Computer', 'Remote', 'dev, engineer, senior, full stack, front end', '$140,000 - $250,000', 'https://remoteOK.com/remote-jobs/remote-head-of-technology-sanctuary-computer-1137537', '2026-10-24 19:14:46'),
(24, 'Director of Product Management and IT Operations', 'Self Bill Pro', 'Remote', 'product manager, exec, infosec, technical, customer support, dev, testing, ops, digital nomad', '$130,000 - $160,000', 'https://remoteOK.com/remote-jobs/remote-director-of-product-management-and-it-operations-self-bill-pro-1137536', '2026-10-24 19:14:46'),
(25, 'SAP RE FX Consultant', 'Yopeso Romania SRL', 'Remote', 'consulting, design, technical, customer support, dev, testing, marketing, exec, part time, digital nomad', '$0 - $0', 'https://remoteOK.com/remote-jobs/remote-sap-re-fx-consultant-yopeso-romania-srl-1137535', '2026-10-24 19:14:46'),
(26, 'APAC Python', 'Kodland', 'Remote', 'python, teaching, education, customer support, dev, testing, part time, non tech, digital nomad', '$0 - $0', 'https://remoteOK.com/remote-jobs/remote-apac-python-kodland-1137534', '2026-10-24 19:14:46'),
(27, 'Associate Data Scientist', 'AlgaeCal', 'Vancouver', 'design, python, customer support, marketing, dev, flutter, exec, data science, ops, stats, sales, medical, ecommerce, digital nomad', '$0 - $0', 'https://remoteOK.com/remote-jobs/remote-associate-data-scientist-algaecal-1137531', '2026-10-24 19:14:46');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `target_role` varchar(100) DEFAULT 'Full-Stack Developer',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_saved_jobs`
--

CREATE TABLE `user_saved_jobs` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `job_id` int(11) DEFAULT NULL,
  `status` varchar(50) DEFAULT 'Saved'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `user_saved_jobs`
--
ALTER TABLE `user_saved_jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `job_id` (`job_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_saved_jobs`
--
ALTER TABLE `user_saved_jobs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `user_saved_jobs`
--
ALTER TABLE `user_saved_jobs`
  ADD CONSTRAINT `user_saved_jobs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_saved_jobs_ibfk_2` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
