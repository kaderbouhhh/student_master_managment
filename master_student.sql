-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : jeu. 27 fév. 2025 à 13:50
-- Version du serveur : 8.0.40-0ubuntu0.22.04.1
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `master_student`
--

-- --------------------------------------------------------

--
-- Structure de la table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int NOT NULL,
  `name` varchar(150) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `auth_group`
--

INSERT INTO `auth_group` (`id`, `name`) VALUES
(1, 'Admins'),
(2, 'staff');

-- --------------------------------------------------------

--
-- Structure de la table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) COLLATE utf8mb4_general_ci NOT NULL
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
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add domain', 7, 'add_domain'),
(26, 'Can change domain', 7, 'change_domain'),
(27, 'Can delete domain', 7, 'delete_domain'),
(28, 'Can view domain', 7, 'view_domain'),
(29, 'Can add pedagogic year', 8, 'add_pedagogicyear'),
(30, 'Can change pedagogic year', 8, 'change_pedagogicyear'),
(31, 'Can delete pedagogic year', 8, 'delete_pedagogicyear'),
(32, 'Can view pedagogic year', 8, 'view_pedagogicyear'),
(33, 'Can add subject', 9, 'add_subject'),
(34, 'Can change subject', 9, 'change_subject'),
(35, 'Can delete subject', 9, 'delete_subject'),
(36, 'Can view subject', 9, 'view_subject'),
(37, 'Can add filiere', 10, 'add_filiere'),
(38, 'Can change filiere', 10, 'change_filiere'),
(39, 'Can delete filiere', 10, 'delete_filiere'),
(40, 'Can view filiere', 10, 'view_filiere'),
(41, 'Can add speciality', 11, 'add_speciality'),
(42, 'Can change speciality', 11, 'change_speciality'),
(43, 'Can delete speciality', 11, 'delete_speciality'),
(44, 'Can view speciality', 11, 'view_speciality'),
(45, 'Can add student', 12, 'add_student'),
(46, 'Can change student', 12, 'change_student'),
(47, 'Can delete student', 12, 'delete_student'),
(48, 'Can view student', 12, 'view_student'),
(49, 'Can add enrollment', 13, 'add_enrollment'),
(50, 'Can change enrollment', 13, 'change_enrollment'),
(51, 'Can delete enrollment', 13, 'delete_enrollment'),
(52, 'Can view enrollment', 13, 'view_enrollment'),
(53, 'Can add deliberation', 14, 'add_deliberation'),
(54, 'Can change deliberation', 14, 'change_deliberation'),
(55, 'Can delete deliberation', 14, 'delete_deliberation'),
(56, 'Can view deliberation', 14, 'view_deliberation'),
(57, 'Can add grade', 15, 'add_grade'),
(58, 'Can change grade', 15, 'change_grade'),
(59, 'Can delete grade', 15, 'delete_grade'),
(60, 'Can view grade', 15, 'view_grade'),
(61, 'Can add unity', 16, 'add_unity'),
(62, 'Can change unity', 16, 'change_unity'),
(63, 'Can delete unity', 16, 'delete_unity'),
(64, 'Can view unity', 16, 'view_unity'),
(65, 'Can add memoire', 17, 'add_memoire'),
(66, 'Can change memoire', 17, 'change_memoire'),
(67, 'Can delete memoire', 17, 'delete_memoire'),
(68, 'Can view memoire', 17, 'view_memoire'),
(69, 'Can add student_contrat', 18, 'add_student_contrat'),
(70, 'Can change student_contrat', 18, 'change_student_contrat'),
(71, 'Can delete student_contrat', 18, 'delete_student_contrat'),
(72, 'Can view student_contrat', 18, 'view_student_contrat'),
(73, 'Can add decrit', 19, 'add_decrit'),
(74, 'Can change decrit', 19, 'change_decrit'),
(75, 'Can delete decrit', 19, 'delete_decrit'),
(76, 'Can view decrit', 19, 'view_decrit'),
(77, 'Can add student contrat', 18, 'add_studentcontrat'),
(78, 'Can change student contrat', 18, 'change_studentcontrat'),
(79, 'Can delete student contrat', 18, 'delete_studentcontrat'),
(80, 'Can view student contrat', 18, 'view_studentcontrat');

-- --------------------------------------------------------

--
-- Structure de la table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int NOT NULL,
  `password` varchar(128) COLLATE utf8mb4_general_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `first_name` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(254) COLLATE utf8mb4_general_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$870000$MIAyUPQATFi8HXrTL5jZMx$iBT+mMnz5h1dSW/XSozefeosjAwvG6vkXE7Fqtt6fmE=', '2025-02-27 09:44:16.749875', 1, 'kader', 'عبد القادر', 'بوحلاب', 'kaderbouhhh@gmail.com', 1, 1, '2024-12-28 20:48:42.000000'),
(2, 'pbkdf2_sha256$870000$sNvhDOc651SAEnzhJzhWgU$ojJ6Zl53TOrGutHw72XJBtl/fD6ZXVX8B3UhsjwsUzY=', '2025-01-25 18:38:44.354614', 0, 'direction.etudes', 'directeur des etudes ens-kouba', 'مديرية الدراسات', 'direction.etudes@g.ens-kouba.dz', 0, 1, '2025-01-15 08:34:22.000000'),
(3, 'pbkdf2_sha256$870000$NqKloHA6NZ6l5w2cFj7crV$yOMXGw2wKMz7g7BvBtJlxSXeV+4Ovs3xWOL2YvmY3EI=', '2025-02-27 08:22:08.000000', 0, 'abdelhak', '', '', '', 0, 0, '2025-02-27 08:11:52.000000');

-- --------------------------------------------------------

--
-- Structure de la table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `auth_user_groups`
--

INSERT INTO `auth_user_groups` (`id`, `user_id`, `group_id`) VALUES
(2, 1, 1),
(1, 2, 1),
(3, 3, 2);

-- --------------------------------------------------------

--
-- Structure de la table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8mb4_general_ci,
  `object_repr` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `action_flag` smallint UNSIGNED NOT NULL,
  `change_message` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL
) ;

--
-- Déchargement des données de la table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2024-12-28 20:49:22.849973', '1', 'الأولى', 1, '[{\"added\": {}}]', 8, 1),
(2, '2024-12-28 20:49:33.500688', '2', 'الأولى', 1, '[{\"added\": {}}]', 8, 1),
(3, '2024-12-28 20:49:45.316012', '3', 'الثانية', 1, '[{\"added\": {}}]', 8, 1),
(4, '2024-12-28 20:49:55.937083', '4', 'الثانية', 1, '[{\"added\": {}}]', 8, 1),
(5, '2024-12-29 16:05:54.141161', '1', 'kader', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\"]}}]', 4, 1),
(6, '2025-01-07 12:13:18.797336', '1', 'U.E.F D00F0001M_S3 - الأساسية', 2, '[{\"changed\": {\"fields\": [\"Code\"]}}]', 16, 1),
(7, '2025-01-07 12:13:57.905524', '2', 'U.E.M D00M0001M_S3 - المنهاجية', 2, '[{\"changed\": {\"fields\": [\"Code\"]}}]', 16, 1),
(8, '2025-01-07 12:14:27.901445', '3', 'U.E.D D00D0001M_S3 - الاستكشافية', 2, '[{\"changed\": {\"fields\": [\"Code\"]}}]', 16, 1),
(9, '2025-01-07 12:15:02.169634', '4', 'U.E.T D00T0001M_S3 - العرضية', 2, '[{\"changed\": {\"fields\": [\"Code\"]}}]', 16, 1),
(10, '2025-01-07 12:18:39.621048', '6', 'U.E.F K00F0001M_S3 - الأساسية', 1, '[{\"added\": {}}]', 16, 1),
(11, '2025-01-07 12:19:11.865780', '7', 'فنون الأداء (فنون)', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 10, 1),
(12, '2025-01-07 12:20:31.535098', '7', 'U.E.M K00M0001M_S3 - المنهاجية', 1, '[{\"added\": {}}]', 16, 1),
(13, '2025-01-07 12:20:39.604941', '1', 'U.E.F D00F0001M_S3 - الأساسية', 2, '[]', 16, 1),
(14, '2025-01-07 12:20:43.988268', '2', 'U.E.M D00M0001M_S3 - المنهاجية', 2, '[]', 16, 1),
(15, '2025-01-07 12:20:48.569455', '3', 'U.E.D D00D0001M_S3 - الاستكشافية', 2, '[]', 16, 1),
(16, '2025-01-07 12:20:52.734293', '4', 'U.E.T D00T0001M_S3 - العرضية', 2, '[]', 16, 1),
(17, '2025-01-07 12:21:01.015452', '6', 'U.E.F K00F0001M_S3 - الأساسية', 2, '[{\"changed\": {\"fields\": [\"Pedagogic year\"]}}]', 16, 1),
(18, '2025-01-07 12:21:05.490042', '7', 'U.E.M K00M0001M_S3 - المنهاجية', 2, '[]', 16, 1),
(19, '2025-01-07 12:22:35.695904', '8', 'U.E.D K00D0001M_S3 - الاستكشافية', 1, '[{\"added\": {}}]', 16, 1),
(20, '2025-01-07 12:23:15.610807', '9', 'U.E.T K00T0001M_S3 - العرضية', 1, '[{\"added\": {}}]', 16, 1),
(21, '2025-01-07 12:25:05.775424', '11', 'تحليل المناهج والبرامج في التربية الموسيقية -(U.E.T K00T0001M_S3 - العرضية)', 1, '[{\"added\": {}}]', 9, 1),
(22, '2025-01-07 12:26:20.853411', '12', 'إدراك وتكوين التذوق الموسيقي -(U.E.D K00D0001M_S3 - الاستكشافية)', 1, '[{\"added\": {}}]', 9, 1),
(23, '2025-01-07 12:27:22.405809', '13', 'استراتيجية التقويم في التربية الموسيقية -(U.E.M K00M0001M_S3 - المنهاجية)', 1, '[{\"added\": {}}]', 9, 1),
(24, '2025-01-07 12:28:20.423521', '14', 'تحليل سمعي وتدوين موسيقي -(U.E.F K00F0001M_S3 - الأساسية)', 1, '[{\"added\": {}}]', 9, 1),
(25, '2025-01-07 12:29:01.683182', '15', 'منهجية البحث في التربية الموسيقية -(U.E.F K00F0001M_S3 - الأساسية)', 1, '[{\"added\": {}}]', 9, 1),
(26, '2025-01-08 09:19:06.985557', '5', 'وفاء مندان (1997-05-14)', 1, '[{\"added\": {}}]', 12, 1),
(27, '2025-01-08 12:39:16.060114', '6', 'سلمى بوداودي (2023-01-29)', 1, '[{\"added\": {}}]', 12, 1),
(28, '2025-01-08 13:31:16.757955', '7', 'إيمان مزهود (2001-10-02)', 1, '[{\"added\": {}}]', 12, 1),
(29, '2025-01-08 14:42:43.320278', '8', 'سارة غزالة (1999-01-18)', 1, '[{\"added\": {}}]', 12, 1),
(30, '2025-01-08 14:58:37.884277', '9', 'شيماء أورنيد (2002-05-19)', 1, '[{\"added\": {}}]', 12, 1),
(31, '2025-01-09 13:58:26.408271', '10', 'عبد الرحمان بوشردود (1995-03-13)', 1, '[{\"added\": {}}]', 12, 1),
(32, '2025-01-12 11:37:31.074428', '19', '‫مىيرة‬ دباري‬‫ None', 3, '', 12, 1),
(33, '2025-01-12 16:13:19.647972', '30', 'طاطا قطاوي None', 3, '', 12, 1),
(34, '2025-01-12 16:35:27.423433', '30', 'صبرينة مخطاري None enrolled in كيمياء عضوية وتعليمية المفاهيم (كيمياء) for الثانية (2024/2023)', 2, '[{\"changed\": {\"fields\": [\"Matricule\"]}}]', 13, 1),
(35, '2025-01-12 16:35:40.958449', '29', 'صورية لعلاوي None enrolled in كيمياء عضوية وتعليمية المفاهيم (كيمياء) for الثانية (2024/2023)', 2, '[{\"changed\": {\"fields\": [\"Matricule\"]}}]', 13, 1),
(36, '2025-01-12 16:35:55.416349', '28', 'طاطا قطاوي None enrolled in كيمياء عضوية وتعليمية المفاهيم (كيمياء) for الثانية (2024/2023)', 2, '[{\"changed\": {\"fields\": [\"Matricule\"]}}]', 13, 1),
(37, '2025-01-12 16:36:08.244316', '27', 'فاطمة الزهراء فراش None enrolled in كيمياء عضوية وتعليمية المفاهيم (كيمياء) for الثانية (2024/2023)', 2, '[{\"changed\": {\"fields\": [\"Matricule\"]}}]', 13, 1),
(38, '2025-01-12 16:36:20.008068', '26', '‫دنيا عبيد None enrolled in كيمياء عضوية وتعليمية المفاهيم (كيمياء) for الثانية (2024/2023)', 2, '[{\"changed\": {\"fields\": [\"Matricule\"]}}]', 13, 1),
(39, '2025-01-12 16:36:32.483277', '28', 'طاطا قطاوي None enrolled in كيمياء عضوية وتعليمية المفاهيم (كيمياء) for الثانية (2024/2023)', 2, '[{\"changed\": {\"fields\": [\"Matricule\"]}}]', 13, 1),
(40, '2025-01-12 16:36:39.692229', '27', 'فاطمة الزهراء فراش None enrolled in كيمياء عضوية وتعليمية المفاهيم (كيمياء) for الثانية (2024/2023)', 2, '[{\"changed\": {\"fields\": [\"Matricule\"]}}]', 13, 1),
(41, '2025-01-12 16:37:05.582500', '26', '‫دنيا عبيد None enrolled in كيمياء عضوية وتعليمية المفاهيم (كيمياء) for الثانية (2024/2023)', 2, '[{\"changed\": {\"fields\": [\"Matricule\"]}}]', 13, 1),
(42, '2025-01-12 16:37:17.248796', '25', '‫خالد شامخي None enrolled in كيمياء عضوية وتعليمية المفاهيم (كيمياء) for الثانية (2024/2023)', 2, '[{\"changed\": {\"fields\": [\"Matricule\"]}}]', 13, 1),
(43, '2025-01-12 16:37:34.604767', '24', '‫هناء سليماني None enrolled in كيمياء عضوية وتعليمية المفاهيم (كيمياء) for الثانية (2024/2023)', 2, '[{\"changed\": {\"fields\": [\"Matricule\"]}}]', 13, 1),
(44, '2025-01-12 16:37:55.008868', '23', '‫‫تقي الدين سالمي None enrolled in كيمياء عضوية وتعليمية المفاهيم (كيمياء) for الثانية (2024/2023)', 2, '[{\"changed\": {\"fields\": [\"Matricule\"]}}]', 13, 1),
(45, '2025-01-12 16:38:11.840806', '22', '‬ ‫اسماء‬ زرق‬ ‫العين None enrolled in كيمياء عضوية وتعليمية المفاهيم (كيمياء) for الثانية (2024/2023)', 2, '[{\"changed\": {\"fields\": [\"Matricule\"]}}]', 13, 1),
(46, '2025-01-12 16:38:29.356424', '21', '‫خديجة رايس None enrolled in كيمياء عضوية وتعليمية المفاهيم (كيمياء) for الثانية (2024/2023)', 2, '[{\"changed\": {\"fields\": [\"Matricule\"]}}]', 13, 1),
(47, '2025-01-12 16:38:42.168532', '20', '‫عبد‬ ‫القادر‬ دزٍيري None enrolled in كيمياء عضوية وتعليمية المفاهيم (كيمياء) for الثانية (2024/2023)', 2, '[{\"changed\": {\"fields\": [\"Matricule\"]}}]', 13, 1),
(48, '2025-01-12 16:39:00.137953', '12', 'صافية بوكرة None enrolled in كيمياء عضوية وتعليمية المفاهيم (كيمياء) for الثانية (2024/2023)', 2, '[{\"changed\": {\"fields\": [\"Matricule\"]}}]', 13, 1),
(49, '2025-01-12 16:39:13.310989', '19', '‫عبد‬ ‫الرفيق‬ دحو‬ None enrolled in كيمياء عضوية وتعليمية المفاهيم (كيمياء) for الثانية (2024/2023)', 2, '[{\"changed\": {\"fields\": [\"Matricule\"]}}]', 13, 1),
(50, '2025-01-12 16:39:23.282850', '18', '‫منيرة‬ دباري‬‫ None enrolled in كيمياء عضوية وتعليمية المفاهيم (كيمياء) for الثانية (2024/2023)', 2, '[{\"changed\": {\"fields\": [\"Matricule\"]}}]', 13, 1),
(51, '2025-01-12 16:39:45.822480', '17', '‫‬‫علاء‬ ‫الدين‬ حمدي None enrolled in كيمياء عضوية وتعليمية المفاهيم (كيمياء) for الثانية (2024/2023)', 2, '[{\"changed\": {\"fields\": [\"Matricule\"]}}]', 13, 1),
(52, '2025-01-12 16:40:00.101892', '16', '‫‬‫إلهام‬ حدوش None enrolled in كيمياء عضوية وتعليمية المفاهيم (كيمياء) for الثانية (2024/2023)', 2, '[{\"changed\": {\"fields\": [\"Matricule\"]}}]', 13, 1),
(53, '2025-01-12 16:40:28.979599', '15', '‫‬‫أحمد حاجي None enrolled in كيمياء عضوية وتعليمية المفاهيم (كيمياء) for الثانية (2024/2023)', 2, '[{\"changed\": {\"fields\": [\"Matricule\"]}}]', 13, 1),
(54, '2025-01-12 16:40:43.027742', '14', '‫‬‫العجال‬ جغدام None enrolled in كيمياء عضوية وتعليمية المفاهيم (كيمياء) for الثانية (2024/2023)', 2, '[{\"changed\": {\"fields\": [\"Matricule\"]}}]', 13, 1),
(55, '2025-01-12 16:40:58.841765', '13', 'أمال تساليت None enrolled in كيمياء عضوية وتعليمية المفاهيم (كيمياء) for الثانية (2024/2023)', 2, '[{\"changed\": {\"fields\": [\"Matricule\"]}}]', 13, 1),
(56, '2025-01-13 13:31:41.173918', '18', '‫منيرة‬ دباري‬‫ 1999-01-13', 2, '[{\"changed\": {\"fields\": [\"First name en\", \"Last name en\", \"Birth place en\"]}}]', 12, 1),
(57, '2025-01-13 13:39:40.836515', '12', 'صافية بوكرة 1997-08-03', 2, '[{\"changed\": {\"fields\": [\"First name en\", \"Last name en\", \"Birth day\", \"Birth place\", \"Birth place en\", \"Birth wilaya\"]}}]', 12, 1),
(58, '2025-01-13 13:43:01.874312', '12', 'صافية بوكرة 1997-08-03', 2, '[{\"changed\": {\"fields\": [\"Birth place en\"]}}]', 12, 1),
(59, '2025-01-13 13:48:46.077672', '33', 'أية مدابيس 1995-08-02', 2, '[{\"changed\": {\"fields\": [\"First name en\", \"Last name en\", \"Birth day\", \"Birth place\", \"Birth place en\", \"Birth wilaya\"]}}]', 12, 1),
(60, '2025-01-13 14:15:16.942134', '48', 'يسرى مكيدش 2000-07-13', 3, '', 12, 1),
(61, '2025-01-13 14:15:29.260911', '47', 'يسرى مكيدش 2000-07-13', 2, '[]', 12, 1),
(62, '2025-01-13 14:19:40.091462', '45', 'يسرى مكيدش 2000-07-13 enrolled in كيمياء فيزيائية (كيمياء) for الثانية (2024/2023)', 2, '[{\"changed\": {\"fields\": [\"Matricule\"]}}]', 13, 1),
(63, '2025-01-13 14:52:28.916481', '47', 'يسرى مكيدش 2000-07-13', 2, '[{\"changed\": {\"fields\": [\"Birth place\"]}}]', 12, 1),
(64, '2025-01-13 14:57:03.878588', '47', 'يسرى امكيدش 2000-07-13', 2, '[{\"changed\": {\"fields\": [\"Birth place en\"]}}]', 12, 1),
(65, '2025-01-13 15:00:05.572420', '52', 'ايمان عماري 2025-01-13', 1, '[{\"added\": {}}]', 12, 1),
(66, '2025-01-14 12:46:11.460357', '62', 'فردوس بطاطا 2000-01-06', 2, '[{\"changed\": {\"fields\": [\"First name en\", \"Last name en\", \"Birth place en\"]}}]', 12, 1),
(67, '2025-01-14 12:54:46.614167', '63', 'ريمة خطاب 1999-03-12', 2, '[{\"changed\": {\"fields\": [\"Birth place en\"]}}]', 12, 1),
(68, '2025-01-14 13:17:30.704234', '12', 'صافية بوكرة 1997-08-30', 2, '[{\"changed\": {\"fields\": [\"Birth place en\"]}}]', 12, 1),
(69, '2025-01-14 14:54:45.166388', '69', 'رحاب مروان 1999-07-15', 2, '[{\"changed\": {\"fields\": [\"Birth place en\"]}}]', 12, 1),
(70, '2025-01-15 08:31:23.350862', '1', 'Admins', 1, '[{\"added\": {}}]', 3, 1),
(71, '2025-01-15 08:31:44.047965', '2', 'staff', 1, '[{\"added\": {}}]', 3, 1),
(72, '2025-01-15 08:34:23.597070', '2', 'direction.etudes', 1, '[{\"added\": {}}]', 4, 1),
(73, '2025-01-15 08:35:59.356976', '2', 'direction.etudes', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\", \"Groups\"]}}]', 4, 1),
(74, '2025-01-15 08:39:36.274319', '2', 'direction.etudes', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\"]}}]', 4, 1),
(75, '2025-01-15 13:34:34.616903', '72', 'عبد الحليم مشري 1991-04-10', 2, '[{\"changed\": {\"fields\": [\"Birth wilaya en\"]}}]', 12, 1),
(76, '2025-01-15 13:38:42.972530', '71', 'أحمد طلحاوي 1993-09-26', 2, '[{\"changed\": {\"fields\": [\"Birth wilaya en\"]}}]', 12, 1),
(77, '2025-01-15 13:44:34.465026', '70', 'نجلاء بن سالم 2000-06-25', 2, '[{\"changed\": {\"fields\": [\"Birth wilaya en\"]}}]', 12, 1),
(78, '2025-01-15 13:44:57.539489', '69', 'رحاب مروان 1999-07-15', 2, '[{\"changed\": {\"fields\": [\"Birth wilaya en\"]}}]', 12, 1),
(79, '2025-01-15 13:45:18.652349', '68', 'نسرين علال 2000-08-26', 2, '[{\"changed\": {\"fields\": [\"Birth wilaya en\"]}}]', 12, 1),
(80, '2025-01-15 13:45:34.680236', '67', 'أحمد بوشاقور الرحماني 1995-01-28', 2, '[{\"changed\": {\"fields\": [\"Birth wilaya en\"]}}]', 12, 1),
(81, '2025-01-15 13:45:53.272440', '66', 'اسماعيل محمودي 2000-02-02', 2, '[{\"changed\": {\"fields\": [\"Birth wilaya en\"]}}]', 12, 1),
(82, '2025-01-15 13:46:13.757875', '65', 'اسماعيل زلماط 1991-04-20', 2, '[{\"changed\": {\"fields\": [\"Birth wilaya en\"]}}]', 12, 1),
(83, '2025-01-15 13:46:32.543797', '64', 'راضية بن عودة 2000-06-14', 2, '[{\"changed\": {\"fields\": [\"Birth wilaya en\"]}}]', 12, 1),
(84, '2025-01-15 13:46:55.010507', '63', 'ريمة خطاب 1999-03-12', 2, '[{\"changed\": {\"fields\": [\"Birth wilaya en\"]}}]', 12, 1),
(85, '2025-01-15 13:47:25.933417', '62', 'فردوس بطاطا 2000-01-06', 2, '[{\"changed\": {\"fields\": [\"Birth wilaya en\"]}}]', 12, 1),
(86, '2025-01-15 13:47:43.322221', '61', 'لويزة صابرينة محال 1999-07-10', 2, '[{\"changed\": {\"fields\": [\"Birth wilaya en\"]}}]', 12, 1),
(87, '2025-01-15 13:48:00.031894', '60', 'زكرياء براهيمي 1996-04-13', 2, '[{\"changed\": {\"fields\": [\"Birth wilaya en\"]}}]', 12, 1),
(88, '2025-01-15 13:48:21.920012', '59', 'إلهام ولداعمر 2000-09-06', 2, '[{\"changed\": {\"fields\": [\"Birth wilaya en\"]}}]', 12, 1),
(89, '2025-01-15 13:48:39.492752', '58', 'ياسر شميشم 2002-01-27', 2, '[{\"changed\": {\"fields\": [\"Birth wilaya en\"]}}]', 12, 1),
(90, '2025-01-15 13:49:00.623693', '57', 'يحي أومدي 2001-01-30', 2, '[{\"changed\": {\"fields\": [\"Birth wilaya en\"]}}]', 12, 1),
(91, '2025-01-15 13:49:20.054440', '56', 'فرحات بوالزرد 1997-07-27', 2, '[{\"changed\": {\"fields\": [\"Birth wilaya en\"]}}]', 12, 1),
(92, '2025-01-15 13:49:39.280763', '55', 'سمية زروالي 1998-01-16', 2, '[{\"changed\": {\"fields\": [\"Birth wilaya en\"]}}]', 12, 1),
(93, '2025-01-15 13:50:02.523725', '54', 'فايزة جدو 2000-05-13', 2, '[{\"changed\": {\"fields\": [\"Birth wilaya en\"]}}]', 12, 1),
(94, '2025-01-15 13:50:20.599632', '53', 'الضاوية فرارحة 1998-09-25', 2, '[{\"changed\": {\"fields\": [\"Birth wilaya en\"]}}]', 12, 1),
(95, '2025-01-15 13:50:59.103940', '33', 'أية مدابيس 1995-08-02', 2, '[{\"changed\": {\"fields\": [\"Birth wilaya en\"]}}]', 12, 1),
(96, '2025-01-15 13:51:24.374696', '49', 'سمية دارزيرار 2000-06-03', 2, '[{\"changed\": {\"fields\": [\"Birth wilaya en\"]}}]', 12, 1),
(97, '2025-01-15 13:52:08.291886', '51', 'لينة أيت سليمان 2001-07-11', 2, '[{\"changed\": {\"fields\": [\"Birth wilaya en\"]}}]', 12, 1),
(98, '2025-01-15 13:52:28.391697', '50', 'ياسمين غبريني 2001-09-12', 2, '[{\"changed\": {\"fields\": [\"Birth wilaya en\"]}}]', 12, 1),
(99, '2025-01-15 13:53:42.442980', '47', 'يسرى امكيدش 2000-07-13', 2, '[{\"changed\": {\"fields\": [\"Birth wilaya en\"]}}]', 12, 1),
(100, '2025-01-15 13:54:14.639658', '33', 'أية مدابيس 1995-08-02', 2, '[]', 12, 1),
(101, '2025-01-15 13:54:33.737353', '18', '‫منيرة‬ دباري‬‫ 1999-01-13', 2, '[{\"changed\": {\"fields\": [\"Birth wilaya en\"]}}]', 12, 1),
(102, '2025-01-15 13:54:50.785014', '12', 'صافية بوكرة 1997-08-30', 2, '[{\"changed\": {\"fields\": [\"Birth wilaya en\"]}}]', 12, 1),
(103, '2025-01-15 13:55:15.904657', '10', 'عبد الرحمان بوشردود 1995-03-13', 2, '[{\"changed\": {\"fields\": [\"Birth wilaya en\", \"Email\"]}}]', 12, 1),
(104, '2025-01-15 13:55:33.875425', '9', 'شيماء أورنيد 2002-05-19', 2, '[{\"changed\": {\"fields\": [\"Birth wilaya en\"]}}]', 12, 1),
(105, '2025-01-15 13:55:53.098837', '8', 'سارة غزالة 1999-01-18', 2, '[{\"changed\": {\"fields\": [\"Birth wilaya en\"]}}]', 12, 1),
(106, '2025-01-15 13:56:19.246759', '7', 'إيمان مزهود 2001-10-02', 2, '[{\"changed\": {\"fields\": [\"Birth wilaya en\"]}}]', 12, 1),
(107, '2025-01-15 13:56:47.089247', '6', 'سلمى بوداودي 2003-01-29', 2, '[{\"changed\": {\"fields\": [\"Birth place en\", \"Birth wilaya en\", \"Email\"]}}]', 12, 1),
(108, '2025-01-15 13:57:08.550829', '5', 'وفاء مندان 1997-05-14', 2, '[{\"changed\": {\"fields\": [\"Birth wilaya en\", \"Email\"]}}]', 12, 1),
(109, '2025-01-15 13:57:38.574323', '4', 'صليحة فاسي 1998-07-19', 2, '[{\"changed\": {\"fields\": [\"Birth place en\", \"Birth wilaya en\", \"Email\"]}}]', 12, 1),
(110, '2025-01-15 13:58:44.610379', '3', 'صلاح الدين عايد 1992-04-22', 2, '[{\"changed\": {\"fields\": [\"Birth place en\", \"Birth wilaya\", \"Birth wilaya en\", \"Email\"]}}]', 12, 1),
(111, '2025-01-15 13:59:06.367352', '2', 'أسماء فرادي 1996-11-30', 2, '[{\"changed\": {\"fields\": [\"Birth wilaya en\", \"Email\"]}}]', 12, 1),
(112, '2025-01-19 09:23:27.106137', '59', '‫خالد شامخي - كيمياء عضوية وتعليمية المفاهيم', 1, '[{\"added\": {}}]', 14, 1),
(113, '2025-01-19 12:55:42.210978', '60', 'نهاد رابح مزاري - بيولوجيا أساسية و تطبيقية', 1, '[{\"added\": {}}]', 14, 1),
(114, '2025-01-19 13:13:17.196886', '60', 'نهاد رابح مزاري - بيولوجيا أساسية و تطبيقية', 2, '[{\"changed\": {\"fields\": [\"Mention\"]}}]', 14, 1),
(115, '2025-01-19 19:36:26.510163', '60', 'نهاد رابح مزاري - بيولوجيا أساسية و تطبيقية', 2, '[{\"changed\": {\"fields\": [\"Total credits\", \"Average grade\"]}}]', 14, 1),
(116, '2025-01-19 20:51:55.467811', '71', 'عبدالقادر بوحلاب 1974-04-16 enrolled in الجبر (رياضيات) for الثانية (2025/2024)', 3, '', 13, 1),
(117, '2025-01-19 20:52:41.360520', '76', 'عبدالقادر بوحلاب 1974-04-16', 3, '', 12, 1),
(118, '2025-01-25 18:48:21.770228', '56', 'أحمد طلحاوي - تعليمية العلوم الطبيعية', 2, '[{\"changed\": {\"fields\": [\"Diploma issued\"]}}]', 14, 1),
(119, '2025-01-25 18:49:28.986871', '56', 'أحمد طلحاوي - تعليمية العلوم الطبيعية', 2, '[{\"changed\": {\"fields\": [\"Diploma issued\"]}}]', 14, 1),
(120, '2025-01-25 18:54:10.023369', '56', 'أحمد طلحاوي - تعليمية العلوم الطبيعية', 2, '[{\"changed\": {\"fields\": [\"Transcript issued\"]}}]', 14, 1),
(121, '2025-01-25 18:54:48.704618', '56', 'أحمد طلحاوي - تعليمية العلوم الطبيعية', 2, '[{\"changed\": {\"fields\": [\"Transcript issued\"]}}]', 14, 1),
(122, '2025-01-25 19:05:58.787031', '1', 'kader', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1),
(123, '2025-01-25 20:11:57.429081', '50', 'أحمد بوشاقور الرحماني - بيولوجيا أساسية و تطبيقية', 2, '[{\"changed\": {\"fields\": [\"Transcript issued\"]}}]', 14, 1),
(124, '2025-01-25 21:16:22.365431', '50', 'أحمد بوشاقور الرحماني - بيولوجيا أساسية و تطبيقية', 2, '[{\"changed\": {\"fields\": [\"Diploma issued\"]}}]', 14, 1),
(125, '2025-01-28 09:13:20.037431', '48', 'اسماعيل زلماط - كيمياء فيزيائية', 2, '[{\"changed\": {\"fields\": [\"Diploma issued\"]}}]', 14, 1),
(126, '2025-01-28 09:13:50.144054', '49', 'اسماعيل محمودي - كيمياء فيزيائية', 2, '[{\"changed\": {\"fields\": [\"Diploma issued\"]}}]', 14, 1),
(127, '2025-01-29 08:53:46.333810', '53', 'رحاب مروان - بيولوجيا أساسية و تطبيقية', 2, '[{\"changed\": {\"fields\": [\"Diploma issued\"]}}]', 14, 1),
(128, '2025-02-02 08:10:04.952035', '98', 'زكي رحموني 2001-04-23', 1, '[{\"added\": {}}]', 12, 1),
(129, '2025-02-02 08:18:42.049416', '99', 'هناء سليماني 2000-12-11', 1, '[{\"added\": {}}]', 12, 1),
(130, '2025-02-02 08:26:07.736830', '100', 'رفيقة ألمو 2000-02-19', 1, '[{\"added\": {}}]', 12, 1),
(131, '2025-02-02 08:37:06.288530', '14', '‫‬‫العجال‬ جغدام 1998-09-18', 2, '[{\"changed\": {\"fields\": [\"First name en\", \"Last name en\", \"Birth day\", \"Birth place\", \"Birth place en\", \"Birth wilaya\", \"Birth wilaya en\"]}}]', 12, 1),
(132, '2025-02-02 08:40:01.721288', '14', '‫‬‫العجال‬ جغدم 1998-09-18', 2, '[{\"changed\": {\"fields\": [\"Last name\"]}}]', 12, 1),
(133, '2025-02-02 08:43:30.015551', '29', 'طاطة قطاوي 1994-06-16', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Birth day\", \"Birth place\", \"Birth wilaya\"]}}]', 12, 1),
(134, '2025-02-02 08:44:29.379109', '29', 'طاطة قطاوي 1994-06-16', 2, '[{\"changed\": {\"fields\": [\"First name en\", \"Last name en\", \"Birth place en\", \"Birth wilaya en\"]}}]', 12, 1),
(135, '2025-02-02 08:51:28.029052', '38', 'بلقاسم زكريا حنيشات 2001-12-06', 2, '[{\"changed\": {\"fields\": [\"First name en\", \"Last name en\", \"Birth day\", \"Birth place\", \"Birth place en\", \"Birth wilaya\", \"Birth wilaya en\"]}}]', 12, 1),
(136, '2025-02-02 08:52:08.071456', '38', 'بلقاسم زكريا حنيشات 2001-12-06', 2, '[{\"changed\": {\"fields\": [\"Birth place en\", \"Birth wilaya en\"]}}]', 12, 1),
(137, '2025-02-02 09:07:51.757575', '37', 'اسمهان بولبان None', 3, '', 12, 1),
(138, '2025-02-02 09:08:34.827004', '95', 'إسمهان بولبان 2000-05-22', 2, '[{\"changed\": {\"fields\": [\"Last name en\", \"Birth wilaya en\"]}}]', 12, 1),
(139, '2025-02-02 09:09:23.510416', '96', 'إسمهان بولبان - كيمياء عضوية وتعليمية المفاهيم', 2, '[{\"changed\": {\"fields\": [\"Diploma issued\"]}}]', 14, 1),
(140, '2025-02-02 09:15:18.547214', '27', '‫دنيا عبيد 1995-10-21', 2, '[{\"changed\": {\"fields\": [\"First name en\", \"Last name en\", \"Birth day\", \"Birth place\", \"Birth place en\", \"Birth wilaya\", \"Birth wilaya en\"]}}]', 12, 1),
(141, '2025-02-02 11:29:31.288206', '101', 'شهرزاد بداوي 2000-03-21', 1, '[{\"added\": {}}]', 12, 1),
(142, '2025-02-02 11:36:54.923819', '102', 'إيمان برادع 2001-05-15', 1, '[{\"added\": {}}]', 12, 1),
(143, '2025-02-02 11:46:53.676355', '78', 'زهير عطة 1998-05-26', 2, '[]', 12, 1),
(144, '2025-02-02 12:19:27.713072', '103', 'صبرينة مخطاري 2000-10-03', 1, '[{\"added\": {}}]', 12, 1),
(145, '2025-02-03 08:26:35.197711', '91', 'لينا أيت سليمان - بيولوجيا أساسية و تطبيقية', 2, '[{\"changed\": {\"fields\": [\"Diploma issued\"]}}]', 14, 1),
(146, '2025-02-04 09:22:35.517991', '127', 'هاجر عزيبر - تربية موسيقية', 2, '[{\"changed\": {\"fields\": [\"Diploma issued\"]}}]', 14, 1),
(147, '2025-02-04 09:22:51.727228', '126', 'نور الهدى بن سطاعلي - تربية موسيقية', 2, '[{\"changed\": {\"fields\": [\"Diploma issued\"]}}]', 14, 1),
(148, '2025-02-04 10:30:02.245171', '126', 'رانية ساعد 1997-07-04', 2, '[{\"changed\": {\"fields\": [\"Birth day\"]}}]', 12, 1),
(149, '2025-02-04 10:30:15.430645', '135', 'رانية ساعد - فيزياء نظرية', 2, '[{\"changed\": {\"fields\": [\"Diploma issued\"]}}]', 14, 1),
(150, '2025-02-05 13:41:10.714247', '93', 'إكرام شرفي - بيولوجيا أساسية و تطبيقية', 2, '[{\"changed\": {\"fields\": [\"Transcript issued\"]}}]', 14, 1),
(151, '2025-02-06 09:11:25.105430', '32', 'صبرينة مخطاري None', 3, '', 12, 1),
(152, '2025-02-06 12:15:51.203604', '142', 'أحلام ساسي - تعليمية العلوم الطبيعية', 2, '[{\"changed\": {\"fields\": [\"Diploma issued\"]}}]', 14, 1),
(153, '2025-02-06 12:20:28.962515', '113', 'إلهام رزاز - كيمياء عضوية وتعليمية المفاهيم', 2, '[{\"changed\": {\"fields\": [\"Diploma issued\"]}}]', 14, 1),
(154, '2025-02-06 12:39:19.934089', '134', 'أحلام قمراوي - تربية موسيقية', 2, '[{\"changed\": {\"fields\": [\"Diploma issued\"]}}]', 14, 1),
(155, '2025-02-11 08:09:25.312951', '134', 'أحلام قمراوي - تربية موسيقية', 2, '[{\"changed\": {\"fields\": [\"Diploma issued\"]}}]', 14, 1),
(156, '2025-02-11 08:19:31.032899', '113', 'إلهام رزاز - كيمياء عضوية وتعليمية المفاهيم', 2, '[{\"changed\": {\"fields\": [\"Diploma issued\"]}}]', 14, 1),
(157, '2025-02-11 13:09:38.363600', '118', 'قدور بلخوص - تعليمية العلوم الطبيعية', 2, '[]', 14, 1),
(158, '2025-02-11 13:10:00.096345', '118', 'قدور بلخوص - تعليمية العلوم الطبيعية', 2, '[{\"changed\": {\"fields\": [\"Diploma issued\"]}}]', 14, 1),
(159, '2025-02-12 12:31:12.908753', '135', 'رانية ساعد - فيزياء نظرية', 2, '[{\"changed\": {\"fields\": [\"Diploma issued\"]}}]', 14, 1),
(160, '2025-02-18 08:46:24.413365', '111', 'راية بادسي - تعليمية العلوم الطبيعية', 2, '[{\"changed\": {\"fields\": [\"Diploma issued\"]}}]', 14, 1),
(161, '2025-02-18 12:42:09.464939', '6', 'سلمى بوداودي 2003-01-29 enrolled in بيولوجيا أساسية و تطبيقية (علوم بيولوجية) for الثانية (2025/2024)', 2, '[{\"changed\": {\"fields\": [\"Badge issued\"]}}]', 13, 1),
(162, '2025-02-19 09:01:17.658082', '48', 'اسماعيل زلماط - كيمياء فيزيائية', 2, '[{\"changed\": {\"fields\": [\"Diploma issued\"]}}]', 14, 1),
(163, '2025-02-26 14:42:48.988237', '180', 'نوال خالدي 2002-11-11', 2, '[{\"changed\": {\"fields\": [\"Email\"]}}]', 12, 1),
(164, '2025-02-27 08:11:54.035464', '3', 'abdelhak', 1, '[{\"added\": {}}]', 4, 1),
(165, '2025-02-27 08:12:22.413131', '3', 'abdelhak', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1),
(166, '2025-02-27 09:43:08.602275', '3', 'abdelhak', 2, '[{\"changed\": {\"fields\": [\"Active\"]}}]', 4, 1);

-- --------------------------------------------------------

--
-- Structure de la table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int NOT NULL,
  `app_label` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `model` varchar(100) COLLATE utf8mb4_general_ci NOT NULL
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
(6, 'sessions', 'session'),
(19, 'student_master', 'decrit'),
(14, 'student_master', 'deliberation'),
(7, 'student_master', 'domain'),
(13, 'student_master', 'enrollment'),
(10, 'student_master', 'filiere'),
(15, 'student_master', 'grade'),
(17, 'student_master', 'memoire'),
(8, 'student_master', 'pedagogicyear'),
(11, 'student_master', 'speciality'),
(12, 'student_master', 'student'),
(18, 'student_master', 'studentcontrat'),
(9, 'student_master', 'subject'),
(16, 'student_master', 'unity');

-- --------------------------------------------------------

--
-- Structure de la table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL,
  `app` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2024-12-28 12:25:21.316790'),
(2, 'auth', '0001_initial', '2024-12-28 12:25:50.394434'),
(3, 'admin', '0001_initial', '2024-12-28 12:25:58.380855'),
(4, 'admin', '0002_logentry_remove_auto_add', '2024-12-28 12:25:58.604672'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2024-12-28 12:25:58.788654'),
(6, 'contenttypes', '0002_remove_content_type_name', '2024-12-28 12:26:01.756401'),
(7, 'auth', '0002_alter_permission_name_max_length', '2024-12-28 12:26:05.250169'),
(8, 'auth', '0003_alter_user_email_max_length', '2024-12-28 12:26:05.796453'),
(9, 'auth', '0004_alter_user_username_opts', '2024-12-28 12:26:06.142340'),
(10, 'auth', '0005_alter_user_last_login_null', '2024-12-28 12:26:08.804157'),
(11, 'auth', '0006_require_contenttypes_0002', '2024-12-28 12:26:08.984509'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2024-12-28 12:26:09.180911'),
(13, 'auth', '0008_alter_user_username_max_length', '2024-12-28 12:26:12.672392'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2024-12-28 12:26:15.837925'),
(15, 'auth', '0010_alter_group_name_max_length', '2024-12-28 12:26:16.425870'),
(16, 'auth', '0011_update_proxy_permissions', '2024-12-28 12:26:16.594527'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2024-12-28 12:26:20.159735'),
(18, 'sessions', '0001_initial', '2024-12-28 12:26:22.085355'),
(19, 'student_master', '0001_initial', '2024-12-28 12:27:23.880430'),
(20, 'student_master', '0002_remove_student_pedagogic_year_and_more', '2024-12-28 21:21:20.447804'),
(21, 'student_master', '0003_deliberation_academic_year', '2024-12-29 20:58:45.001285'),
(22, 'student_master', '0004_alter_deliberation_academic_year_and_more', '2024-12-31 13:44:46.566686'),
(23, 'student_master', '0005_alter_enrollment_academic_year', '2024-12-31 13:50:30.935200'),
(24, 'student_master', '0006_unity_pedagogic_year_alter_enrollment_academic_year', '2024-12-31 14:14:38.951635'),
(25, 'student_master', '0007_memoire_session', '2024-12-31 17:05:06.071182'),
(26, 'student_master', '0008_deliberation_mention', '2024-12-31 19:55:21.607446'),
(27, 'student_master', '0009_alter_deliberation_academic_year_and_more', '2025-01-01 17:24:37.237185'),
(28, 'student_master', '0010_alter_deliberation_mention', '2025-01-01 18:31:51.164951'),
(29, 'student_master', '0011_remove_deliberation_unique_student_deliberation_and_more', '2025-01-02 17:54:59.893258'),
(30, 'student_master', '0012_alter_enrollment_matricule', '2025-01-06 09:27:10.537886'),
(31, 'student_master', '0013_grade_academic_year', '2025-01-06 12:51:10.275449'),
(32, 'student_master', '0014_alter_unity_code', '2025-01-08 08:51:00.664274'),
(33, 'student_master', '0015_deliberation_diploma_number', '2025-01-08 14:22:41.515815'),
(34, 'student_master', '0016_alter_student_birth_day_alter_student_birth_place_and_more', '2025-01-12 11:11:57.608093'),
(35, 'student_master', '0017_alter_student_birth_day', '2025-01-12 11:14:35.964725'),
(36, 'student_master', '0018_student_birth_wilaya_en', '2025-01-15 13:28:03.629839'),
(37, 'student_master', '0019_remove_student_group_student_ex_entreprise', '2025-01-16 21:19:03.581896'),
(38, 'student_master', '0020_alter_student_email', '2025-01-17 18:44:29.121643'),
(39, 'student_master', '0021_memoire_academic_year_and_more', '2025-01-20 09:05:53.730719'),
(40, 'student_master', '0022_alter_enrollment_pedagogic_year', '2025-01-25 15:28:42.734817'),
(41, 'student_master', '0023_student_contrat_alter_grade_session_and_more', '2025-01-30 10:30:00.632067'),
(42, 'student_master', '0024_decrit_student_contrat_academic_year', '2025-02-01 17:53:13.005654'),
(43, 'student_master', '0025_memoire_memoire_file', '2025-02-06 09:33:59.401364'),
(44, 'student_master', '0026_alter_memoire_memoire_file', '2025-02-06 22:30:27.193894'),
(45, 'student_master', '0027_deliberation_issued_date', '2025-02-09 20:59:38.987365'),
(46, 'student_master', '0028_enrollment_issued_badge_date_and_more', '2025-02-18 08:44:24.044914'),
(47, 'student_master', '0029_rename_transcript_issued_enrollment_badge_issued', '2025-02-18 09:21:33.415324'),
(48, 'student_master', '0030_alter_enrollment_matricule', '2025-02-20 08:40:30.998776'),
(49, 'student_master', '0031_alter_enrollment_student', '2025-02-20 08:50:42.661271'),
(50, 'student_master', '0032_rename_student_contrat_studentcontrat', '2025-02-25 09:36:21.583740'),
(51, 'student_master', '0033_studentcontrat_branch_studentcontrat_category', '2025-02-25 10:11:52.267792'),
(52, 'student_master', '0034_studentcontrat_sexe', '2025-02-25 10:36:12.362648');

-- --------------------------------------------------------

--
-- Structure de la table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8mb4_general_ci NOT NULL,
  `session_data` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('2oohwm5fgzb7b0lbkymkji8igsa128vx', '.eJxVjMsOgjAURP-la9P0QpHi0r3f0NxXBTVtQmFl_HchYaGrSeacmbeJuC5jXKvOcRJzMWBOvx0hPzXvQB6Y78Vyycs8kd0Ve9Bqb0X0dT3cv4MR67it1TuBNODQi0JyDTYNsGcNQiBnhF4AQQL5bouWJbXUsSMg5oBOnfl8AQaIOR4:1tW0A4:Isk7s1sjtVfHgBhpOqbdQSxBye5Y5-VhTdB86IkKbZ8', '2025-01-23 21:33:52.679202'),
('4nhpnolsqf0eaiw27g3w3cc10cattg7x', '.eJxVjEEOwiAQRe_C2pBCWzq4dO8ZyDDDSNVAUtqV8e7apAvd_vfef6mA25rD1tISZlZnZdTpd4tIj1R2wHcst6qplnWZo94VfdCmr5XT83K4fwcZW_7W6B3jSOwk0iTWjuI7NBDJEQlj8gYJvHVIAj3aQYwAeEq9dDjJAOr9ASNcOWM:1tnaRE:YXY7kELTdsQ5QahbdFJyCri-0Jye-2UkCQ8iF7x1arE', '2025-03-13 09:44:16.872280'),
('5tfvsxdhepnodk25twjwmqok0gk7k5cf', '.eJxVjEEOwiAQRe_C2pBCWzq4dO8ZyDDDSNVAUtqV8e7apAvd_vfef6mA25rD1tISZlZnZdTpd4tIj1R2wHcst6qplnWZo94VfdCmr5XT83K4fwcZW_7W6B3jSOwk0iTWjuI7NBDJEQlj8gYJvHVIAj3aQYwAeEq9dDjJAOr9ASNcOWM:1tg6S1:8J022gMT4ISZsyhB6VdCPQ2qx6beno6WdziFCVhchr0', '2025-02-20 18:18:09.642503'),
('b46o56rmr29zzor20cc7pkxf82qbjanv', '.eJxVjEEOwiAQRe_C2pBCWzq4dO8ZyDDDSNVAUtqV8e7apAvd_vfef6mA25rD1tISZlZnZdTpd4tIj1R2wHcst6qplnWZo94VfdCmr5XT83K4fwcZW_7W6B3jSOwk0iTWjuI7NBDJEQlj8gYJvHVIAj3aQYwAeEq9dDjJAOr9ASNcOWM:1tcOky:DUYg8mUUAlkMBJZYWR4h_xtQN8ZXdEm9qfcVdATBz0c', '2025-02-10 13:02:24.481826'),
('grv8pt8oy9rn6qg83yzwbvzslracbsum', '.eJxVjMsOgjAURP-la9P0QpHi0r3f0NxXBTVtQmFl_HchYaGrSeacmbeJuC5jXKvOcRJzMWBOvx0hPzXvQB6Y78Vyycs8kd0Ve9Bqb0X0dT3cv4MR67it1TuBNODQi0JyDTYNsGcNQiBnhF4AQQL5bouWJbXUsSMg5oBOnfl8AQaIOR4:1tSdQR:4Qv6Xdb5VAWpqs4yvobluEHiIzjHvGEwvxQeJrbfKh0', '2025-01-14 14:40:51.486105'),
('h2uhykmdmw6ejvdrpu2xf4ohoedc05ty', '.eJxVjDkOwjAQRe_iGlnyMl4o6TmDNZ4ZcAAlUpYKcXccKQW0_73336rgtrayLTKXgdVZWXX63SrSU8Yd8APH-6RpGtd5qHpX9EEXfZ1YXpfD_TtouLReu8je2ySQszMQrCdiwd6zAQJv0UUAQqkMJLnLEpKx3sVwSwwQ1OcL4yo34g:1taIXz:YQv2GY8BfY0avX8wTS3RQZ9ngbQH21kZ_yHA4El9yV8', '2025-02-04 18:00:19.017488'),
('kjwex6seaoquf64z16sr0wsjt3urvsai', '.eJxVjEEOwiAQRe_C2pBCWzq4dO8ZyDDDSNVAUtqV8e7apAvd_vfef6mA25rD1tISZlZnZdTpd4tIj1R2wHcst6qplnWZo94VfdCmr5XT83K4fwcZW_7W6B3jSOwk0iTWjuI7NBDJEQlj8gYJvHVIAj3aQYwAeEq9dDjJAOr9ASNcOWM:1tcQYz:rtwv14engVELxaqtIx8U0ShWa4HNYUUdcDT0yKcmuVQ', '2025-02-10 14:58:09.695695'),
('ldw5ur6buh40ha2v12jlyna7km8p0ok4', '.eJxVjMsOgjAURP-la9P0QpHi0r3f0NxXBTVtQmFl_HchYaGrSeacmbeJuC5jXKvOcRJzMWBOvx0hPzXvQB6Y78Vyycs8kd0Ve9Bqb0X0dT3cv4MR67it1TuBNODQi0JyDTYNsGcNQiBnhF4AQQL5bouWJbXUsSMg5oBOnfl8AQaIOR4:1tVW4E:FnN-ztBtCkCIPqjL7gsORMUp6B_luBe4ZrDZ4TCjwg0', '2025-01-22 13:25:50.888141'),
('qf86jt25acmmz5f1b97mapo3agmmwjpv', '.eJxVjEEOwiAQRe_C2pBCWzq4dO8ZyDDDSNVAUtqV8e7apAvd_vfef6mA25rD1tISZlZnZdTpd4tIj1R2wHcst6qplnWZo94VfdCmr5XT83K4fwcZW_7W6B3jSOwk0iTWjuI7NBDJEQlj8gYJvHVIAj3aQYwAeEq9dDjJAOr9ASNcOWM:1taWi9:IjElFAfadafBA7l09F4z5Qa2Tsvy0I6d6h5RaR4bJKs', '2025-02-05 09:07:45.557291'),
('r93y1dz78nbyossa6jjc8y0e6g7j7a6k', '.eJxVjEEOwiAQRe_C2pBCWzq4dO8ZyDDDSNVAUtqV8e7apAvd_vfef6mA25rD1tISZlZnZdTpd4tIj1R2wHcst6qplnWZo94VfdCmr5XT83K4fwcZW_7W6B3jSOwk0iTWjuI7NBDJEQlj8gYJvHVIAj3aQYwAeEq9dDjJAOr9ASNcOWM:1taAZp:N6f4TNGEXcM1fgiTLmsv8ixC8OtmFTDO2G-nf1F6hbY', '2025-02-04 09:29:41.813099'),
('ty1anfjichl2d23uzs0kw0wp98dvs90w', '.eJxVjMsOgjAURP-la9P0QpHi0r3f0NxXBTVtQmFl_HchYaGrSeacmbeJuC5jXKvOcRJzMWBOvx0hPzXvQB6Y78Vyycs8kd0Ve9Bqb0X0dT3cv4MR67it1TuBNODQi0JyDTYNsGcNQiBnhF4AQQL5bouWJbXUsSMg5oBOnfl8AQaIOR4:1tSeNG:_Z7cbwf09N0ax5zF0iNOhiGE7MBj5duSZu8oILxtVAk', '2025-01-14 15:41:38.280152'),
('v4eqfwiajmb9givi8re2up4x9s3qqoru', '.eJxVjEEOwiAQRe_C2pBCWzq4dO8ZyDDDSNVAUtqV8e7apAvd_vfef6mA25rD1tISZlZnZdTpd4tIj1R2wHcst6qplnWZo94VfdCmr5XT83K4fwcZW_7W6B3jSOwk0iTWjuI7NBDJEQlj8gYJvHVIAj3aQYwAeEq9dDjJAOr9ASNcOWM:1tbl4F:0l-7IEquvP1hwu39DBWd3l3MpXinEbDEiC6vKp66V_8', '2025-02-08 18:39:39.110056'),
('vbud1q6sbxpd6h0r8grblbro6a04yjst', '.eJxVjEEOwiAQRe_C2pBCWzq4dO8ZyDDDSNVAUtqV8e7apAvd_vfef6mA25rD1tISZlZnZdTpd4tIj1R2wHcst6qplnWZo94VfdCmr5XT83K4fwcZW_7W6B3jSOwk0iTWjuI7NBDJEQlj8gYJvHVIAj3aQYwAeEq9dDjJAOr9ASNcOWM:1tahKJ:TycbUDh5_PHMa8FzSF10xjqttTdBVWsj2VVRm_v12EQ', '2025-02-05 20:27:51.981189');

-- --------------------------------------------------------

--
-- Structure de la table `student_master_academicyear`
--

CREATE TABLE `student_master_academicyear` (
  `id` bigint NOT NULL,
  `academic_year` varchar(10) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `student_master_decrit`
--

CREATE TABLE `student_master_decrit` (
  `id` bigint NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `academic_year` varchar(9) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `student_master_deliberation`
--

CREATE TABLE `student_master_deliberation` (
  `id` bigint NOT NULL,
  `total_credits` int NOT NULL,
  `average_grade` decimal(5,2) DEFAULT NULL,
  `result_status` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `decision_date` date NOT NULL,
  `diploma_issued` tinyint(1) NOT NULL,
  `transcript_issued` tinyint(1) NOT NULL,
  `pedagogic_year_id` bigint NOT NULL,
  `speciality_id` bigint NOT NULL,
  `student_id` bigint NOT NULL,
  `academic_year` varchar(9) COLLATE utf8mb4_general_ci NOT NULL,
  `mention` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `diploma_number` int NOT NULL,
  `issued_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `student_master_deliberation`
--

INSERT INTO `student_master_deliberation` (`id`, `total_credits`, `average_grade`, `result_status`, `decision_date`, `diploma_issued`, `transcript_issued`, `pedagogic_year_id`, `speciality_id`, `student_id`, `academic_year`, `mention`, `diploma_number`, `issued_date`) VALUES
(5, 30, 16.52, 'ناجح', '2025-01-01', 1, 0, 3, 8, 2, '2025/2024', 'ممتاز', 0, '2025-02-09'),
(19, 0, 0.00, 'ناجح', '2023-11-30', 1, 0, 3, 4, 5, '2023/2022', 'جيد جدا', 284, NULL),
(20, 0, 0.00, 'ناجح', '2024-12-18', 1, 0, 3, 2, 8, '2024/2023', 'قريب من الجيد', 286, NULL),
(21, 0, 0.00, 'ناجح', '2024-12-18', 1, 0, 3, 4, 7, '2024/2023', 'قريب من الجيد', 287, NULL),
(22, 0, 0.00, 'ناجح', '2019-07-09', 1, 0, 3, 9, 3, '2019/2018', 'جيد', 288, NULL),
(23, 0, 0.00, 'ناجح', '2024-12-18', 1, 0, 3, 2, 9, '2024/2023', 'جيد', 289, NULL),
(24, 0, 0.00, 'ناجح', '2024-12-18', 1, 0, 3, 2, 10, '2024/2023', 'جيد', 290, NULL),
(25, 30, 0.00, 'ناجح', '2024-12-19', 1, 0, 3, 3, 11, '2024/2023', '/', 322, NULL),
(27, 20, 0.00, 'ناجح', '2024-12-19', 1, 0, 3, 3, 13, '2024/2023', '/', 323, NULL),
(29, 30, 14.00, 'ناجح', '2025-01-12', 0, 0, 3, 3, 15, '2024/2023', '/', 0, NULL),
(31, 26, 12.00, 'ناجح', '2024-12-19', 1, 0, 3, 3, 12, '2024/2023', 'جيد جدا', 292, NULL),
(35, 0, 0.00, 'ناجح', '2024-12-19', 1, 0, 3, 3, 33, '2024/2023', '/', 294, NULL),
(36, 0, 0.00, 'ناجح', '2024-12-18', 1, 0, 3, 4, 47, '2024/2023', 'جيد جدا', 293, NULL),
(37, 0, 0.00, 'ناجح', '2024-12-18', 1, 0, 3, 4, 55, '2024/2023', 'جيد جدا', 295, NULL),
(38, 0, 0.00, 'ناجح', '2024-12-18', 1, 0, 3, 4, 56, '2024/2023', 'جيد جدا', 296, NULL),
(39, 0, 0.00, 'ناجح', '2024-12-18', 1, 0, 3, 4, 57, '2024/2023', 'جيد جدا', 297, NULL),
(40, 0, 0.00, 'ناجح', '2024-12-18', 1, 0, 3, 4, 58, '2024/2023', 'جيد جدا', 298, NULL),
(42, 0, 0.00, 'ناجح', '2024-12-18', 1, 0, 3, 4, 61, '2024/2023', '/', 300, NULL),
(43, 0, 0.00, 'ناجح', '2024-12-18', 1, 0, 3, 2, 53, '2024/2023', '/', 301, NULL),
(44, 0, 0.00, 'ناجح', '2024-12-18', 1, 0, 3, 2, 60, '2024/2023', '/', 302, NULL),
(45, 0, 0.00, 'ناجح', '2024-12-18', 1, 0, 3, 4, 62, '2024/2023', '/', 303, NULL),
(46, 0, 0.00, 'ناجح', '2024-12-18', 1, 0, 3, 4, 63, '2024/2023', '/', 304, NULL),
(47, 0, 0.00, 'ناجح', '2024-12-18', 1, 0, 3, 4, 64, '2024/2023', '/', 305, NULL),
(48, 0, 0.00, 'ناجح', '2024-12-18', 1, 0, 3, 4, 65, '2024/2023', '/', 306, '2025-02-19'),
(49, 0, 0.00, 'ناجح', '2024-12-18', 1, 0, 3, 4, 66, '2024/2023', '/', 307, NULL),
(50, 0, 0.00, 'ناجح', '2024-12-23', 1, 0, 3, 1, 67, '2024/2023', '/', 308, NULL),
(51, 0, 0.00, 'ناجح', '2024-12-23', 1, 0, 3, 1, 49, '2024/2023', '/', 309, NULL),
(52, 0, 0.00, 'ناجح', '2024-12-23', 1, 0, 3, 1, 68, '2024/2023', '/', 310, NULL),
(53, 0, 0.00, 'ناجح', '2024-12-23', 1, 0, 3, 1, 69, '2024/2023', '/', 311, NULL),
(56, 0, 0.00, 'ناجح', '2024-12-23', 1, 0, 3, 8, 71, '2024/2023', '/', 312, NULL),
(57, 0, 0.00, 'ناجح', '2024-12-23', 1, 0, 3, 8, 72, '2024/2023', '/', 313, NULL),
(58, 0, 0.00, 'ناجح', '2024-12-19', 1, 0, 3, 3, 73, '2024/2023', 'جيد', 314, NULL),
(59, 0, 0.00, 'ناجح', '2024-12-19', 1, 0, 3, 3, 26, '2024/2023', '/', 315, NULL),
(60, 60, 15.13, 'ناجح', '2024-12-23', 1, 1, 3, 1, 75, '2024/2023', 'جيد', 316, NULL),
(65, 0, 0.00, 'ناجح', '2024-12-23', 1, 0, 3, 8, 77, '2024/2023', '/', 317, NULL),
(76, 0, 0.00, 'ناجح', '2020-12-07', 1, 0, 3, 1, 82, '2020/2019', '/', 318, NULL),
(77, 0, 0.00, 'ناجح', '2024-12-23', 1, 0, 3, 8, 54, '2024/2023', '/', 319, NULL),
(78, 0, 0.00, 'ناجح', '2024-12-23', 1, 0, 3, 8, 83, '2024/2023', '/', 320, NULL),
(79, 0, 0.00, 'ناجح', '2024-12-18', 1, 0, 3, 4, 84, '2024/2023', '/', 321, NULL),
(81, 0, 0.00, 'ناجح', '2024-12-18', 1, 0, 3, 4, 85, '2024/2023', '/', 324, NULL),
(82, 0, 0.00, 'ناجح', '2024-12-19', 1, 0, 3, 3, 20, '2024/2023', '/', 325, NULL),
(83, 0, 0.00, 'ناجح', '2024-12-19', 1, 0, 3, 3, 34, '2024/2023', '/', 326, NULL),
(84, 0, 0.00, 'ناجح', '2024-12-23', 1, 0, 3, 1, 87, '2024/2023', 'جيد', 327, NULL),
(85, 0, 0.00, 'ناجح', '2024-12-23', 1, 0, 3, 1, 88, '2024/2023', 'جيد', 328, NULL),
(86, 56, 14.00, 'ناجح', '2024-12-19', 1, 0, 3, 3, 24, '2024/2023', 'جيد', 329, NULL),
(87, 0, 0.00, 'ناجح', '2024-12-23', 1, 0, 3, 1, 50, '2024/2023', '/', 330, NULL),
(88, 0, 0.00, 'ناجح', '2024-12-23', 1, 0, 3, 1, 89, '2024/2023', '/', 331, NULL),
(89, 45, 13.00, 'ناجح', '2024-12-19', 1, 0, 3, 3, 17, '2024/2023', '/', 332, NULL),
(90, 0, 0.00, 'ناجح', '2024-12-23', 1, 0, 3, 1, 90, '2024/2023', '/', 333, NULL),
(91, 0, 0.00, 'ناجح', '2024-12-23', 1, 0, 3, 1, 51, '2024/2023', '/', 334, NULL),
(92, 0, 0.00, 'ناجح', '2024-12-18', 1, 0, 3, 4, 91, '2024/2023', '/', 335, NULL),
(93, 0, 0.00, 'ناجح', '2024-12-23', 1, 0, 3, 1, 92, '2024/2023', 'جيد', 336, NULL),
(94, 0, 0.00, 'ناجح', '2024-12-18', 1, 0, 3, 2, 93, '2024/2023', '/', 337, NULL),
(95, 0, 0.00, 'ناجح', '2024-12-23', 1, 0, 3, 1, 94, '2024/2023', '/', 338, NULL),
(96, 0, 0.00, 'ناجح', '2024-12-19', 1, 0, 3, 3, 95, '2024/2023', '/', 339, NULL),
(97, 0, 0.00, 'ناجح', '2024-12-19', 1, 0, 3, 3, 96, '2024/2023', '/', 340, NULL),
(98, 0, 0.00, 'ناجح', '2024-12-23', 1, 0, 3, 1, 97, '2024/2023', '/', 341, NULL),
(99, 0, 0.00, 'ناجح', '2024-12-18', 1, 0, 3, 2, 98, '2024/2023', '/', 342, NULL),
(100, 0, 0.00, 'ناجح', '2024-12-19', 1, 0, 3, 3, 99, '2024/2023', '/', 343, NULL),
(101, 0, 0.00, 'ناجح', '2024-12-19', 1, 0, 3, 3, 100, '2024/2023', '/', 344, NULL),
(102, 37, 12.84, 'ناجح', '2024-12-19', 1, 0, 3, 3, 14, '2024/2023', '/', 345, NULL),
(103, 0, 0.00, 'ناجح', '2024-12-19', 1, 0, 3, 3, 29, '2024/2023', '/', 346, NULL),
(104, 0, 0.00, 'ناجح', '2024-12-19', 1, 0, 3, 3, 38, '2024/2023', '/', 347, NULL),
(105, 0, 0.00, 'ناجح', '2024-12-19', 1, 0, 3, 3, 27, '2024/2023', '/', 348, NULL),
(106, 0, 0.00, 'ناجح', '2024-12-18', 1, 0, 3, 4, 101, '2024/2023', '/', 349, NULL),
(107, 0, 0.00, 'ناجح', '2024-12-18', 1, 0, 3, 4, 102, '2024/2023', '/', 350, NULL),
(108, 0, 0.00, 'ناجح', '2024-12-23', 1, 0, 3, 8, 78, '2024/2023', '/', 351, NULL),
(109, 0, 0.00, 'ناجح', '2024-12-19', 1, 0, 3, 3, 103, '2024/2023', '/', 352, NULL),
(110, 0, 0.00, 'ناجح', '2024-12-18', 1, 0, 3, 2, 106, '2024/2023', '/', 353, NULL),
(111, 0, 0.00, 'ناجح', '2024-12-23', 1, 0, 3, 8, 107, '2024/2023', 'جيد جدا', 354, '2025-02-27'),
(112, 0, 0.00, 'ناجح', '2024-12-23', 1, 0, 3, 1, 108, '2023/2022', '/', 355, NULL),
(113, 0, 0.00, 'ناجح', '2024-12-19', 1, 0, 3, 3, 41, '2024/2023', '/', 356, '2025-02-11'),
(114, 0, 0.00, 'ناجح', '2024-12-19', 1, 0, 3, 3, 39, '2024/2023', '/', 357, NULL),
(115, 0, 0.00, 'ناجح', '2024-12-23', 1, 0, 3, 1, 109, '2024/2023', '/', 358, NULL),
(116, 0, 0.00, 'ناجح', '2024-12-23', 1, 0, 3, 1, 110, '2024/2023', '/', 359, NULL),
(117, 0, 0.00, 'ناجح', '2024-12-19', 1, 0, 3, 3, 111, '2024/2023', '/', 360, NULL),
(118, 0, 0.00, 'ناجح', '2024-12-23', 1, 0, 3, 8, 112, '2024/2023', 'جيد جدا', 361, '2025-02-11'),
(119, 0, 0.00, 'ناجح', '2024-12-18', 1, 0, 3, 2, 113, '2024/2023', '/', 362, NULL),
(120, 0, 0.00, 'ناجح', '2024-12-18', 1, 0, 3, 2, 114, '2024/2023', '/', 363, NULL),
(121, 0, 0.00, 'ناجح', '2024-12-23', 1, 0, 3, 1, 115, '2024/2023', '/', 364, NULL),
(122, 0, 0.00, 'ناجح', '2024-12-19', 1, 0, 3, 3, 116, '2024/2023', '/', 365, NULL),
(123, 47, 14.12, 'ناجح', '2024-12-19', 1, 0, 3, 3, 16, '2024/2023', 'جيد جدا', 366, NULL),
(124, 0, 0.00, 'ناجح', '2024-12-18', 1, 0, 3, 4, 117, '2024/2023', '/', 367, NULL),
(125, 0, 0.00, 'ناجح', '2024-12-23', 1, 0, 3, 8, 118, '2024/2023', '/', 368, NULL),
(126, 0, 0.00, 'ناجح', '2024-12-22', 1, 0, 3, 7, 104, '2024/2023', '/', 369, NULL),
(127, 0, 0.00, 'ناجح', '2024-12-22', 1, 0, 3, 7, 105, '2024/2023', '/', 370, NULL),
(128, 0, 0.00, 'ناجح', '2024-12-22', 1, 0, 3, 7, 119, '2024/2023', '/', 371, NULL),
(129, 0, 0.00, 'ناجح', '2024-12-22', 1, 0, 3, 7, 120, '2024/2023', '/', 372, NULL),
(130, 0, 0.00, 'ناجح', '2024-12-18', 1, 0, 3, 2, 121, '2024/2023', '/', 373, NULL),
(131, 0, 0.00, 'ناجح', '2024-12-22', 1, 0, 3, 7, 122, '2024/2023', '/', 374, NULL),
(132, 0, 0.00, 'ناجح', '2024-12-18', 1, 0, 3, 2, 123, '2024/2023', '/', 375, NULL),
(133, 0, 0.00, 'ناجح', '2024-12-22', 1, 0, 3, 7, 124, '2024/2023', '/', 376, NULL),
(134, 0, 0.00, 'ناجح', '2024-12-22', 1, 0, 3, 7, 125, '2024/2023', '/', 377, '2025-02-11'),
(135, 0, 0.00, 'ناجح', '2024-12-18', 1, 0, 3, 2, 126, '2024/2023', '/', 378, '2025-02-12'),
(136, 0, 0.00, 'ناجح', '2024-12-18', 1, 0, 3, 2, 127, '2024/2023', 'جيد', 379, NULL),
(137, 0, 0.00, 'ناجح', '2024-12-23', 1, 0, 3, 8, 128, '2024/2023', '/', 380, NULL),
(138, 0, 0.00, 'ناجح', '2024-12-23', 1, 0, 3, 1, 129, '2024/2023', '/', 381, NULL),
(139, 0, 0.00, 'ناجح', '2024-12-23', 1, 0, 3, 8, 130, '2024/2023', '/', 382, NULL),
(140, 0, 0.00, 'ناجح', '2024-12-23', 1, 0, 3, 8, 132, '2024/2023', '/', 383, NULL),
(141, 0, 0.00, 'ناجح', '2024-12-23', 1, 0, 3, 8, 133, '2024/2023', '/', 384, NULL),
(142, 0, 0.00, 'ناجح', '2024-12-23', 1, 0, 3, 8, 134, '2024/2023', '/', 385, NULL),
(143, 0, 0.00, 'ناجح', '2024-12-23', 1, 0, 3, 8, 135, '2024/2023', '/', 386, NULL),
(144, 0, 0.00, 'ناجح', '2024-12-23', 1, 0, 3, 8, 136, '2024/2023', '/', 387, NULL),
(145, 0, 0.00, 'ناجح', '2024-12-19', 1, 0, 3, 3, 23, '2024/2023', '/', 388, NULL),
(146, 0, 0.00, 'ناجح', '2024-12-23', 1, 0, 3, 8, 138, '2024/2023', '/', 389, NULL),
(147, 0, 0.00, 'ناجح', '2024-12-23', 1, 0, 3, 1, 139, '2024/2023', '/', 390, NULL),
(148, 0, 0.00, 'ناجح', '2024-12-23', 1, 0, 3, 1, 140, '2024/2023', '/', 391, NULL),
(149, 0, 0.00, 'ناجح', '2024-12-23', 1, 0, 3, 8, 131, '2024/2023', '/', 392, NULL),
(150, 0, 0.00, 'ناجح', '2024-12-23', 1, 0, 3, 8, 137, '2024/2023', '/', 393, NULL),
(151, 0, 0.00, 'ناجح', '2024-12-18', 1, 0, 3, 4, 141, '2024/2023', '/', 394, '2025-02-12'),
(152, 0, 0.00, 'ناجح', '2024-12-19', 1, 0, 3, 3, 142, '2024/2023', '/', 395, '2025-02-12'),
(153, 0, 0.00, 'ناجح', '2024-12-18', 0, 0, 3, 5, 143, '2025/2024', '/', 396, NULL),
(154, 54, 13.82, 'ناجح', '2022-11-10', 0, 0, 3, 1, 174, '2022/2021', 'قريب من الجيد', 397, NULL),
(157, 30, 9.00, 'ناجح', '2025-02-23', 0, 0, 1, 1, 2, '2025/2024', '/', 0, NULL),
(159, 50, 13.00, 'ناجح', '2025-02-23', 0, 0, 1, 1, 174, '2020/2019', 'مقبول', 0, NULL),
(160, 0, 0.00, 'ناجح', '2024-12-23', 1, 0, 3, 1, 175, '2024/2023', '/', 398, '2025-02-24');

-- --------------------------------------------------------

--
-- Structure de la table `student_master_domain`
--

CREATE TABLE `student_master_domain` (
  `id` bigint NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `name_en` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `student_master_domain`
--

INSERT INTO `student_master_domain` (`id`, `name`, `name_en`) VALUES
(7, 'علوم الطبيعة والحياة', 'Sciences de la Nature et de la Vie'),
(8, 'رياضيات و إعلام ألي', 'Mathématique et Informatique'),
(9, 'علوم المادة', 'Sciences de la Matière'),
(11, 'فنون', 'Art');

-- --------------------------------------------------------

--
-- Structure de la table `student_master_enrollment`
--

CREATE TABLE `student_master_enrollment` (
  `id` bigint NOT NULL,
  `matricule` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `date_enrolled` date NOT NULL,
  `academic_year` varchar(9) COLLATE utf8mb4_general_ci NOT NULL,
  `certificate_issued` tinyint(1) NOT NULL,
  `pedagogic_year_id` bigint NOT NULL,
  `speciality_id` bigint NOT NULL,
  `student_id` bigint NOT NULL,
  `issued_badge_date` date DEFAULT NULL,
  `issued_certificate_date` date DEFAULT NULL,
  `badge_issued` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `student_master_enrollment`
--

INSERT INTO `student_master_enrollment` (`id`, `matricule`, `date_enrolled`, `academic_year`, `certificate_issued`, `pedagogic_year_id`, `speciality_id`, `student_id`, `issued_badge_date`, `issued_certificate_date`, `badge_issued`) VALUES
(2, '141/م ع أ/2021', '2024-12-29', '2022/2021', 0, 1, 1, 2, NULL, NULL, 0),
(3, 'ph/M-A/2019-05', '2025-01-05', '2019/2018', 0, 3, 9, 3, NULL, NULL, 0),
(4, 'م ع ف-2020/007', '2025-01-05', '2021/2020', 0, 1, 2, 4, NULL, NULL, 0),
(5, 'م.ع.أ/م-0284', '2025-01-08', '2023/2022', 0, 3, 4, 5, NULL, NULL, 0),
(6, '202031082793', '2025-01-08', '2025/2024', 0, 1, 1, 6, '2025-02-18', NULL, 0),
(7, '33003467', '2025-01-08', '2024/2023', 0, 3, 4, 7, NULL, NULL, 0),
(8, '161732019534', '2025-01-08', '2024/2023', 0, 3, 2, 8, NULL, NULL, 0),
(9, '191932065039', '2025-01-08', '2024/2023', 0, 3, 2, 9, NULL, NULL, 0),
(10, '141432009516', '2025-01-09', '2024/2023', 0, 3, 2, 10, NULL, NULL, 0),
(11, 'م ت ك-2022/001', '2025-01-12', '2024/2023', 0, 3, 3, 11, NULL, NULL, 0),
(12, '‫م‬ ‫ت‬ ‫ك-‬‬‫‪2022/002‬‬', '2025-01-12', '2024/2023', 0, 3, 3, 12, NULL, NULL, 0),
(13, '‫م‬ ‫ت‬ ‫ك-‬‬‫‪2022/003‬‬', '2025-01-12', '2024/2023', 0, 3, 3, 13, NULL, NULL, 0),
(14, '‫م‬ ‫ت‬ ‫ك-‬‬‫‪2022/004‬‬', '2025-01-12', '2024/2023', 0, 3, 3, 14, NULL, NULL, 0),
(15, '‫م‬ ‫ت‬ ‫ك‬-‬‬‫‪2022/005‬‬', '2025-01-12', '2024/2023', 0, 3, 3, 15, NULL, NULL, 0),
(16, '‫م‬ ‫ت‬ ‫ك-‬‬‫‪2022/006‬‬', '2025-01-12', '2024/2023', 0, 3, 3, 16, NULL, NULL, 0),
(17, '‫م‬ ‫ت‬ ‫ك‬-‬‬‫‪2022/007‬‬', '2025-01-12', '2024/2023', 0, 3, 3, 17, NULL, NULL, 0),
(18, '‫م‬ ‫ت‬ ‫ك-‬‬‫‪2022/008‬‬', '2025-01-12', '2024/2023', 0, 3, 3, 18, NULL, NULL, 0),
(19, '‫م‬ ‫ت‬ ‫ك-‬‬‫‪2022/009‬‬', '2025-01-12', '2024/2023', 0, 3, 3, 20, NULL, NULL, 0),
(20, '‫م‬ ‫ت‬ ‫ك-‬‬‫‪2022/010‬‬', '2025-01-12', '2024/2023', 0, 3, 3, 21, NULL, NULL, 0),
(21, '‫م‬ ‫ت‬ ‫ك-‬‬‫‪2022/011‬‬', '2025-01-12', '2024/2023', 0, 3, 3, 22, NULL, NULL, 0),
(22, '‫م‬ ‫ت‬ ‫ك-‬‬‫‪2022/012‬‬', '2025-01-12', '2024/2023', 0, 3, 3, 23, NULL, NULL, 0),
(23, '‫م‬ ‫ت‬ ‫ك‬-‬‬‫‪2022/013‬‬', '2025-01-12', '2024/2023', 0, 3, 3, 24, NULL, NULL, 0),
(24, '‫م‬ ‫ت‬ ‫ك-‬‬‫‪2022/014‬‬', '2025-01-12', '2024/2023', 0, 3, 3, 25, NULL, NULL, 0),
(25, '‫م‬ ‫ت‬ ‫ك-‬‬‫‪2022/015‬‬', '2025-01-12', '2024/2023', 0, 3, 3, 26, NULL, NULL, 0),
(26, '‫م‬ ‫ت‬ ‫ك- ‫‪2022/016‬‬', '2025-01-12', '2024/2023', 0, 3, 3, 27, NULL, NULL, 0),
(27, '‫م‬‫ ت‬ ‫ك-‬‬‫‪2022/017‬‬', '2025-01-12', '2024/2023', 0, 3, 3, 28, NULL, NULL, 0),
(28, '‫م‬‫ ت‬ ‫ك-‬‬‫‪2022/018‬‬', '2025-01-12', '2024/2023', 0, 3, 3, 29, NULL, NULL, 0),
(29, '‫م‬‫ ت‬ ‫ك‬-‬‬‫‪2022/019‬‬', '2025-01-12', '2024/2023', 0, 3, 3, 31, NULL, NULL, 0),
(31, '‫م‬‫ت‬ ‫ك-‬‬‫‪2022/021‬‬', '2025-01-12', '2024/2023', 0, 3, 3, 33, NULL, NULL, 0),
(32, '‫م‬‫ت‬ ‫ك‬-‬‬‫‪2022/022‬‬', '2025-01-12', '2024/2023', 0, 3, 3, 34, NULL, NULL, 0),
(33, '‫م‬ ‫ت‬ ‫ك‬-‬‬‫‪2023/001‬‬', '2025-01-12', '2024/2023', 0, 3, 3, 35, NULL, NULL, 0),
(34, '‫م‬ ‫ت‬ ‫ك-‬‬‫‪2023/002‬‬', '2025-01-12', '2024/2023', 0, 3, 3, 36, NULL, NULL, 0),
(36, '‫م‬ ‫ت‬ ‫ك‬-‬‬‫‪2023/004‬‬', '2025-01-12', '2024/2023', 0, 3, 3, 38, NULL, NULL, 0),
(37, '‫م‬ ‫ت‬ ‫ك-‬‬‫‪2023/005‬‬', '2025-01-12', '2024/2023', 0, 3, 3, 39, NULL, NULL, 0),
(38, '‫م‬ ‫ت‬ ‫ك-‬‬‫‪2023/006‬‬', '2025-01-12', '2024/2023', 0, 3, 3, 40, NULL, NULL, 0),
(39, '‫م‬ ‫ت‬ ‫ك-‬‬‫‪2023/007‬‬', '2025-01-12', '2024/2023', 0, 3, 3, 41, NULL, NULL, 0),
(40, '‫م‬ ‫ت‬ ‫ك‬-‬‬‫‪2023/008‬‬', '2025-01-12', '2024/2023', 0, 3, 3, 42, NULL, NULL, 0),
(42, '‫م‬ ‫ت‬ ‫ك-‬‬‫‪2023/010‬‬', '2025-01-12', '2024/2023', 0, 3, 3, 44, NULL, NULL, 0),
(43, '‫م‬ ‫ت‬ ‫ك-‬‬‫‪2023/011‬‬', '2025-01-12', '2024/2023', 0, 3, 3, 45, NULL, NULL, 0),
(44, '‫م‬ ‫ت‬ ‫ك-‬‬‫‪2023/012‬‬', '2025-01-12', '2024/2023', 0, 3, 3, 46, NULL, NULL, 0),
(45, 'م ع ك-2023/001', '2025-01-13', '2024/2023', 0, 3, 4, 47, NULL, NULL, 0),
(46, '791374759', '2025-01-13', '2024/2023', 0, 3, 1, 49, NULL, NULL, 0),
(47, '780034621', '2025-01-13', '2024/2023', 0, 3, 1, 50, NULL, NULL, 0),
(48, '191931065748', '2025-01-13', '2024/2023', 0, 1, 1, 51, NULL, NULL, 0),
(49, '55554444', '2025-01-14', '2024/2023', 0, 3, 2, 53, NULL, NULL, 0),
(50, '779858464', '2025-01-14', '2024/2023', 0, 3, 8, 54, NULL, NULL, 0),
(51, '999999', '2025-01-14', '2024/2023', 0, 3, 4, 55, NULL, NULL, 0),
(52, '77777', '2025-01-14', '2024/2023', 0, 3, 4, 56, NULL, NULL, 0),
(53, '99999', '2025-01-14', '2024/2023', 0, 3, 4, 57, NULL, NULL, 0),
(54, '54544555', '2025-01-14', '2024/2023', 0, 3, 4, 58, NULL, NULL, 0),
(55, '191933030293', '2025-01-14', '2024/2023', 0, 3, 8, 59, NULL, NULL, 0),
(56, '161731063914', '2025-01-14', '2024/2023', 0, 3, 2, 60, NULL, NULL, 0),
(57, '88888888', '2025-01-14', '2024/2023', 0, 3, 4, 61, NULL, NULL, 0),
(58, 'م ع ك/2023- 004', '2025-01-14', '2024/2023', 0, 3, 4, 62, NULL, NULL, 0),
(59, 'م ع ك-2022/010', '2025-01-14', '2024/2023', 0, 3, 4, 63, NULL, NULL, 0),
(60, 'م ع ك-2023/006', '2025-01-14', '2024/2023', 0, 3, 4, 64, NULL, NULL, 0),
(61, 'م ع ك-2022/014', '2025-01-14', '2024/2023', 0, 3, 4, 65, NULL, NULL, 0),
(62, 'م ع ك/2023- 010', '2025-01-14', '2024/2023', 0, 3, 4, 66, NULL, NULL, 0),
(63, '141432076910', '2025-01-14', '2024/2023', 0, 4, 1, 67, NULL, NULL, 0),
(64, '181831031110', '2025-01-14', '2024/2023', 0, 3, 1, 68, NULL, NULL, 0),
(65, '171732070173', '2025-01-14', '2024/2023', 0, 3, 1, 69, NULL, NULL, 0),
(66, '181839018078', '2025-01-15', '2025/2024', 0, 3, 7, 70, NULL, NULL, 1),
(67, '12122009659', '2025-01-15', '2024/2023', 0, 3, 8, 71, NULL, NULL, 0),
(68, '10105057755', '2025-01-15', '2024/2023', 0, 3, 8, 72, NULL, NULL, 0),
(69, 'م ت ك-2022/010', '2025-01-16', '2024/2023', 0, 3, 3, 73, NULL, NULL, 0),
(70, '171732002419', '2025-01-19', '2024/2023', 0, 3, 1, 75, NULL, NULL, 0),
(72, '171731041915', '2025-01-21', '2024/2023', 0, 3, 8, 77, NULL, NULL, 0),
(73, '161632049092', '2025-01-21', '2024/2023', 0, 3, 8, 78, NULL, NULL, 0),
(75, 'م ع ط-2019/070', '2025-01-27', '2020/2019', 0, 3, 1, 82, NULL, NULL, 0),
(76, '191931030332', '2025-01-28', '2024/2023', 0, 3, 8, 83, NULL, NULL, 0),
(77, 'م ع ك-2022/015', '2025-01-28', '2024/2023', 0, 3, 4, 84, NULL, NULL, 0),
(79, 'م ع ك-2022/007', '2025-01-28', '2024/2023', 0, 3, 4, 85, NULL, NULL, 0),
(80, '161732082441', '2025-01-29', '2024/2023', 0, 3, 1, 87, NULL, NULL, 0),
(81, '151532011705', '2025-01-29', '2024/2023', 0, 3, 1, 88, NULL, NULL, 0),
(82, '191931062820', '2025-01-29', '2024/2023', 0, 3, 1, 89, NULL, NULL, 0),
(83, '171733067389', '2025-01-29', '2024/2023', 0, 3, 1, 90, NULL, NULL, 0),
(84, 'م ع ك-006/2022', '2025-01-29', '2024/2023', 0, 3, 4, 91, NULL, NULL, 0),
(85, '171732060838', '2025-01-29', '2024/2023', 0, 3, 1, 92, NULL, NULL, 0),
(86, 'م ع ف-2023/014', '2025-01-30', '2024/2023', 0, 3, 2, 93, NULL, NULL, 0),
(87, '191931096357', '2025-01-30', '2024/2023', 0, 3, 1, 94, NULL, NULL, 0),
(88, 'م ت ك2023/003-', '2025-01-30', '2024/2023', 0, 3, 3, 95, NULL, NULL, 0),
(89, 'م ت ك2022/011-', '2025-01-30', '2024/2023', 0, 3, 3, 96, NULL, NULL, 0),
(90, '131331072860', '2025-01-30', '2024/2023', 0, 3, 1, 97, NULL, NULL, 0),
(91, 'م ع ف-2023/012', '2025-02-02', '2024/2023', 0, 3, 2, 98, NULL, NULL, 0),
(92, 'م ت ك-2022/014', '2025-02-02', '2024/2023', 0, 3, 3, 99, NULL, NULL, 0),
(93, 'م ت ك-2023/001', '2025-02-02', '2024/2023', 0, 3, 3, 100, NULL, NULL, 0),
(94, 'م ع ك-2022/02', '2025-02-02', '2024/2023', 0, 3, 4, 101, NULL, NULL, 0),
(95, 'م ع ك-2022/003', '2025-02-02', '2024/2023', 0, 3, 4, 102, NULL, NULL, 0),
(96, 'م ت ك-2022/020', '2025-02-02', '2024/2023', 0, 3, 3, 103, NULL, NULL, 0),
(97, '181837077699100', '2025-02-03', '2024/2023', 0, 3, 7, 104, NULL, NULL, 0),
(98, '161735104350', '2025-02-03', '2024/2023', 0, 3, 7, 105, NULL, NULL, 0),
(99, 'م ع ف-2023/003', '2025-02-03', '2024/2023', 0, 3, 2, 106, NULL, NULL, 0),
(100, '9797108378', '2025-02-03', '2024/2023', 0, 3, 8, 107, NULL, NULL, 0),
(101, '171732024598', '2025-02-03', '2023/2022', 0, 3, 1, 108, NULL, NULL, 0),
(102, '171732060864', '2025-02-03', '2024/2023', 0, 3, 1, 109, NULL, NULL, 0),
(103, '161632020079', '2025-02-03', '2024/2023', 0, 3, 1, 110, NULL, NULL, 0),
(104, 'م‬ ‫ت‬ ‫ك-‬‬‫‪2023/009‬‬', '2025-02-03', '2024/2023', 0, 3, 3, 111, NULL, NULL, 0),
(105, '9999238784', '2025-02-03', '2024/2023', 0, 3, 8, 112, NULL, NULL, 0),
(106, 'م ع ف-2023/017', '2025-02-03', '2024/2023', 0, 3, 2, 113, NULL, NULL, 0),
(107, 'م ع ف-2023/004', '2025-02-03', '2024/2023', 0, 3, 2, 114, NULL, NULL, 0),
(108, '161631094908', '2025-02-03', '2024/2023', 0, 3, 1, 115, NULL, NULL, 0),
(109, 'م ت ك-2022/017', '2025-02-03', '2024/2023', 0, 3, 3, 116, NULL, NULL, 0),
(110, 'م ع ك-019/2022', '2025-02-03', '2024/2023', 0, 3, 4, 117, NULL, NULL, 0),
(111, '181831009802', '2025-02-04', '2024/2023', 0, 3, 8, 118, NULL, NULL, 0),
(112, '131339016348', '2025-02-04', '2024/2023', 0, 3, 7, 119, NULL, NULL, 0),
(113, '181937079988', '2025-02-04', '2024/2023', 0, 3, 7, 120, NULL, NULL, 0),
(114, 'م ع ف-2023/010', '2025-02-04', '2024/2023', 0, 3, 2, 121, NULL, NULL, 0),
(115, '191938014393', '2025-02-04', '2024/2023', 0, 3, 7, 122, NULL, NULL, 0),
(116, 'م ع ف-2022/005', '2025-02-04', '2024/2023', 0, 3, 2, 123, NULL, NULL, 0),
(117, '08084036559', '2025-02-04', '2024/2023', 0, 3, 7, 124, NULL, NULL, 0),
(118, '161638048493', '2025-02-04', '2024/2023', 0, 3, 7, 125, NULL, NULL, 0),
(119, 'م ع ف-2022/007', '2025-02-04', '2024/2023', 0, 3, 2, 126, NULL, NULL, 0),
(120, 'م ع ف-2022/011', '2025-02-04', '2024/2023', 0, 3, 2, 127, NULL, NULL, 0),
(121, '161731084401', '2025-02-04', '2024/2023', 0, 3, 8, 128, NULL, NULL, 0),
(122, '08082009728', '2025-02-04', '2024/2023', 0, 3, 1, 129, NULL, NULL, 0),
(123, '161637074693', '2025-02-04', '2024/2023', 0, 3, 8, 130, NULL, NULL, 0),
(124, '04049022190', '2025-02-04', '2024/2023', 0, 3, 8, 132, NULL, NULL, 0),
(125, '151531066885', '2025-02-04', '2024/2023', 0, 3, 8, 133, NULL, NULL, 0),
(126, '161633028933', '2025-02-04', '2024/2023', 0, 3, 8, 134, NULL, NULL, 0),
(127, '181831085107', '2025-02-04', '2024/2023', 0, 3, 8, 135, NULL, NULL, 0),
(128, '06064094085', '2025-02-04', '2024/2023', 0, 3, 8, 136, NULL, NULL, 0),
(129, '181831054512', '2025-02-04', '2024/2023', 0, 3, 8, 138, NULL, NULL, 0),
(130, '181831052335', '2025-02-04', '2024/2023', 0, 3, 1, 139, NULL, NULL, 0),
(131, '131332050727', '2025-02-04', '2024/2023', 0, 3, 1, 140, NULL, NULL, 0),
(132, '9696094907', '2025-02-09', '2024/2023', 0, 3, 8, 137, NULL, NULL, 0),
(133, '9494213595', '2025-02-09', '2024/2023', 0, 3, 8, 131, NULL, NULL, 0),
(134, 'م ع ك-2021/005', '2025-02-12', '2024/2023', 0, 3, 4, 141, NULL, NULL, 0),
(135, 'م ت ك-2023/011', '2025-02-12', '2024/2023', 0, 3, 3, 142, NULL, NULL, 0),
(136, '1000', '2025-02-16', '2024/2023', 0, 3, 5, 143, NULL, NULL, 0),
(137, '202032041163', '2025-02-18', '2025/2024', 0, 3, 7, 144, NULL, NULL, 1),
(138, '191938012609', '2025-02-18', '2025/2024', 0, 1, 7, 145, NULL, NULL, 1),
(139, '191935091746', '2025-02-18', '2025/2024', 0, 3, 7, 146, NULL, NULL, 1),
(140, '202037069327', '2025-02-18', '2025/2024', 0, 3, 7, 147, NULL, NULL, 1),
(141, '191938011540', '2025-02-18', '2025/2024', 0, 3, 7, 148, NULL, NULL, 1),
(142, '202034029775', '2025-02-18', '2025/2024', 0, 3, 7, 149, NULL, NULL, 1),
(143, '24115032746', '2025-02-18', '2025/2024', 0, 3, 7, 150, NULL, NULL, 1),
(144, '191931039006', '2025-02-18', '2025/2024', 0, 3, 7, 151, NULL, NULL, 0),
(145, '171735104669', '2025-02-18', '2025/2024', 0, 3, 7, 152, NULL, NULL, 0),
(146, '191932063462', '2025-02-18', '2025/2024', 0, 3, 7, 153, NULL, NULL, 0),
(147, '191935036055', '2025-02-18', '2025/2024', 0, 3, 7, 154, '2025-02-25', NULL, 1),
(148, '181833024525', '2025-02-18', '2025/2024', 0, 3, 4, 155, NULL, NULL, 0),
(149, '191938057202', '2025-02-19', '2025/2024', 0, 3, 3, 156, '2025-02-19', NULL, 1),
(150, '191937080379', '2025-02-19', '2025/2024', 0, 3, 2, 157, '2025-02-19', NULL, 1),
(151, '181932071629', '2025-02-19', '2025/2024', 0, 3, 2, 158, '2025-02-19', NULL, 1),
(152, '191937072810', '2025-02-19', '2025/2024', 0, 3, 2, 164, '2025-02-19', NULL, 1),
(153, '181932016119', '2025-02-19', '2025/2024', 0, 3, 2, 165, '2025-02-19', NULL, 1),
(154, '181932035826', '2025-02-19', '2025/2024', 0, 3, 2, 166, '2025-02-19', NULL, 1),
(155, '181932015826', '2025-02-19', '2025/2024', 0, 3, 2, 167, NULL, NULL, 0),
(156, '191931034349', '2025-02-19', '2025/2024', 0, 3, 2, 168, '2025-02-19', NULL, 1),
(158, '191931069152', '2025-02-20', '2025/2024', 0, 3, 5, 171, '2025-02-24', NULL, 1),
(161, '141432009516', '2025-02-20', '2025/2024', 0, 3, 4, 10, '2025-02-20', NULL, 1),
(162, '191932040537', '2025-02-20', '2025/2024', 0, 3, 2, 162, '2025-02-20', NULL, 1),
(163, '161633033736', '2025-02-20', '2025/2024', 0, 3, 3, 160, '2025-02-20', NULL, 1),
(164, '161632033774', '2025-02-20', '2025/2024', 0, 3, 3, 161, '2025-02-20', NULL, 1),
(165, '161637091955', '2025-02-20', '2025/2024', 0, 3, 3, 159, '2025-02-20', NULL, 1),
(166, '191932007117', '2025-02-20', '2025/2024', 0, 3, 4, 163, '2025-02-20', NULL, 1),
(167, '191932051634', '2025-02-20', '2025/2024', 0, 3, 5, 173, '2025-02-20', NULL, 1),
(168, 'م ع ط-2020/009', '2025-02-20', '2020/2019', 0, 1, 1, 174, NULL, NULL, 0),
(169, 'م ع ط-2020/009', '2025-02-20', '2022/2021', 0, 3, 1, 174, NULL, NULL, 0),
(170, '161731083599', '2025-02-24', '2023/2022', 0, 3, 1, 175, NULL, NULL, 0),
(171, '191931044231', '2025-02-25', '2025/2024', 0, 3, 3, 176, '2025-02-25', NULL, 1),
(172, '191931090617', '2025-02-26', '2025/2024', 0, 3, 2, 177, '2025-02-26', NULL, 1),
(173, '202032020112', '2025-02-26', '2025/2024', 0, 3, 2, 178, '2025-02-26', NULL, 1),
(174, '202032052424', '2025-02-26', '2025/2024', 0, 3, 2, 179, '2025-02-26', NULL, 1),
(175, '202031016710', '2025-02-26', '2025/2024', 0, 3, 1, 180, '2025-02-26', NULL, 1);

-- --------------------------------------------------------

--
-- Structure de la table `student_master_filiere`
--

CREATE TABLE `student_master_filiere` (
  `id` bigint NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `name_en` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `domain_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `student_master_filiere`
--

INSERT INTO `student_master_filiere` (`id`, `name`, `name_en`, `domain_id`) VALUES
(1, 'علوم بيولوجية', 'Siences Biologiques', 7),
(3, 'فيزياء', 'Physique', 9),
(4, 'كيمياء', 'Chimie', 9),
(5, 'رياضيات', 'Mathématiques', 8),
(6, 'إعلام ألي', 'Informatique', 8),
(7, 'فنون العرض', 'Art de spectacle', 11);

-- --------------------------------------------------------

--
-- Structure de la table `student_master_grade`
--

CREATE TABLE `student_master_grade` (
  `id` bigint NOT NULL,
  `grade` decimal(5,2) NOT NULL,
  `session` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `pedagogic_year_id` bigint NOT NULL,
  `student_id` bigint NOT NULL,
  `subject_id` bigint NOT NULL,
  `academic_year` varchar(9) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `student_master_grade`
--

INSERT INTO `student_master_grade` (`id`, `grade`, `session`, `pedagogic_year_id`, `student_id`, `subject_id`, `academic_year`) VALUES
(1, 18.40, 'العادية', 3, 2, 1, '2025/2024'),
(2, 12.00, 'العادية', 3, 2, 2, '2025/2024'),
(3, 10.50, 'العادية', 3, 2, 3, '2025/2024'),
(4, 13.50, 'العادية', 3, 2, 4, '2025/2024'),
(5, 13.75, 'العادية', 3, 2, 5, '2025/2024'),
(6, 14.50, 'العادية', 3, 2, 6, '2025/2024'),
(7, 15.25, 'العادية', 3, 2, 7, '2025/2024'),
(8, 16.00, 'العادية', 3, 2, 8, '2025/2024'),
(9, 14.00, 'العادية', 3, 2, 9, '2025/2024'),
(11, 455.00, 'العادية', 2, 3, 4, '2018/2017'),
(12, 10.25, 'العادية', 3, 11, 45, '2024/2023'),
(13, 8.08, 'العادية', 3, 11, 46, '2024/2023'),
(14, 5.00, 'العادية', 3, 11, 47, '2024/2023'),
(15, 10.00, 'العادية', 3, 11, 48, '2024/2023'),
(17, 10.00, 'العادية', 3, 11, 49, '2024/2023'),
(18, 11.16, 'العادية', 3, 11, 43, '2024/2023'),
(19, 11.50, 'العادية', 3, 11, 44, '2024/2023'),
(20, 12.50, 'العادية', 3, 11, 42, '2024/2023'),
(21, 3.49, 'العادية', 3, 11, 41, '2024/2023'),
(22, 8.58, 'العادية', 3, 12, 45, '2024/2023'),
(23, 11.75, 'العادية', 3, 12, 46, '2024/2023'),
(24, 10.25, 'العادية', 3, 12, 47, '2024/2023'),
(25, 14.00, 'العادية', 3, 12, 48, '2024/2023'),
(26, 14.00, 'العادية', 3, 12, 49, '2024/2023'),
(27, 13.33, 'العادية', 3, 12, 43, '2024/2023'),
(28, 16.50, 'العادية', 3, 12, 44, '2024/2023'),
(29, 11.50, 'العادية', 3, 12, 42, '2024/2023'),
(30, 13.22, 'العادية', 3, 12, 41, '2024/2023'),
(31, 10.80, 'العادية', 3, 13, 45, '2024/2023'),
(32, 13.17, 'العادية', 3, 13, 46, '2024/2023'),
(33, 6.00, 'العادية', 3, 13, 47, '2024/2023'),
(34, 10.00, 'العادية', 3, 13, 48, '2024/2023'),
(35, 10.00, 'العادية', 3, 13, 49, '2024/2023'),
(36, 8.58, 'العادية', 3, 13, 43, '2024/2023'),
(37, 16.00, 'العادية', 3, 13, 44, '2024/2023'),
(38, 12.00, 'العادية', 3, 13, 42, '2024/2023'),
(39, 13.33, 'العادية', 3, 13, 41, '2024/2023'),
(40, 4.67, 'العادية', 3, 14, 45, '2024/2023'),
(41, 5.14, 'العادية', 3, 14, 46, '2024/2023'),
(42, 6.18, 'العادية', 3, 14, 47, '2024/2023'),
(43, 8.00, 'العادية', 3, 14, 48, '2024/2023'),
(44, 10.00, 'العادية', 3, 14, 49, '2024/2023'),
(45, 8.33, 'العادية', 3, 14, 43, '2024/2023'),
(46, 10.50, 'العادية', 3, 14, 44, '2024/2023'),
(47, 11.00, 'العادية', 3, 14, 42, '2024/2023'),
(48, 4.50, 'العادية', 3, 14, 41, '2024/2023'),
(49, 13.20, 'العادية', 3, 15, 45, '2024/2023'),
(50, 14.00, 'العادية', 3, 15, 46, '2024/2023'),
(51, 12.00, 'العادية', 3, 15, 47, '2024/2023'),
(52, 17.00, 'العادية', 3, 15, 48, '2024/2023'),
(53, 16.00, 'العادية', 3, 15, 49, '2024/2023'),
(54, 14.08, 'العادية', 3, 15, 43, '2024/2023'),
(55, 16.00, 'العادية', 3, 15, 44, '2024/2023'),
(56, 13.00, 'العادية', 3, 15, 42, '2024/2023'),
(57, 12.72, 'العادية', 3, 15, 41, '2024/2023'),
(58, 5.75, 'العادية', 3, 16, 45, '2024/2023'),
(59, 6.75, 'العادية', 3, 16, 46, '2024/2023'),
(60, 8.50, 'العادية', 3, 16, 47, '2024/2023'),
(61, 13.00, 'العادية', 3, 16, 48, '2024/2023'),
(62, 10.00, 'العادية', 3, 16, 49, '2024/2023'),
(63, 11.50, 'العادية', 3, 16, 43, '2024/2023'),
(64, 13.50, 'العادية', 3, 16, 44, '2024/2023'),
(65, 12.50, 'العادية', 3, 16, 42, '2024/2023'),
(66, 9.56, 'العادية', 3, 16, 41, '2024/2023'),
(67, 5.58, 'العادية', 3, 17, 45, '2024/2023'),
(68, 7.08, 'العادية', 3, 17, 46, '2024/2023'),
(69, 10.00, 'العادية', 3, 17, 47, '2024/2023'),
(70, 10.00, 'العادية', 3, 17, 48, '2024/2023'),
(71, 10.00, 'العادية', 3, 17, 49, '2024/2023'),
(72, 9.58, 'العادية', 3, 17, 43, '2024/2023'),
(73, 11.00, 'العادية', 3, 17, 44, '2024/2023'),
(74, 12.00, 'العادية', 3, 17, 42, '2024/2023'),
(75, 8.11, 'العادية', 3, 17, 41, '2024/2023'),
(76, 9.33, 'العادية', 3, 18, 45, '2024/2023'),
(77, 5.00, 'العادية', 3, 18, 46, '2024/2023'),
(78, 10.15, 'العادية', 3, 18, 47, '2024/2023'),
(79, 12.50, 'العادية', 3, 18, 48, '2024/2023'),
(80, 10.00, 'العادية', 3, 18, 49, '2024/2023'),
(81, 10.83, 'العادية', 3, 18, 43, '2024/2023'),
(82, 11.50, 'العادية', 3, 18, 44, '2024/2023'),
(83, 10.50, 'العادية', 3, 18, 42, '2024/2023'),
(84, 4.22, 'العادية', 3, 18, 41, '2024/2023'),
(86, 15.50, 'العادية', 3, 75, 34, '2024/2023'),
(87, 10.00, 'العادية', 3, 75, 35, '2024/2023'),
(88, 14.17, 'العادية', 3, 75, 36, '2024/2023'),
(89, 13.00, 'العادية', 3, 75, 37, '2024/2023'),
(90, 15.00, 'العادية', 3, 75, 39, '2024/2023'),
(91, 13.33, 'العادية', 3, 75, 40, '2024/2023'),
(92, 16.50, 'العادية', 3, 75, 38, '2024/2023'),
(93, 11.50, 'الثانية', 3, 9, 50, '2024/2023'),
(94, 12.83, 'الثانية', 3, 9, 51, '2024/2023'),
(95, 5.50, 'الثانية', 3, 9, 52, '2024/2023'),
(96, 8.33, 'الثانية', 3, 9, 53, '2024/2023'),
(97, 13.00, 'العادية', 3, 9, 54, '2024/2023'),
(98, 11.17, 'العادية', 3, 9, 55, '2024/2023'),
(99, 4.14, 'الثانية', 3, 9, 56, '2024/2023'),
(100, 14.50, 'العادية', 3, 69, 34, '2024/2023'),
(101, 13.00, 'العادية', 3, 69, 35, '2024/2023'),
(102, 9.00, 'العادية', 3, 69, 36, '2024/2023'),
(103, 14.00, 'العادية', 3, 69, 37, '2024/2023'),
(104, 12.00, 'العادية', 3, 69, 39, '2024/2023'),
(105, 8.00, 'العادية', 3, 69, 40, '2024/2023'),
(106, 14.00, 'العادية', 3, 69, 38, '2024/2023'),
(107, 12.50, 'العادية', 3, 24, 45, '2024/2023'),
(108, 9.00, 'العادية', 3, 24, 46, '2024/2023'),
(109, 10.25, 'العادية', 3, 24, 47, '2024/2023'),
(110, 12.00, 'العادية', 3, 24, 48, '2024/2023'),
(111, 10.00, 'العادية', 3, 24, 49, '2024/2023'),
(112, 10.00, 'العادية', 3, 24, 43, '2024/2023'),
(113, 12.00, 'العادية', 3, 24, 44, '2024/2023'),
(114, 11.75, 'العادية', 3, 24, 42, '2024/2023'),
(115, 13.11, 'العادية', 3, 24, 41, '2024/2023'),
(116, 14.50, 'العادية', 3, 87, 34, '2024/2023'),
(117, 11.00, 'العادية', 3, 87, 35, '2024/2023'),
(118, 7.00, 'العادية', 3, 87, 36, '2024/2023'),
(119, 13.50, 'العادية', 3, 87, 37, '2024/2023'),
(120, 16.00, 'العادية', 3, 87, 39, '2024/2023'),
(121, 14.66, 'العادية', 3, 87, 40, '2024/2023'),
(122, 15.50, 'العادية', 3, 87, 38, '2024/2023'),
(123, 15.00, 'العادية', 3, 92, 34, '2024/2023'),
(124, 10.00, 'العادية', 3, 92, 35, '2024/2023'),
(125, 12.83, 'العادية', 3, 92, 36, '2024/2023'),
(126, 14.00, 'العادية', 3, 92, 37, '2024/2023'),
(127, 15.00, 'العادية', 3, 92, 39, '2024/2023'),
(128, 13.33, 'العادية', 3, 92, 40, '2024/2023'),
(129, 14.50, 'العادية', 3, 92, 38, '2024/2023'),
(130, 14.50, 'العادية', 3, 88, 34, '2024/2023'),
(131, 16.00, 'العادية', 3, 88, 35, '2024/2023'),
(132, 12.67, 'العادية', 3, 88, 36, '2024/2023'),
(133, 14.00, 'العادية', 3, 88, 37, '2024/2023'),
(134, 14.00, 'العادية', 3, 88, 39, '2024/2023'),
(135, 16.00, 'العادية', 3, 88, 40, '2024/2023'),
(136, 18.50, 'العادية', 3, 88, 38, '2024/2023'),
(137, 17.50, 'العادية', 3, 107, 1, '2024/2023'),
(138, 17.00, 'العادية', 3, 107, 2, '2024/2023'),
(139, 19.00, 'العادية', 3, 107, 3, '2024/2023'),
(140, 15.25, 'العادية', 3, 107, 4, '2024/2023'),
(141, 16.00, 'العادية', 3, 107, 5, '2024/2023'),
(142, 16.75, 'العادية', 3, 107, 6, '2024/2023'),
(143, 16.50, 'العادية', 3, 107, 7, '2024/2023'),
(144, 15.50, 'العادية', 3, 107, 8, '2024/2023'),
(145, 17.00, 'العادية', 3, 107, 9, '2024/2023'),
(146, 10.00, 'العادية', 3, 112, 1, '2024/2023'),
(147, 17.00, 'العادية', 3, 112, 2, '2024/2023'),
(148, 18.00, 'العادية', 3, 112, 3, '2024/2023'),
(149, 10.00, 'العادية', 3, 112, 4, '2024/2023'),
(150, 12.00, 'العادية', 3, 112, 5, '2024/2023'),
(151, 13.50, 'العادية', 3, 112, 6, '2024/2023'),
(152, 15.75, 'العادية', 3, 112, 7, '2024/2023'),
(153, 15.75, 'العادية', 3, 112, 8, '2024/2023'),
(154, 16.00, 'العادية', 3, 112, 9, '2024/2023'),
(155, 14.25, 'العادية', 3, 112, 57, '2024/2023'),
(156, 13.50, 'العادية', 3, 107, 57, '2024/2023'),
(157, 9.50, 'العادية', 3, 174, 35, '2022/2021'),
(158, 10.17, 'العادية', 3, 174, 79, '2022/2021'),
(159, 10.00, 'العادية', 3, 174, 36, '2022/2021'),
(160, 13.00, 'العادية', 3, 174, 80, '2022/2021'),
(161, 12.50, 'العادية', 3, 174, 38, '2022/2021'),
(162, 10.33, 'العادية', 3, 174, 40, '2022/2021'),
(163, 16.75, 'العادية', 3, 174, 39, '2022/2021'),
(164, 13.00, 'العادية', 1, 174, 62, '2020/2019'),
(165, 13.00, 'العادية', 1, 174, 63, '2020/2019'),
(166, 11.00, 'العادية', 1, 174, 64, '2020/2019'),
(167, 8.00, 'العادية', 1, 174, 65, '2020/2019'),
(168, 10.00, 'العادية', 1, 174, 66, '2020/2019'),
(169, 8.12, 'العادية', 1, 174, 67, '2020/2019'),
(170, 9.00, 'العادية', 1, 174, 68, '2020/2019'),
(171, 11.00, 'العادية', 2, 174, 69, '2020/2019'),
(172, 10.00, 'العادية', 2, 174, 71, '2020/2019'),
(173, 11.75, 'العادية', 2, 174, 72, '2020/2019'),
(174, 9.00, 'العادية', 2, 174, 73, '2020/2019'),
(175, 10.00, 'العادية', 2, 174, 74, '2020/2019'),
(176, 8.50, 'العادية', 2, 174, 75, '2020/2019'),
(177, 11.00, 'العادية', 2, 174, 76, '2020/2019'),
(178, 9.25, 'العادية', 2, 174, 77, '2020/2019'),
(179, 12.00, 'العادية', 2, 174, 78, '2020/2019'),
(180, 12.00, 'العادية', 2, 174, 78, '2020/2019'),
(181, 12.00, 'العادية', 2, 174, 78, '2020/2019');

-- --------------------------------------------------------

--
-- Structure de la table `student_master_memoire`
--

CREATE TABLE `student_master_memoire` (
  `id` bigint NOT NULL,
  `coeficient` int NOT NULL,
  `credit` int NOT NULL,
  `grade` decimal(5,2) DEFAULT NULL,
  `speciality_id` bigint NOT NULL,
  `student_id` bigint NOT NULL,
  `session` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `academic_year` varchar(9) COLLATE utf8mb4_general_ci NOT NULL,
  `memoire_file` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `student_master_memoire`
--

INSERT INTO `student_master_memoire` (`id`, `coeficient`, `credit`, `grade`, `speciality_id`, `student_id`, `session`, `academic_year`, `memoire_file`) VALUES
(2, 1, 30, 18.50, 8, 2, 'العادية', '2024/2023', NULL),
(4, 1, 30, 17.00, 3, 11, 'العادية', '2024/2023', NULL),
(5, 1, 30, 18.00, 3, 12, 'العادية', '2024/2023', NULL),
(6, 1, 30, 17.50, 3, 13, 'العادية', '2024/2023', NULL),
(7, 1, 30, 18.00, 3, 14, 'العادية', '2024/2023', NULL),
(8, 1, 30, 17.50, 3, 15, 'العادية', '2024/2023', NULL),
(9, 1, 30, 18.00, 3, 16, 'العادية', '2024/2023', NULL),
(10, 15, 30, 17.00, 3, 17, 'العادية', '2024/2023', NULL),
(11, 1, 30, 17.50, 3, 18, 'العادية', '2024/2023', NULL),
(12, 1, 30, 16.50, 1, 75, 'العادية', '2024/2023', NULL),
(13, 1, 30, 16.50, 2, 9, 'الثانية', '2024/2023', NULL),
(14, 1, 30, 17.00, 1, 69, 'العادية', '2024/2023', '2024_2023/بيولوجيا_أساسية_و_تطبيقية_(علوم_بيولوجية)/رحاب_مروان_1999-07-15.pdf'),
(15, 1, 30, 17.00, 3, 24, 'العادية', '2024/2023', NULL),
(16, 1, 30, 17.50, 1, 87, 'العادية', '2024/2023', NULL),
(17, 1, 30, 17.00, 1, 92, 'العادية', '2024/2023', NULL),
(18, 1, 30, 16.00, 1, 88, 'العادية', '2024/2023', NULL),
(19, 15, 30, 18.20, 8, 107, 'العادية', '2024/2023', '2024_2023/تعليمية_العلوم_الطبيعية_(علوم_بيولوجية)/راية_بادسي_1978-09-16.pdf'),
(20, 15, 30, 18.50, 8, 112, 'العادية', '2024/2023', NULL),
(30, 1, 30, 16.50, 1, 174, 'العادية', '2022/2021', '');

-- --------------------------------------------------------

--
-- Structure de la table `student_master_pedagogicyear`
--

CREATE TABLE `student_master_pedagogicyear` (
  `id` bigint NOT NULL,
  `year_name` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `contrat` varchar(20) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `student_master_pedagogicyear`
--

INSERT INTO `student_master_pedagogicyear` (`id`, `year_name`, `contrat`) VALUES
(1, 'الأولى', 'الأول'),
(2, 'الأولى', 'الثاني'),
(3, 'الثانية', 'الثالث'),
(4, 'الثانية', 'الرابع');

-- --------------------------------------------------------

--
-- Structure de la table `student_master_speciality`
--

CREATE TABLE `student_master_speciality` (
  `id` bigint NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `name_en` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `filiere_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `student_master_speciality`
--

INSERT INTO `student_master_speciality` (`id`, `name`, `name_en`, `filiere_id`) VALUES
(1, 'بيولوجيا أساسية و تطبيقية', 'Biologie Fondamentale et Appliquée', 1),
(2, 'فيزياء نظرية', 'Physique Théorique', 3),
(3, 'كيمياء عضوية وتعليمية المفاهيم', 'Chimie Organique et Didactique des Concepts', 4),
(4, 'كيمياء فيزيائية', 'Chimie Physique', 4),
(5, 'الجبر', 'Algèbre', 5),
(6, 'نظام المعلومات والتعليم عن بعد', 'Systèmes d\'informations et e-learning', 6),
(7, 'تربية موسيقية', 'Education Musicale', 7),
(8, 'تعليمية العلوم الطبيعية', 'Didactique des Sciences Naturelles', 1),
(9, 'تعليمية المفاهيم وفيزياء الجسيمات و الحقول', 'Didactique des concepts et  physiques des particules et des champs', 3);

-- --------------------------------------------------------

--
-- Structure de la table `student_master_student`
--

CREATE TABLE `student_master_student` (
  `id` bigint NOT NULL,
  `first_name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `first_name_en` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `last_name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `last_name_en` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `birth_day` date DEFAULT NULL,
  `birth_place` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `birth_place_en` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `birth_wilaya` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `birth_wilaya_en` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ex_entreprise` varchar(150) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `student_master_student`
--

INSERT INTO `student_master_student` (`id`, `first_name`, `first_name_en`, `last_name`, `last_name_en`, `birth_day`, `birth_place`, `birth_place_en`, `birth_wilaya`, `email`, `birth_wilaya_en`, `ex_entreprise`) VALUES
(2, 'أسماء', 'Asmaa', 'فرادي', 'FERRADI', '1996-11-30', 'الرويبة', 'Rouiba', 'الجزائر', NULL, 'Alger', 'None'),
(3, 'صلاح الدين', 'Salaheddine', 'عايد', 'AID', '1992-04-22', 'البرواقية', 'Berouaghia', 'المدية', NULL, 'Médéa', NULL),
(4, 'صليحة', 'Saliha', 'فاسي', 'FACI', '1998-07-19', 'عشعاشة', 'Achaacha', 'مستغانم', NULL, 'Mostaganem', NULL),
(5, 'وفاء', 'Wafa', 'مندان', 'MANEDDENE', '1997-05-14', 'الجزائر', 'Alger', 'الجزائر', NULL, 'Alger', 'None'),
(6, 'سلمى', 'Selma', 'بوداودي', 'BOUDAOUDI', '2003-01-29', 'الدويرة', 'Douira', 'الجزائر', NULL, 'Alger', NULL),
(7, 'إيمان', 'Imene', 'مزهود', 'MEZHOUD', '2001-10-02', 'بجاية', 'Bedjaia', 'بجاية', 'imene.mezhoud@g.ens-kouba.dz', 'Bedjaia', NULL),
(8, 'سارة', 'Sara', 'غزالة', 'GHEZALA', '1999-01-18', 'الشلف', 'Chlef', 'Chlef', 'saraghezala@g.ens-kouba.dz', 'Chlef', NULL),
(9, 'شيماء', 'Chaima', 'أورنيد', 'OURNID', '2002-05-19', 'خميس مليانة', 'Khemis Miliana', 'Ain Defla', 'chaimaa.ournid@g.ens-kouba.dz', 'Ain Defla', NULL),
(10, 'عبد الرحمان', 'Abderrahmane', 'بوشردود', 'BOUCHERDOUD', '1995-03-13', 'أولاد زياد الصبحة', 'Ouled Ziad Sobha', 'الشلف', 'abderrahmane.boucherdoud59@g.ens-kouba.dz', 'Chlef', 'None'),
(11, 'أسامة', 'Oussama', 'بن معزيز', 'BEN MAAZIZ', '1996-12-31', 'مديونة', 'Mediouna', 'غليزان', NULL, 'Relizane', 'None'),
(12, 'صافية', 'Safia', 'بوكرة', 'BOUKERRA', '1997-08-30', 'سطاوالي', 'Staoueli', 'الجزائر', NULL, 'Alger', NULL),
(13, 'أمال', 'Amel', 'تساليت', 'Tassalit', '2000-01-23', 'مليانة', 'Miliana', 'عين الدفلى', NULL, 'Ain Defla', 'None'),
(14, '‫‬‫العجال‬', 'Ladjel', 'جغدم', 'DJOURDEM', '1998-09-18', 'ماسرة', 'Mesra', 'مستغانم', NULL, 'Mostaganem', NULL),
(15, '‫‬‫أحمد', 'HADJI', 'حاجي', 'Ahmed', '1995-10-12', 'الحمامات', 'Beni Messous', 'الجزائر', NULL, 'Alger', 'None'),
(16, '‫‬‫إلهام‬', 'Ilhem', 'حدوش', 'HADDOUCHE', '2000-04-14', 'البويرة', 'Bouira', 'البويرة', NULL, 'Bouira', 'None'),
(17, '‫‬‫علاء‬ ‫الدين‬', 'Alaeddine', 'حمدي', 'HAMDI', '1998-05-22', 'عين الدفلى', 'Ain Defla', 'عين الدفلى', NULL, 'Ain Defla', 'None'),
(18, '‫منيرة‬', 'Mounira', 'دباري‬‫', 'DEBBARI', '1999-01-13', 'الثنية', 'Thenia', 'بومرداس', NULL, 'Boumerdes', NULL),
(20, '‫عبد‬ ‫الرفيق‬', 'Abdelrafik', 'دحو‬', 'Dahou', '1997-01-24', 'الثنية', 'Thenia', 'بومرداس', NULL, 'Boumerdes', 'None'),
(21, '‫عبد‬ ‫القادر‬', NULL, 'دزٍيري', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(22, '‫خديجة', NULL, 'رايس', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(23, '‬أسماء‬', 'Asmaa', 'زرق‬ ‫العين', 'ZERGLAINE', '1999-03-11', 'واد الفضة', 'Oued Fodda', 'الشلف', NULL, 'Chlef', 'None'),
(24, '‫‫تقي الدين', 'Takieddine', 'سالمي', 'SELMI', '1999-01-26', 'خميس مليانة', 'Khemis Miliana', 'عين الدفلى', NULL, 'Ain Defla', 'None'),
(25, '‫هناء', NULL, 'سليماني', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(26, '‫خالد', 'Khaled', 'شامخي', 'CHAMEKHI', '1999-05-27', 'تيسمسيلت', 'Tissemsilt', 'تيسمسيلت', NULL, 'Tissemsilt', NULL),
(27, '‫دنيا', 'Donia', 'عبيد', 'ABID', '1995-10-21', 'بير العاتر', 'Bir El Ater', 'تبسة', NULL, 'Tebessa', NULL),
(28, 'فاطمة الزهراء', NULL, 'فراش', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(29, 'طاطة', 'Tata', 'قطاوي', 'GUETTAOUI', '1994-06-16', 'مازونة', 'Mazouna', 'غليزان', NULL, 'Relizane', NULL),
(31, 'صورية', NULL, 'لعلاوي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(33, 'أية', 'Aya', 'مدابيس', 'MEDABIS', '1995-08-02', 'بريكة', 'Barika', 'باتنة', NULL, 'Batna', NULL),
(34, 'أيمن', 'Aymen', 'نصلي بكير', 'NASLI BAKIR', '1999-07-28', 'س م بن علي', 'S M ben ali', 'غليزان', NULL, 'Relizane', 'None'),
(35, 'رفيقة', NULL, 'ألمو', 'GHEZALA', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(36, 'ندى', NULL, 'بوجمعة', 'GHEZALA', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(38, 'بلقاسم زكريا', 'Belkacem Zakaria', 'حنيشات', 'HANICHET', '2001-12-06', 'تيسمسيلت', 'Tissemsilt', 'تيسمسيلت', NULL, 'Tissemsilt', NULL),
(39, 'أميرة', 'Amira', 'حو', 'HAOU', '2001-03-25', 'بوحجار', 'Bouhadjer', 'الطارف', NULL, 'El Tarf', 'None'),
(40, 'حسام الدين', NULL, 'دحماني', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(41, 'إلهام', 'Ilhem', 'رزاز', 'REZZAZ', '2001-12-03', 'امدوكال', 'Emdoukel', 'باتنة', NULL, 'Batna', 'None'),
(42, 'محمد الأمين', NULL, 'شتوح', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(44, 'بشرى', NULL, 'غريبي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(45, 'روميسة', NULL, 'كحول', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(46, 'بختة', NULL, 'لعلاوي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(47, 'يسرى', 'Yousra', 'امكيدش', 'EMKEIDECHE', '2000-07-13', 'بئر خادم', 'Birkhadem', 'الجزائر', NULL, 'Alger', NULL),
(49, 'سمية', 'Soumia', 'دارزيرار', 'DARZIRAR', '2000-06-03', 'تنس', 'Ténès', 'الشلف', NULL, 'Chlef', NULL),
(50, 'ياسمين', 'Yasmine', 'غبريني', 'GHOBRINI', '2001-09-12', 'الحراش', 'El-Harrach', 'الجزائر', NULL, 'Alger', NULL),
(51, 'لينا', 'Lina', 'أيت سليمان', 'AIT SLIMANE', '2001-07-11', 'تيزي وزو', 'Tizi Ouzou', 'تيزي وزو', NULL, 'Tizi Ouzou', 'None'),
(52, 'ايمان', 'Imène', 'عماري', 'AMMARI', '2025-01-13', NULL, NULL, NULL, NULL, NULL, NULL),
(53, 'الضاوية', 'Daouia', 'فرارحة', 'FERARHA', '1998-09-25', 'الحراش', 'El-Harrach', 'الجزائر', NULL, 'Alger', NULL),
(54, 'فايزة', 'Fayza', 'جدو', 'DJEDDOU', '2000-05-13', 'بني سليمان', 'Beni Slimane', 'المدية', NULL, 'Médéa', NULL),
(55, 'سمية', 'Soumaya', 'زروالي', 'ZEROUALI', '1998-01-16', 'بوينان', 'Bouinane', 'البليدة', NULL, 'Blida', NULL),
(56, 'فرحات', 'Farhat', 'بوالزرد', 'BOUZRED', '1997-07-27', 'القرارم قوقة', 'Grarem Gouga', 'ميلة', NULL, 'Mila', NULL),
(57, 'يحي', 'Yahia', 'أومدي', 'OUMEDDI', '2001-01-30', 'حمام ملوان', 'Hammam Melouane', 'البليدة', NULL, 'Blida', NULL),
(58, 'ياسر', 'Yasser', 'شميشم', 'CHEMICHEM', '2002-01-27', 'بني مسوس', 'Beni Messous', 'الجزائر', NULL, 'Alger', NULL),
(59, 'إلهام', 'Ilham', 'ولداعمر', 'OULDAMER', '2000-09-06', 'البويرة', 'Bouira', 'البويرة', NULL, 'Bouira', NULL),
(60, 'زكرياء', 'Zakaria', 'براهيمي', 'BRAHIMI', '1996-04-13', 'سيدي موسى', 'Sidi Moussa', 'الجزائر', NULL, 'Alger', NULL),
(61, 'لويزة صابرينة', 'Louiza Sabrina', 'محال', 'MEHAL', '1999-07-10', 'وهران', 'Oran', 'وهران', NULL, 'Oran', 'None'),
(62, 'فردوس', 'Ferdaous', 'بطاطا', 'BATATA', '2000-01-06', 'بولوغين', 'Bouloughine', 'الجزائر', NULL, 'Alger', NULL),
(63, 'ريمة', 'Rima', 'خطاب', 'KHETTAB', '1999-03-12', 'بوروبة', 'Bourouba', 'الجزائر', NULL, 'Alger', NULL),
(64, 'راضية', 'Radia', 'بن عودة', 'BENAOUDA', '2000-06-14', 'بولوغين', 'Bouloughine', 'الجزائر', NULL, 'Alger', NULL),
(65, 'إسماعيل', 'Ismail', 'زلماط', 'ZELMAT', '1991-04-20', 'العطاف', 'El Attaf', 'عين الدفلى', NULL, 'Ain Defla', 'None'),
(66, 'اسماعيل', 'Ismail', 'محمودي', 'MAHMOUDI', '2000-02-02', 'مازونة', 'Mazouna', 'غليزان', NULL, 'Relizane', NULL),
(67, 'أحمد', 'Ahmed', 'بوشاقور الرحماني', 'BOUCHAKOUR ERRAHMANI', '1995-01-28', 'القبة', 'Kouba', 'الجزائر', NULL, 'Alger', NULL),
(68, 'نسرين', 'Nesrine', 'علال', 'ALLAL', '2000-08-26', 'الحراش', 'El-Harrach', 'الجزائر', NULL, 'Alger', NULL),
(69, 'رحاب', 'Rihab', 'مروان', 'MEROUANE', '1999-07-15', 'عين الدفلى', 'Ain Defla', 'عين الدفلى', NULL, 'Ain Defla', 'None'),
(70, 'نجلاء', 'Nadjla', 'بن سالم', 'BEN SALEM', '2000-06-25', 'الجلفة', 'Djelfa', 'الجلفة', 'bensalemnajla28@gmail.com', 'Djelfa', NULL),
(71, 'أحمد', 'Ahmed', 'طلحاوي', 'TALHAOUI', '1993-09-26', 'مازونة', 'Mazouna', 'غليزان', NULL, 'Relizane', 'None'),
(72, 'عبد الحليم', 'Abdelhalim', 'مشري', 'MECHERI', '1991-04-10', 'بابور', 'Babor', 'سطيف', NULL, 'Setif', NULL),
(73, 'عبدالقادر', 'Abdelkader', 'دزيري', 'DZIRI', '1997-04-05', 'بوراشد', 'Bourached', 'عين الدقلى', NULL, 'Ain Defla', NULL),
(74, 'محمد الأمين', 'Mohamed', 'عمورةوةةةةةةةة', 'AMMOURA', '2001-03-12', 'جيجل', 'djidjel', 'جيجل', NULL, 'Djidjel', 'None'),
(75, 'نهاد', 'Nihed', 'رابح مزاري', 'RABAH MAZARI', '1998-05-31', 'القليعة', 'Kolea', 'تيبازة', NULL, 'Tipaza', NULL),
(77, 'عبد الرحيم إلياس', 'Abderrahim Elias', 'طفات', 'TAFAT', '1998-02-12', 'سيدي امحمد', 'Sidi M\'hamed', 'الجزائر', NULL, 'Alger', NULL),
(78, 'زهير', 'Zohir', 'عطة', 'ATTA', '1998-05-26', 'بني سليمان', 'Beni Slimane', 'المدية', NULL, 'Médéa', NULL),
(82, 'بشرى', 'Bouchra', 'جلولي', 'DJELLOULI', '1996-01-14', 'مليانة', 'Miliana', 'عين الدفلى', NULL, 'Ain Defla', NULL),
(83, 'هدية', 'Haddia', 'راعي', 'RAI', '2001-06-12', 'الحراش', 'EL-Harrach', 'الجزائر', NULL, 'Alger', NULL),
(84, 'منال', 'Manel', 'شراير', 'CHERAIR', '1995-08-13', 'قصر البخاري', 'Ksar Elboukhari', 'المدية', NULL, 'Médéa', 'None'),
(85, 'إكرام', 'Ikram', 'بوزكري', 'BOUZEKRI', '1999-08-11', 'باب الوادي', 'Bab El Oued', 'الجزائر', NULL, 'Alger', 'None'),
(87, 'فاطمة الزهراء', 'Fatma Zohra', 'تراكة', 'TRAKA', '1999-05-20', 'خميس مليانة', 'Khemis Miliana', 'عين الدفلى', NULL, 'Ain Defla', 'None'),
(88, 'مروة', 'Marwa', 'قداوي', 'KADAOUI', '1998-06-25', 'الشلف', 'Chlef', 'الشلف', NULL, 'Chlef', NULL),
(89, 'تيزيري', 'Tiziri', 'عتيق', 'ATIK', '2001-07-29', 'الحمامات', 'El Hammamat', 'الجزائر', NULL, 'Alger', NULL),
(90, 'تقوى إحسان', 'Takoua Ihcene', 'حداد', 'HADDAD', '1998-09-24', 'سطيف', 'Setif', 'سطيف', NULL, 'Setif', NULL),
(91, 'إبتسام', 'Ibtessam', 'بوديسة', 'BOUDISSA', '1998-01-05', 'سور الغزلان', 'Sour Elghouzlane', 'البويرة', NULL, 'Bouira', NULL),
(92, 'إكرام', 'Ikram', 'شرفي', 'CHERFI', '2000-08-06', 'سيدي غيلاس', 'Sidi Ghiles', 'تيبازة', NULL, 'Tipaza', NULL),
(93, 'صبرينة', 'Sabrina', 'طلاب', 'TELLAB', '2000-03-01', 'وادي سلي', 'Oued Sly', 'الشلف', NULL, 'Chlef', NULL),
(94, 'إيمان', 'Imene', 'عماري', 'AMMARI', '2000-08-29', 'بني مسوس', 'Beni Messous', 'الجزائر', NULL, 'Alger', NULL),
(95, 'إسمهان', 'Ismahan', 'بولبان', 'BOULBENE', '2000-05-22', 'ثنية الحد', 'Theniet El Had', 'تيسمسيلت', NULL, 'Tissemsilt', NULL),
(96, 'خديجة', 'Khadidja', 'رايس', 'RAIS', '2000-08-14', 'حجوط', 'Hadjout', 'تيبازة', NULL, 'Tipaza', NULL),
(97, 'صارة', 'Sarah', 'كسيرة', 'KSIRA', '1994-06-09', 'درارية', 'Draria', 'الجزائر', NULL, 'Alger', NULL),
(98, 'زكي', 'Zaki', 'رحموني', 'RAHMOUNI', '2001-04-23', 'سور الغزلان', 'Sour Elghouzlane', 'البويرة', NULL, 'Bouira', NULL),
(99, 'هناء', 'Hana', 'سليماني', 'SLIMANI', '2000-12-11', 'البليدة', 'Blida', 'البليدة', NULL, 'Blida', NULL),
(100, 'رفيقة', 'Rafika', 'ألمو', 'ALMOU', '2000-02-19', 'الرويبة', 'Rouiba', 'الجزائر', NULL, 'Alger', NULL),
(101, 'شهرزاد', 'Chahrazed', 'بداوي', 'BADAOUI', '2000-03-21', 'سور الغزلان', 'Sour Elghouzlane', 'البويرة', NULL, 'Bouira', NULL),
(102, 'إيمان', 'Imen', 'برادع', 'BRADAA', '2001-05-15', 'العامرة', 'El Amra', 'عين الدفلى', NULL, 'Ain Defla', NULL),
(103, 'صبرينة', 'Sabrina', 'مخطاري', 'MOKHTARI', '2000-10-03', 'العطاف', 'El Attaf', 'عين الدفلى', NULL, 'Ain Defla', NULL),
(104, 'نور الهدى', 'Nour El houda', 'بن سطاعلي', 'BENSTAALI', '2000-11-07', 'مازونة', 'Mazouna', 'غليزان', NULL, 'Relizane', NULL),
(105, 'هاجر', 'Hadjer', 'عزيبر', 'AZEIBER', '1998-09-20', 'الهامل', 'El Hamel', 'مسيلة', NULL, 'Msila', NULL),
(106, 'أمينة', 'Amina', 'برور', 'BEROUR', '2001-06-07', 'الحمامات', 'El Hammamat', 'الجزائر', NULL, 'Alger', NULL),
(107, 'راية', 'Raya', 'بادسي', 'BADSI', '1978-09-16', 'برج منايل', 'Bordj Menaiel', 'بومرداس', NULL, 'Boumerdes', 'None'),
(108, 'أمال', 'Amel', 'معيوف', 'MAYOUF', '1999-04-14', 'وادي العلايق', 'Oued Eloulaig', 'البليدة', NULL, 'Blida', NULL),
(109, 'بشرى شيماء', 'Bouchra Chaima', 'نومري', 'NOUMERI', '1999-09-21', 'سيدي غيلاس', 'Sidi Ghiless', 'تيبازة', NULL, 'Tipaza', NULL),
(110, 'وفاء', 'Wafa', 'صالحي', 'SALHI', '1996-03-29', 'الشلف', 'Chlef', 'الشلف', NULL, 'Chlef', NULL),
(111, 'نور الهدى', 'Nour El Houda', 'عمارة', 'AMARA', '1998-12-17', 'قادرية', 'Kadiria', 'البويرة', NULL, 'Bouira', NULL),
(112, 'قدور', 'Kaddour', 'بلخوص', 'BELKHOUS', '1980-06-03', 'السواقي', 'Souagui', 'المدية', NULL, 'Médéa', NULL),
(113, 'دينة', 'Dina', 'هاين', 'HAINE', '2000-01-22', 'جيجل', 'Jijel', 'جيجل', NULL, 'Jijel', NULL),
(114, 'أحمد', 'Ahmed', 'بلوط', 'BELLOUT', '1999-10-19', 'فرندة', 'Frenda', 'تيارت', NULL, 'Tiaret', NULL),
(115, 'إكرام زهيرة', 'Ikram Zahira', 'بن عمارة', 'BENAMARA', '1998-09-04', 'المنصورة', 'Mansourah', 'برج بوعريريج', NULL, 'Bordj Bouareredj', NULL),
(116, 'فاطمة الزهراء', 'Fatma Zahra', 'قراش', 'GUERRACHE', '1998-07-03', 'سور الغزلان', 'Sour Elghouzlane', 'البويرة', NULL, 'Bouira', NULL),
(117, 'عتيقة', 'Atika', 'لعرج', 'LAREDJ', '1998-02-06', 'وادي ارهيو', 'Oued Rhiou', 'غليزان', NULL, 'Relizane', NULL),
(118, 'أمينة', 'Amina', 'كسي', 'KESSI', '2000-06-25', 'ذراع الميزلن', 'Draa El Mizan', 'تيزي وزو', NULL, 'Tizi Ouzou', NULL),
(119, 'محمد الأمين', 'Mohamed Lamine', 'قادري', 'KADRI', '1994-08-04', 'حاسي بحبح', 'Hassi Bahbah', 'الجلفة', NULL, 'Djelfa', NULL),
(120, 'وفاء', 'Wafa', 'بن عودة', 'BENAOUDA', '2000-04-01', 'غليزان', 'Relizane', 'غليزان', NULL, 'Relizane', 'None'),
(121, 'سمية', 'Somia', 'حساني', 'HASSANI', '1999-12-30', 'عين طاية', 'Ain Taya', 'الجزائر', NULL, 'Alger', NULL),
(122, 'لبنى', 'Loubna', 'جماع', 'DJEMAA', '2001-03-07', 'قصر الشاللة', 'Ksar Chellala', 'تيارت', NULL, 'Tiaret', 'None'),
(123, 'إيمان', 'Imane', 'حاج صدوق', 'HADJ SADOK', '1994-08-08', 'عين الدفلى', 'Ain Defla', 'عين الدفلى', NULL, 'Ain Defla', NULL),
(124, 'بلال', 'Bilal', 'طريفي', 'TRIFI', '1990-02-03', 'زيغود يوسف', 'Zighoud Youcef', 'قسنطينة', NULL, 'Constantine', NULL),
(125, 'أحلام', 'Ahlem', 'قمراوي', 'KAMRAOUI', '1996-01-04', 'سيدي بلعباس', 'Sidi Bel Abbès', NULL, NULL, NULL, 'None'),
(126, 'رانيا', 'Rania', 'ساعد', 'SAAD', '1997-07-04', 'سور الغزلان', 'Sour Elghouzlane', 'البويرة', NULL, 'Bouira', 'None'),
(127, 'رحيل', 'Rahil', 'عيناوي', 'AINAOUI', '2000-05-14', 'القليعة', 'Kolea', 'تيبازة', NULL, 'Tipaza', NULL),
(128, 'سلمى مروى', 'Selma Maroua', 'أوباجي', 'OUBADJI', '1998-07-18', 'بني مسوس', 'Beni Messous', 'الجزائر', NULL, 'Alger', NULL),
(129, 'سمية', 'Somia', 'عبدي', 'ABDI', '1991-08-11', 'الشلف', 'Chlef', 'الشلف', NULL, 'Chlef', NULL),
(130, 'سهام خديجة', 'Siham Khadidja', 'بعيليش', 'BAILICH', '1998-01-26', 'عين تموشنت', 'Ain Temouchent', 'عين تموشنت', NULL, 'Ain Temouchent', NULL),
(131, 'امحمد', 'Mhamed', 'بوفاتح', 'BOUFATAH', '1976-02-26', 'سيدي حسني', 'Sidi Hosni', 'تيارت', NULL, 'Tiaret', 'None'),
(132, 'محمد', 'Mohamed', 'جاب الله', 'JABALLAH', '1985-10-29', 'حاسي بحبح', 'Hassi Bahbah', 'الجلفة', NULL, 'Djelfa', NULL),
(133, 'نسرين', 'Nesrine', 'حنيفي', 'HANIFI', '1997-03-30', 'باب الوادي', 'Bab El Oued', 'الجزائر', NULL, 'Alger', NULL),
(134, 'أحلام', 'Ahlam', 'ساسي', 'SACI', '1999-03-18', 'احنيف', 'Ahnif', 'البويرة', NULL, 'Bouira', 'None'),
(135, 'مروى', 'Maroua', 'عبد اللاوي', 'ABDELLAOUI', '2000-01-03', 'زرالدة', 'Zeralda', 'الجزائر', NULL, 'Alger', NULL),
(136, 'حكيمة', 'Hakima', 'عطاالله', 'ATTALLAH', '1985-08-12', 'أولاد عدي لقبالة', 'Ouled Adi Lagbala', 'المسيلة', NULL, 'Msila', NULL),
(137, 'أحمد', 'Ahmed', 'عظيم', 'ADIM', '1977-01-01', 'الميهوب', 'Mihoub', 'المدية', NULL, 'Médéa', NULL),
(138, 'زهية', 'Zahia', 'قويزي', 'GOUIZI', '2000-10-07', 'حسين داي', 'Hussein Dey', 'الجزائر', NULL, 'Alger', NULL),
(139, 'سماح', 'Samah', 'صياد', 'SIAD', '2001-03-21', 'عين طاية', 'Ain Taya', 'الجزائر', NULL, 'Alger', NULL),
(140, 'خديجة', 'Khadidja', 'هرهور', 'HERHOUR', '1993-12-23', 'جندل', 'Djendel', 'عين الدفلى', NULL, 'Ain Defla', NULL),
(141, 'محمد', 'Mohammed', 'لعربي', 'LARBI', '1997-02-01', 'بني سليمان', 'Beni Slimane', 'المدية', NULL, 'Médéa', NULL),
(142, 'روميسة', 'Roumissa', 'كحلول', 'KAHLOUL', '2001-04-08', 'سيدي عيسى', 'Sidi Aissa', 'المسيلة', NULL, 'Msila', NULL),
(143, 'سلوى', 'Salwa', 'نواح', 'NOUAH', '1999-05-14', 'برج اخريص', 'Bordj Okhriss', 'البويرة', NULL, 'Bouira', NULL),
(144, 'عبد الرؤوف', 'Abderraouf', 'صيد', 'SID', '2000-10-25', 'سيدي عيسى', 'Sidi Aissa', 'المسيلة', NULL, 'Msila', NULL),
(145, 'سمية', 'Soumia', 'حاجي', 'HADJI', '2001-12-18', 'السوقر', 'Sougueur', 'تيارت', 'soumia.hadji@g.ens-kouba.dz', 'Tiaret', NULL),
(146, 'عيسى', 'Aissa', 'أوهيبة', 'Ouhiba', '2000-12-08', 'بوسعادة', 'Bousaada', 'المسيلة', 'aissaouhiba55@gmail.com', 'Msila', NULL),
(147, 'فوزي', 'Faouzi', 'مجادي', 'MEDJADI', '2002-11-17', 'يلل', 'Yellel', 'غليزان', 'medjadi.faouzi98@g.ens-kouba.dz', 'Relizane', NULL),
(148, 'عائشة', 'Aicha', 'داودي', 'DAOUDI', '2002-02-25', 'السوقر', 'Sougueur', 'تيارت', 'aicha.daoudi@g.ens-kouba.dz', 'Tiaret', NULL),
(149, 'ريان', 'Rayane', 'دراس', 'DERRAS', '2002-09-23', 'سطيف', 'Setif', 'سطيف', 'derras.rayane44@g.ens-kouba.dz', 'Setif', NULL),
(150, 'نبيل', 'Nabil', 'لعبيدي', 'LABIDI', '1992-10-29', 'باتنة', 'Batna', 'باتنة', 'labidi.nabil@g.ens-kouba.dz', 'Batna', NULL),
(151, 'عبير', 'Abir', 'قرواني', 'KEROUANI', '2001-09-29', 'سيدي عيسى', 'Sidi Aissa', 'المسيلة', NULL, 'Msila', NULL),
(152, 'رقية أم السعد', 'Reguia Oumassaad', 'خاوي', 'KHAOUI', '1999-12-10', 'برهوم', NULL, NULL, NULL, NULL, NULL),
(153, 'رميساء', 'Roumaissa', 'بن حليمة', 'BENHALIMA', '2001-07-13', 'خميس مليانة', 'Khemis Miliana', 'عين الدفلى', NULL, 'Ain Defla', NULL),
(154, 'مارية', 'Mariya', 'ساعد', 'SAAD', '2001-10-16', 'زريبة الوادي', 'Zeribet Eloued', 'بسكرة', 'mariya.saad@g.ens-kouba.dz', 'Biskra', 'None'),
(155, 'بشرى', 'Bouchra', 'بلقاسمي', 'BELKACEMI', '2000-03-31', 'سور الغزلان', 'Sour Elghouzlane', 'البويرة', 'bouchra.belkacemi@g.ens-kouba.dz', 'Bouira', NULL),
(156, 'أية', 'Aya', 'بولنوار', 'BOULANOUAR', '2001-09-15', 'الأبيض سيدي الشيخ', 'El Abiodh Sidi Chiekh', 'البيض', 'ayahsaffi@gmail.com', 'El Bayadh', 'المدرسة العليا للأساتذة بشار'),
(157, 'سيد أحمد', 'Sid Ahmed', 'بودار', 'BOUDAR', '1997-06-13', 'جديوية', 'Djdiouia', 'غليزان', 'sidahmed.boudar@g.ens-kouba.dz', 'Relizane', NULL),
(158, 'محمد أمين', 'Mohammed Amin', 'بوجلة', 'BOUDJELLA', '2000-12-28', 'العطاف', 'El Attaf', 'عين الدفلى', 'mohammedamin.boudjella@g.ens-kouba.dz', 'Ain Defla', NULL),
(159, 'لحسن', 'Lahcene', 'لقرع', 'LAGRAA', '1995-01-22', 'جديوية', 'Djdiouia', 'غليزان', NULL, 'Relizane', NULL),
(160, 'توفيق', 'Toufik', 'عليلوش', 'ALILOUCHE', '1996-07-23', 'برج اخريص', 'Bordj Okhriss', 'البويرة', NULL, 'Bouira', NULL),
(161, 'محمد أمين', 'Mohamed Amine', 'العسكر', 'ELASKER', '1995-08-03', 'البليدة', 'Blida', 'البليدة', NULL, 'Blida', NULL),
(162, 'رفيق', 'Rafik', 'غياطو', 'GHIATOU', '2001-12-02', 'سور الغزلان', 'Sour Elghouzlane', 'البويرة', NULL, 'Bouira', NULL),
(163, 'سيد أحمد', 'Sidahmed', 'مداني', 'MADANI', '2001-05-02', 'مازونة', 'Mazouna', 'غليزان', NULL, 'Relizane', NULL),
(164, 'نور الاسلام زكرياء', 'Nour El Islam Zakaria', 'حمو', 'HAMMOU', '2002-01-07', 'يلل', 'Yellel', 'غليزان', 'zakaria.hammou@g.ens-kouba.dz', 'Relizane', NULL),
(165, 'الياسين', 'Elyacine', 'بن خادم', 'BEN KHADEM', '2000-11-16', 'الشلف', 'Chlef', 'الشلف', 'elyacine.benkhadem@g.ens-kouba.dz', 'Chlef', NULL),
(166, 'بوعلام', 'Boualem', 'قبي', 'KOBBI', '2000-06-07', 'بوقرة', 'Bougara', 'البليدة', 'boualem.kobbi@g.ens-kouba.dz', 'Blida', NULL),
(167, 'يوسف', 'Youssouf', 'رحماني قوادري', 'RAHMANI KOUADRI', '2001-01-27', 'الشلف', 'Chlef', 'الشلف', 'youssouf.rahmanikouadri@g.ens-kouba.dz', 'Chlef', NULL),
(168, 'إكرام', 'Ikram', 'صاري', 'SARRI', '2001-04-27', 'الأبيار', 'El Biar', 'الجزائر', 'sarriikram@gmail.com', 'Alger', NULL),
(171, 'ميساء', 'Maissa', 'ماضي', 'MADI', '0002-02-08', 'حسين داي', 'Hussein Dey', 'الجزائر', 'maissa.madi@g.ens-kouba.dz', 'Alger', 'None'),
(173, 'وفاء', 'Wafaa', 'بن حمودة', 'BENHAMOUDA', '2002-07-14', 'حجوط', 'Hadjout', 'تيبازة', 'wafaa.benhamouda@g.ens-kouba.dz', 'Tipaza', NULL),
(174, 'فريال', 'Feriel', 'قعلول', 'GUAALOUL', '1998-12-17', 'الأخضرية', 'Lakhdharia', 'البويرة', NULL, 'Bouira', NULL),
(175, 'أميرة', 'Amira', 'حسين', 'HOCINE', '1998-12-22', 'باب الوادي', 'Bab El Oued', 'الجزائر', NULL, 'Alger', NULL),
(176, 'إكرام', 'Ikram', 'شويكي', 'CHOUIKI', '2001-11-17', 'مفتاح', 'Mefteh', 'البليدة', 'ikram.chouiki@g.ens-kouba.dz', 'Blida', NULL),
(177, 'مريم', 'Meriem', 'بن قسمية', 'BENGUESMIA', '2001-12-08', 'الأبيار', 'El Biar', 'الجزائر', 'meriem.benguesmia@g.ens-kouba.dz', 'Alger', NULL),
(178, 'فضيلة نو رهان', 'Fadila Nour Hane', 'مكاشمي', 'MEKKACHEMI', '2002-10-14', 'بوفاريك', 'Boufarik', 'البليدة', 'mekkachemi.nourhane44@g.ens-kouba.dz', 'Blida', NULL),
(179, 'ليليا وصال', 'Lilia Ouissal', 'قلوع', 'KELLOUA', '2003-02-02', 'القليعة', 'Kolea', 'تيبازة', 'liliaouissal02@gmail.com', 'Tipaza', NULL),
(180, 'نوال', 'Nawal', 'خالدي', 'KHALDI', '2002-11-11', 'تيزي وزو', 'Tizi Ouzou', 'تيزي وزو', 'khaldi.nawel11@g.ens-kouba.dz', 'Tizi Ouzou', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `student_master_studentcontrat`
--

CREATE TABLE `student_master_studentcontrat` (
  `id` bigint NOT NULL,
  `first_name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `first_name_en` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `last_name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `last_name_en` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `birth_day` date DEFAULT NULL,
  `birth_place` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `birth_place_en` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `birth_wilaya` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `birth_wilaya_en` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `address` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `live_wilaya` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `academic_year` varchar(9) COLLATE utf8mb4_general_ci NOT NULL,
  `branch` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `category` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `sexe` varchar(50) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `student_master_studentcontrat`
--

INSERT INTO `student_master_studentcontrat` (`id`, `first_name`, `first_name_en`, `last_name`, `last_name_en`, `birth_day`, `birth_place`, `birth_place_en`, `birth_wilaya`, `birth_wilaya_en`, `address`, `live_wilaya`, `email`, `academic_year`, `branch`, `category`, `sexe`) VALUES
(2, 'عبد الرحيم إلياس', 'Ismahan', 'بوشاقور الرحماني', 'BOUDISSA', '2001-02-12', 'الحمامات', NULL, 'الجزائر', NULL, 'حي قرامي محمد, سي مصطفى', 'بومرداس', 'kaderbouhhh@gmail.com', '2025/2024', 'علوم طبيعية', 'أستاذ التعليم الثانوي', 'ذكر'),
(3, 'إكرام', 'Abderafik', 'بولبان', 'AMMARI', '1999-03-12', 'الثنية', NULL, 'بومرداس', NULL, 'حي قرامي محمد, سي مصطفى', 'بومرداس', 'kaderbouhhh@gmail.com', '2025/2024', 'علوم طبيعية', 'أستاذ التعليم المتوسط', 'أنثى'),
(5, 'ملاك صبرين', NULL, 'الخالدي', NULL, '2004-06-29', 'سيدي غيلاس', NULL, 'تيبازة', NULL, 'حي قرامي, شرشال', 'تيبازة', 'kaderbouhhh@gmail.com', '2025/2024', 'رياضيات', 'أستاذ التعليم المتوسط', ''),
(10, 'علي', 'Ali', 'بن صالح', 'Ben Salah', '2000-05-14', 'الجزائر', 'Algiers', 'الجزائر', 'Algiers', 'Address', 'Wilaya', 'email@example.com', '2025/2024', 'رياضيات', 'أستاذ التعليم المتوسط', ''),
(12, 'علي', 'Ali', 'بن صالح', 'Ben Salah', '2000-05-14', 'الجزائر', 'Algiers', 'الجزائر', 'Algiers', 'Address', 'Wilaya', 'email@example.com', '2025/2024', 'رياضيات', 'أستاذ التعليم المتوسط', ''),
(14, 'سيد أحمد', 'Sidahmed', 'بوشردود', 'BOUCHERDOUD', '1999-03-12', 'سيدي عيسى', NULL, 'البويرة', NULL, 'حي 750 مسكن عمارةأ12 رقم 23 عين النعجة القديمة', 'المسيلة', 'kaderbouhhh@gmail.com', '2025/2024', 'إعلام ألي', 'أستاذ التعليم الثانوي', 'ذكر'),
(15, 'علي', 'Ali', 'بن صالح', 'Ben Salah', '2000-05-14', 'الجزائر', 'Algiers', 'الجزائر', 'Algiers', 'Address', 'Wilaya', 'email@example.com', '2025/2024', 'رياضيات', 'أستاذ التعليم المتوسط', 'ذكر'),
(16, 'محمد أمين', 'Ahmed', 'عرباوي', 'Mohamed', '1998-03-21', 'وهران', 'Oran', 'وهران', 'Oran', 'Address', 'Wilaya', 'email@example.com', '2025/2024', 'فيزياء', 'أستاذ التعليم الثانوي', 'ذكر'),
(17, 'محمد', NULL, 'بن محمد', NULL, '2001-10-22', 'القبة', NULL, 'الجزائر', NULL, 'شارع الأخوة عبد السلامي بلدية القبة', 'الجزائر', 'abdelhak.adnane@g.ens-kouba.dz', '2025/2024', 'إعلام ألي', 'أستاذ التعليم المتوسط', 'ذكر');

-- --------------------------------------------------------

--
-- Structure de la table `student_master_subject`
--

CREATE TABLE `student_master_subject` (
  `id` bigint NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `credit` int NOT NULL,
  `coeficient` int NOT NULL,
  `unity_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `student_master_subject`
--

INSERT INTO `student_master_subject` (`id`, `name`, `credit`, `coeficient`, `unity_id`) VALUES
(1, 'تكنولوجيا الاعلام والاتصال', 9, 4, 1),
(2, 'تحليل إشكالية البحث', 3, 2, 1),
(3, 'تاريخ علوم الأحياء', 3, 2, 1),
(4, 'تاريخ علوم الأرض', 3, 2, 1),
(5, 'تحليل مرجعي علم الأحياء', 4, 2, 2),
(6, 'تحليل مرجعي علم الأرض', 4, 2, 2),
(7, 'أخطار طبيعية', 1, 1, 3),
(8, 'أخطار اصطناعية', 1, 1, 3),
(9, 'ثروات طبيعية', 1, 1, 4),
(11, 'تحليل المناهج والبرامج في التربية الموسيقية', 1, 1, 9),
(12, 'إدراك وتكوين التذوق الموسيقي', 1, 1, 8),
(13, 'استراتيجية التقويم في التربية الموسيقية', 6, 3, 7),
(14, 'تحليل سمعي وتدوين موسيقي', 14, 6, 6),
(15, 'منهجية البحث في التربية الموسيقية', 8, 4, 6),
(16, 'نظرية الأعداد الجبرية', 8, 2, 10),
(19, 'نظرية الأعداد التحليلية', 8, 2, 10),
(20, 'تحليل حقيقي وعقدي3', 8, 2, 10),
(21, 'لغات البرمجة العلمية3', 3, 1, 11),
(22, 'تعليمية الرياضيات3', 3, 1, 11),
(23, 'إعلام آلي', 1, 1, 15),
(24, 'علم الإنزيمات الكيميائي', 1, 1, 14),
(25, 'بيوتكنولوجيا', 1, 1, 14),
(26, 'منهجيات البحث والتعليم', 1, 1, 14),
(27, 'تدريس عملي 3', 2, 2, 13),
(28, 'ترموديناميك كيميائي 3', 5, 4, 12),
(29, 'حركة كيميائية وتحفيز 2', 5, 4, 12),
(30, 'كيمياء-فيزياء البيئة 2', 4, 3, 12),
(31, 'البنية الذرية والجزيئية 2', 2, 2, 12),
(32, 'كيمياء تحليلية 2', 4, 3, 12),
(33, 'كهروكيمياء 2', 4, 3, 12),
(34, 'بيوتكنولوجيا', 6, 3, 17),
(35, 'أدوات البيولوجيا الجزيئية الأساسية', 6, 3, 17),
(36, 'تحليل البيانات متعدد الأبعاد', 6, 3, 18),
(37, 'بيولوجيا الحفظ', 4, 2, 18),
(38, 'تكنولوجيا المعلومات والاتصالات', 4, 2, 22),
(39, 'لغة إنجليزية', 2, 1, 21),
(40, 'بحث وثائقي', 2, 1, 21),
(41, 'انجليزية تقنية2', 1, 1, 30),
(42, 'تاريخ الكيمياء2', 2, 2, 29),
(43, 'علم البلورات', 6, 3, 25),
(44, 'طرق البحث', 4, 2, 27),
(45, 'كيمياء عضوية1', 4, 2, 23),
(46, 'كيمياء عضوية2', 4, 2, 23),
(47, 'طرق التحليل و الفصل', 4, 2, 23),
(48, 'تعليمية الكيمياء وإنشاء الموارد التعليمية', 4, 2, 24),
(49, 'ابستيمولوجيا المفاهيم', 1, 1, 24),
(50, 'ميكانيكا الكم 3', 6, 3, 31),
(51, 'فيزياء الجسيمات 2', 6, 3, 31),
(52, 'ميكانيكا الكم النسبوية', 4, 2, 31),
(53, 'الفيزياء الإحصائية', 4, 2, 31),
(54, 'النسبية والكهرومغناطيسية 3', 6, 3, 33),
(55, 'فيزياء البلازما', 2, 2, 34),
(56, 'التجريب في الفيزياء والإعلام الألي 2', 2, 2, 35),
(57, 'لغة إنجليزية 3', 1, 1, 4),
(62, 'مراقبة التعبير الجيني عند حقيقة النواة', 6, 3, 36),
(63, 'فيزيولوجيا الخلوية', 6, 3, 38),
(64, 'إيكولوجيا والطاقات المتجددة', 4, 2, 39),
(65, 'التزامن البيولوجي', 2, 1, 39),
(66, 'مناهج البحث', 4, 2, 39),
(67, 'الإحصاء الوصفي والإحتمالات', 6, 3, 40),
(68, 'لغة إنجليزية', 2, 1, 41),
(69, 'علم السموم', 2, 1, 42),
(71, 'الكيمياء الحيوية والوظيفية', 6, 3, 43),
(72, 'التركيبة الحيوية النسيجية', 4, 2, 44),
(73, 'بيوتكنولوجيا الحيوان', 4, 2, 45),
(74, 'بيوتكنولوجيا النباتية', 4, 2, 45),
(75, 'الإحصاء الإستدلالي', 5, 3, 46),
(76, 'البيومعلوماتية والبيانات البيولوجية', 2, 1, 46),
(77, 'المكافحة البيولوجية و المواد الطبيعية', 2, 1, 47),
(78, 'التوثيق العلمي', 1, 1, 48),
(79, 'إضطراب الغدد الصماء', 6, 3, 17),
(80, 'الهندسة الوراثية', 4, 2, 18);

-- --------------------------------------------------------

--
-- Structure de la table `student_master_unity`
--

CREATE TABLE `student_master_unity` (
  `id` bigint NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `code` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `speciality_id` bigint NOT NULL,
  `pedagogic_year_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `student_master_unity`
--

INSERT INTO `student_master_unity` (`id`, `name`, `code`, `speciality_id`, `pedagogic_year_id`) VALUES
(1, 'الأساسية', 'U.E.F D00F0001M_S3', 8, 3),
(2, 'المنهاجية', 'U.E.M D00M0001M_S3', 8, 3),
(3, 'الاستكشافية', 'U.E.D D00D0001M_S3', 8, 3),
(4, 'العرضية', 'U.E.T D00T0001M_S3', 8, 3),
(6, 'الأساسية', 'U.E.F K00F0001M_S3', 7, 3),
(7, 'المنهاجية', 'U.E.M K00M0001M_S3', 7, 3),
(8, 'الاستكشافية', 'U.E.D K00D0001M_S3', 7, 3),
(9, 'العرضية', 'U.E.T K00T0001M_S3', 7, 3),
(10, 'العرضية1', 'Unité U.E.T C00T0001', 5, 3),
(11, 'العرضية2', 'Unité U.E.T C00T0002', 5, 3),
(12, 'الأساسية', 'U.E.F B00F0001M_S3', 4, 3),
(13, 'المنهاجية', 'U.E.M B00M0001M_S3', 4, 3),
(14, 'الاستكشافية', 'U.E.D B00D0001M_S3', 4, 3),
(15, 'العرضية', 'U.E.T B00T0001M_S3', 4, 3),
(17, 'الأساسية', 'U.E.F D00F0001M_S3', 1, 3),
(18, 'المنهاجية', 'U.E.M D00M0001M_S3', 1, 3),
(21, 'العرضية', 'U.E.T D00T0001M_S3', 1, 3),
(22, 'الاستكشافية', 'U.E.D D00D0001M_S3', 1, 3),
(23, 'الأساسية1', 'U.E.F B00F0001M_S3', 3, 3),
(24, 'الأساسية2', 'U.E.F B00F0002M_S3', 3, 3),
(25, 'المنهاجية1', 'U.E.M B00M0001M_S3', 3, 3),
(27, 'المنهاجية2', 'U.E.M B00M0002M_S3', 3, 3),
(29, 'الاستكشافية', 'U.E.D B00D0001M_S3', 3, 3),
(30, 'العرضية', 'U.E.T B00T0001M_S3', 3, 3),
(31, 'الأساسية', 'UEF3', 2, 3),
(33, 'المنهاجية', 'UEM3', 2, 3),
(34, 'الإستكشافية', 'UED3', 2, 3),
(35, 'العرضية', 'UET3', 2, 3),
(36, 'الأساسية', 'UEF1-1', 1, 1),
(38, 'الأساسية', 'UEF1-2', 1, 1),
(39, 'المنهاجية', 'UEM1-1', 1, 1),
(40, 'المنهاجية', 'UEM1-2', 1, 1),
(41, 'العرضية', 'UET1', 1, 1),
(42, 'الأساسية', 'UEF2-1', 1, 2),
(43, 'الأساسية', 'UEF2-2', 1, 2),
(44, 'الأساسية', 'UEF2-3', 1, 2),
(45, 'المنهاجية', 'UEM2-1', 1, 2),
(46, 'المنهاجية', 'UEM2-2', 1, 2),
(47, 'الإستكشافية', 'UED2', 1, 2),
(48, 'العرضية', 'UET2', 1, 2);

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
-- Index pour la table `student_master_academicyear`
--
ALTER TABLE `student_master_academicyear`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `student_master_decrit`
--
ALTER TABLE `student_master_decrit`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `student_master_deliberation`
--
ALTER TABLE `student_master_deliberation`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_student_pedagogic_year_deliberation` (`student_id`,`pedagogic_year_id`),
  ADD KEY `student_master_delib_speciality_id_bf77d55e_fk_student_m` (`speciality_id`),
  ADD KEY `student_master_deliberation_student_id_0b8fc5d9` (`student_id`),
  ADD KEY `student_master_delib_pedagogic_year_id_afbe94d0_fk_student_m` (`pedagogic_year_id`);

--
-- Index pour la table `student_master_domain`
--
ALTER TABLE `student_master_domain`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD UNIQUE KEY `name_en` (`name_en`);

--
-- Index pour la table `student_master_enrollment`
--
ALTER TABLE `student_master_enrollment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_master_enrol_pedagogic_year_id_f448973a_fk_student_m` (`pedagogic_year_id`),
  ADD KEY `student_master_enrol_speciality_id_4c7c3e41_fk_student_m` (`speciality_id`),
  ADD KEY `student_master_enrollment_student_id_725a1b90` (`student_id`);

--
-- Index pour la table `student_master_filiere`
--
ALTER TABLE `student_master_filiere`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD UNIQUE KEY `name_en` (`name_en`),
  ADD KEY `student_master_filie_domain_id_c1d1ee61_fk_student_m` (`domain_id`);

--
-- Index pour la table `student_master_grade`
--
ALTER TABLE `student_master_grade`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_master_grade_pedagogic_year_id_86322c66_fk_student_m` (`pedagogic_year_id`),
  ADD KEY `student_master_grade_student_id_e95b5ec1_fk_student_m` (`student_id`),
  ADD KEY `student_master_grade_subject_id_b655f464_fk_student_m` (`subject_id`);

--
-- Index pour la table `student_master_memoire`
--
ALTER TABLE `student_master_memoire`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_master_memoi_speciality_id_bbe5c791_fk_student_m` (`speciality_id`),
  ADD KEY `student_master_memoi_student_id_b8bddb41_fk_student_m` (`student_id`);

--
-- Index pour la table `student_master_pedagogicyear`
--
ALTER TABLE `student_master_pedagogicyear`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `student_master_speciality`
--
ALTER TABLE `student_master_speciality`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD UNIQUE KEY `name_en` (`name_en`),
  ADD KEY `student_master_speci_filiere_id_93770798_fk_student_m` (`filiere_id`);

--
-- Index pour la table `student_master_student`
--
ALTER TABLE `student_master_student`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `student_master_studentcontrat`
--
ALTER TABLE `student_master_studentcontrat`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `student_master_subject`
--
ALTER TABLE `student_master_subject`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_master_subje_unity_id_8e5afd5e_fk_student_m` (`unity_id`);

--
-- Index pour la table `student_master_unity`
--
ALTER TABLE `student_master_unity`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_master_unity_speciality_id_541ccbaf_fk_student_m` (`speciality_id`),
  ADD KEY `student_master_unity_pedagogic_year_id_56a8cc43_fk_student_m` (`pedagogic_year_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT pour la table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT pour la table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT pour la table `student_master_academicyear`
--
ALTER TABLE `student_master_academicyear`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `student_master_decrit`
--
ALTER TABLE `student_master_decrit`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `student_master_deliberation`
--
ALTER TABLE `student_master_deliberation`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=161;

--
-- AUTO_INCREMENT pour la table `student_master_domain`
--
ALTER TABLE `student_master_domain`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT pour la table `student_master_enrollment`
--
ALTER TABLE `student_master_enrollment`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=176;

--
-- AUTO_INCREMENT pour la table `student_master_filiere`
--
ALTER TABLE `student_master_filiere`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `student_master_grade`
--
ALTER TABLE `student_master_grade`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=182;

--
-- AUTO_INCREMENT pour la table `student_master_memoire`
--
ALTER TABLE `student_master_memoire`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT pour la table `student_master_pedagogicyear`
--
ALTER TABLE `student_master_pedagogicyear`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `student_master_speciality`
--
ALTER TABLE `student_master_speciality`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pour la table `student_master_student`
--
ALTER TABLE `student_master_student`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=181;

--
-- AUTO_INCREMENT pour la table `student_master_studentcontrat`
--
ALTER TABLE `student_master_studentcontrat`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT pour la table `student_master_subject`
--
ALTER TABLE `student_master_subject`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT pour la table `student_master_unity`
--
ALTER TABLE `student_master_unity`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

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

--
-- Contraintes pour la table `student_master_deliberation`
--
ALTER TABLE `student_master_deliberation`
  ADD CONSTRAINT `student_master_delib_pedagogic_year_id_afbe94d0_fk_student_m` FOREIGN KEY (`pedagogic_year_id`) REFERENCES `student_master_pedagogicyear` (`id`),
  ADD CONSTRAINT `student_master_delib_speciality_id_bf77d55e_fk_student_m` FOREIGN KEY (`speciality_id`) REFERENCES `student_master_speciality` (`id`),
  ADD CONSTRAINT `student_master_delib_student_id_0b8fc5d9_fk_student_m` FOREIGN KEY (`student_id`) REFERENCES `student_master_student` (`id`);

--
-- Contraintes pour la table `student_master_enrollment`
--
ALTER TABLE `student_master_enrollment`
  ADD CONSTRAINT `student_master_enrol_pedagogic_year_id_f448973a_fk_student_m` FOREIGN KEY (`pedagogic_year_id`) REFERENCES `student_master_pedagogicyear` (`id`),
  ADD CONSTRAINT `student_master_enrol_speciality_id_4c7c3e41_fk_student_m` FOREIGN KEY (`speciality_id`) REFERENCES `student_master_speciality` (`id`),
  ADD CONSTRAINT `student_master_enrol_student_id_725a1b90_fk_student_m` FOREIGN KEY (`student_id`) REFERENCES `student_master_student` (`id`);

--
-- Contraintes pour la table `student_master_filiere`
--
ALTER TABLE `student_master_filiere`
  ADD CONSTRAINT `student_master_filie_domain_id_c1d1ee61_fk_student_m` FOREIGN KEY (`domain_id`) REFERENCES `student_master_domain` (`id`);

--
-- Contraintes pour la table `student_master_grade`
--
ALTER TABLE `student_master_grade`
  ADD CONSTRAINT `student_master_grade_pedagogic_year_id_86322c66_fk_student_m` FOREIGN KEY (`pedagogic_year_id`) REFERENCES `student_master_pedagogicyear` (`id`),
  ADD CONSTRAINT `student_master_grade_student_id_e95b5ec1_fk_student_m` FOREIGN KEY (`student_id`) REFERENCES `student_master_student` (`id`),
  ADD CONSTRAINT `student_master_grade_subject_id_b655f464_fk_student_m` FOREIGN KEY (`subject_id`) REFERENCES `student_master_subject` (`id`);

--
-- Contraintes pour la table `student_master_memoire`
--
ALTER TABLE `student_master_memoire`
  ADD CONSTRAINT `student_master_memoi_speciality_id_bbe5c791_fk_student_m` FOREIGN KEY (`speciality_id`) REFERENCES `student_master_speciality` (`id`),
  ADD CONSTRAINT `student_master_memoi_student_id_b8bddb41_fk_student_m` FOREIGN KEY (`student_id`) REFERENCES `student_master_student` (`id`);

--
-- Contraintes pour la table `student_master_speciality`
--
ALTER TABLE `student_master_speciality`
  ADD CONSTRAINT `student_master_speci_filiere_id_93770798_fk_student_m` FOREIGN KEY (`filiere_id`) REFERENCES `student_master_filiere` (`id`);

--
-- Contraintes pour la table `student_master_subject`
--
ALTER TABLE `student_master_subject`
  ADD CONSTRAINT `student_master_subje_unity_id_8e5afd5e_fk_student_m` FOREIGN KEY (`unity_id`) REFERENCES `student_master_unity` (`id`);

--
-- Contraintes pour la table `student_master_unity`
--
ALTER TABLE `student_master_unity`
  ADD CONSTRAINT `student_master_unity_pedagogic_year_id_56a8cc43_fk_student_m` FOREIGN KEY (`pedagogic_year_id`) REFERENCES `student_master_pedagogicyear` (`id`),
  ADD CONSTRAINT `student_master_unity_speciality_id_541ccbaf_fk_student_m` FOREIGN KEY (`speciality_id`) REFERENCES `student_master_speciality` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
