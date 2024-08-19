-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mar. 16 avr. 2024 à 17:29
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `tunisia`
--

-- --------------------------------------------------------

--
-- Structure de la table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session');

-- --------------------------------------------------------

--
-- Structure de la table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `country` varchar(255) DEFAULT NULL,
  `passport` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `phone` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`, `country`, `passport`, `city`, `phone`) VALUES
(1, 'pbkdf2_sha256$720000$KLsNn1aL9IWJHvWUJCNeXm$dQOU8EP6WXO7ufFhMRfR3CUJcNiwIomxvtHSo9XBRAM=', '2024-04-04 23:40:41.035224', 1, 'salah', '', '', 'sboubnaya@gmail.com', 1, 1, '2024-03-28 00:41:25.340049', NULL, NULL, NULL, NULL),
(2, 'pbkdf2_sha256$720000$4lpJne5zSzJvTDQXl7NqrX$W+AAnchogRqx+f06sHOgk/zx/H4EnRIKt4Ho3a9Ixq4=', NULL, 0, 'test', 'saalah', 'bnb', 'salaahnn@gmail.com', 0, 1, '2024-04-04 23:44:15.670438', NULL, NULL, NULL, NULL),
(5, 'pbkdf2_sha256$720000$JTOkMRT3yfTwrDaF4OGbnb$lH2wdmhM1EYD5nvrRG9zX3Nnw1SG3dYOi8ob1DTKlBE=', '2024-04-05 00:24:15.176197', 0, 'testss', 'aymen', 'bo', 'aymenbn@gmail.com', 0, 1, '2024-04-05 02:23:31.443139', NULL, NULL, 'djerba', NULL),
(8, 'pbkdf2_sha256$720000$Qrw6bvGWX5H02lgrLNSK7L$o/1KiTG127VT8VPyNhTqtYzYb1t+rPpLLmMiDxKTuUM=', NULL, 0, 'davidaaa', 'david', 'aaa', 'david@gmail.com', 0, 1, '2024-04-05 03:01:41.716810', 'england', '54467474a', NULL, NULL),
(9, 'pbkdf2_sha256$720000$G6g1daDL9MWy7Ziv4VadXc$YhT4czPvFwUXZ6ZuuWL5+033tYaKGTN3uYMvIJElMAI=', NULL, 0, 'tests', 'omar', 'bn', 'omar@gmail.com', 0, 1, '2024-04-05 03:03:23.698978', NULL, NULL, 'MIDOUN', 2147483647),
(10, 'pbkdf2_sha256$720000$jiypJ0OqPLalZLpqaLksSL$JIojYMgX0XFnLbXoiT2TV/Ok80r5pdIw2jFGCX+SW2U=', '2024-04-16 13:12:42.619663', 0, 'omar_bn', 'omar', 'bn', 'omar@gmail.com', 0, 1, '2024-04-05 03:09:41.813532', NULL, NULL, 'MIDOUN', 2147483647),
(11, 'pbkdf2_sha256$720000$p3iy88FuORi8U4AFZD246Q$1+M9C8JVFYhe/hEzmmlQLity5+GuIc2/Mn4PLYTxlLM=', NULL, 0, 'fares_eriss', 'fares', 'eriss', 'fars@gmail.com', 0, 1, '2024-04-05 03:10:41.937126', NULL, NULL, 'MIDOUN', 6565675),
(12, 'pbkdf2_sha256$720000$CgjceIajJ2wDIBp7k9PyKz$CQX6Dg4wJX+pjnPw9MAHX4tsBj4HMZp+4g1mGVp3Dx4=', NULL, 0, 'xxxxx_wwwww', 'xxxxx', 'wwwww', 'sboubn@gm.com', 0, 1, '2024-04-05 03:12:25.945846', NULL, NULL, 'MIDOUN', 877454);

-- --------------------------------------------------------

--
-- Structure de la table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Structure de la table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2024-03-28 00:37:22.455657'),
(2, 'auth', '0001_initial', '2024-03-28 00:37:22.831853'),
(3, 'admin', '0001_initial', '2024-03-28 00:37:22.920682'),
(4, 'admin', '0002_logentry_remove_auto_add', '2024-03-28 00:37:22.928796'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2024-03-28 00:37:22.936322'),
(6, 'contenttypes', '0002_remove_content_type_name', '2024-03-28 00:37:22.989012'),
(7, 'auth', '0002_alter_permission_name_max_length', '2024-03-28 00:37:23.031865'),
(8, 'auth', '0003_alter_user_email_max_length', '2024-03-28 00:37:23.061978'),
(9, 'auth', '0004_alter_user_username_opts', '2024-03-28 00:37:23.071499'),
(10, 'auth', '0005_alter_user_last_login_null', '2024-03-28 00:37:23.108601'),
(11, 'auth', '0006_require_contenttypes_0002', '2024-03-28 00:37:23.110602'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2024-03-28 00:37:23.119127'),
(13, 'auth', '0008_alter_user_username_max_length', '2024-03-28 00:37:23.132141'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2024-03-28 00:37:23.144658'),
(15, 'auth', '0010_alter_group_name_max_length', '2024-03-28 00:37:23.158135'),
(16, 'auth', '0011_update_proxy_permissions', '2024-03-28 00:37:23.165652'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2024-03-28 00:37:23.179086'),
(18, 'sessions', '0001_initial', '2024-03-28 00:37:23.205857');

-- --------------------------------------------------------

--
-- Structure de la table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('ge9n52r9j94zmyj7rwlneqw1mfoasurm', '.eJxVjDkOwjAUBe_iGlne4hBK-pzB-ptxADlSnFSIu0OkFNC-mXkvlWBbS9qaLGlidVFWnX43BHpI3QHfod5mTXNdlwn1ruiDNj3OLM_r4f4dFGjlWyM69jlYOzAh2z7Y4GyGLOacOxMMRp8hYkAkjy5yjzJ46TxxJJMJ1PsD_fM5AA:1rq1YB:He_RdFOYKqB6Tw2bOr9936jcAfvN-He0Mno_0j6azdA', '2024-04-12 02:00:59.525638'),
('sjraiai3nd2e0txif6pk2a5h5legiiaw', '.eJxVjDkOwjAUBe_iGlne4hBK-pzB-ptxADlSnFSIu0OkFNC-mXkvlWBbS9qaLGlidVFWnX43BHpI3QHfod5mTXNdlwn1ruiDNj3OLM_r4f4dFGjlWyM69jlYOzAh2z7Y4GyGLOacOxMMRp8hYkAkjy5yjzJ46TxxJJMJ1PsD_fM5AA:1rq1Jw:V7b7PlAeW6wYSO2eWQKpt0tpKjj9R6hezc-Mo2vfjxs', '2024-04-12 01:46:16.284499'),
('xxtt9zpvp2atqh16167dg1lsr3yeb5jo', '.eJxVjDEOwjAMRe-SGUWhiUvNyM4ZIjs2pIBSqWknxN1JpQ6w_vf-e5tI65LjWnWOo5izOTpz-B2Z0lPLRuRB5T7ZNJVlHtluit1ptddJ9HXZ3b9ApprbO3EfkBFp8HxT3weWoMEl6NCdVIQJOk-eW5EQEEgdDiTgoMlCYj5fJt05HA:1rwic6:uTnPkuz19_WWwe970ds9z2QSZl-W0tNDsYL5kuiaRbI', '2024-04-30 13:12:42.625476');

-- --------------------------------------------------------

--
-- Structure de la table `hotel`
--

CREATE TABLE `hotel` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `rate` int(11) DEFAULT NULL,
  `region` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `image`
--

CREATE TABLE `image` (
  `id` int(11) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `region` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `image`
--

INSERT INTO `image` (`id`, `url`, `region`, `description`) VALUES
(1, 'tunis/tunis.jpg', 'TUNIS', NULL),
(2, 'ariana/ariana.jpg', 'ARIANA', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `monement`
--

CREATE TABLE `monement` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `rate` int(11) DEFAULT NULL,
  `region` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `region`
--

CREATE TABLE `region` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `region`
--

INSERT INTO `region` (`id`, `title`, `path`) VALUES
(1, 'tunis', '/tunis/'),
(2, 'ariana', '/ariana/'),
(3, 'manouba', '/manouba/'),
(4, 'bizerte', '/bizerte/\r\n'),
(5, 'beja', '/beja/'),
(6, 'ben arous', '/ben arous/'),
(7, 'jandouba', '/jandouba/'),
(8, 'nabeul', '/nabeul/'),
(9, 'zaghouen', '/zaghouen/'),
(10, 'seliana', '/seliana/'),
(11, 'elkef', '/elkef/'),
(12, 'sousse', '/sousse/'),
(13, 'kairouan', '/kairouan/'),
(14, 'kasserin', '/kasserin/'),
(15, 'monastir', '/monastir/'),
(16, 'mahdia', '/mahdia/'),
(17, 'sidi bouzid', '/sidi bouzid/'),
(18, 'gafsa', '/gafsa/'),
(19, 'sfax', '/sfax/'),
(20, 'tozeur', '/tozeur/'),
(21, 'gabes', '/gabes/'),
(22, 'kbeli', '/kbeli/'),
(23, 'mednine', '/mednine/'),
(24, 'tataouin', '/tataouin/');

-- --------------------------------------------------------

--
-- Structure de la table `reservation`
--

CREATE TABLE `reservation` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `adult` int(11) DEFAULT NULL,
  `children` int(11) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `resto_cafe`
--

CREATE TABLE `resto_cafe` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `rate` int(11) DEFAULT NULL,
  `region` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Index pour la table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Index pour la table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Index pour la table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Index pour la table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Index pour la table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Index pour la table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Index pour la table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Index pour la table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Index pour la table `hotel`
--
ALTER TABLE `hotel`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `monement`
--
ALTER TABLE `monement`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `region`
--
ALTER TABLE `region`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `resto_cafe`
--
ALTER TABLE `resto_cafe`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT pour la table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pour la table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT pour la table `hotel`
--
ALTER TABLE `hotel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `image`
--
ALTER TABLE `image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `monement`
--
ALTER TABLE `monement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `region`
--
ALTER TABLE `region`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT pour la table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `resto_cafe`
--
ALTER TABLE `resto_cafe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Contraintes pour la table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Contraintes pour la table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Contraintes pour la table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Contraintes pour la table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
