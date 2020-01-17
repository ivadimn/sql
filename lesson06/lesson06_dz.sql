-- Проанализировать запросы, которые выполнялись на занятии, 
-- определить возможные корректировки и/или улучшения (JOIN пока не применять).



-- Пусть задан некоторый пользователь. 
-- из всех друзей этого пользователя найдите человека, который больше всех общался с нашим пользователем.
-- пусть user_id = 10

Select id from users;
Select from_user_id FROM messages WHERE to_user_id = 10;

INSERT INTO `messages` (`from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`) VALUES (11, 10, 'Cumque minus eos quo expedita. Praesentium expedita culpa fuga atque autem dolorum. Id a fugit soluta ut.', 1, 0);
INSERT INTO `messages` (`from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`) VALUES (85, 10, 'Corporis deleniti natus iste. Eligendi iure perferendis et maxime illum cumque. Et et dolores aut consequatur qui nulla. Id sunt perferendis est et ut quia quos.', 1, 1);
INSERT INTO `messages` (`from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`) VALUES (78, 10, 'Sit quasi sint vitae ratione voluptate distinctio nemo provident. Sed cupiditate vitae nemo corporis quia. Aperiam veritatis hic natus officia nihil repellat libero.', 1, 0);
INSERT INTO `messages` (`from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`) VALUES (45, 10, 'Dolorem eius est veniam velit sed. Voluptatem cumque nostrum consequatur aut facilis. Corporis numquam aperiam qui vel totam pariatur animi qui. Cum deleniti soluta dolores omnis.', 1, 0);
INSERT INTO `messages` (`from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`) VALUES (32, 10, 'Aut non nam molestiae sit. Velit ut ab est temporibus. Corrupti tenetur illo sapiente assumenda inventore. Quisquam ea nesciunt et quasi qui.', 0, 1);
INSERT INTO `messages` (`from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`) VALUES (100, 10, 'Aut officia aut dicta minima et. Et voluptate sed officia id.', 0, 0);
INSERT INTO `messages` (`from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`) VALUES (34, 10, 'Incidunt suscipit nulla amet aut voluptas eveniet laudantium. Nostrum quasi eveniet omnis sed id et. Qui dignissimos culpa doloribus ut occaecati id laboriosam. Corporis sed velit et.', 1, 0);
INSERT INTO `messages` (`from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`) VALUES (10, 10, 'Facilis accusamus voluptas repellat qui. Optio doloremque eligendi ratione consequatur incidunt pariatur sunt. Vero odio perspiciatis quasi qui animi.', 1, 1);
INSERT INTO `messages` (`from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`) VALUES (86, 10, 'Aut aut ab consequatur cumque aperiam natus iste. Ut a sapiente iste beatae officiis.', 0, 1);
INSERT INTO `messages` (`from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`) VALUES (12, 10, 'Doloremque iure sit accusamus. Sequi sapiente voluptatum nobis quam quibusdam facere. Corrupti nisi sed sed qui dicta non voluptas.', 1, 0);
INSERT INTO `messages` (`from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`) VALUES (66, 10, 'Et voluptas labore doloremque minima repudiandae quidem incidunt. Modi quisquam illum molestias nemo voluptates. Quas molestiae eos ipsum optio itaque vero corporis nobis.', 1, 1);
INSERT INTO `messages` (`from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`) VALUES (77, 10, 'Totam voluptate ut aut commodi accusamus omnis maxime. Magnam officia sit consequatur illo. Ratione rerum possimus dolore sunt quisquam.', 0, 0);
INSERT INTO `messages` (`from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`) VALUES (21, 10, 'Voluptatem totam consequuntur aut nulla repellendus. Id rerum aut quidem accusamus voluptatem. Doloribus dolores id ab commodi.', 0, 1);
INSERT INTO `messages` (`from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`) VALUES (42, 10, 'Illo corporis est atque qui vel rem harum. Suscipit blanditiis in ipsam deleniti hic voluptas. Ut amet aut tempore eos.', 1, 0);


-- Подсчитать общее количество лайков, которые получили 10 самых молодых пользователей.
-- Определить кто больше поставил лайков (всего) - мужчины или женщины?
-- Найти 10 пользователей, которые проявляют наименьшую активность в использовании социальной сет
