2. Используя сервис http://filldb.info или другой по вашему желанию, сгенерировать тестовые данные для всех таблиц, учитывая логику связей. Для всех таблиц, где это имеет смысл, создать не менее 100 строк. Загрузить тестовые данные.

#
# TABLE STRUCTURE FOR: users
#

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `users` (`id`, `first_name`, `last_name`, `phone`, `created_at`, `updated_at`) VALUES (1, 'Jalen', 'Lubowitz', '741-585-2266', '2011-03-08 22:55:57', '1981-10-10 15:40:59');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `phone`, `created_at`, `updated_at`) VALUES (2, 'Geoffrey', 'Krajcik', '1-512-579-6879x8', '2019-01-27 09:38:44', '1971-01-13 19:01:41');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `phone`, `created_at`, `updated_at`) VALUES (3, 'Donavon', 'Hermann', '1-399-111-8992x5', '1988-09-15 04:07:09', '1980-01-27 08:29:12');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `phone`, `created_at`, `updated_at`) VALUES (4, 'Jacklyn', 'Will', '869-893-1994', '2002-05-13 22:03:08', '2009-04-07 00:13:02');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `phone`, `created_at`, `updated_at`) VALUES (5, 'Sincere', 'Connelly', '1-375-606-5244', '1989-03-04 11:34:20', '2016-10-15 02:34:53');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `phone`, `created_at`, `updated_at`) VALUES (6, 'Delpha', 'Daniel', '(824)963-8433', '2019-09-20 03:50:03', '1977-06-02 10:29:02');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `phone`, `created_at`, `updated_at`) VALUES (7, 'Jennie', 'Schmitt', '00160777876', '1983-10-12 02:08:12', '1987-09-07 09:32:14');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `phone`, `created_at`, `updated_at`) VALUES (8, 'Keith', 'Kutch', '296-356-5287', '1996-07-26 11:16:46', '1976-06-22 12:27:29');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `phone`, `created_at`, `updated_at`) VALUES (9, 'Lonie', 'Padberg', '1-551-623-7899', '1979-03-13 20:09:05', '1981-04-11 02:52:12');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `phone`, `created_at`, `updated_at`) VALUES (10, 'Wyman', 'Bode', '774-931-9661', '1994-11-16 15:18:31', '2015-08-13 21:48:18');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `phone`, `created_at`, `updated_at`) VALUES (11, 'Deshaun', 'Sporer', '1-673-526-4813', '1980-08-26 05:13:35', '2013-05-03 15:26:28');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `phone`, `created_at`, `updated_at`) VALUES (12, 'Valentine', 'Kuhic', '661.386.3533x817', '2007-05-14 05:48:48', '1999-10-05 18:54:13');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `phone`, `created_at`, `updated_at`) VALUES (13, 'Della', 'Dickinson', '09513605189', '1977-02-14 01:44:49', '2016-12-01 19:31:43');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `phone`, `created_at`, `updated_at`) VALUES (14, 'Randi', 'O\'Connell', '1-362-283-3234x2', '1973-04-13 10:31:23', '2005-09-23 05:52:04');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `phone`, `created_at`, `updated_at`) VALUES (15, 'Ottis', 'Waelchi', '(655)163-9599x12', '2009-04-15 18:54:05', '1998-11-07 08:19:12');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `phone`, `created_at`, `updated_at`) VALUES (16, 'Corene', 'Dickinson', '063-578-6156', '2016-09-26 12:37:27', '2001-05-09 10:16:27');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `phone`, `created_at`, `updated_at`) VALUES (17, 'Zelda', 'Windler', '(419)136-6388x48', '2010-07-10 08:51:35', '1972-07-17 10:23:05');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `phone`, `created_at`, `updated_at`) VALUES (18, 'Shaina', 'Daugherty', '1-278-907-5920x1', '1983-08-29 15:15:48', '2007-02-06 02:44:45');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `phone`, `created_at`, `updated_at`) VALUES (19, 'Kathryn', 'Dickinson', '726.536.0770', '2005-08-01 16:03:31', '1975-05-29 12:32:39');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `phone`, `created_at`, `updated_at`) VALUES (20, 'Olin', 'Hayes', '(205)465-5135x84', '2008-04-18 09:22:01', '2005-11-02 00:02:52');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `phone`, `created_at`, `updated_at`) VALUES (21, 'Anya', 'Goldner', '501-785-4530x369', '1987-05-22 09:55:22', '2018-10-19 01:19:10');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `phone`, `created_at`, `updated_at`) VALUES (22, 'Minnie', 'Champlin', '616.006.8354x478', '2011-01-21 21:28:52', '1974-08-25 11:11:59');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `phone`, `created_at`, `updated_at`) VALUES (23, 'Linda', 'Satterfield', '705.667.7170x638', '1999-03-29 22:02:25', '1974-02-15 15:35:05');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `phone`, `created_at`, `updated_at`) VALUES (24, 'Jaida', 'Hauck', '1-444-715-2826', '1977-06-02 11:04:12', '1986-11-14 09:01:12');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `phone`, `created_at`, `updated_at`) VALUES (25, 'Elmo', 'Lowe', '265.326.4129x285', '2007-10-18 13:54:28', '2007-12-07 08:29:30');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `phone`, `created_at`, `updated_at`) VALUES (26, 'Lennie', 'Connelly', '863.201.9406x903', '1998-01-29 10:51:43', '1974-09-08 14:28:49');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `phone`, `created_at`, `updated_at`) VALUES (27, 'Devon', 'Nader', '018.939.8955', '2017-10-26 03:54:59', '1982-11-24 00:22:14');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `phone`, `created_at`, `updated_at`) VALUES (28, 'Opal', 'White', '1-720-974-6300x2', '2018-11-08 02:09:07', '1991-08-27 06:19:32');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `phone`, `created_at`, `updated_at`) VALUES (29, 'Camron', 'Toy', '139.179.0114x747', '2012-11-02 21:55:16', '2005-07-05 15:39:16');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `phone`, `created_at`, `updated_at`) VALUES (30, 'Pink', 'Langosh', '432.183.0328x398', '1987-09-05 10:49:48', '1993-06-08 10:32:38');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `phone`, `created_at`, `updated_at`) VALUES (31, 'Harry', 'Hoppe', '973-352-6656x567', '2011-02-19 14:46:31', '1991-11-28 18:24:19');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `phone`, `created_at`, `updated_at`) VALUES (32, 'Emil', 'Ankunding', '(221)916-7280x16', '1973-10-08 13:14:38', '1987-09-21 04:19:29');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `phone`, `created_at`, `updated_at`) VALUES (33, 'Cindy', 'Trantow', '881-440-5982', '1995-10-08 19:45:23', '1976-04-18 08:30:10');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `phone`, `created_at`, `updated_at`) VALUES (34, 'Kali', 'Torphy', '241-462-7270x829', '1976-06-28 07:23:52', '2008-09-24 15:34:44');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `phone`, `created_at`, `updated_at`) VALUES (35, 'Zachariah', 'Waelchi', '(492)741-9749x27', '2000-05-20 21:05:17', '1983-09-07 08:58:45');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `phone`, `created_at`, `updated_at`) VALUES (36, 'Effie', 'Bechtelar', '237.527.9622', '1995-07-09 12:42:04', '1984-12-31 20:12:37');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `phone`, `created_at`, `updated_at`) VALUES (37, 'Vida', 'Sporer', '885-864-9275', '1980-09-23 18:42:44', '2014-10-23 07:26:36');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `phone`, `created_at`, `updated_at`) VALUES (38, 'Aletha', 'Champlin', '438.065.0379x734', '1999-05-07 18:44:46', '2000-09-22 18:44:14');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `phone`, `created_at`, `updated_at`) VALUES (39, 'Torrey', 'Barton', '046.386.5268x022', '2017-01-07 12:55:43', '1991-01-20 09:01:59');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `phone`, `created_at`, `updated_at`) VALUES (40, 'Ned', 'Cassin', '748.605.3763x518', '1975-02-08 19:06:14', '1993-04-18 09:08:16');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `phone`, `created_at`, `updated_at`) VALUES (41, 'Torrey', 'Marquardt', '1-608-534-1792', '1978-04-27 03:26:09', '2000-10-17 11:01:34');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `phone`, `created_at`, `updated_at`) VALUES (42, 'Benedict', 'Schulist', '(989)042-3611', '1977-08-31 00:33:55', '1974-10-20 15:17:28');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `phone`, `created_at`, `updated_at`) VALUES (43, 'Kelli', 'Eichmann', '494-917-4456', '1994-10-27 10:40:52', '2013-08-18 09:54:08');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `phone`, `created_at`, `updated_at`) VALUES (44, 'Naomie', 'Walter', '943.820.5176x559', '1987-01-19 08:34:00', '2003-05-21 13:43:51');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `phone`, `created_at`, `updated_at`) VALUES (45, 'Jeanne', 'Jones', '1-301-150-4520', '1971-09-19 10:03:57', '1988-03-28 00:16:22');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `phone`, `created_at`, `updated_at`) VALUES (46, 'Stefanie', 'Gutmann', '635.310.3400', '1974-02-10 22:17:45', '1996-01-15 15:43:34');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `phone`, `created_at`, `updated_at`) VALUES (47, 'Darrion', 'Beier', '084.915.4382', '2009-09-22 21:12:44', '1994-08-28 02:37:33');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `phone`, `created_at`, `updated_at`) VALUES (48, 'Dovie', 'Volkman', '(419)293-3227x32', '1995-07-03 09:54:40', '1990-05-31 13:11:23');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `phone`, `created_at`, `updated_at`) VALUES (49, 'Leopold', 'Konopelski', '(912)376-9989', '1976-04-26 21:12:25', '1998-03-06 00:54:14');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `phone`, `created_at`, `updated_at`) VALUES (50, 'Roman', 'Steuber', '1-427-144-7771x2', '1993-02-22 16:50:02', '2001-07-07 13:13:41');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `phone`, `created_at`, `updated_at`) VALUES (51, 'Ally', 'Hyatt', '(516)272-0087x68', '2018-02-25 17:35:23', '2014-09-30 10:38:10');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `phone`, `created_at`, `updated_at`) VALUES (52, 'Tommie', 'McGlynn', '01897473281', '2002-04-08 22:34:50', '2017-11-01 00:50:16');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `phone`, `created_at`, `updated_at`) VALUES (53, 'Bertrand', 'Kunze', '985.375.5725x633', '1981-09-14 16:46:05', '1980-07-06 03:00:38');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `phone`, `created_at`, `updated_at`) VALUES (54, 'Zackery', 'Wisoky', '(552)482-5903', '2004-01-19 08:49:09', '2001-04-01 21:20:59');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `phone`, `created_at`, `updated_at`) VALUES (55, 'Della', 'Leffler', '242.789.7511', '2010-11-22 09:05:05', '1996-10-01 04:24:49');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `phone`, `created_at`, `updated_at`) VALUES (56, 'Harley', 'Kerluke', '790-208-6495x708', '1976-05-11 11:27:53', '1973-12-10 19:24:21');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `phone`, `created_at`, `updated_at`) VALUES (57, 'Charles', 'Harris', '947.373.1519x579', '2016-01-05 01:00:25', '1972-09-13 08:55:31');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `phone`, `created_at`, `updated_at`) VALUES (58, 'Jaquan', 'Gorczany', '1-664-151-5931', '2005-11-03 20:12:14', '1998-04-08 11:43:20');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `phone`, `created_at`, `updated_at`) VALUES (59, 'Marc', 'Kuphal', '410-578-0127', '1985-02-16 15:10:42', '2018-05-09 00:30:54');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `phone`, `created_at`, `updated_at`) VALUES (60, 'Sierra', 'Hackett', '1-868-586-0807x0', '2010-02-17 01:22:28', '1998-09-09 14:34:21');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `phone`, `created_at`, `updated_at`) VALUES (61, 'Lucas', 'Williamson', '974-194-5369', '1987-07-18 17:13:22', '2019-08-25 03:28:33');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `phone`, `created_at`, `updated_at`) VALUES (62, 'Reba', 'Lueilwitz', '(272)323-9194', '2015-04-22 07:52:40', '2019-10-05 06:40:12');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `phone`, `created_at`, `updated_at`) VALUES (63, 'Carlie', 'Hills', '702-967-5328x090', '2005-02-15 13:45:33', '2010-12-17 02:07:48');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `phone`, `created_at`, `updated_at`) VALUES (64, 'Aurelia', 'Mohr', '(352)921-7057', '1993-12-21 15:49:15', '2004-06-12 00:24:08');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `phone`, `created_at`, `updated_at`) VALUES (65, 'Jedediah', 'Moen', '(562)516-3873', '2011-11-05 18:05:08', '2004-02-29 15:51:15');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `phone`, `created_at`, `updated_at`) VALUES (66, 'Rowland', 'Mills', '395-905-6475x773', '1975-10-01 05:19:11', '2008-03-15 04:39:25');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `phone`, `created_at`, `updated_at`) VALUES (67, 'Santa', 'Rowe', '1-513-323-8200x9', '1987-03-26 06:16:44', '1986-09-07 04:26:57');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `phone`, `created_at`, `updated_at`) VALUES (68, 'Margie', 'Rohan', '(023)713-0891x90', '1990-05-05 22:42:59', '1998-11-19 06:52:16');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `phone`, `created_at`, `updated_at`) VALUES (69, 'Damon', 'Schoen', '299.975.2662x136', '1972-05-02 18:25:59', '2011-09-05 00:26:24');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `phone`, `created_at`, `updated_at`) VALUES (70, 'Vinnie', 'Ferry', '999-546-4166', '2000-07-15 22:20:34', '1991-08-19 20:16:58');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `phone`, `created_at`, `updated_at`) VALUES (71, 'Tanner', 'Christiansen', '698-080-8410x014', '2001-03-25 14:06:38', '2010-07-08 10:42:19');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `phone`, `created_at`, `updated_at`) VALUES (72, 'Lew', 'Baumbach', '(938)592-8645', '2004-09-03 03:36:00', '1977-06-11 07:02:25');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `phone`, `created_at`, `updated_at`) VALUES (73, 'Tremaine', 'Wuckert', '1-545-751-6781x4', '1970-11-05 21:46:31', '1987-07-09 22:01:36');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `phone`, `created_at`, `updated_at`) VALUES (74, 'Rocky', 'Hyatt', '923.030.1866x233', '2004-12-29 15:37:06', '2012-10-22 02:13:26');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `phone`, `created_at`, `updated_at`) VALUES (75, 'Evan', 'Ledner', '(829)482-5415', '2008-02-01 18:40:19', '2006-12-28 03:38:18');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `phone`, `created_at`, `updated_at`) VALUES (76, 'Madelyn', 'Hoeger', '397.087.1601x188', '1995-12-18 06:20:32', '1975-01-08 00:14:03');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `phone`, `created_at`, `updated_at`) VALUES (77, 'Paula', 'Farrell', '+78(6)8817377988', '1999-09-16 06:52:58', '2000-11-06 06:57:19');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `phone`, `created_at`, `updated_at`) VALUES (78, 'Trace', 'Zieme', '411.235.8622x882', '1997-10-10 05:15:49', '1981-12-26 22:31:24');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `phone`, `created_at`, `updated_at`) VALUES (79, 'Nichole', 'Jakubowski', '(379)300-5159x03', '1970-06-29 10:30:40', '1987-03-31 12:09:16');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `phone`, `created_at`, `updated_at`) VALUES (80, 'Carleton', 'Parker', '1-924-632-3214', '1979-08-06 20:47:59', '1998-12-31 21:18:20');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `phone`, `created_at`, `updated_at`) VALUES (81, 'Jeanette', 'Klocko', '(236)283-3709', '2014-11-24 09:03:11', '1989-05-02 09:58:50');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `phone`, `created_at`, `updated_at`) VALUES (82, 'Joe', 'Sawayn', '972.205.6361x554', '1998-02-20 19:40:17', '2014-03-02 19:23:02');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `phone`, `created_at`, `updated_at`) VALUES (83, 'Kade', 'Harber', '08451300676', '1990-02-04 19:56:11', '2014-06-05 09:30:24');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `phone`, `created_at`, `updated_at`) VALUES (84, 'Brenna', 'Kulas', '460-278-2779', '2012-10-06 17:40:19', '1994-07-10 09:16:26');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `phone`, `created_at`, `updated_at`) VALUES (85, 'Jameson', 'Metz', '071.197.7792', '1978-02-17 12:23:40', '2014-01-26 16:16:45');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `phone`, `created_at`, `updated_at`) VALUES (86, 'Reynold', 'Mann', '(689)023-5485x04', '1977-08-10 18:08:34', '1995-07-09 11:25:13');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `phone`, `created_at`, `updated_at`) VALUES (87, 'Nikita', 'Larkin', '451.590.7630x260', '1979-08-22 03:23:53', '1994-02-20 00:08:57');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `phone`, `created_at`, `updated_at`) VALUES (88, 'Garrick', 'Hartmann', '+65(2)0954776200', '1988-08-16 15:28:15', '1988-02-21 16:40:26');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `phone`, `created_at`, `updated_at`) VALUES (89, 'Destinee', 'Lehner', '(348)359-7922', '1994-01-16 17:56:08', '2003-03-24 02:34:04');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `phone`, `created_at`, `updated_at`) VALUES (90, 'Emil', 'Satterfield', '1-794-910-7800x8', '1972-12-03 17:42:47', '1997-12-07 00:52:24');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `phone`, `created_at`, `updated_at`) VALUES (91, 'Judge', 'Harvey', '09111580166', '1981-01-31 05:01:26', '1977-08-27 02:13:44');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `phone`, `created_at`, `updated_at`) VALUES (92, 'Randal', 'Ernser', '(718)908-6609x25', '1998-10-06 10:44:31', '1984-11-03 22:01:30');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `phone`, `created_at`, `updated_at`) VALUES (93, 'Guy', 'Fay', '(545)037-3555x48', '1973-02-07 09:13:23', '1999-06-25 14:17:08');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `phone`, `created_at`, `updated_at`) VALUES (94, 'Charity', 'Leuschke', '(343)141-4695x47', '1997-02-26 19:48:13', '2010-12-21 17:50:09');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `phone`, `created_at`, `updated_at`) VALUES (95, 'Kaleb', 'Schuppe', '021.321.2958x860', '1980-06-16 11:35:09', '2007-04-20 13:30:11');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `phone`, `created_at`, `updated_at`) VALUES (96, 'Aniya', 'Bartoletti', '261.806.8811x369', '2009-06-17 03:42:57', '1993-08-24 23:20:19');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `phone`, `created_at`, `updated_at`) VALUES (97, 'Rossie', 'Mayer', '226.259.0273x415', '1971-09-06 20:14:08', '1983-04-22 20:34:35');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `phone`, `created_at`, `updated_at`) VALUES (98, 'Julien', 'Nolan', '(927)256-9244', '1992-10-20 11:10:36', '2008-10-16 23:37:37');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `phone`, `created_at`, `updated_at`) VALUES (99, 'Giovanny', 'Hamill', '1-104-419-5314', '1985-12-20 18:17:45', '1980-12-20 01:34:55');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `phone`, `created_at`, `updated_at`) VALUES (100, 'Tyree', 'Bernier', '1-732-138-9879x5', '1983-11-24 14:43:04', '2012-11-05 04:48:16');




#
# TABLE STRUCTURE FOR: communities
#

DROP TABLE IF EXISTS `communities`;

CREATE TABLE `communities` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `communities` (`id`, `name`) VALUES (14, 'culpa');
INSERT INTO `communities` (`id`, `name`) VALUES (3, 'cum');
INSERT INTO `communities` (`id`, `name`) VALUES (8, 'dolore');
INSERT INTO `communities` (`id`, `name`) VALUES (20, 'dolores');
INSERT INTO `communities` (`id`, `name`) VALUES (9, 'et');
INSERT INTO `communities` (`id`, `name`) VALUES (6, 'eum');
INSERT INTO `communities` (`id`, `name`) VALUES (10, 'exercitationem');
INSERT INTO `communities` (`id`, `name`) VALUES (1, 'laboriosam');
INSERT INTO `communities` (`id`, `name`) VALUES (2, 'molestiae');
INSERT INTO `communities` (`id`, `name`) VALUES (18, 'possimus');
INSERT INTO `communities` (`id`, `name`) VALUES (16, 'provident');
INSERT INTO `communities` (`id`, `name`) VALUES (11, 'qui');
INSERT INTO `communities` (`id`, `name`) VALUES (17, 'quia');
INSERT INTO `communities` (`id`, `name`) VALUES (4, 'quis');
INSERT INTO `communities` (`id`, `name`) VALUES (7, 'quo');
INSERT INTO `communities` (`id`, `name`) VALUES (13, 'sunt');
INSERT INTO `communities` (`id`, `name`) VALUES (19, 'suscipit');
INSERT INTO `communities` (`id`, `name`) VALUES (5, 'tempora');
INSERT INTO `communities` (`id`, `name`) VALUES (12, 'ut');
INSERT INTO `communities` (`id`, `name`) VALUES (15, 'voluptas');


#
# TABLE STRUCTURE FOR: communities_users
#

DROP TABLE IF EXISTS `communities_users`;

CREATE TABLE `communities_users` (
  `community_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`community_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (1, 1);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (1, 21);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (1, 41);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (1, 61);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (1, 81);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (2, 2);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (2, 22);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (2, 42);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (2, 62);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (2, 82);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (3, 3);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (3, 23);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (3, 43);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (3, 63);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (3, 83);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (4, 4);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (4, 24);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (4, 44);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (4, 64);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (4, 84);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (5, 5);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (5, 25);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (5, 45);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (5, 65);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (5, 85);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (6, 6);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (6, 26);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (6, 46);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (6, 66);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (6, 86);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (7, 7);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (7, 27);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (7, 47);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (7, 67);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (7, 87);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (8, 8);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (8, 28);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (8, 48);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (8, 68);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (8, 88);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (9, 9);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (9, 29);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (9, 49);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (9, 69);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (9, 89);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (10, 10);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (10, 30);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (10, 50);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (10, 70);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (10, 90);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (11, 11);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (11, 31);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (11, 51);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (11, 71);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (11, 91);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (12, 12);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (12, 32);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (12, 52);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (12, 72);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (12, 92);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (13, 13);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (13, 33);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (13, 53);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (13, 73);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (13, 93);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (14, 14);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (14, 34);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (14, 54);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (14, 74);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (14, 94);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (15, 15);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (15, 35);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (15, 55);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (15, 75);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (15, 95);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (16, 16);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (16, 36);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (16, 56);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (16, 76);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (16, 96);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (17, 17);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (17, 37);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (17, 57);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (17, 77);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (17, 97);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (18, 18);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (18, 38);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (18, 58);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (18, 78);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (18, 98);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (19, 19);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (19, 39);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (19, 59);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (19, 79);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (19, 99);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (20, 20);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (20, 40);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (20, 60);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (20, 80);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (20, 100);


#
# TABLE STRUCTURE FOR: friendship
#

DROP TABLE IF EXISTS `friendship`;

CREATE TABLE `friendship` (
  `user_id` int(10) unsigned NOT NULL,
  `friend_id` int(10) unsigned NOT NULL,
  `status` enum('requested','confirmed','interrupted') COLLATE utf8_unicode_ci NOT NULL,
  `requested_at` datetime DEFAULT current_timestamp(),
  `confirmed_at` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`,`friend_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`) VALUES (1, 78, 'interrupted', '1981-10-21 17:08:59', '2011-03-31 00:29:51');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`) VALUES (2, 73, 'interrupted', '1992-05-07 14:44:33', '1981-03-08 13:08:44');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`) VALUES (3, 37, 'confirmed', '1977-10-02 23:49:36', '1971-08-23 01:42:48');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`) VALUES (4, 64, 'interrupted', '1981-01-17 17:32:22', '1997-02-22 15:07:53');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`) VALUES (5, 24, 'confirmed', '2019-11-20 21:11:12', '1983-04-11 01:19:42');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`) VALUES (6, 64, 'interrupted', '2005-03-15 11:47:01', '1992-11-01 00:55:11');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`) VALUES (7, 45, 'confirmed', '2012-08-02 02:13:21', '2002-05-31 10:02:19');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`) VALUES (8, 78, 'interrupted', '2015-12-10 09:36:20', '2007-11-10 21:48:44');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`) VALUES (9, 55, 'interrupted', '1998-09-01 14:23:46', '1998-04-14 15:59:03');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`) VALUES (10, 21, 'interrupted', '2015-09-06 07:27:11', '1980-05-04 14:27:41');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`) VALUES (11, 92, 'confirmed', '1998-11-08 20:53:10', '1983-11-01 03:17:33');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`) VALUES (12, 48, 'requested', '1993-10-14 23:48:42', '1984-06-14 15:09:39');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`) VALUES (13, 16, 'confirmed', '1998-03-20 15:01:45', '1981-10-13 03:43:14');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`) VALUES (14, 15, 'confirmed', '1971-10-18 19:42:55', '1987-05-12 13:54:05');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`) VALUES (15, 82, 'interrupted', '1972-01-30 12:21:59', '1994-01-14 13:05:13');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`) VALUES (16, 100, 'requested', '1996-05-02 11:07:03', '1971-06-10 00:08:38');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`) VALUES (17, 100, 'requested', '1991-10-24 21:21:44', '1971-06-19 20:45:17');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`) VALUES (18, 18, 'confirmed', '1977-01-13 18:29:41', '1976-10-17 04:39:22');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`) VALUES (19, 27, 'requested', '1987-04-28 12:03:16', '1976-02-21 02:48:03');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`) VALUES (20, 61, 'interrupted', '1978-01-12 04:40:37', '2013-03-26 22:36:31');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`) VALUES (21, 90, 'interrupted', '2017-12-27 21:46:19', '1978-09-01 02:40:15');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`) VALUES (22, 76, 'requested', '1992-11-12 07:17:57', '2017-07-14 11:30:29');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`) VALUES (23, 32, 'confirmed', '2007-05-30 02:48:06', '2009-04-21 14:50:21');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`) VALUES (24, 20, 'requested', '1982-01-10 13:01:38', '2001-02-23 07:40:23');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`) VALUES (25, 69, 'interrupted', '2009-10-19 01:40:19', '1978-08-02 00:55:26');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`) VALUES (26, 16, 'confirmed', '2000-01-04 19:51:30', '2016-05-26 17:52:42');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`) VALUES (27, 31, 'confirmed', '1994-09-02 03:46:08', '1985-05-08 02:19:22');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`) VALUES (28, 10, 'interrupted', '2007-01-17 03:34:57', '1979-12-10 07:54:37');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`) VALUES (29, 53, 'confirmed', '2013-07-30 13:17:24', '2008-05-02 19:22:42');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`) VALUES (30, 4, 'confirmed', '1977-05-02 10:07:50', '1980-04-17 20:16:24');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`) VALUES (31, 47, 'requested', '1986-11-23 13:21:46', '1986-01-02 07:23:04');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`) VALUES (32, 40, 'confirmed', '2013-12-19 01:42:17', '1978-11-19 01:42:37');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`) VALUES (33, 53, 'confirmed', '2000-06-15 01:01:08', '1988-03-14 03:21:02');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`) VALUES (34, 27, 'requested', '2009-03-28 19:17:58', '1977-11-30 01:36:12');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`) VALUES (35, 35, 'interrupted', '2014-07-21 03:24:01', '2015-10-17 10:14:36');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`) VALUES (36, 55, 'confirmed', '2018-02-07 03:06:43', '1974-08-03 11:33:48');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`) VALUES (37, 72, 'confirmed', '2013-12-07 11:20:13', '1997-03-31 07:25:29');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`) VALUES (38, 42, 'requested', '1991-10-17 04:33:14', '2003-11-19 16:28:49');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`) VALUES (39, 61, 'confirmed', '1982-05-05 14:21:30', '1981-10-11 22:50:43');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`) VALUES (40, 99, 'interrupted', '1987-07-08 23:12:04', '1995-09-13 13:36:36');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`) VALUES (41, 49, 'requested', '2012-12-12 18:11:03', '1995-02-18 05:23:36');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`) VALUES (42, 86, 'interrupted', '1992-01-18 09:33:29', '1970-08-02 04:17:56');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`) VALUES (43, 47, 'confirmed', '1994-01-03 10:38:11', '1976-11-17 19:41:11');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`) VALUES (44, 100, 'requested', '2000-10-30 02:58:06', '1994-04-23 17:48:54');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`) VALUES (45, 48, 'requested', '1991-07-08 15:50:34', '1970-11-28 10:53:50');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`) VALUES (46, 95, 'interrupted', '1989-05-06 20:27:57', '2015-02-11 08:05:51');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`) VALUES (47, 37, 'interrupted', '1984-11-24 13:28:22', '2004-08-07 19:24:09');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`) VALUES (48, 60, 'interrupted', '1974-02-13 19:18:24', '1982-02-22 04:13:38');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`) VALUES (49, 81, 'confirmed', '1994-08-29 05:59:28', '1985-05-14 11:54:46');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`) VALUES (50, 92, 'confirmed', '2013-01-16 17:24:03', '2008-07-24 05:57:58');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`) VALUES (51, 72, 'requested', '2000-10-20 06:42:45', '1999-07-14 12:30:12');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`) VALUES (52, 55, 'requested', '2013-01-05 06:21:21', '2013-01-25 19:50:36');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`) VALUES (53, 25, 'confirmed', '1973-03-09 13:15:20', '1981-09-14 11:31:34');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`) VALUES (54, 89, 'interrupted', '2005-02-13 06:11:01', '2012-11-27 10:00:53');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`) VALUES (55, 52, 'requested', '1999-03-17 10:16:50', '2006-12-06 15:57:49');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`) VALUES (56, 29, 'confirmed', '2009-02-21 11:09:55', '2012-05-24 12:10:39');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`) VALUES (57, 10, 'requested', '1972-09-20 06:39:52', '2010-09-24 11:39:38');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`) VALUES (58, 47, 'confirmed', '1985-12-10 11:46:24', '2017-02-20 04:03:00');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`) VALUES (59, 47, 'confirmed', '1993-08-18 05:59:43', '1988-05-06 04:07:08');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`) VALUES (60, 91, 'requested', '2015-08-09 22:49:12', '2009-07-31 03:44:16');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`) VALUES (61, 25, 'requested', '1995-02-10 03:21:27', '1983-05-14 15:59:09');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`) VALUES (62, 6, 'interrupted', '2007-07-03 16:33:32', '2019-01-25 15:06:25');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`) VALUES (63, 10, 'requested', '1990-05-03 07:24:02', '1970-12-05 04:49:44');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`) VALUES (64, 60, 'confirmed', '2017-01-17 19:02:17', '2009-07-30 01:20:15');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`) VALUES (65, 83, 'interrupted', '1978-03-20 23:42:51', '1970-12-17 18:46:47');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`) VALUES (66, 91, 'confirmed', '1987-08-27 03:16:32', '2006-02-06 14:37:51');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`) VALUES (67, 13, 'confirmed', '1974-04-04 01:14:20', '1970-07-12 13:17:35');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`) VALUES (68, 38, 'requested', '2007-01-15 18:09:39', '1993-10-29 19:10:44');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`) VALUES (69, 65, 'interrupted', '1987-02-26 15:05:24', '1975-06-16 06:00:47');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`) VALUES (70, 58, 'requested', '2006-08-28 13:51:10', '2016-08-04 20:22:42');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`) VALUES (71, 94, 'requested', '2012-11-25 16:34:08', '1980-04-10 18:15:36');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`) VALUES (72, 71, 'interrupted', '2008-06-08 14:53:19', '1991-05-31 07:18:57');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`) VALUES (73, 84, 'interrupted', '2016-06-11 06:31:52', '2017-02-10 07:31:51');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`) VALUES (74, 65, 'interrupted', '2014-12-19 01:05:44', '1985-06-11 05:56:48');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`) VALUES (75, 16, 'requested', '1973-09-26 12:53:38', '1991-09-25 10:59:19');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`) VALUES (76, 43, 'confirmed', '2010-02-15 06:43:37', '1984-06-14 00:12:25');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`) VALUES (77, 15, 'interrupted', '2006-06-11 05:23:12', '1999-08-29 00:28:16');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`) VALUES (78, 99, 'requested', '2008-08-31 16:56:34', '1971-04-27 18:09:25');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`) VALUES (79, 58, 'requested', '1991-03-09 16:53:09', '2018-06-27 18:17:47');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`) VALUES (80, 21, 'confirmed', '1975-12-31 22:35:05', '2013-07-06 02:48:03');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`) VALUES (81, 54, 'requested', '1981-12-27 22:00:21', '1974-07-29 19:39:29');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`) VALUES (82, 39, 'confirmed', '1975-04-22 06:21:55', '1997-02-03 17:19:03');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`) VALUES (83, 16, 'interrupted', '2012-06-22 11:02:47', '2013-08-18 20:59:11');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`) VALUES (84, 98, 'interrupted', '1990-08-01 21:14:54', '1984-05-30 15:41:42');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`) VALUES (85, 72, 'requested', '1974-12-26 11:15:46', '2014-11-28 11:35:51');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`) VALUES (86, 3, 'confirmed', '2014-11-05 18:01:42', '1982-11-28 18:52:16');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`) VALUES (87, 11, 'interrupted', '1992-10-11 05:16:00', '1990-09-27 09:15:28');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`) VALUES (88, 9, 'interrupted', '1983-08-02 13:37:33', '1978-07-11 03:11:32');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`) VALUES (89, 8, 'interrupted', '2019-01-08 19:42:47', '2000-04-11 09:10:44');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`) VALUES (90, 74, 'interrupted', '2003-12-07 18:49:35', '2001-02-12 23:36:58');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`) VALUES (91, 68, 'interrupted', '1992-04-16 16:02:57', '2003-12-22 16:59:07');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`) VALUES (92, 24, 'confirmed', '2001-09-12 14:47:14', '2013-09-10 22:11:02');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`) VALUES (93, 59, 'interrupted', '2005-04-12 09:06:22', '1990-04-19 23:00:10');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`) VALUES (94, 33, 'interrupted', '1994-07-02 19:18:17', '1979-05-30 17:57:24');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`) VALUES (95, 59, 'confirmed', '1985-03-27 04:20:50', '1992-06-05 04:42:30');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`) VALUES (96, 38, 'requested', '1977-07-21 23:35:20', '2015-07-09 18:44:06');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`) VALUES (97, 16, 'requested', '2001-06-25 01:29:08', '1992-06-24 12:41:49');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`) VALUES (98, 22, 'interrupted', '2001-04-04 04:30:04', '1994-07-28 08:34:14');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`) VALUES (99, 67, 'requested', '1987-04-10 07:06:22', '1974-09-25 11:31:19');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`) VALUES (100, 60, 'interrupted', '1980-04-29 16:41:22', '2010-03-26 03:25:56');

#
# TABLE STRUCTURE FOR: media_types
#

DROP TABLE IF EXISTS `media_types`;

CREATE TABLE `media_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `media_types` (`id`, `name`) VALUES (2, ' photo');
INSERT INTO `media_types` (`id`, `name`) VALUES (4, ' text');
INSERT INTO `media_types` (`id`, `name`) VALUES (1, ' video');
INSERT INTO `media_types` (`id`, `name`) VALUES (3, 'avatar');



#
# TABLE STRUCTURE FOR: media
#

DROP TABLE IF EXISTS `media`;

CREATE TABLE `media` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `media_type_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES (1, 1, 1, '/1764bc7777926151a849a00471cfe767.jpg', '{"type-photo" : "avatat"}', '2014-08-24 18:09:21', '2000-12-09 06:38:49');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES (2, 2, 2, '/f51ff40505d7932edac71d73d09b7a01.jpg', '{"type-photo" : "avatat"}', '1981-03-10 15:28:43', '1992-04-09 06:19:12');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES (3, 3, 3, '/43e956a7d2efef2bd9414db12dc90e3e.jpg', '{"type-photo" : "avatat"}', '1978-06-07 10:04:20', '2007-09-06 01:32:07');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES (4, 4, 4, '/3d0f094cdc14658d2bc2a330c45c8ada.jpg', '{"type-photo" : "avatat"}', '1987-08-08 20:08:44', '1980-03-29 08:25:47');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES (5, 1, 5, '/4f7e7156e1a0151acb53570c9dbc65c9.jpg', '{"type-photo" : "avatat"}', '2005-03-11 15:41:57', '1981-09-17 01:06:03');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES (6, 2, 6, '/c790136020237c903a6da5756312bcdc.jpg', '{"type-photo" : "avatat"}', '1989-07-27 17:55:06', '1981-10-23 19:36:48');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES (7, 3, 7, '/358657b2e6540c8481489814553d215e.jpg', '{"type-photo" : "avatat"}', '1994-01-08 17:32:16', '1985-12-02 13:14:55');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES (8, 4, 8, '/26a2906461b6c3dfe7f3e8e2dfc8dcf1.jpg', '{"type-photo" : "avatat"}', '2018-07-06 00:39:55', '2004-05-17 19:03:27');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES (9, 1, 9, '/16135b8fd85742be6e53129705b01379.jpg', '{"type-photo" : "avatat"}', '2014-12-03 10:39:31', '2011-08-24 11:33:41');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES (10, 2, 10, '/41b915d3d37efc6f53b06c34a461f5d7.jpg', '{"type-photo" : "avatat"}', '2018-07-26 02:23:00', '1979-12-23 10:54:11');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES (11, 3, 11, '/df1469541a88c99fdb6a5d9225f47696.jpg', '{"type-photo" : "avatat"}', '1986-06-21 11:39:25', '1984-01-23 23:49:21');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES (12, 4, 12, '/b22cdfb06283a32c076eddc30abc871b.jpg', '{"type-photo" : "avatat"}', '1985-04-19 07:29:54', '2011-11-09 10:48:53');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES (13, 1, 13, '/a89a0fcae6b6f2ef7a626da8dfcef42a.jpg', '{"type-photo" : "avatat"}', '1979-12-15 21:08:30', '2006-05-04 13:53:40');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES (14, 2, 14, '/36dd35e92c61c5ea2013c9e4761fefc4.jpg', '{"type-photo" : "avatat"}', '1974-10-06 09:43:54', '2019-03-02 20:31:14');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES (15, 3, 15, '/a4c0480c07d6a2848e9460c1cd3856ad.jpg', '{"type-photo" : "avatat"}', '1996-05-29 19:31:48', '2001-05-06 16:10:31');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES (16, 4, 16, '/71755f43dd2b6689e5a18ad849898b68.jpg', '{"type-photo" : "avatat"}', '1990-02-25 10:21:20', '1970-08-19 11:57:45');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES (17, 1, 17, '/952343408c854f2e1a91f077e1ee32cc.jpg', '{"type-photo" : "avatat"}', '1980-09-04 13:04:44', '2013-09-24 20:23:00');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES (18, 2, 18, '/1e457981ad1b0935f969be09e7e82660.jpg', '{"type-photo" : "avatat"}', '1983-11-22 22:44:12', '1991-01-19 19:18:38');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES (19, 3, 19, '/c74a2136c57aec08ee20aca270d0c1fc.jpg', '{"type-photo" : "avatat"}', '2006-02-20 10:00:30', '2013-12-11 05:17:31');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES (20, 4, 20, '/15f6c348fb0c769ae9da856efa77eab8.jpg', '{"type-photo" : "avatat"}', '1976-10-01 06:22:47', '1992-04-08 06:34:35');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES (21, 1, 21, '/8099d43c06d2f5bb1689e52fc4841cba.jpg', '{"type-photo" : "avatat"}', '1980-12-14 20:26:53', '2008-02-04 06:14:02');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES (22, 2, 22, '/1a15d60a8b829cad0369692c5945b221.jpg', '{"type-photo" : "avatat"}', '2009-04-11 07:27:13', '1987-07-05 03:50:50');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES (23, 3, 23, '/541940ff57de0f3b166a0eb03b99f952.jpg', '{"type-photo" : "avatat"}', '2004-10-28 00:19:13', '2010-07-22 10:31:43');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES (24, 4, 24, '/840e3f86454716766e8a819d5672a71f.jpg', '{"type-photo" : "avatat"}', '2011-09-11 21:10:25', '1982-02-27 19:39:29');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES (25, 1, 25, '/3ca2bbf6863f9a7ae16cb744d2a47c27.jpg', '{"type-photo" : "avatat"}', '2008-01-15 06:31:21', '1982-10-16 06:37:16');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES (26, 2, 26, '/bfcb1aeb96378959e7d797d5794f27b6.jpg', '{"type-photo" : "avatat"}', '1998-04-15 11:07:58', '2012-06-04 16:53:01');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES (27, 3, 27, '/f7e03d08f593e5705297e84d637a31b8.jpg', '{"type-photo" : "avatat"}', '1982-10-02 11:06:28', '1995-09-02 15:25:19');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES (28, 4, 28, '/bce730da2b42c695c66ed9f922edbb59.jpg', '{"type-photo" : "avatat"}', '1997-05-03 09:18:01', '1995-04-19 05:45:05');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES (29, 1, 29, '/4ca5a618db1f21fefc5da455b4af7d93.jpg', '{"type-photo" : "avatat"}', '2014-09-25 01:13:31', '1986-08-06 14:45:17');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES (30, 2, 30, '/120738dc06ce6029ed5d9d12377af91a.jpg', '{"type-photo" : "avatat"}', '1989-11-26 12:01:44', '2001-06-27 13:05:09');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES (31, 3, 31, '/c4bebd553a4d049c686f7a30f6cfe9e3.jpg', '{"type-photo" : "avatat"}', '2012-03-30 02:41:15', '2019-05-25 14:18:49');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES (32, 4, 32, '/1e52a284db2ec8bc6d04f16b1381052f.jpg', '{"type-photo" : "avatat"}', '1980-06-01 23:53:58', '2013-07-31 13:06:29');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES (33, 1, 33, '/33598e3ae9324b4fc71b6c73c274f7ac.jpg', '{"type-photo" : "avatat"}', '1998-04-09 13:44:01', '1975-05-25 15:13:25');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES (34, 2, 34, '/027bab6248fb897481676826ad13e393.jpg', '{"type-photo" : "avatat"}', '2007-12-12 11:17:11', '1971-05-24 19:40:31');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES (35, 3, 35, '/d7c5b8d0a6ec6f394732a1a50cfe5a52.jpg', '{"type-photo" : "avatat"}', '2000-07-17 17:00:14', '2018-06-01 06:54:58');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES (36, 4, 36, '/71c65a037fd72a4ce2dc19e57609e857.jpg', '{"type-photo" : "avatat"}', '2009-01-25 18:42:29', '1994-11-20 01:43:47');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES (37, 1, 37, '/f2c7396038e56b46887891c3de0cb3ba.jpg', '{"type-photo" : "avatat"}', '1992-05-14 13:58:06', '1985-01-26 10:51:48');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES (38, 2, 38, '/01af34c889cc357713c28a0884cf770f.jpg', '{"type-photo" : "avatat"}', '2012-05-30 06:12:55', '1995-12-27 23:12:10');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES (39, 3, 39, '/c11cb41170c97517b5f6ceda02e83536.jpg', '{"type-photo" : "avatat"}', '1999-01-31 01:04:45', '1983-06-18 01:43:38');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES (40, 4, 40, '/e044c38bb498a1730fd52066d52b66ea.jpg', '{"type-photo" : "avatat"}', '1982-09-27 08:49:04', '1991-03-09 19:05:22');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES (41, 1, 41, '/0364e6ea38ff9f3ceba67f4902324b0c.jpg', '{"type-photo" : "avatat"}', '1986-03-25 01:55:54', '1977-08-28 17:33:10');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES (42, 2, 42, '/d790edcc900fdb0af1bf24561bd36a3f.jpg', '{"type-photo" : "avatat"}', '1982-10-30 10:40:53', '1980-04-23 06:40:52');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES (43, 3, 43, '/f7d1068dd3c185fbc8bb6054c4d0f96f.jpg', '{"type-photo" : "avatat"}', '1975-04-03 00:44:50', '2017-11-12 05:28:51');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES (44, 4, 44, '/13c286c88079bf4304eea59c3a6f2fbb.jpg', '{"type-photo" : "avatat"}', '2006-02-19 08:28:49', '1970-06-04 21:41:27');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES (45, 1, 45, '/d27790c0bfa53379f0b26f004e84fb1f.jpg', '{"type-photo" : "avatat"}', '2005-09-17 10:16:24', '2006-01-25 02:22:59');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES (46, 2, 46, '/bd9cb905a1917a48f12b8158eb5513d5.jpg', '{"type-photo" : "avatat"}', '2017-12-18 17:00:29', '1986-04-30 22:15:22');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES (47, 3, 47, '/af775dcfc17ea2a0b9a135c6cd09131d.jpg', '{"type-photo" : "avatat"}', '1974-03-25 13:12:14', '1988-12-11 13:03:47');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES (48, 4, 48, '/ee2bd9a0e5d1402a9acb4e1c2f96f57a.jpg', '{"type-photo" : "avatat"}', '2008-08-29 20:54:35', '1989-12-13 14:26:59');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES (49, 1, 49, '/3e862cd20bb0c2115b789230c1eed98d.jpg', '{"type-photo" : "avatat"}', '2002-08-15 10:49:47', '1998-04-09 19:18:10');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES (50, 2, 50, '/d3bc22f5f9734477679cdaf8286bebe4.jpg', '{"type-photo" : "avatat"}', '2008-12-02 13:59:38', '1986-07-05 02:36:04');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES (51, 3, 51, '/a49f6aa16cb913132197e3a064be4634.jpg', '{"type-photo" : "avatat"}', '2007-06-15 17:25:33', '2018-12-03 21:56:26');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES (52, 4, 52, '/98bf24b3c6b1e9f732ceeb977deacee1.jpg', '{"type-photo" : "avatat"}', '1980-02-06 05:58:36', '1989-10-12 02:54:48');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES (53, 1, 53, '/ca44a51d4c3d6f857a2caaa098eaca1f.jpg', '{"type-photo" : "avatat"}', '1984-04-03 01:08:15', '1970-06-01 11:04:26');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES (54, 2, 54, '/1559c7b30d20679bb140f2ccf7d453c0.jpg', '{"type-photo" : "avatat"}', '1970-06-28 17:48:06', '1983-02-10 17:11:46');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES (55, 3, 55, '/9973033ebf32413d4fd03594ebd35a80.jpg', '{"type-photo" : "avatat"}', '1974-04-04 00:23:22', '1985-12-28 22:23:56');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES (56, 4, 56, '/a505e1e2822fac80ae1d5a90bbfbdacd.jpg', '{"type-photo" : "avatat"}', '2002-02-25 13:28:19', '2001-12-01 01:31:33');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES (57, 1, 57, '/b6bd2fe959e8f11b52e0a24cd579c228.jpg', '{"type-photo" : "avatat"}', '2001-11-11 23:23:53', '1981-08-01 10:05:18');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES (58, 2, 58, '/5f23ab211441045d3ae41aac80df34ad.jpg', '{"type-photo" : "avatat"}', '2010-06-22 01:49:39', '2014-12-25 21:47:01');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES (59, 3, 59, '/16a41c191b0a7733c5a414e0a1ef359a.jpg', '{"type-photo" : "avatat"}', '1972-07-20 16:24:31', '2010-09-29 10:18:30');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES (60, 4, 60, '/00a0bf48076925f3d5168ca569609e41.jpg', '{"type-photo" : "avatat"}', '2000-03-29 11:08:00', '2005-06-04 11:35:30');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES (61, 1, 61, '/9084d90bf940e3cfc548ae136d064c64.jpg', '{"type-photo" : "avatat"}', '1992-03-03 14:45:23', '1998-07-23 08:32:43');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES (62, 2, 62, '/72c835f8edde14496a5d0a404afdc7eb.jpg', '{"type-photo" : "avatat"}', '2010-02-01 09:25:39', '1973-07-04 02:01:47');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES (63, 3, 63, '/0981bfef412589fc9a3122481a77468b.jpg', '{"type-photo" : "avatat"}', '2005-11-30 00:46:22', '1992-11-23 22:23:45');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES (64, 4, 64, '/016ef498b3a8e82f2ecd03464236ca06.jpg', '{"type-photo" : "avatat"}', '2010-11-14 11:15:53', '2010-08-25 18:33:38');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES (65, 1, 65, '/5a60cc31df9f016743e019f2c5ec09bf.jpg', '{"type-photo" : "avatat"}', '2018-03-11 07:02:36', '2015-08-20 07:01:32');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES (66, 2, 66, '/526377e88c2cfdb81969846633980bfb.jpg', '{"type-photo" : "avatat"}', '1991-04-01 19:27:44', '2008-08-08 04:05:08');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES (67, 3, 67, '/77145c3ef76ad4a015a628a7393afa4d.jpg', '{"type-photo" : "avatat"}', '1980-04-10 09:11:34', '2004-03-01 07:53:52');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES (68, 4, 68, '/bb1c7abfed5844e842fd30228c46f4c8.jpg', '{"type-photo" : "avatat"}', '1983-01-04 06:13:51', '1989-04-01 04:00:27');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES (69, 1, 69, '/209aa230c7c0e5e84993ecd92ece7bdb.jpg', '{"type-photo" : "avatat"}', '2013-09-28 11:01:07', '2001-05-18 17:03:00');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES (70, 2, 70, '/74fd7fc950bcd3a3adca891bff401648.jpg', '{"type-photo" : "avatat"}', '2006-03-31 13:10:11', '1977-02-19 01:36:34');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES (71, 3, 71, '/6b74e77064055abcf46a731c37d0b2a4.jpg', '{"type-photo" : "avatat"}', '1972-12-04 13:45:32', '1997-03-11 09:55:41');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES (72, 4, 72, '/9d38fbd267d8ddac57437eacd05a2016.jpg', '{"type-photo" : "avatat"}', '1986-09-24 18:13:57', '1990-10-20 04:07:17');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES (73, 1, 73, '/0a44adc26086e30ebb144cf2e7461628.jpg', '{"type-photo" : "avatat"}', '2005-12-10 15:15:19', '2002-08-18 13:08:31');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES (74, 2, 74, '/0aaa88ce1f4505f598a1093575cdbf82.jpg', '{"type-photo" : "avatat"}', '1992-04-05 03:46:18', '2006-04-07 04:48:14');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES (75, 3, 75, '/d39831d86fe2cf165343d585bfe3e74a.jpg', '{"type-photo" : "avatat"}', '2013-12-11 23:12:20', '1988-12-12 07:02:37');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES (76, 4, 76, '/97fa6cec811239c49a8c0e07210e5390.jpg', '{"type-photo" : "avatat"}', '2017-06-05 13:25:29', '1995-11-15 13:36:23');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES (77, 1, 77, '/74b4a5ed71d2bc7f1c15dda389e7f141.jpg', '{"type-photo" : "avatat"}', '1994-10-11 19:00:35', '2005-09-11 06:27:23');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES (78, 2, 78, '/43eefc2c49e9c3cfc50e60d56279c6c8.jpg', '{"type-photo" : "avatat"}', '2002-05-05 20:27:14', '1971-01-10 18:15:54');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES (79, 3, 79, '/02390b0007998c5ac8ebfa0e215bb342.jpg', '{"type-photo" : "avatat"}', '1990-09-26 20:15:10', '1990-11-04 06:33:01');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES (80, 4, 80, '/d76b85c1f8ab7a1c23c399d2d9a090a9.jpg', '{"type-photo" : "avatat"}', '1994-03-25 00:17:49', '2004-11-03 23:25:26');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES (81, 1, 81, '/38de902063b6c462322032190c8f9aca.jpg', '{"type-photo" : "avatat"}', '2003-01-27 10:31:39', '1986-02-07 20:09:08');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES (82, 2, 82, '/94f172b5144131fd5fa76314b144df58.jpg', '{"type-photo" : "avatat"}', '1993-11-04 02:09:59', '2014-11-01 09:02:01');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES (83, 3, 83, '/f422b0f29d8edbb5bc52e40f26aea5d5.jpg', '{"type-photo" : "avatat"}', '1981-06-17 03:42:24', '2015-03-25 11:50:11');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES (84, 4, 84, '/3fb076a799f58ab6ddf2850cae36cc68.jpg', '{"type-photo" : "avatat"}', '1977-09-04 03:27:32', '2013-12-24 00:25:38');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES (85, 1, 85, '/73674f20c645a5b5fa223cdb2ec3e876.jpg', '{"type-photo" : "avatat"}', '2018-03-05 13:20:19', '1986-05-02 23:17:08');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES (86, 2, 86, '/08a4e97a054116bf2a55a5efb31ad9e5.jpg', '{"type-photo" : "avatat"}', '1983-09-06 20:34:47', '2013-12-12 03:10:05');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES (87, 3, 87, '/b7a894baaa7a7b5122f34a5e9dbe93fb.jpg', '{"type-photo" : "avatat"}', '1984-05-08 13:08:05', '1977-02-16 01:12:29');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES (88, 4, 88, '/9e3cfa7431aca8531828a46022924adf.jpg', '{"type-photo" : "avatat"}', '2000-08-05 08:18:40', '2011-04-16 21:27:17');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES (89, 1, 89, '/d6f7d65aa8e248c1fe362b168128051f.jpg', '{"type-photo" : "avatat"}', '2016-02-05 10:43:57', '1987-05-07 11:11:16');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES (90, 2, 90, '/bc5f178560dd645b5d01be2a56a1a9d5.jpg', '{"type-photo" : "avatat"}', '1981-06-09 18:14:33', '2018-01-28 19:25:23');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES (91, 3, 91, '/2312c4af9f06f1a8cdff0c004c1c400c.jpg', '{"type-photo" : "avatat"}', '1985-06-06 10:21:45', '1998-12-21 19:39:37');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES (92, 4, 92, '/954617c2f733958088196f0e19446074.jpg', '{"type-photo" : "avatat"}', '1981-07-26 09:52:11', '1974-03-01 17:02:57');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES (93, 1, 93, '/b28cbb625be43ff30229045ca52cd03f.jpg', '{"type-photo" : "avatat"}', '1983-01-17 12:39:35', '2017-01-06 02:59:10');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES (94, 2, 94, '/9aa50dcfa8333b03183bcdb78f9a1f42.jpg', '{"type-photo" : "avatat"}', '1975-04-08 03:54:23', '2012-03-29 14:16:12');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES (95, 3, 95, '/be716e44cf48945445aa58d9feae4f6c.jpg', '{"type-photo" : "avatat"}', '1972-05-04 14:19:11', '2002-12-31 01:00:36');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES (96, 4, 96, '/a0153d72365e5b2e57b92fd5a45606a7.jpg', '{"type-photo" : "avatat"}', '2011-03-17 18:49:48', '1991-09-12 03:04:10');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES (97, 1, 97, '/ec4409cc6707945d21013a2ec40e9b87.jpg', '{"type-photo" : "avatat"}', '1970-02-01 21:02:45', '1972-02-03 23:44:31');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES (98, 2, 98, '/2610129ec3d983bc9a405bcc13e37dfe.jpg', '{"type-photo" : "avatat"}', '2007-03-24 19:24:25', '1999-01-28 12:14:04');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES (99, 3, 99, '/d2a555c75e832b14f00d434aad5a2cf1.jpg', '{"type-photo" : "avatat"}', '2005-04-15 21:39:01', '2015-08-28 22:36:56');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES (100, 4, 100, '/cd315888ad5c549c4cc5fdeafea483ed.jpg', '{"type-photo" : "avatat"}', '1979-11-10 13:01:56', '1981-03-31 10:33:13');

#
# TABLE STRUCTURE FOR: messages
#

DROP TABLE IF EXISTS `messages`;

CREATE TABLE `messages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `from_user_id` int(10) unsigned NOT NULL,
  `to_user_id` int(10) unsigned NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `is_important` tinyint(1) DEFAULT NULL,
  `is_delivered` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# TABLE STRUCTURE FOR: profiles
#

DROP TABLE IF EXISTS `profiles`;

CREATE TABLE `profiles` (
  `user_id` int(10) unsigned NOT NULL,
  `sex` enum('male','female') COLLATE utf8_unicode_ci NOT NULL,
  `birthday` date DEFAULT NULL,
  `hometown` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `photo_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `profiles` (`user_id`, `sex`, `birthday`, `hometown`, `photo_id`) VALUES (1, 'male', '2007-08-20', 'Feeneyton', 1);
INSERT INTO `profiles` (`user_id`, `sex`, `birthday`, `hometown`, `photo_id`) VALUES (2, 'female', '1987-07-20', 'West Bryanashire', 2);
INSERT INTO `profiles` (`user_id`, `sex`, `birthday`, `hometown`, `photo_id`) VALUES (3, 'female', '1984-10-17', 'Marquardtshire', 3);
INSERT INTO `profiles` (`user_id`, `sex`, `birthday`, `hometown`, `photo_id`) VALUES (4, 'female', '1989-03-05', 'Jacquelynborough', 4);
INSERT INTO `profiles` (`user_id`, `sex`, `birthday`, `hometown`, `photo_id`) VALUES (5, 'female', '2016-04-28', 'Lake Lavernbury', 5);
INSERT INTO `profiles` (`user_id`, `sex`, `birthday`, `hometown`, `photo_id`) VALUES (6, 'male', '2011-06-03', 'Port Bennett', 6);
INSERT INTO `profiles` (`user_id`, `sex`, `birthday`, `hometown`, `photo_id`) VALUES (7, 'female', '1987-07-20', 'Ullrichberg', 7);
INSERT INTO `profiles` (`user_id`, `sex`, `birthday`, `hometown`, `photo_id`) VALUES (8, 'male', '2012-05-16', 'Mireilleborough', 8);
INSERT INTO `profiles` (`user_id`, `sex`, `birthday`, `hometown`, `photo_id`) VALUES (9, 'male', '2019-08-06', 'Lake Norbert', 9);
INSERT INTO `profiles` (`user_id`, `sex`, `birthday`, `hometown`, `photo_id`) VALUES (10, 'male', '2001-04-12', 'New Evan', 10);
INSERT INTO `profiles` (`user_id`, `sex`, `birthday`, `hometown`, `photo_id`) VALUES (11, 'female', '1999-09-26', 'Lake Edythton', 11);
INSERT INTO `profiles` (`user_id`, `sex`, `birthday`, `hometown`, `photo_id`) VALUES (12, 'male', '1994-09-10', 'South Raegan', 12);
INSERT INTO `profiles` (`user_id`, `sex`, `birthday`, `hometown`, `photo_id`) VALUES (13, 'female', '1994-11-29', 'Koeppland', 13);
INSERT INTO `profiles` (`user_id`, `sex`, `birthday`, `hometown`, `photo_id`) VALUES (14, 'male', '1998-03-22', 'Haleyfort', 14);
INSERT INTO `profiles` (`user_id`, `sex`, `birthday`, `hometown`, `photo_id`) VALUES (15, 'female', '1975-03-27', 'South Ettieberg', 15);
INSERT INTO `profiles` (`user_id`, `sex`, `birthday`, `hometown`, `photo_id`) VALUES (16, 'female', '2001-07-18', 'Joellemouth', 16);
INSERT INTO `profiles` (`user_id`, `sex`, `birthday`, `hometown`, `photo_id`) VALUES (17, 'male', '1988-11-14', 'Lubowitzfurt', 17);
INSERT INTO `profiles` (`user_id`, `sex`, `birthday`, `hometown`, `photo_id`) VALUES (18, 'female', '2007-02-02', 'North Joannyborough', 18);
INSERT INTO `profiles` (`user_id`, `sex`, `birthday`, `hometown`, `photo_id`) VALUES (19, 'female', '1975-09-07', 'North Whitney', 19);
INSERT INTO `profiles` (`user_id`, `sex`, `birthday`, `hometown`, `photo_id`) VALUES (20, 'male', '1993-05-13', 'West Libbie', 20);
INSERT INTO `profiles` (`user_id`, `sex`, `birthday`, `hometown`, `photo_id`) VALUES (21, 'female', '2003-11-27', 'Angieside', 21);
INSERT INTO `profiles` (`user_id`, `sex`, `birthday`, `hometown`, `photo_id`) VALUES (22, 'male', '2006-01-04', 'Rustyberg', 22);
INSERT INTO `profiles` (`user_id`, `sex`, `birthday`, `hometown`, `photo_id`) VALUES (23, 'male', '2001-07-29', 'Lorenaland', 23);
INSERT INTO `profiles` (`user_id`, `sex`, `birthday`, `hometown`, `photo_id`) VALUES (24, 'female', '2003-08-31', 'Robertsborough', 24);
INSERT INTO `profiles` (`user_id`, `sex`, `birthday`, `hometown`, `photo_id`) VALUES (25, 'female', '2015-06-10', 'New Mossie', 25);
INSERT INTO `profiles` (`user_id`, `sex`, `birthday`, `hometown`, `photo_id`) VALUES (26, 'female', '2013-08-04', 'North Christine', 26);
INSERT INTO `profiles` (`user_id`, `sex`, `birthday`, `hometown`, `photo_id`) VALUES (27, 'male', '1974-03-22', 'South Dorian', 27);
INSERT INTO `profiles` (`user_id`, `sex`, `birthday`, `hometown`, `photo_id`) VALUES (28, 'female', '2018-01-19', 'North Norval', 28);
INSERT INTO `profiles` (`user_id`, `sex`, `birthday`, `hometown`, `photo_id`) VALUES (29, 'male', '2016-09-07', 'Leuschkeview', 29);
INSERT INTO `profiles` (`user_id`, `sex`, `birthday`, `hometown`, `photo_id`) VALUES (30, 'female', '2005-08-08', 'North Lincoln', 30);
INSERT INTO `profiles` (`user_id`, `sex`, `birthday`, `hometown`, `photo_id`) VALUES (31, 'female', '1984-10-14', 'Lambertview', 31);
INSERT INTO `profiles` (`user_id`, `sex`, `birthday`, `hometown`, `photo_id`) VALUES (32, 'male', '1983-11-19', 'Jakobhaven', 32);
INSERT INTO `profiles` (`user_id`, `sex`, `birthday`, `hometown`, `photo_id`) VALUES (33, 'female', '1978-10-04', 'Bellestad', 33);
INSERT INTO `profiles` (`user_id`, `sex`, `birthday`, `hometown`, `photo_id`) VALUES (34, 'female', '2010-02-27', 'Juniorton', 34);
INSERT INTO `profiles` (`user_id`, `sex`, `birthday`, `hometown`, `photo_id`) VALUES (35, 'male', '1974-04-14', 'New Jessytown', 35);
INSERT INTO `profiles` (`user_id`, `sex`, `birthday`, `hometown`, `photo_id`) VALUES (36, 'male', '1977-08-09', 'Medhursthaven', 36);
INSERT INTO `profiles` (`user_id`, `sex`, `birthday`, `hometown`, `photo_id`) VALUES (37, 'male', '1988-03-24', 'West Bryonport', 37);
INSERT INTO `profiles` (`user_id`, `sex`, `birthday`, `hometown`, `photo_id`) VALUES (38, 'female', '1991-06-20', 'East Zoebury', 38);
INSERT INTO `profiles` (`user_id`, `sex`, `birthday`, `hometown`, `photo_id`) VALUES (39, 'male', '1970-11-01', 'North Alda', 39);
INSERT INTO `profiles` (`user_id`, `sex`, `birthday`, `hometown`, `photo_id`) VALUES (40, 'female', '2006-10-07', 'East Hermannhaven', 40);
INSERT INTO `profiles` (`user_id`, `sex`, `birthday`, `hometown`, `photo_id`) VALUES (41, 'female', '2010-08-15', 'Luzfurt', 41);
INSERT INTO `profiles` (`user_id`, `sex`, `birthday`, `hometown`, `photo_id`) VALUES (42, 'female', '1989-03-15', 'Bartolettiberg', 42);
INSERT INTO `profiles` (`user_id`, `sex`, `birthday`, `hometown`, `photo_id`) VALUES (43, 'female', '2000-11-30', 'West Nakiaview', 43);
INSERT INTO `profiles` (`user_id`, `sex`, `birthday`, `hometown`, `photo_id`) VALUES (44, 'male', '1988-09-02', 'East Hassan', 44);
INSERT INTO `profiles` (`user_id`, `sex`, `birthday`, `hometown`, `photo_id`) VALUES (45, 'female', '1991-10-11', 'Feilchester', 45);
INSERT INTO `profiles` (`user_id`, `sex`, `birthday`, `hometown`, `photo_id`) VALUES (46, 'male', '1995-08-15', 'Archibaldmouth', 46);
INSERT INTO `profiles` (`user_id`, `sex`, `birthday`, `hometown`, `photo_id`) VALUES (47, 'male', '1983-08-07', 'New Verda', 47);
INSERT INTO `profiles` (`user_id`, `sex`, `birthday`, `hometown`, `photo_id`) VALUES (48, 'female', '2004-08-05', 'South Cristobalmouth', 48);
INSERT INTO `profiles` (`user_id`, `sex`, `birthday`, `hometown`, `photo_id`) VALUES (49, 'male', '2006-02-21', 'North Esther', 49);
INSERT INTO `profiles` (`user_id`, `sex`, `birthday`, `hometown`, `photo_id`) VALUES (50, 'female', '2006-04-22', 'Alexysview', 50);
INSERT INTO `profiles` (`user_id`, `sex`, `birthday`, `hometown`, `photo_id`) VALUES (51, 'female', '1996-09-11', 'Lake Zoe', 51);
INSERT INTO `profiles` (`user_id`, `sex`, `birthday`, `hometown`, `photo_id`) VALUES (52, 'female', '1992-12-30', 'Rainachester', 52);
INSERT INTO `profiles` (`user_id`, `sex`, `birthday`, `hometown`, `photo_id`) VALUES (53, 'female', '1979-12-03', 'Dejahborough', 53);
INSERT INTO `profiles` (`user_id`, `sex`, `birthday`, `hometown`, `photo_id`) VALUES (54, 'female', '2013-03-25', 'South Nikita', 54);
INSERT INTO `profiles` (`user_id`, `sex`, `birthday`, `hometown`, `photo_id`) VALUES (55, 'male', '2007-10-24', 'East Franco', 55);
INSERT INTO `profiles` (`user_id`, `sex`, `birthday`, `hometown`, `photo_id`) VALUES (56, 'female', '1977-12-15', 'Sauerfort', 56);
INSERT INTO `profiles` (`user_id`, `sex`, `birthday`, `hometown`, `photo_id`) VALUES (57, 'female', '1983-07-25', 'West Daxport', 57);
INSERT INTO `profiles` (`user_id`, `sex`, `birthday`, `hometown`, `photo_id`) VALUES (58, 'female', '1990-02-09', 'North Axelbury', 58);
INSERT INTO `profiles` (`user_id`, `sex`, `birthday`, `hometown`, `photo_id`) VALUES (59, 'male', '2010-11-23', 'West Krystalborough', 59);
INSERT INTO `profiles` (`user_id`, `sex`, `birthday`, `hometown`, `photo_id`) VALUES (60, 'female', '2009-05-25', 'Janychester', 60);
INSERT INTO `profiles` (`user_id`, `sex`, `birthday`, `hometown`, `photo_id`) VALUES (61, 'male', '2007-03-21', 'Roseland', 61);
INSERT INTO `profiles` (`user_id`, `sex`, `birthday`, `hometown`, `photo_id`) VALUES (62, 'female', '1973-04-07', 'Port Reva', 62);
INSERT INTO `profiles` (`user_id`, `sex`, `birthday`, `hometown`, `photo_id`) VALUES (63, 'male', '2014-05-10', 'Port Kristofer', 63);
INSERT INTO `profiles` (`user_id`, `sex`, `birthday`, `hometown`, `photo_id`) VALUES (64, 'male', '2004-09-28', 'North Elna', 64);
INSERT INTO `profiles` (`user_id`, `sex`, `birthday`, `hometown`, `photo_id`) VALUES (65, 'male', '1978-11-09', 'Ariannaborough', 65);
INSERT INTO `profiles` (`user_id`, `sex`, `birthday`, `hometown`, `photo_id`) VALUES (66, 'female', '1993-05-13', 'Littelview', 66);
INSERT INTO `profiles` (`user_id`, `sex`, `birthday`, `hometown`, `photo_id`) VALUES (67, 'female', '2006-10-22', 'Boydton', 67);
INSERT INTO `profiles` (`user_id`, `sex`, `birthday`, `hometown`, `photo_id`) VALUES (68, 'female', '1992-09-03', 'Gerholdchester', 68);
INSERT INTO `profiles` (`user_id`, `sex`, `birthday`, `hometown`, `photo_id`) VALUES (69, 'male', '1991-10-16', 'North Olgashire', 69);
INSERT INTO `profiles` (`user_id`, `sex`, `birthday`, `hometown`, `photo_id`) VALUES (70, 'male', '1980-01-16', 'Port Reese', 70);
INSERT INTO `profiles` (`user_id`, `sex`, `birthday`, `hometown`, `photo_id`) VALUES (71, 'female', '1995-06-20', 'Schillershire', 71);
INSERT INTO `profiles` (`user_id`, `sex`, `birthday`, `hometown`, `photo_id`) VALUES (72, 'female', '2018-03-13', 'Port Elbert', 72);
INSERT INTO `profiles` (`user_id`, `sex`, `birthday`, `hometown`, `photo_id`) VALUES (73, 'male', '2001-04-21', 'Bruenborough', 73);
INSERT INTO `profiles` (`user_id`, `sex`, `birthday`, `hometown`, `photo_id`) VALUES (74, 'male', '2019-10-08', 'Kemmershire', 74);
INSERT INTO `profiles` (`user_id`, `sex`, `birthday`, `hometown`, `photo_id`) VALUES (75, 'female', '1985-07-11', 'West Rosstown', 75);
INSERT INTO `profiles` (`user_id`, `sex`, `birthday`, `hometown`, `photo_id`) VALUES (76, 'female', '2000-01-26', 'Reillybury', 76);
INSERT INTO `profiles` (`user_id`, `sex`, `birthday`, `hometown`, `photo_id`) VALUES (77, 'female', '1971-06-16', 'South Destanychester', 77);
INSERT INTO `profiles` (`user_id`, `sex`, `birthday`, `hometown`, `photo_id`) VALUES (78, 'male', '1988-12-25', 'Port Damaris', 78);
INSERT INTO `profiles` (`user_id`, `sex`, `birthday`, `hometown`, `photo_id`) VALUES (79, 'female', '1970-08-29', 'Kipmouth', 79);
INSERT INTO `profiles` (`user_id`, `sex`, `birthday`, `hometown`, `photo_id`) VALUES (80, 'male', '1970-01-26', 'South Dejah', 80);
INSERT INTO `profiles` (`user_id`, `sex`, `birthday`, `hometown`, `photo_id`) VALUES (81, 'female', '2009-09-13', 'Dibbertville', 81);
INSERT INTO `profiles` (`user_id`, `sex`, `birthday`, `hometown`, `photo_id`) VALUES (82, 'female', '1994-07-20', 'New Wardshire', 82);
INSERT INTO `profiles` (`user_id`, `sex`, `birthday`, `hometown`, `photo_id`) VALUES (83, 'male', '1986-06-05', 'Nolantown', 83);
INSERT INTO `profiles` (`user_id`, `sex`, `birthday`, `hometown`, `photo_id`) VALUES (84, 'female', '1976-03-08', 'New Lonnyborough', 84);
INSERT INTO `profiles` (`user_id`, `sex`, `birthday`, `hometown`, `photo_id`) VALUES (85, 'female', '2003-03-05', 'Willshire', 85);
INSERT INTO `profiles` (`user_id`, `sex`, `birthday`, `hometown`, `photo_id`) VALUES (86, 'female', '2007-07-23', 'Godfreymouth', 86);
INSERT INTO `profiles` (`user_id`, `sex`, `birthday`, `hometown`, `photo_id`) VALUES (87, 'male', '1977-12-31', 'Bernierfort', 87);
INSERT INTO `profiles` (`user_id`, `sex`, `birthday`, `hometown`, `photo_id`) VALUES (88, 'female', '1999-08-19', 'Balistreriport', 88);
INSERT INTO `profiles` (`user_id`, `sex`, `birthday`, `hometown`, `photo_id`) VALUES (89, 'male', '1978-04-10', 'Bernadineside', 89);
INSERT INTO `profiles` (`user_id`, `sex`, `birthday`, `hometown`, `photo_id`) VALUES (90, 'male', '1999-03-16', 'South Ethelton', 90);
INSERT INTO `profiles` (`user_id`, `sex`, `birthday`, `hometown`, `photo_id`) VALUES (91, 'female', '1986-01-09', 'New Brockchester', 91);
INSERT INTO `profiles` (`user_id`, `sex`, `birthday`, `hometown`, `photo_id`) VALUES (92, 'male', '2001-03-02', 'Thielshire', 92);
INSERT INTO `profiles` (`user_id`, `sex`, `birthday`, `hometown`, `photo_id`) VALUES (93, 'male', '2015-10-15', 'Maciborough', 93);
INSERT INTO `profiles` (`user_id`, `sex`, `birthday`, `hometown`, `photo_id`) VALUES (94, 'female', '1981-06-14', 'Kozeyberg', 94);
INSERT INTO `profiles` (`user_id`, `sex`, `birthday`, `hometown`, `photo_id`) VALUES (95, 'female', '2012-01-25', 'Satterfieldfurt', 95);
INSERT INTO `profiles` (`user_id`, `sex`, `birthday`, `hometown`, `photo_id`) VALUES (96, 'male', '1996-04-01', 'Edmundchester', 96);
INSERT INTO `profiles` (`user_id`, `sex`, `birthday`, `hometown`, `photo_id`) VALUES (97, 'female', '1982-07-16', 'East Marleeside', 97);
INSERT INTO `profiles` (`user_id`, `sex`, `birthday`, `hometown`, `photo_id`) VALUES (98, 'female', '1991-07-02', 'West Savannaside', 98);
INSERT INTO `profiles` (`user_id`, `sex`, `birthday`, `hometown`, `photo_id`) VALUES (99, 'male', '2003-10-31', 'Nienowstad', 99);
INSERT INTO `profiles` (`user_id`, `sex`, `birthday`, `hometown`, `photo_id`) VALUES (100, 'female', '2004-10-18', 'Huelshire', 100);


#
# TABLE STRUCTURE FOR: user_emails
#

DROP TABLE IF EXISTS `user_emails`;

CREATE TABLE `user_emails` (
  `user_id` int(10) unsigned NOT NULL,
  `email` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `email_type` enum('main','reserved') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'main',
  PRIMARY KEY (`user_id`,`email`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `user_emails` (`user_id`, `email`, `email_type`) VALUES (1, 'fpadberg@example.org', 'main');
INSERT INTO `user_emails` (`user_id`, `email`, `email_type`) VALUES (2, 'aglae.bruen@example.org', 'main');
INSERT INTO `user_emails` (`user_id`, `email`, `email_type`) VALUES (3, 'fmosciski@example.com', 'main');
INSERT INTO `user_emails` (`user_id`, `email`, `email_type`) VALUES (4, 'malinda.hettinger@example.com', 'reserved');
INSERT INTO `user_emails` (`user_id`, `email`, `email_type`) VALUES (5, 'roscoe.sawayn@example.org', 'main');
INSERT INTO `user_emails` (`user_id`, `email`, `email_type`) VALUES (6, 'justyn94@example.net', 'reserved');
INSERT INTO `user_emails` (`user_id`, `email`, `email_type`) VALUES (7, 'murphy.earnest@example.com', 'reserved');
INSERT INTO `user_emails` (`user_id`, `email`, `email_type`) VALUES (8, 'ledner.johann@example.net', 'reserved');
INSERT INTO `user_emails` (`user_id`, `email`, `email_type`) VALUES (9, 'dgoyette@example.org', 'main');
INSERT INTO `user_emails` (`user_id`, `email`, `email_type`) VALUES (10, 'miller.lucienne@example.com', 'reserved');
INSERT INTO `user_emails` (`user_id`, `email`, `email_type`) VALUES (11, 'ehermann@example.com', 'main');
INSERT INTO `user_emails` (`user_id`, `email`, `email_type`) VALUES (12, 'parisian.marc@example.com', 'main');
INSERT INTO `user_emails` (`user_id`, `email`, `email_type`) VALUES (13, 'egrant@example.com', 'main');
INSERT INTO `user_emails` (`user_id`, `email`, `email_type`) VALUES (14, 'ycrist@example.net', 'reserved');
INSERT INTO `user_emails` (`user_id`, `email`, `email_type`) VALUES (15, 'igottlieb@example.com', 'main');
INSERT INTO `user_emails` (`user_id`, `email`, `email_type`) VALUES (16, 'borer.madyson@example.net', 'main');
INSERT INTO `user_emails` (`user_id`, `email`, `email_type`) VALUES (17, 'harley.abbott@example.com', 'main');
INSERT INTO `user_emails` (`user_id`, `email`, `email_type`) VALUES (18, 'pollich.judy@example.org', 'main');
INSERT INTO `user_emails` (`user_id`, `email`, `email_type`) VALUES (19, 'wlegros@example.com', 'reserved');
INSERT INTO `user_emails` (`user_id`, `email`, `email_type`) VALUES (20, 'waelchi.kathryne@example.org', 'main');
INSERT INTO `user_emails` (`user_id`, `email`, `email_type`) VALUES (21, 'bud.pfannerstill@example.org', 'main');
INSERT INTO `user_emails` (`user_id`, `email`, `email_type`) VALUES (22, 'sherzog@example.org', 'main');
INSERT INTO `user_emails` (`user_id`, `email`, `email_type`) VALUES (23, 'edaugherty@example.com', 'reserved');
INSERT INTO `user_emails` (`user_id`, `email`, `email_type`) VALUES (24, 'hoeger.rebecca@example.com', 'main');
INSERT INTO `user_emails` (`user_id`, `email`, `email_type`) VALUES (25, 'clemmie.kris@example.com', 'reserved');
INSERT INTO `user_emails` (`user_id`, `email`, `email_type`) VALUES (26, 'ernser.elvie@example.org', 'reserved');
INSERT INTO `user_emails` (`user_id`, `email`, `email_type`) VALUES (27, 'smith.garfield@example.org', 'reserved');
INSERT INTO `user_emails` (`user_id`, `email`, `email_type`) VALUES (28, 'altenwerth.natalie@example.net', 'main');
INSERT INTO `user_emails` (`user_id`, `email`, `email_type`) VALUES (29, 'zoila.treutel@example.org', 'main');
INSERT INTO `user_emails` (`user_id`, `email`, `email_type`) VALUES (30, 'emelie20@example.net', 'main');
INSERT INTO `user_emails` (`user_id`, `email`, `email_type`) VALUES (31, 'wyost@example.com', 'reserved');
INSERT INTO `user_emails` (`user_id`, `email`, `email_type`) VALUES (32, 'bogisich.silas@example.org', 'reserved');
INSERT INTO `user_emails` (`user_id`, `email`, `email_type`) VALUES (33, 'kherzog@example.net', 'main');
INSERT INTO `user_emails` (`user_id`, `email`, `email_type`) VALUES (34, 'oceane19@example.org', 'reserved');
INSERT INTO `user_emails` (`user_id`, `email`, `email_type`) VALUES (35, 'ebba17@example.com', 'main');
INSERT INTO `user_emails` (`user_id`, `email`, `email_type`) VALUES (36, 'reynolds.hailee@example.org', 'main');
INSERT INTO `user_emails` (`user_id`, `email`, `email_type`) VALUES (37, 'ivy.corkery@example.net', 'main');
INSERT INTO `user_emails` (`user_id`, `email`, `email_type`) VALUES (38, 'bayer.travis@example.com', 'main');
INSERT INTO `user_emails` (`user_id`, `email`, `email_type`) VALUES (39, 'jschmeler@example.org', 'main');
INSERT INTO `user_emails` (`user_id`, `email`, `email_type`) VALUES (40, 'kyra.kassulke@example.net', 'main');
INSERT INTO `user_emails` (`user_id`, `email`, `email_type`) VALUES (41, 'ben.feest@example.net', 'main');
INSERT INTO `user_emails` (`user_id`, `email`, `email_type`) VALUES (42, 'kemmer.shaniya@example.org', 'reserved');
INSERT INTO `user_emails` (`user_id`, `email`, `email_type`) VALUES (43, 'estefania50@example.net', 'main');
INSERT INTO `user_emails` (`user_id`, `email`, `email_type`) VALUES (44, 'emorar@example.net', 'main');
INSERT INTO `user_emails` (`user_id`, `email`, `email_type`) VALUES (45, 'xander49@example.org', 'reserved');
INSERT INTO `user_emails` (`user_id`, `email`, `email_type`) VALUES (46, 'justyn.renner@example.net', 'reserved');
INSERT INTO `user_emails` (`user_id`, `email`, `email_type`) VALUES (47, 'lswift@example.net', 'main');
INSERT INTO `user_emails` (`user_id`, `email`, `email_type`) VALUES (48, 'bailey.alda@example.org', 'reserved');
INSERT INTO `user_emails` (`user_id`, `email`, `email_type`) VALUES (49, 'kshlerin.kayley@example.net', 'main');
INSERT INTO `user_emails` (`user_id`, `email`, `email_type`) VALUES (50, 'arvilla57@example.com', 'main');
INSERT INTO `user_emails` (`user_id`, `email`, `email_type`) VALUES (51, 'abbigail.hessel@example.org', 'main');
INSERT INTO `user_emails` (`user_id`, `email`, `email_type`) VALUES (52, 'schaden.darien@example.com', 'reserved');
INSERT INTO `user_emails` (`user_id`, `email`, `email_type`) VALUES (53, 'miller.legros@example.net', 'reserved');
INSERT INTO `user_emails` (`user_id`, `email`, `email_type`) VALUES (54, 'ibernhard@example.net', 'reserved');
INSERT INTO `user_emails` (`user_id`, `email`, `email_type`) VALUES (55, 'dnader@example.org', 'main');
INSERT INTO `user_emails` (`user_id`, `email`, `email_type`) VALUES (56, 'twila.ratke@example.com', 'main');
INSERT INTO `user_emails` (`user_id`, `email`, `email_type`) VALUES (57, 'rice.keira@example.net', 'main');
INSERT INTO `user_emails` (`user_id`, `email`, `email_type`) VALUES (58, 'gilda.stanton@example.net', 'reserved');
INSERT INTO `user_emails` (`user_id`, `email`, `email_type`) VALUES (59, 'oberbrunner.marietta@example.net', 'reserved');
INSERT INTO `user_emails` (`user_id`, `email`, `email_type`) VALUES (60, 'schoen.jane@example.net', 'main');
INSERT INTO `user_emails` (`user_id`, `email`, `email_type`) VALUES (61, 'schamberger.herman@example.net', 'main');
INSERT INTO `user_emails` (`user_id`, `email`, `email_type`) VALUES (62, 'nicolas.demetris@example.org', 'main');
INSERT INTO `user_emails` (`user_id`, `email`, `email_type`) VALUES (63, 'odooley@example.com', 'main');
INSERT INTO `user_emails` (`user_id`, `email`, `email_type`) VALUES (64, 'dickinson.hollie@example.com', 'reserved');
INSERT INTO `user_emails` (`user_id`, `email`, `email_type`) VALUES (65, 'felipa.reynolds@example.com', 'reserved');
INSERT INTO `user_emails` (`user_id`, `email`, `email_type`) VALUES (66, 'aisha38@example.net', 'reserved');
INSERT INTO `user_emails` (`user_id`, `email`, `email_type`) VALUES (67, 'moshe96@example.net', 'reserved');
INSERT INTO `user_emails` (`user_id`, `email`, `email_type`) VALUES (68, 'tfisher@example.org', 'reserved');
INSERT INTO `user_emails` (`user_id`, `email`, `email_type`) VALUES (69, 'verna.rutherford@example.com', 'reserved');
INSERT INTO `user_emails` (`user_id`, `email`, `email_type`) VALUES (70, 'hoppe.ivy@example.net', 'reserved');
INSERT INTO `user_emails` (`user_id`, `email`, `email_type`) VALUES (71, 'heidenreich.ila@example.com', 'reserved');
INSERT INTO `user_emails` (`user_id`, `email`, `email_type`) VALUES (72, 'von.baylee@example.com', 'main');
INSERT INTO `user_emails` (`user_id`, `email`, `email_type`) VALUES (73, 'alejandra74@example.org', 'reserved');
INSERT INTO `user_emails` (`user_id`, `email`, `email_type`) VALUES (74, 'jalon75@example.com', 'main');
INSERT INTO `user_emails` (`user_id`, `email`, `email_type`) VALUES (75, 'simonis.darien@example.com', 'main');
INSERT INTO `user_emails` (`user_id`, `email`, `email_type`) VALUES (76, 'electa.boehm@example.com', 'main');
INSERT INTO `user_emails` (`user_id`, `email`, `email_type`) VALUES (77, 'stamm.alexandra@example.org', 'reserved');
INSERT INTO `user_emails` (`user_id`, `email`, `email_type`) VALUES (78, 'ilene98@example.org', 'reserved');
INSERT INTO `user_emails` (`user_id`, `email`, `email_type`) VALUES (79, 'claude19@example.net', 'main');
INSERT INTO `user_emails` (`user_id`, `email`, `email_type`) VALUES (80, 'abshire.lennie@example.org', 'reserved');
INSERT INTO `user_emails` (`user_id`, `email`, `email_type`) VALUES (81, 'mann.bartholome@example.net', 'reserved');
INSERT INTO `user_emails` (`user_id`, `email`, `email_type`) VALUES (82, 'elittle@example.net', 'main');
INSERT INTO `user_emails` (`user_id`, `email`, `email_type`) VALUES (83, 'sporer.trever@example.org', 'main');
INSERT INTO `user_emails` (`user_id`, `email`, `email_type`) VALUES (84, 'yorn@example.com', 'main');
INSERT INTO `user_emails` (`user_id`, `email`, `email_type`) VALUES (85, 'sanford.fabian@example.com', 'reserved');
INSERT INTO `user_emails` (`user_id`, `email`, `email_type`) VALUES (86, 'amy10@example.net', 'main');
INSERT INTO `user_emails` (`user_id`, `email`, `email_type`) VALUES (87, 'milford75@example.net', 'main');
INSERT INTO `user_emails` (`user_id`, `email`, `email_type`) VALUES (88, 'yesenia.rowe@example.com', 'reserved');
INSERT INTO `user_emails` (`user_id`, `email`, `email_type`) VALUES (89, 'melissa60@example.net', 'reserved');
INSERT INTO `user_emails` (`user_id`, `email`, `email_type`) VALUES (90, 'dale08@example.com', 'main');
INSERT INTO `user_emails` (`user_id`, `email`, `email_type`) VALUES (91, 'mario05@example.com', 'main');
INSERT INTO `user_emails` (`user_id`, `email`, `email_type`) VALUES (92, 'cody60@example.net', 'reserved');
INSERT INTO `user_emails` (`user_id`, `email`, `email_type`) VALUES (93, 'schmeler.malika@example.com', 'main');
INSERT INTO `user_emails` (`user_id`, `email`, `email_type`) VALUES (94, 'kenya03@example.net', 'main');
INSERT INTO `user_emails` (`user_id`, `email`, `email_type`) VALUES (95, 'vincenzo50@example.net', 'main');
INSERT INTO `user_emails` (`user_id`, `email`, `email_type`) VALUES (96, 'olittle@example.net', 'main');
INSERT INTO `user_emails` (`user_id`, `email`, `email_type`) VALUES (97, 'terrell37@example.org', 'main');
INSERT INTO `user_emails` (`user_id`, `email`, `email_type`) VALUES (98, 'haylie.pfannerstill@example.org', 'reserved');
INSERT INTO `user_emails` (`user_id`, `email`, `email_type`) VALUES (99, 'electa.wunsch@example.org', 'reserved');
INSERT INTO `user_emails` (`user_id`, `email`, `email_type`) VALUES (100, 'gus36@example.net', 'main');


