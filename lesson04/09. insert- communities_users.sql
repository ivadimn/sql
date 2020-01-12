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
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (1, 11);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (1, 21);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (1, 31);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (1, 41);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (1, 51);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (1, 61);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (1, 71);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (1, 81);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (1, 91);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (2, 2);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (2, 12);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (2, 22);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (2, 32);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (2, 42);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (2, 52);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (2, 62);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (2, 72);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (2, 82);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (2, 92);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (3, 3);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (3, 13);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (3, 23);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (3, 33);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (3, 43);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (3, 53);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (3, 63);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (3, 73);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (3, 83);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (3, 93);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (4, 4);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (4, 14);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (4, 24);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (4, 34);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (4, 44);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (4, 54);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (4, 64);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (4, 74);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (4, 84);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (4, 94);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (5, 5);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (5, 15);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (5, 25);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (5, 35);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (5, 45);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (5, 55);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (5, 65);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (5, 75);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (5, 85);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (5, 95);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (6, 6);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (6, 16);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (6, 26);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (6, 36);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (6, 46);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (6, 56);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (6, 66);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (6, 76);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (6, 86);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (6, 96);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (7, 7);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (7, 17);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (7, 27);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (7, 37);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (7, 47);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (7, 57);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (7, 67);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (7, 77);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (7, 87);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (7, 97);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (8, 8);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (8, 18);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (8, 28);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (8, 38);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (8, 48);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (8, 58);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (8, 68);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (8, 78);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (8, 88);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (8, 98);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (9, 9);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (9, 19);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (9, 29);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (9, 39);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (9, 49);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (9, 59);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (9, 69);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (9, 79);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (9, 89);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (9, 99);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (10, 10);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (10, 20);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (10, 30);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (10, 40);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (10, 50);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (10, 60);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (10, 70);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (10, 80);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (10, 90);
INSERT INTO `communities_users` (`community_id`, `user_id`) VALUES (10, 100);


