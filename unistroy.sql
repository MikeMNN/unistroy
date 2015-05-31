-- phpMyAdmin SQL Dump
-- version 4.0.10.6
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1:3306
-- Время создания: Май 31 2015 г., 19:14
-- Версия сервера: 5.5.41-log
-- Версия PHP: 5.4.35

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `unistroy`
--

-- --------------------------------------------------------

--
-- Структура таблицы `comments`
--

CREATE TABLE IF NOT EXISTS `comments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `seen` tinyint(1) NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL,
  `post_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `comments_user_id_foreign` (`user_id`),
  KEY `comments_post_id_foreign` (`post_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Дамп данных таблицы `comments`
--

INSERT INTO `comments` (`id`, `created_at`, `updated_at`, `content`, `seen`, `user_id`, `post_id`) VALUES
(1, '2015-05-18 20:33:14', '2015-05-18 20:33:14', '<p>\nLorem ipsum suscipit quam egestas ornare malesuada auctor sapien arcu inceptos, aenean consequat metus litora mattis vivamus feugiat arcu adipiscing mauris, primis ante ullamcorper ad nisi lobortis arcu per orci. \nMalesuada blandit metus tortor urna turpis consectetur porttitor egestas sed eleifend, eget tincidunt pharetra varius tincidunt morbi malesuada elementum mi torquent mollis, eu lobortis curae purus amet vivamus amet nulla torquent. \nNibh eu diam aliquam pretium donec aliquam tempus lacus tempus feugiat lectus cras non velit, mollis sit et integer egestas habitant auctor integer sem at nam massa. \n</p>\n<p>\nHimenaeos netus vel dapibus nibh malesuada leo fusce tortor sociosqu, semper facilisis semper class tempus faucibus tristique duis eros, cubilia quisque habitasse aliquam fringilla orci non vel. \nLaoreet dolor enim justo facilisis neque accumsan in ad, venenatis hac per dictumst nulla ligula donec mollis, massa porttitor ullamcorper risus eu platea fringilla. \nHabitasse suscipit pellentesque donec est habitant vehicula tempor ultrices, placerat sociosqu ultrices consectetur ullamcorper tincidunt quisque tellus, ante nostra euismod nec suspendisse sem curabitur. \nElit malesuada lacus viverra sagittis sit ornare orci, augue nullam adipiscing pulvinar libero aliquam, vestibulum platea cursus pellentesque leo dui. \n</p>\n<p>\nLectus curabitur euismod ad erat curae non, elit ultrices placerat netus metus, feugiat non conubia fusce porttitor. \n</p>', 0, 2, 1),
(2, '2015-05-18 20:33:14', '2015-05-18 20:33:14', '<p>\nLorem ipsum aliquet diam commodo metus in himenaeos vitae aptent, consequat luctus purus eleifend enim sollicitudin eleifend porta malesuada, ac class conubia condimentum mauris facilisis conubia quis. \nScelerisque lacinia tempus nullam felis fusce ac potenti, netus ornare semper molestie iaculis fermentum, ornare curabitur tincidunt imperdiet scelerisque imperdiet. \nEuismod scelerisque torquent curae rhoncus sollicitudin tortor placerat aptent hac, nec posuere suscipit sed tortor neque urna hendrerit vehicula, duis litora tristique congue nec auctor felis libero. \nOrnare habitasse nec elit felis inceptos tellus, inceptos cubilia quis mattis faucibus sem, non odio fringilla class aliquam. \n</p>\n<p>\nMetus ipsum lorem luctus pharetra dictum vehicula tempus in, venenatis gravida ut gravida proin orci quis, sed platea mi quisque hendrerit semper hendrerit. \nFacilisis ante sapien faucibus ligula commodo vestibulum rutrum pretium varius, sem aliquet himenaeos dolor cursus nunc habitasse aliquam ut, curabitur ipsum luctus ut rutrum odio condimentum donec. \nSuscipit molestie est etiam sit rutrum dui nostra sem, aliquet conubia nullam sollicitudin rhoncus venenatis vivamus rhoncus netus, risus tortor non mauris turpis eget integer. \nNibh dolor commodo venenatis ut molestie semper, adipiscing amet cras class donec sapien malesuada, auctor sapien arcu inceptos aenean. \n</p>\n<p>\nConsequat metus litora mattis vivamus feugiat, arcu adipiscing mauris primis, ante ullamcorper ad nisi. \n</p>', 0, 2, 2),
(3, '2015-05-18 20:33:14', '2015-05-18 20:33:14', '<p>\nLorem ipsum vehicula arcu per orci malesuada blandit metus tortor, urna turpis consectetur porttitor egestas sed eleifend eget tincidunt, pharetra varius tincidunt morbi malesuada elementum mi torquent, mollis eu lobortis curae purus amet vivamus amet. \nNulla torquent nibh eu diam aliquam pretium donec aliquam, tempus lacus tempus feugiat lectus cras non velit, mollis sit et integer egestas habitant auctor. \nInteger sem at nam massa himenaeos netus vel, dapibus nibh malesuada leo fusce tortor sociosqu, semper facilisis semper class tempus faucibus. \nTristique duis eros cubilia quisque habitasse aliquam fringilla orci non vel laoreet dolor enim justo facilisis, neque accumsan in ad venenatis hac per dictumst nulla ligula donec mollis massa porttitor. \n</p>\n<p>\nUllamcorper risus eu platea fringilla habitasse suscipit pellentesque donec est habitant, vehicula tempor ultrices placerat sociosqu ultrices consectetur ullamcorper tincidunt quisque, tellus ante nostra euismod nec suspendisse sem curabitur elit. \nMalesuada lacus viverra sagittis sit ornare orci augue nullam adipiscing, pulvinar libero aliquam vestibulum platea cursus pellentesque leo dui lectus, curabitur euismod ad erat curae non elit ultrices. \nPlacerat netus metus feugiat non conubia fusce, porttitor sociosqu diam commodo metus, in himenaeos vitae aptent consequat. \nLuctus purus eleifend enim sollicitudin eleifend, porta malesuada ac class conubia, condimentum mauris facilisis conubia. \n</p>', 0, 3, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `contacts`
--

CREATE TABLE IF NOT EXISTS `contacts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `text` text COLLATE utf8_unicode_ci NOT NULL,
  `seen` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Дамп данных таблицы `contacts`
--

INSERT INTO `contacts` (`id`, `name`, `email`, `text`, `seen`, `created_at`, `updated_at`) VALUES
(4, 'Александр', 'mike_mnn@mail.ru', 'Здравствуйте, подскажите, а могу ли я купить у вас просто материалы, не заказывая услугу?', 0, '2015-05-28 22:23:52', '2015-05-28 22:23:52');

-- --------------------------------------------------------

--
-- Структура таблицы `materials`
--

CREATE TABLE IF NOT EXISTS `materials` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `summary` text COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `type` int(11) NOT NULL,
  `cost` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=19 ;

--
-- Дамп данных таблицы `materials`
--

INSERT INTO `materials` (`id`, `name`, `summary`, `content`, `type`, `cost`) VALUES
(1, 'Плинтус керамика', '', 'Плинтус из керамической плитки 100мм', 0, 135),
(2, 'Плинтус керамика', '', 'Плинтус из керамической плитки 150мм', 0, 13),
(3, 'Плинтус керамика', '', 'Плинтус из керамической плитка 50мм', 0, 5),
(4, 'Деревянный плинтус', '', '', 0, 65),
(5, 'Пластиковый плинтус', '', '', 0, 75),
(6, 'Керамическая плитка', '', '', 0, 95),
(7, 'Гипсовый состав', '<img alt="" src="/public/filemanager/userfiles/greatredactor/mega-champignon-icone-8453-128.png" style="float:left; height:128px; width:128px" />', '', 0, 89),
(8, 'Масляно-клеевый состав', '<img alt="" src="/public/filemanager/userfiles/greatredactor/rouge-shyguy-icone-6870-128.png" style="float:left; height:128px; width:128px" />', '', 0, 63),
(9, 'Армированная сетка', '', '', 0, 45),
(10, 'Стеклохолст', '', '', 0, 77),
(11, 'ПВХ', '', '', 0, 44),
(12, 'Пробковые панели', '', '', 0, 56),
(13, 'Металический порог', '', '', 0, 145),
(14, 'Клеящая мастика', '', '', 0, 56),
(15, 'Пластиковые сантехнические лючки', '', '', 0, 215),
(16, 'Подиум из бетона B15', '', '', 0, 422),
(17, 'Монтажная пена', '', '', 0, 19),
(18, 'Цементное молоко', '', '', 0, 34);

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

CREATE TABLE IF NOT EXISTS `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `migrations`
--

INSERT INTO `migrations` (`migration`, `batch`) VALUES
('2015_05_01_000000_create_users_table', 1),
('2015_05_01_100000_create_password_resets_table', 1),
('2015_05_01_105844_create_roles_table', 1),
('2015_05_02_110325_create_foreign_keys', 1),
('2015_05_03_205441_create_contact_table', 1),
('2015_05_04_172107_create_posts_table', 1),
('2015_05_04_172631_create_tags_table', 1),
('2015_05_04_172904_create_post_tag_table', 1),
('2015_05_04_222018_create_comments_table', 1),
('2015_05_17_225944_create_material_table', 1),
('2015_05_17_230109_create_service_table', 1),
('2015_05_18_230120_create_service_material_table', 1),
('2015_05_31_094032_create_pictures_table', 2);

-- --------------------------------------------------------

--
-- Структура таблицы `password_resets`
--

CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `pictures`
--

CREATE TABLE IF NOT EXISTS `pictures` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=32 ;

--
-- Дамп данных таблицы `pictures`
--

INSERT INTO `pictures` (`id`, `title`, `filename`, `created_at`, `updated_at`) VALUES
(1, '', '/public/filemanager/userfiles/greatredactor/_YU-9Stmlw8.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, '', '/public/filemanager/userfiles/greatredactor/2TyczmeOKoQ.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, '', '/public/filemanager/userfiles/greatredactor/ffvTHXYHlRA.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, '', '/public/filemanager/userfiles/greatredactor/KN9jsDP5ZdQ.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, '', '/public/filemanager/userfiles/greatredactor/0oMg_BAaaNk.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, '', '/public/filemanager/userfiles/greatredactor/8f8KHVGCONQ.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, '', '/public/filemanager/userfiles/greatredactor/RivtMqTcDCM.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, '', '/public/filemanager/userfiles/greatredactor/KYlHBHib_K8.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, '', '/public/filemanager/userfiles/greatredactor/LMpdCOONSOE.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, '', '/public/filemanager/userfiles/greatredactor/PmaySpHZHwQ.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, '', '/public/filemanager/userfiles/greatredactor/TV_BOn6KPXY.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(12, '', '/public/filemanager/userfiles/greatredactor/7CC7xG3Lgmw.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(13, '', '/public/filemanager/userfiles/greatredactor/7LO3tLVgtZQ.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(14, '', '/public/filemanager/userfiles/greatredactor/a0lFDIs2-Sw.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(15, '', '/public/filemanager/userfiles/greatredactor/vOBx5V324Fg.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(16, '', '/public/filemanager/userfiles/greatredactor/BaMzXD8MKLs.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(17, '', '/public/filemanager/userfiles/greatredactor/eEocwR8s2z0.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(18, '', '/public/filemanager/userfiles/greatredactor/zBjHlXQBZmA.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(19, '', '/public/filemanager/userfiles/greatredactor/cSLJF2YRXqk.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(20, '', '/public/filemanager/userfiles/greatredactor/jTTP0RWAgSA.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(21, '', '/public/filemanager/userfiles/greatredactor/TNa-5npABPk.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(22, '', '/public/filemanager/userfiles/greatredactor/CYS25hrPIf8.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(23, '', '/public/filemanager/userfiles/greatredactor/rgy1OXU8PdA.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(24, '', '/public/filemanager/userfiles/greatredactor/RivtMqTcDCM.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(25, '', '/public/filemanager/userfiles/greatredactor/ydXXmDW1-SI.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(26, '', '/public/filemanager/userfiles/greatredactor/dAtYyva-czk.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(27, '', '/public/filemanager/userfiles/greatredactor/gTl92yjK6VI.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(28, '', '/public/filemanager/userfiles/greatredactor/hLtSHJn3aMM.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(29, '', '/public/filemanager/userfiles/greatredactor/KBthcDEhB1U.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(30, '', '/public/filemanager/userfiles/greatredactor/MGpyqbjLblI.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(31, '', '/public/filemanager/userfiles/greatredactor/hdvekOEhwTQ.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Структура таблицы `posts`
--

CREATE TABLE IF NOT EXISTS `posts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `summary` text COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `seen` tinyint(1) NOT NULL DEFAULT '0',
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `posts_slug_unique` (`slug`),
  KEY `posts_user_id_foreign` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Дамп данных таблицы `posts`
--

INSERT INTO `posts` (`id`, `created_at`, `updated_at`, `title`, `slug`, `summary`, `content`, `seen`, `active`, `user_id`) VALUES
(1, '2015-05-18 20:33:14', '2015-05-18 20:33:14', 'Post 1', 'post-1', '<img alt="" src="/filemanager/userfiles/greatredactor/mega-champignon-icone-8453-128.png" style="float:left; height:128px; width:128px" /><p>\nLorem ipsum quisque aliquam vestibulum platea cursus pellentesque leo dui lectus curabitur, euismod ad erat curae non elit ultrices placerat netus. \nMetus feugiat non conubia fusce porttitor sociosqu diam, commodo metus in himenaeos vitae aptent consequat, luctus purus eleifend enim sollicitudin eleifend. \nPorta malesuada ac class conubia, condimentum mauris facilisis. \n</p>', '<p>\nLorem ipsum egestas lacinia scelerisque lacinia tempus, nullam felis fusce ac potenti, netus ornare semper molestie iaculis. \nFermentum ornare curabitur tincidunt imperdiet scelerisque imperdiet euismod scelerisque torquent, curae rhoncus sollicitudin tortor placerat aptent hac nec posuere, suscipit sed tortor neque urna hendrerit vehicula duis. \nLitora tristique congue nec auctor felis libero ornare habitasse nec elit, felis inceptos tellus inceptos cubilia quis mattis faucibus sem, non odio fringilla class aliquam metus ipsum lorem luctus. \nPharetra dictum vehicula tempus in venenatis gravida ut gravida proin orci, quis sed platea mi quisque hendrerit semper hendrerit facilisis, ante sapien faucibus ligula commodo vestibulum rutrum pretium varius. \n</p>\n<p>\nSem aliquet himenaeos dolor cursus nunc habitasse aliquam ut, curabitur ipsum luctus ut rutrum odio condimentum, donec suscipit molestie est etiam sit rutrum. \nDui nostra sem aliquet conubia nullam sollicitudin rhoncus venenatis vivamus, rhoncus netus risus tortor non mauris turpis eget, integer nibh dolor commodo venenatis ut molestie semper. \nAdipiscing amet cras class donec sapien malesuada auctor, sapien arcu inceptos aenean consequat metus, litora mattis vivamus feugiat arcu adipiscing. \nMauris primis ante ullamcorper ad nisi lobortis arcu per orci, malesuada blandit metus tortor urna turpis consectetur porttitor, egestas sed eleifend eget tincidunt pharetra varius tincidunt. \n</p>\n<p>\nMorbi malesuada elementum mi torquent mollis eu lobortis curae purus amet vivamus, amet nulla torquent nibh eu diam aliquam pretium donec aliquam, tempus lacus tempus feugiat lectus cras non velit mollis sit. \nEt integer egestas habitant auctor integer sem at nam massa himenaeos netus vel, dapibus nibh malesuada leo fusce tortor sociosqu semper facilisis semper class, tempus faucibus tristique duis eros cubilia quisque habitasse aliquam fringilla orci. \nNon vel laoreet dolor enim justo facilisis neque, accumsan in ad venenatis hac per dictumst, nulla ligula donec mollis massa porttitor. \n</p>\n<p>\nUllamcorper risus eu platea fringilla habitasse suscipit pellentesque donec, est habitant vehicula tempor ultrices placerat sociosqu, ultrices consectetur ullamcorper tincidunt quisque tellus ante. \nNostra euismod nec suspendisse sem curabitur elit malesuada, lacus viverra sagittis sit ornare orci, augue nullam adipiscing pulvinar libero aliquam. \nVestibulum platea cursus pellentesque leo dui lectus curabitur euismod, ad erat curae non elit ultrices placerat netus metus, feugiat non conubia fusce porttitor sociosqu diam. \nCommodo metus in himenaeos vitae aptent consequat luctus purus eleifend, enim sollicitudin eleifend porta malesuada ac class. \nConubia condimentum mauris facilisis conubia quis scelerisque lacinia tempus nullam, felis fusce ac potenti netus ornare semper molestie, iaculis fermentum ornare curabitur tincidunt imperdiet scelerisque imperdiet. \n</p>\n<p>\nEuismod scelerisque torquent curae rhoncus sollicitudin tortor placerat, aptent hac nec posuere suscipit sed tortor neque, urna hendrerit vehicula duis litora tristique. \nCongue nec auctor felis libero ornare habitasse, nec elit felis inceptos tellus inceptos cubilia, quis mattis faucibus sem non. \nOdio fringilla class aliquam metus ipsum lorem luctus pharetra dictum vehicula, tempus in venenatis gravida ut gravida proin orci quis, sed platea mi quisque hendrerit semper hendrerit facilisis ante. \nSapien faucibus ligula commodo vestibulum rutrum pretium varius sem aliquet himenaeos, dolor cursus nunc habitasse aliquam ut curabitur ipsum luctus ut, rutrum odio condimentum donec suscipit molestie est etiam sit. \n</p>\n<p>\nRutrum dui nostra, sem. \n</p>', 0, 1, 1),
(2, '2015-05-18 20:33:14', '2015-05-18 20:33:14', 'Post 2', 'post-2', '<img alt="" src="/filemanager/userfiles/greatredactor/goomba-icone-7704-128.png" style="float:left; height:128px; width:128px" /><p>\nLorem ipsum phasellus nullam sollicitudin rhoncus venenatis vivamus rhoncus netus, risus tortor non mauris turpis eget integer nibh dolor, commodo venenatis ut molestie semper adipiscing amet cras. \nClass donec sapien malesuada auctor sapien arcu inceptos aenean, consequat metus litora mattis vivamus feugiat arcu, adipiscing mauris primis ante ullamcorper ad nisi. \n</p>', '<p>Lorem ipsum convallis ac curae non elit ultrices placerat netus metus feugiat, non conubia fusce porttitor sociosqu diam commodo metus in himenaeos, vitae aptent consequat luctus purus eleifend enim sollicitudin eleifend porta. Malesuada ac class conubia condimentum mauris facilisis conubia quis scelerisque lacinia, tempus nullam felis fusce ac potenti netus ornare semper. Molestie iaculis fermentum ornare curabitur tincidunt imperdiet scelerisque, imperdiet euismod scelerisque torquent curae rhoncus, sollicitudin tortor placerat aptent hac nec. Posuere suscipit sed tortor neque urna hendrerit vehicula duis litora tristique congue nec auctor felis libero, ornare habitasse nec elit felis inceptos tellus inceptos cubilia quis mattis faucibus sem non.</p>\r\n\r\n<p>Odio fringilla class aliquam metus ipsum lorem luctus pharetra dictum, vehicula tempus in venenatis gravida ut gravida proin orci, quis sed platea mi quisque hendrerit semper hendrerit. Facilisis ante sapien faucibus ligula commodo vestibulum rutrum pretium, varius sem aliquet himenaeos dolor cursus nunc habitasse, aliquam ut curabitur ipsum luctus ut rutrum. Odio condimentum donec suscipit molestie est etiam sit rutrum dui nostra, sem aliquet conubia nullam sollicitudin rhoncus venenatis vivamus rhoncus netus, risus tortor non mauris turpis eget integer nibh dolor. Commodo venenatis ut molestie semper adipiscing amet cras, class donec sapien malesuada auctor sapien arcu inceptos, aenean consequat metus litora mattis vivamus.</p>\r\n\r\n<pre>\r\n<code class="language-php">protected function getUserByRecaller($recaller)\r\n{\r\n	if ($this-&gt;validRecaller($recaller) &amp;&amp; ! $this-&gt;tokenRetrievalAttempted)\r\n	{\r\n		$this-&gt;tokenRetrievalAttempted = true;\r\n\r\n		list($id, $token) = explode("|", $recaller, 2);\r\n\r\n		$this-&gt;viaRemember = ! is_null($user = $this-&gt;provider-&gt;retrieveByToken($id, $token));\r\n\r\n		return $user;\r\n	}\r\n}</code></pre>\r\n\r\n<p>Feugiat arcu adipiscing mauris primis ante ullamcorper ad nisi, lobortis arcu per orci malesuada blandit metus tortor, urna turpis consectetur porttitor egestas sed eleifend. Eget tincidunt pharetra varius tincidunt morbi malesuada elementum mi torquent mollis, eu lobortis curae purus amet vivamus amet nulla torquent, nibh eu diam aliquam pretium donec aliquam tempus lacus. Tempus feugiat lectus cras non velit mollis sit et integer, egestas habitant auctor integer sem at nam massa himenaeos, netus vel dapibus nibh malesuada leo fusce tortor. Sociosqu semper facilisis semper class tempus faucibus tristique duis eros, cubilia quisque habitasse aliquam fringilla orci non vel, laoreet dolor enim justo facilisis neque accumsan in.</p>\r\n\r\n<p>Ad venenatis hac per dictumst nulla ligula donec, mollis massa porttitor ullamcorper risus eu platea, fringilla habitasse suscipit pellentesque donec est. Habitant vehicula tempor ultrices placerat sociosqu ultrices consectetur ullamcorper tincidunt quisque tellus, ante nostra euismod nec suspendisse sem curabitur elit malesuada lacus. Viverra sagittis sit ornare orci augue nullam adipiscing pulvinar libero aliquam vestibulum platea cursus pellentesque leo dui lectus, curabitur euismod ad erat curae non elit ultrices placerat netus metus feugiat non conubia fusce porttitor. Sociosqu diam commodo metus in himenaeos vitae aptent consequat luctus purus eleifend enim sollicitudin eleifend, porta malesuada ac class conubia condimentum mauris facilisis conubia quis scelerisque lacinia.</p>\r\n\r\n<p>Tempus nullam felis fusce ac potenti netus ornare semper molestie iaculis, fermentum ornare curabitur tincidunt imperdiet scelerisque imperdiet euismod. Scelerisque torquent curae rhoncus sollicitudin tortor placerat aptent hac, nec posuere suscipit sed tortor neque urna hendrerit, vehicula duis litora tristique congue nec auctor. Felis libero ornare habitasse nec elit felis, inceptos tellus inceptos cubilia quis mattis, faucibus sem non odio fringilla. Class aliquam metus ipsum lorem luctus pharetra dictum vehicula, tempus in venenatis gravida ut gravida proin orci, quis sed platea mi quisque hendrerit semper.</p>\r\n', 0, 1, 2),
(3, '2015-05-18 20:33:14', '2015-05-18 20:33:14', 'Post 3', 'post-3', '<img alt="" src="/filemanager/userfiles/greatredactor/rouge-shell--icone-5599-128.png" style="float:left; height:128px; width:128px" /><p>\nLorem ipsum inceptos arcu per orci malesuada blandit metus tortor urna turpis, consectetur porttitor egestas sed eleifend eget tincidunt pharetra varius tincidunt, morbi malesuada elementum mi torquent mollis eu lobortis curae purus. \nAmet vivamus amet nulla torquent nibh eu, diam aliquam pretium donec aliquam tempus, lacus tempus feugiat lectus cras. \n</p>', '<p>\nLorem ipsum pretium velit mollis sit et integer egestas habitant auctor, integer sem at nam massa himenaeos netus vel dapibus nibh, malesuada leo fusce tortor sociosqu semper facilisis semper class. \nTempus faucibus tristique duis eros cubilia quisque habitasse aliquam fringilla orci, non vel laoreet dolor enim justo facilisis neque accumsan in ad, venenatis hac per dictumst nulla ligula donec mollis massa. \nPorttitor ullamcorper risus eu platea fringilla habitasse suscipit pellentesque donec est habitant vehicula tempor ultrices, placerat sociosqu ultrices consectetur ullamcorper tincidunt quisque tellus ante nostra euismod nec. \n</p>\n<p>\nSuspendisse sem curabitur elit malesuada lacus viverra sagittis sit ornare, orci augue nullam adipiscing pulvinar libero aliquam vestibulum platea, cursus pellentesque leo dui lectus curabitur euismod ad. \nErat curae non elit ultrices placerat netus metus feugiat, non conubia fusce porttitor sociosqu diam commodo metus, in himenaeos vitae aptent consequat luctus purus. \nEleifend enim sollicitudin eleifend porta malesuada ac class conubia, condimentum mauris facilisis conubia quis scelerisque lacinia tempus, nullam felis fusce ac potenti netus ornare. \nSemper molestie iaculis fermentum ornare curabitur tincidunt imperdiet, scelerisque imperdiet euismod scelerisque torquent curae, rhoncus sollicitudin tortor placerat aptent hac. \n</p>\n<p>\nNec posuere suscipit sed tortor neque urna hendrerit, vehicula duis litora tristique congue nec auctor felis, libero ornare habitasse nec elit felis. \nInceptos tellus inceptos cubilia quis mattis, faucibus sem non odio fringilla class, aliquam metus ipsum lorem. \nLuctus pharetra dictum vehicula tempus in venenatis gravida ut gravida proin, orci quis sed platea mi quisque hendrerit semper hendrerit facilisis, ante sapien faucibus ligula commodo vestibulum rutrum pretium varius. \nSem aliquet himenaeos dolor cursus nunc habitasse aliquam ut, curabitur ipsum luctus ut rutrum odio condimentum donec suscipit, molestie est etiam sit rutrum dui nostra. \n</p>\n<p>\nSem aliquet conubia nullam sollicitudin rhoncus venenatis vivamus rhoncus netus risus, tortor non mauris turpis eget integer nibh dolor commodo venenatis, ut molestie semper adipiscing amet cras class donec sapien. \nMalesuada auctor sapien arcu inceptos aenean consequat metus litora mattis vivamus feugiat arcu adipiscing, mauris primis ante ullamcorper ad nisi lobortis arcu per orci malesuada. \nBlandit metus tortor urna turpis consectetur porttitor egestas sed eleifend eget, tincidunt pharetra varius tincidunt morbi malesuada elementum mi torquent. \nMollis eu lobortis curae purus amet vivamus, amet nulla torquent nibh eu diam, aliquam pretium donec aliquam tempus. \n</p>\n<p>\nLacus tempus feugiat lectus cras non velit mollis sit et integer egestas habitant auctor, integer sem at nam massa himenaeos netus vel dapibus nibh malesuada. \nLeo fusce tortor sociosqu semper facilisis semper class tempus faucibus tristique, duis eros cubilia quisque habitasse aliquam fringilla orci non vel laoreet, dolor enim justo facilisis neque accumsan in ad venenatis. \nHac per dictumst nulla ligula donec mollis massa porttitor ullamcorper risus eu platea, fringilla habitasse suscipit pellentesque donec est habitant vehicula tempor ultrices placerat. \nSociosqu ultrices consectetur ullamcorper tincidunt quisque tellus ante nostra euismod nec, suspendisse sem curabitur elit malesuada lacus viverra sagittis sit ornare orci, augue nullam adipiscing pulvinar libero aliquam vestibulum platea cursus. \n</p>\n<p>\nPellentesque leo dui lectus curabitur euismod ad erat curae non elit, ultrices placerat netus metus feugiat non conubia fusce porttitor. \n</p>', 0, 1, 2),
(4, '2015-05-18 20:33:14', '2015-05-18 20:33:14', 'Post 4', 'post-4', '<img alt="" src="/filemanager/userfiles/greatredactor/rouge-shyguy-icone-6870-128.png" style="float:left; height:128px; width:128px" /><p>\nLorem ipsum sapien diam commodo metus in himenaeos vitae aptent consequat luctus, purus eleifend enim sollicitudin eleifend porta malesuada ac class conubia condimentum mauris, facilisis conubia quis scelerisque lacinia tempus nullam felis fusce ac. \nPotenti netus ornare semper molestie iaculis fermentum ornare curabitur, tincidunt imperdiet scelerisque imperdiet euismod scelerisque torquent. \n</p>', '<p>\nLorem ipsum ultricies rhoncus sollicitudin, tortor placerat aptent hac nec, posuere suscipit sed. \nTortor neque urna hendrerit vehicula duis litora tristique congue nec auctor felis, libero ornare habitasse nec elit felis inceptos tellus inceptos cubilia quis, mattis faucibus sem non odio fringilla class aliquam metus ipsum. \nLorem luctus pharetra dictum vehicula tempus in venenatis, gravida ut gravida proin orci quis sed, platea mi quisque hendrerit semper hendrerit. \nFacilisis ante sapien faucibus ligula commodo vestibulum rutrum pretium varius, sem aliquet himenaeos dolor cursus nunc habitasse aliquam ut curabitur, ipsum luctus ut rutrum odio condimentum donec suscipit. \n</p>\n<p>\nMolestie est etiam sit rutrum dui nostra sem aliquet conubia nullam sollicitudin, rhoncus venenatis vivamus rhoncus netus risus tortor non mauris turpis, eget integer nibh dolor commodo venenatis ut molestie semper adipiscing. \nAmet cras class donec sapien malesuada auctor sapien arcu inceptos, aenean consequat metus litora mattis vivamus feugiat. \nArcu adipiscing mauris primis ante ullamcorper ad nisi lobortis arcu per, orci malesuada blandit metus tortor urna turpis consectetur porttitor, egestas sed eleifend eget tincidunt pharetra varius tincidunt morbi. \nMalesuada elementum mi torquent mollis eu lobortis curae purus amet, vivamus amet nulla torquent nibh eu diam aliquam pretium donec, aliquam tempus lacus tempus feugiat lectus cras non. \n</p>\n<p>\nVelit mollis sit et integer egestas habitant auctor integer sem, at nam massa himenaeos netus vel dapibus nibh. \nMalesuada leo fusce tortor sociosqu semper facilisis semper, class tempus faucibus tristique duis eros cubilia, quisque habitasse aliquam fringilla orci non. \nVel laoreet dolor enim justo facilisis neque accumsan in ad venenatis, hac per dictumst nulla ligula donec mollis massa porttitor ullamcorper, risus eu platea fringilla habitasse suscipit pellentesque donec est. \nHabitant vehicula tempor ultrices placerat sociosqu, ultrices consectetur ullamcorper tincidunt, quisque tellus ante nostra. \nEuismod nec suspendisse sem curabitur elit malesuada lacus viverra sagittis sit ornare, orci augue nullam adipiscing pulvinar libero aliquam vestibulum platea cursus, pellentesque leo dui lectus curabitur euismod ad erat curae non. \n</p>\n<p>\nElit ultrices placerat netus metus feugiat non conubia fusce porttitor, sociosqu diam commodo metus in himenaeos vitae aptent consequat luctus, purus eleifend enim sollicitudin eleifend porta malesuada ac. \nClass conubia condimentum mauris facilisis conubia quis scelerisque, lacinia tempus nullam felis fusce ac potenti netus, ornare semper molestie iaculis fermentum ornare. \nCurabitur tincidunt imperdiet scelerisque imperdiet euismod scelerisque torquent curae rhoncus sollicitudin tortor, placerat aptent hac nec posuere suscipit sed tortor neque urna. \nHendrerit vehicula duis litora tristique congue nec auctor felis, libero ornare habitasse nec elit felis inceptos, tellus inceptos cubilia quis mattis faucibus sem. \n</p>\n<p>\nNon odio fringilla class aliquam metus ipsum lorem luctus pharetra dictum vehicula tempus in, venenatis gravida ut gravida proin orci quis sed platea mi quisque. \nHendrerit semper hendrerit facilisis ante sapien faucibus, ligula commodo vestibulum rutrum pretium, varius sem aliquet himenaeos dolor. \nCursus nunc habitasse aliquam ut curabitur ipsum luctus ut, rutrum odio condimentum donec suscipit molestie est etiam, sit rutrum dui nostra sem aliquet conubia. \nNullam sollicitudin rhoncus venenatis vivamus rhoncus netus risus tortor, non mauris turpis eget integer nibh dolor, commodo venenatis ut molestie semper adipiscing amet. \n</p>', 0, 1, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `post_tag`
--

CREATE TABLE IF NOT EXISTS `post_tag` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` int(10) unsigned NOT NULL,
  `tag_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `post_tag_post_id_foreign` (`post_id`),
  KEY `post_tag_tag_id_foreign` (`tag_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=9 ;

--
-- Дамп данных таблицы `post_tag`
--

INSERT INTO `post_tag` (`id`, `post_id`, `tag_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 1),
(4, 2, 2),
(5, 2, 3),
(6, 3, 1),
(7, 3, 2),
(8, 3, 4);

-- --------------------------------------------------------

--
-- Структура таблицы `roles`
--

CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Дамп данных таблицы `roles`
--

INSERT INTO `roles` (`id`, `title`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', 'admin', '2015-05-18 20:33:13', '2015-05-18 20:33:13'),
(2, 'Redactor', 'redac', '2015-05-18 20:33:13', '2015-05-18 20:33:13'),
(3, 'User', 'user', '2015-05-18 20:33:13', '2015-05-18 20:33:13');

-- --------------------------------------------------------

--
-- Структура таблицы `services`
--

CREATE TABLE IF NOT EXISTS `services` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `type` int(11) NOT NULL,
  `cost` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=21 ;

--
-- Дамп данных таблицы `services`
--

INSERT INTO `services` (`id`, `title`, `slug`, `content`, `type`, `cost`) VALUES
(1, 'Установка плинтусов', 'serv-1', 'Установка декоративных и защитных элементов отделки помещений для сокрытия угла между полом (или потолком) и стеной, тяга, идущая по низу стены.', 3, 180),
(2, 'Облицовка по диагонали простая', 'slide-1', '', 3, 600),
(3, 'Облицовка по диагонали сложная', 'slide-2', '', 3, 650),
(4, 'Шпатлевка со шлифовкой под покраску', 'shpat-1', '', 1, 150),
(5, 'Армирование штукатурки', 'arm-1', '', 2, 80),
(6, 'Проклейка стен', 'prokl-1', '', 2, 49),
(7, 'Установка дверного доводчика', 'dovod', '', 4, 600),
(8, 'Оформление дверных проёмов в деревянных перегородках', 'oform-1', '', 4, 750),
(9, 'Устройство бетонного криволинейного бортика', 'bet-1', '', 5, 800),
(10, 'Установка галтелей', 'ust-1', '', 1, 65),
(11, 'Установка деревянных уголков', 'ust-2', '', 1, 30),
(12, 'Оклейка потолка', 'okl-1', '', 1, 240),
(13, 'Укладка ковролина', 'ol-3', '', 3, 140),
(14, 'Укладка порогов', 'por-3', '', 3, 120),
(15, 'Укладка линолиума', 'lin-3', '', 3, 180),
(16, 'Установка сантехнических лючков', 'san-3', '', 3, 60),
(17, 'Устройство подиума', 'pod-3', '', 3, 250),
(18, 'Устройство теплоизоляции из керамзита', 'tepl-1', '', 3, 100),
(19, 'Заполнение швов', 'shv-1', '', 3, 7),
(20, 'Проливка утеплителя', 'utp-1', '', 3, 60);

-- --------------------------------------------------------

--
-- Структура таблицы `service_materials`
--

CREATE TABLE IF NOT EXISTS `service_materials` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `service_id` int(10) unsigned NOT NULL,
  `materials_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `service_materials_service_id_foreign` (`service_id`),
  KEY `service_materials_materials_id_foreign` (`materials_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=20 ;

--
-- Дамп данных таблицы `service_materials`
--

INSERT INTO `service_materials` (`id`, `service_id`, `materials_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 2, 6),
(7, 3, 6),
(8, 4, 7),
(9, 4, 8),
(10, 5, 10),
(11, 6, 9),
(12, 10, 11),
(13, 12, 12),
(14, 14, 13),
(15, 15, 14),
(16, 16, 15),
(17, 17, 16),
(18, 19, 17),
(19, 20, 18);

-- --------------------------------------------------------

--
-- Структура таблицы `tags`
--

CREATE TABLE IF NOT EXISTS `tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `tag` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tags_tag_unique` (`tag`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Дамп данных таблицы `tags`
--

INSERT INTO `tags` (`id`, `created_at`, `updated_at`, `tag`) VALUES
(1, '2015-05-18 20:33:14', '2015-05-18 20:33:14', 'Tag1'),
(2, '2015-05-18 20:33:14', '2015-05-18 20:33:14', 'Tag2'),
(3, '2015-05-18 20:33:14', '2015-05-18 20:33:14', 'Tag3'),
(4, '2015-05-18 20:33:14', '2015-05-18 20:33:14', 'Tag4');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  `seen` tinyint(1) NOT NULL DEFAULT '0',
  `valid` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_username_unique` (`username`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_role_id_foreign` (`role_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `role_id`, `seen`, `valid`, `created_at`, `updated_at`, `remember_token`) VALUES
(1, 'GreatAdmin', 'admin@la.fr', '$2y$10$kZzXRdsZUkrpxR/qKqIbs.XdQOC0vfZe3xyrM33hJjHUop9Bt0Zcm', 1, 1, 0, '2015-05-18 20:33:14', '2015-05-29 01:00:18', 'wrQmiaPk4VxxDhsSWyWkvQbADhpaL8kEciGMITes2gnsuj0xb6I3stwtvZJZ'),
(2, 'GreatRedactor', 'redac@la.fr', '$2y$10$/MMcutewol7J.4YQuclI3u4tgGemLUewH/pBW0ZRabc8cNNkaX99S', 3, 1, 1, '2015-05-18 20:33:14', '2015-05-29 00:19:40', NULL),
(3, 'Walker', 'walker@la.fr', '$2y$10$BI3VolnP9jONMMKiZrrGhehGBHwqmvumj2hnYkMSI90wI3GtcHyja', 3, 0, 0, '2015-05-18 20:33:14', '2015-05-18 20:33:14', NULL),
(4, 'Slacker', 'slacker@la.fr', '$2y$10$NOqaTlOeayhz8QTeBPneCehLcwdPiidE5Ey9W9zZIdpbzs96wr1tm', 3, 0, 0, '2015-05-18 20:33:14', '2015-05-24 22:49:03', 'sX9reWfrRnIOjPyK5zwonrfOHc8fnxZhmaB95dLD10vlp6XvAyoZNXaXQce8'),
(5, 'Yunus', 'Yunus_07@mail.ru', '$2y$10$5GGj4lw9be74I17OOAOKYOua/DGYGAYTdDRGyQmTg4hAwG8b3LqiC', 1, 1, 0, '2015-05-28 22:28:28', '2015-05-31 12:01:23', '2hv2DcKShtXoGptbjNY0quin7tJUudqJQ29TP5vn3TpgsFYhL3weGgqHyCLR');

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Ограничения внешнего ключа таблицы `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Ограничения внешнего ключа таблицы `post_tag`
--
ALTER TABLE `post_tag`
  ADD CONSTRAINT `post_tag_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`),
  ADD CONSTRAINT `post_tag_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`);

--
-- Ограничения внешнего ключа таблицы `service_materials`
--
ALTER TABLE `service_materials`
  ADD CONSTRAINT `service_materials_materials_id_foreign` FOREIGN KEY (`materials_id`) REFERENCES `materials` (`id`),
  ADD CONSTRAINT `service_materials_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`);

--
-- Ограничения внешнего ключа таблицы `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
