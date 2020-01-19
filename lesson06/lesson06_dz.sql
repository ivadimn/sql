-- Проанализировать запросы, которые выполнялись на занятии, 
-- определить возможные корректировки и/или улучшения (JOIN пока не применять).


-- Пусть задан некоторый пользователь. 
-- из всех друзей этого пользователя найдите человека, который больше всех общался с нашим пользователем.
-- пусть user_id = 10
select * from friendship_statuses;

INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`) 
VALUES (10, 73, 2, '2018-06-02 09:56:27', '2019-06-20 05:38:59');
UPDATE friendship SET status_id = 2 WHERE friend_id = 10;

-- выбор друзей
(SELECT friend_id 
	FROM friendship 
    WHERE user_id = 10
    AND requested_at IS NOT NULL
    AND status_id IN (
		SELECT id FROM friendship_statuses WHERE name = 'Confirmed')
    )    
UNION
(SELECT user_id 
	FROM friendship 
    WHERE friend_id = 10
    AND requested_at IS NOT NULL
    AND status_id IN (
		SELECT id FROM friendship_statuses WHERE name = 'Confirmed')
);

INSERT INTO messages (`from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`) 
VALUES (10, 73, 'Cumque minus eos quo expedita. Praesentium expedita culpa fuga atque autem dolorum. Id a fugit soluta ut.', 1, 1, '2019-09-17 20:41:25');

SELECT id, COUNT(id) FROM users WHERE id IN (
 (SELECT from_user_id, body, is_delivered, created_at 
  FROM messages
    WHERE from_user_id IN (
    (SELECT friend_id 
		FROM friendship 
		WHERE user_id = 10
		AND requested_at IS NOT NULL
		AND status_id IN (
			SELECT id FROM friendship_statuses WHERE name = 'Confirmed'))
	UNION
	(SELECT user_id 
		FROM friendship 
		WHERE friend_id = 10
		AND requested_at IS NOT NULL
		AND status_id IN (
			SELECT id FROM friendship_statuses WHERE name = 'Confirmed'))
	 )
     AND to_user_id = 10)
UNION
  (SELECT to_user_id, body, is_delivered, created_at 
  FROM messages
    WHERE to_user_id IN (
    (SELECT friend_id 
		FROM friendship 
		WHERE user_id = 10
		AND requested_at IS NOT NULL
		AND status_id IN (
			SELECT id FROM friendship_statuses WHERE name = 'Confirmed'))
	UNION
	(SELECT user_id 
		FROM friendship 
		WHERE friend_id = 10
		AND requested_at IS NOT NULL
		AND status_id IN (
			SELECT id FROM friendship_statuses WHERE name = 'Confirmed'))
	 )
     AND from_user_id = 10)
)
GROUP BY id;     





-- Подсчитать общее количество лайков, которые получили 10 самых молодых пользователей.
-- Определить кто больше поставил лайков (всего) - мужчины или женщины?
-- Найти 10 пользователей, которые проявляют наименьшую активность в использовании социальной сет
