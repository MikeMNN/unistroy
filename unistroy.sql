-- phpMyAdmin SQL Dump
-- version 4.0.10.6
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1:3306
-- Время создания: Май 28 2015 г., 16:04
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

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
('2015_05_18_230120_create_service_material_table', 1);

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
(1, '2015-05-21 03:45:01', '2015-05-21 03:45:01', 'Post 1', 'post-1', '<img alt="" src="filemanager/userfiles/greatredactor/mega-champignon-icone-8453-128.png" style="float:left; height:128px; width:128px" /><p>\nLorem ipsum at facilisis semper class tempus faucibus tristique duis, eros cubilia quisque habitasse aliquam fringilla orci non, vel laoreet dolor enim justo facilisis neque accumsan. \nIn ad venenatis hac per dictumst nulla ligula, donec mollis massa porttitor ullamcorper risus, eu platea fringilla habitasse suscipit pellentesque. \nDonec est habitant, vehicula. \n</p>', '<p>\nLorem ipsum fames vehicula placerat sociosqu ultrices consectetur ullamcorper, tincidunt quisque tellus ante nostra euismod nec suspendisse sem, curabitur elit malesuada lacus viverra sagittis sit. \nOrnare orci augue nullam adipiscing pulvinar, libero aliquam vestibulum platea cursus, pellentesque leo dui lectus. \nCurabitur euismod ad erat curae non elit ultrices placerat, netus metus feugiat non conubia fusce porttitor, sociosqu diam commodo metus in himenaeos vitae. \nAptent consequat luctus purus eleifend enim sollicitudin eleifend, porta malesuada ac class conubia condimentum, mauris facilisis conubia quis scelerisque lacinia. \nTempus nullam felis fusce ac potenti netus ornare semper, molestie iaculis fermentum ornare curabitur tincidunt imperdiet, scelerisque imperdiet euismod scelerisque torquent curae rhoncus. \n</p>\n<p>\nSollicitudin tortor placerat aptent hac nec posuere suscipit sed tortor, neque urna hendrerit vehicula duis litora tristique. \nCongue nec auctor felis libero ornare habitasse nec elit felis inceptos, tellus inceptos cubilia quis mattis faucibus sem non odio fringilla, class aliquam metus ipsum lorem luctus pharetra dictum vehicula. \nTempus in venenatis gravida ut gravida proin orci quis sed, platea mi quisque hendrerit semper hendrerit facilisis ante sapien, faucibus ligula commodo vestibulum rutrum pretium varius sem. \nAliquet himenaeos dolor cursus nunc habitasse aliquam ut curabitur ipsum luctus, ut rutrum odio condimentum donec suscipit molestie est etiam sit, rutrum dui nostra sem aliquet conubia nullam sollicitudin rhoncus. \n</p>\n<p>\nVenenatis vivamus rhoncus netus risus tortor non mauris, turpis eget integer nibh dolor commodo venenatis, ut molestie semper adipiscing amet cras. \nClass donec sapien malesuada auctor sapien arcu inceptos aenean consequat metus litora, mattis vivamus feugiat arcu adipiscing mauris primis ante ullamcorper ad nisi lobortis, arcu per orci malesuada blandit metus tortor urna turpis consectetur. \nPorttitor egestas sed eleifend eget tincidunt pharetra varius tincidunt morbi, malesuada elementum mi torquent mollis eu lobortis curae, purus amet vivamus amet nulla torquent nibh eu. \nDiam aliquam pretium donec aliquam tempus lacus tempus feugiat, lectus cras non velit mollis sit et integer, egestas habitant auctor integer sem at nam. \n</p>\n<p>\nMassa himenaeos netus vel dapibus nibh malesuada leo fusce, tortor sociosqu semper facilisis semper class tempus, faucibus tristique duis eros cubilia quisque habitasse. \nAliquam fringilla orci non vel laoreet dolor enim justo facilisis neque accumsan, in ad venenatis hac per dictumst nulla ligula donec mollis. \nMassa porttitor ullamcorper risus eu platea fringilla habitasse, suscipit pellentesque donec est habitant vehicula tempor ultrices, placerat sociosqu ultrices consectetur ullamcorper tincidunt. \nQuisque tellus ante nostra euismod nec suspendisse sem curabitur elit, malesuada lacus viverra sagittis sit ornare orci augue nullam adipiscing, pulvinar libero aliquam vestibulum platea cursus pellentesque leo. \n</p>\n<p>\nDui lectus curabitur euismod ad erat curae non elit ultrices placerat netus metus feugiat non conubia fusce, porttitor sociosqu diam commodo metus in himenaeos vitae aptent consequat luctus purus eleifend enim sollicitudin. \nEleifend porta malesuada ac class conubia condimentum mauris facilisis conubia quis, scelerisque lacinia tempus nullam felis fusce ac potenti netus ornare, semper molestie iaculis fermentum ornare curabitur tincidunt imperdiet scelerisque. \nImperdiet euismod scelerisque torquent curae rhoncus sollicitudin tortor placerat, aptent hac nec posuere suscipit sed tortor neque, urna hendrerit vehicula duis litora tristique congue. \nNec auctor felis, libero. \n</p>', 0, 1, 1),
(2, '2015-05-21 03:45:01', '2015-05-21 03:45:01', 'Post 2', 'post-2', '<img alt="" src="/filemanager/userfiles/greatredactor/goomba-icone-7704-128.png" style="float:left; height:128px; width:128px" /><p>\nLorem ipsum nec elit felis inceptos tellus inceptos cubilia quis mattis, faucibus sem non odio fringilla class aliquam metus ipsum lorem luctus, pharetra dictum vehicula tempus in venenatis gravida ut gravida. \nProin orci quis sed platea mi quisque hendrerit semper hendrerit facilisis, ante sapien faucibus ligula commodo vestibulum rutrum pretium. \n</p>', '<p>Lorem ipsum convallis ac curae non elit ultrices placerat netus metus feugiat, non conubia fusce porttitor sociosqu diam commodo metus in himenaeos, vitae aptent consequat luctus purus eleifend enim sollicitudin eleifend porta. Malesuada ac class conubia condimentum mauris facilisis conubia quis scelerisque lacinia, tempus nullam felis fusce ac potenti netus ornare semper. Molestie iaculis fermentum ornare curabitur tincidunt imperdiet scelerisque, imperdiet euismod scelerisque torquent curae rhoncus, sollicitudin tortor placerat aptent hac nec. Posuere suscipit sed tortor neque urna hendrerit vehicula duis litora tristique congue nec auctor felis libero, ornare habitasse nec elit felis inceptos tellus inceptos cubilia quis mattis faucibus sem non.</p>\r\n\r\n<p>Odio fringilla class aliquam metus ipsum lorem luctus pharetra dictum, vehicula tempus in venenatis gravida ut gravida proin orci, quis sed platea mi quisque hendrerit semper hendrerit. Facilisis ante sapien faucibus ligula commodo vestibulum rutrum pretium, varius sem aliquet himenaeos dolor cursus nunc habitasse, aliquam ut curabitur ipsum luctus ut rutrum. Odio condimentum donec suscipit molestie est etiam sit rutrum dui nostra, sem aliquet conubia nullam sollicitudin rhoncus venenatis vivamus rhoncus netus, risus tortor non mauris turpis eget integer nibh dolor. Commodo venenatis ut molestie semper adipiscing amet cras, class donec sapien malesuada auctor sapien arcu inceptos, aenean consequat metus litora mattis vivamus.</p>\r\n\r\n<pre>\r\n<code class="language-php">protected function getUserByRecaller($recaller)\r\n{\r\n	if ($this-&gt;validRecaller($recaller) &amp;&amp; ! $this-&gt;tokenRetrievalAttempted)\r\n	{\r\n		$this-&gt;tokenRetrievalAttempted = true;\r\n\r\n		list($id, $token) = explode("|", $recaller, 2);\r\n\r\n		$this-&gt;viaRemember = ! is_null($user = $this-&gt;provider-&gt;retrieveByToken($id, $token));\r\n\r\n		return $user;\r\n	}\r\n}</code></pre>\r\n\r\n<p>Feugiat arcu adipiscing mauris primis ante ullamcorper ad nisi, lobortis arcu per orci malesuada blandit metus tortor, urna turpis consectetur porttitor egestas sed eleifend. Eget tincidunt pharetra varius tincidunt morbi malesuada elementum mi torquent mollis, eu lobortis curae purus amet vivamus amet nulla torquent, nibh eu diam aliquam pretium donec aliquam tempus lacus. Tempus feugiat lectus cras non velit mollis sit et integer, egestas habitant auctor integer sem at nam massa himenaeos, netus vel dapibus nibh malesuada leo fusce tortor. Sociosqu semper facilisis semper class tempus faucibus tristique duis eros, cubilia quisque habitasse aliquam fringilla orci non vel, laoreet dolor enim justo facilisis neque accumsan in.</p>\r\n\r\n<p>Ad venenatis hac per dictumst nulla ligula donec, mollis massa porttitor ullamcorper risus eu platea, fringilla habitasse suscipit pellentesque donec est. Habitant vehicula tempor ultrices placerat sociosqu ultrices consectetur ullamcorper tincidunt quisque tellus, ante nostra euismod nec suspendisse sem curabitur elit malesuada lacus. Viverra sagittis sit ornare orci augue nullam adipiscing pulvinar libero aliquam vestibulum platea cursus pellentesque leo dui lectus, curabitur euismod ad erat curae non elit ultrices placerat netus metus feugiat non conubia fusce porttitor. Sociosqu diam commodo metus in himenaeos vitae aptent consequat luctus purus eleifend enim sollicitudin eleifend, porta malesuada ac class conubia condimentum mauris facilisis conubia quis scelerisque lacinia.</p>\r\n\r\n<p>Tempus nullam felis fusce ac potenti netus ornare semper molestie iaculis, fermentum ornare curabitur tincidunt imperdiet scelerisque imperdiet euismod. Scelerisque torquent curae rhoncus sollicitudin tortor placerat aptent hac, nec posuere suscipit sed tortor neque urna hendrerit, vehicula duis litora tristique congue nec auctor. Felis libero ornare habitasse nec elit felis, inceptos tellus inceptos cubilia quis mattis, faucibus sem non odio fringilla. Class aliquam metus ipsum lorem luctus pharetra dictum vehicula, tempus in venenatis gravida ut gravida proin orci, quis sed platea mi quisque hendrerit semper.</p>\r\n', 0, 1, 2),
(3, '2015-05-21 03:45:01', '2015-05-21 03:45:01', 'Post 3', 'post-3', '<img alt="" src="/filemanager/userfiles/greatredactor/rouge-shell--icone-5599-128.png" style="float:left; height:128px; width:128px" /><p>\nLorem ipsum vivamus sem aliquet himenaeos dolor, cursus nunc habitasse aliquam ut curabitur ipsum, luctus ut rutrum odio condimentum. \nDonec suscipit molestie est etiam sit rutrum dui nostra, sem aliquet conubia nullam sollicitudin rhoncus venenatis, vivamus rhoncus netus risus tortor non mauris. \nTurpis eget integer nibh dolor, commodo venenatis ut. \n</p>', '<p>\nLorem ipsum quam adipiscing amet cras class donec, sapien malesuada auctor sapien arcu inceptos aenean consequat, metus litora mattis vivamus feugiat arcu. \nAdipiscing mauris primis ante ullamcorper ad nisi lobortis arcu per orci malesuada blandit metus, tortor urna turpis consectetur porttitor egestas sed eleifend eget tincidunt pharetra. \nVarius tincidunt morbi malesuada elementum mi torquent mollis eu lobortis curae purus, amet vivamus amet nulla torquent nibh eu diam aliquam pretium, donec aliquam tempus lacus tempus feugiat lectus cras non velit. \nMollis sit et integer egestas habitant auctor integer sem at nam massa, himenaeos netus vel dapibus nibh malesuada leo fusce tortor sociosqu, semper facilisis semper class tempus faucibus tristique duis eros cubilia. \n</p>\n<p>\nQuisque habitasse aliquam fringilla orci non vel, laoreet dolor enim justo facilisis neque accumsan, in ad venenatis hac per. \nDictumst nulla ligula donec mollis massa porttitor, ullamcorper risus eu platea fringilla habitasse, suscipit pellentesque donec est habitant. \nVehicula tempor ultrices placerat sociosqu ultrices consectetur ullamcorper, tincidunt quisque tellus ante nostra euismod nec, suspendisse sem curabitur elit malesuada lacus. \nViverra sagittis sit ornare orci augue, nullam adipiscing pulvinar libero aliquam vestibulum, platea cursus pellentesque leo. \nDui lectus curabitur euismod ad erat curae non elit ultrices, placerat netus metus feugiat non conubia fusce porttitor, sociosqu diam commodo metus in himenaeos vitae aptent. \n</p>\n<p>\nConsequat luctus purus eleifend enim sollicitudin eleifend porta malesuada, ac class conubia condimentum mauris facilisis conubia, quis scelerisque lacinia tempus nullam felis fusce. \nAc potenti netus ornare semper molestie iaculis fermentum ornare, curabitur tincidunt imperdiet scelerisque imperdiet euismod scelerisque, torquent curae rhoncus sollicitudin tortor placerat aptent. \nHac nec posuere suscipit sed tortor neque urna hendrerit, vehicula duis litora tristique congue nec auctor felis libero, ornare habitasse nec elit felis inceptos tellus. \nInceptos cubilia quis mattis faucibus sem non odio fringilla class aliquam, metus ipsum lorem luctus pharetra dictum vehicula tempus in. \n</p>\n<p>\nVenenatis gravida ut gravida proin orci quis sed platea mi quisque, hendrerit semper hendrerit facilisis ante sapien faucibus ligula commodo vestibulum, rutrum pretium varius sem aliquet himenaeos dolor cursus nunc. \nHabitasse aliquam ut curabitur ipsum luctus ut rutrum, odio condimentum donec suscipit molestie est etiam, sit rutrum dui nostra sem aliquet. \nConubia nullam sollicitudin rhoncus venenatis vivamus rhoncus netus, risus tortor non mauris turpis eget integer, nibh dolor commodo venenatis ut molestie. \nSemper adipiscing amet cras class donec sapien malesuada auctor sapien arcu inceptos aenean consequat metus litora, mattis vivamus feugiat arcu adipiscing mauris primis ante ullamcorper ad nisi lobortis arcu. \n</p>\n<p>\nPer orci malesuada blandit metus tortor urna turpis consectetur porttitor egestas sed, eleifend eget tincidunt pharetra varius tincidunt morbi malesuada elementum mi torquent, mollis eu lobortis curae purus amet vivamus amet nulla torquent. \nNibh eu diam aliquam pretium donec aliquam tempus, lacus tempus feugiat lectus cras non velit, mollis sit et integer egestas habitant. \nAuctor integer sem at nam massa himenaeos netus vel, dapibus nibh malesuada leo fusce tortor sociosqu semper facilisis, semper class tempus faucibus tristique duis eros. \nCubilia quisque habitasse aliquam fringilla orci non, vel laoreet dolor enim justo facilisis, neque accumsan in ad venenatis. \n</p>', 0, 1, 2),
(4, '2015-05-21 03:45:01', '2015-05-21 03:45:01', 'Post 4', 'post-4', '<img alt="" src="/filemanager/userfiles/greatredactor/rouge-shyguy-icone-6870-128.png" style="float:left; height:128px; width:128px" /><p>\nLorem ipsum cubilia dictumst nulla ligula donec mollis massa, porttitor ullamcorper risus eu platea fringilla habitasse, suscipit pellentesque donec est habitant vehicula tempor. \nUltrices placerat sociosqu ultrices consectetur ullamcorper tincidunt quisque tellus ante, nostra euismod nec suspendisse sem curabitur elit malesuada lacus, viverra sagittis sit ornare orci augue nullam adipiscing. \n</p>', '<p>\nLorem ipsum iaculis lorem aliquam vestibulum platea cursus pellentesque, leo dui lectus curabitur euismod ad erat curae, non elit ultrices placerat netus metus feugiat. \nNon conubia fusce porttitor sociosqu diam commodo metus, in himenaeos vitae aptent consequat luctus purus eleifend, enim sollicitudin eleifend porta malesuada ac. \nClass conubia condimentum mauris facilisis conubia quis scelerisque lacinia, tempus nullam felis fusce ac potenti. \nNetus ornare semper molestie iaculis fermentum ornare curabitur tincidunt, imperdiet scelerisque imperdiet euismod scelerisque torquent curae rhoncus sollicitudin, tortor placerat aptent hac nec posuere suscipit. \nSed tortor neque urna hendrerit vehicula duis litora tristique, congue nec auctor felis libero ornare habitasse, nec elit felis inceptos tellus inceptos cubilia. \n</p>\n<p>\nQuis mattis faucibus sem non odio fringilla class aliquam metus ipsum, lorem luctus pharetra dictum vehicula tempus in venenatis gravida, ut gravida proin orci quis sed platea mi quisque. \nHendrerit semper hendrerit facilisis ante sapien faucibus ligula commodo, vestibulum rutrum pretium varius sem aliquet himenaeos dolor cursus, nunc habitasse aliquam ut curabitur ipsum luctus. \nUt rutrum odio condimentum donec suscipit molestie est, etiam sit rutrum dui nostra sem, aliquet conubia nullam sollicitudin rhoncus venenatis. \nVivamus rhoncus netus risus tortor non mauris turpis eget integer nibh, dolor commodo venenatis ut molestie semper adipiscing amet. \n</p>\n<p>\nCras class donec sapien malesuada auctor sapien arcu inceptos aenean consequat metus litora, mattis vivamus feugiat arcu adipiscing mauris primis ante ullamcorper ad. \nNisi lobortis arcu per orci malesuada blandit metus tortor, urna turpis consectetur porttitor egestas sed eleifend eget tincidunt, pharetra varius tincidunt morbi malesuada elementum mi. \nTorquent mollis eu lobortis curae purus amet vivamus amet nulla torquent nibh, eu diam aliquam pretium donec aliquam tempus lacus tempus. \nFeugiat lectus cras non velit mollis sit et integer, egestas habitant auctor integer sem at nam, massa himenaeos netus vel dapibus nibh malesuada. \n</p>\n<p>\nLeo fusce tortor sociosqu semper facilisis semper class tempus faucibus tristique, duis eros cubilia quisque habitasse aliquam fringilla orci non vel, laoreet dolor enim justo facilisis neque accumsan in ad. \nVenenatis hac per dictumst nulla ligula donec mollis massa porttitor ullamcorper risus, eu platea fringilla habitasse suscipit pellentesque donec est habitant vehicula tempor, ultrices placerat sociosqu ultrices consectetur ullamcorper tincidunt quisque tellus ante. \nNostra euismod nec suspendisse sem curabitur elit malesuada lacus viverra sagittis, sit ornare orci augue nullam adipiscing pulvinar libero aliquam vestibulum, platea cursus pellentesque leo dui lectus curabitur euismod ad. \n</p>\n<p>\nErat curae non elit ultrices placerat netus, metus feugiat non conubia fusce porttitor sociosqu, diam commodo metus in himenaeos. \nVitae aptent consequat luctus purus eleifend enim sollicitudin eleifend porta, malesuada ac class conubia condimentum mauris facilisis conubia quis scelerisque, lacinia tempus nullam felis fusce ac potenti netus. \nOrnare semper molestie iaculis fermentum ornare curabitur tincidunt imperdiet scelerisque imperdiet euismod scelerisque torquent curae, rhoncus sollicitudin tortor placerat aptent hac nec posuere suscipit sed tortor neque urna. \nHendrerit vehicula duis litora tristique congue nec auctor felis libero ornare, habitasse nec elit felis inceptos tellus inceptos cubilia quis mattis, faucibus sem non odio fringilla class aliquam metus ipsum. \n</p>\n<p>\nLorem luctus pharetra dictum vehicula, tempus in venenatis. \n</p>', 0, 1, 2);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Дамп данных таблицы `roles`
--

INSERT INTO `roles` (`id`, `title`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', 'admin', '2015-05-21 03:45:00', '2015-05-21 03:45:00'),
(2, 'Redactor', 'redac', '2015-05-21 03:45:00', '2015-05-21 03:45:00'),
(3, 'User', 'user', '2015-05-21 03:45:00', '2015-05-21 03:45:00'),
(4, 'Administrator', 'admin', '2015-05-21 04:06:18', '2015-05-21 04:06:18'),
(5, 'Redactor', 'redac', '2015-05-21 04:06:18', '2015-05-21 04:06:18'),
(6, 'User', 'user', '2015-05-21 04:06:18', '2015-05-21 04:06:18');

-- --------------------------------------------------------

--
-- Структура таблицы `services`
--

CREATE TABLE IF NOT EXISTS `services` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `type` int(11) NOT NULL,
  `cost` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Дамп данных таблицы `services`
--

INSERT INTO `services` (`id`, `title`, `content`, `type`, `cost`) VALUES
(1, 'Шпаклевка', 'Шпаклюем на ура, оп оп опа нихуя оп оп ди сюда на!И последнее: графические файлы иногда имеют довольно большой размер, убедитесь, что настройки сервера позволяют работать с таким объемом данных. В файле php.ini это директивы post_max_size - определяет максимальный объем данных передаваемых методом POST, и upload_max_filesize - определяет максимальный размер загружаемого файла. Так же проверьте, позволяют ли настройки MySQL обрабатывать запросы с большим объемом данных (директива max_allowed_packet файла my.ini).', 1, 500),
(2, 'Шпаклевка', 'Шпаклюем на ура, оп оп опа нихуя оп оп ди сюда на!И последнее: графические файлы иногда имеют довольно большой размер, убедитесь, что настройки сервера позволяют работать с таким объемом данных. В файле php.ini это директивы post_max_size - определяет максимальный объем данных передаваемых методом POST, и upload_max_filesize - определяет максимальный размер загружаемого файла. Так же проверьте, позволяют ли настройки MySQL обрабатывать запросы с большим объемом данных (директива max_allowed_packet файла my.ini).', 1, 500);

-- --------------------------------------------------------

--
-- Структура таблицы `service_materials`
--

CREATE TABLE IF NOT EXISTS `service_materials` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `service_id` int(10) unsigned NOT NULL,
  `material_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `service_materials_service_id_foreign` (`service_id`),
  KEY `service_materials_material_id_foreign` (`material_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

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
(1, '2015-05-21 03:45:01', '2015-05-21 03:45:01', 'Tag1'),
(2, '2015-05-21 03:45:01', '2015-05-21 03:45:01', 'Tag2'),
(3, '2015-05-21 03:45:01', '2015-05-21 03:45:01', 'Tag3'),
(4, '2015-05-21 03:45:01', '2015-05-21 03:45:01', 'Tag4');

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
(1, 'GreatAdmin', 'admin@la.fr', '$2y$10$GaJMl7FVfkVu.O.tvC3lROtcI/BCyAMQkadm7pnf0PXy.gjdIFLKe', 1, 1, 0, '2015-05-21 03:45:00', '2015-05-28 06:56:11', 'OYun7KWYnTzIGjPtP1MDnCU3B4hw6nmwVX2WkLOFENFMdlRmRUZ13IxwdRPD'),
(2, 'GreatRedactor', 'redac@la.fr', '$2y$10$sT4nXpgqETfSrpi3VPEgbeozjIkrYUKcEgsZQkL/a5Oit/xyfZPJW', 2, 1, 1, '2015-05-21 03:45:00', '2015-05-21 03:45:00', NULL),
(3, 'Walker', 'walker@la.fr', '$2y$10$oTAfuxxskok99Mw10H2rOuuQRFcXJo2zu8PmvZM4lScz3kNzFw0jq', 3, 0, 0, '2015-05-21 03:45:01', '2015-05-21 03:45:01', NULL),
(4, 'Slacker', 'slacker@la.fr', '$2y$10$K.TzZD.ZuxyK.gvaNddg0.mMd6CpuNmlHg67aVUCnQIc5MtkQi9q2', 3, 0, 0, '2015-05-21 03:45:01', '2015-05-21 03:45:01', NULL),
(5, 'Yunus', 'Yunus_07@mail.ru', '$2y$10$wPW8wfHGABpM1Tq/v/hMneCSZk/5MdU660NSSWdKZr8TCuMCFz9O.', 1, 1, 0, '2015-05-28 06:55:03', '2015-05-28 06:56:04', NULL);

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
  ADD CONSTRAINT `service_materials_material_id_foreign` FOREIGN KEY (`material_id`) REFERENCES `materials` (`id`),
  ADD CONSTRAINT `service_materials_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`);

--
-- Ограничения внешнего ключа таблицы `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
