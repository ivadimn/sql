-- Проанализировать запросы, которые выполнялись на занятии, 
-- определить возможные корректировки и/или улучшения (JOIN пока не применять).


-- Пусть задан некоторый пользователь. 
-- из всех друзей этого пользователя найдите человека, который больше всех общался с нашим пользователем.
-- пусть user_id = 10
-- бралось так что "больше всех общался" это тот кто писал и тот кому наш пользователе писал" 
-- правда получилось как то сложно (может быть можно проще???)
-- ecть некоторая неуверенность в правильности (но на моих данных считает правильно)

SELECT m.uname, count(m.uname) FROM (
SELECT  
  (SELECT CONCAT(first_name, ' ', last_name) 
	FROM users WHERE id = from_user_id) as uname 
  FROM messages WHERE to_user_id = 10
  AND from_user_id IN (
		SELECT friend_id 
			FROM friendship 
			WHERE user_id = 10
			AND requested_at IS NOT NULL
			AND status_id IN (
				SELECT id FROM friendship_statuses WHERE name = 'Confirmed')
		UNION
		SELECT user_id 
			FROM friendship 
			WHERE friend_id = 10
			AND requested_at IS NOT NULL
			AND status_id IN (
			SELECT id FROM friendship_statuses WHERE name = 'Confirmed')
		)
UNION ALL
SELECT 
  (SELECT CONCAT(first_name, ' ', last_name) 
	FROM users WHERE id = to_user_id) as uname	
  FROM messages WHERE from_user_id = 10
  AND to_user_id IN (
		SELECT friend_id 
			FROM friendship 
			WHERE user_id = 10
			AND requested_at IS NOT NULL
			AND status_id IN (
				SELECT id FROM friendship_statuses WHERE name = 'Confirmed')
		UNION
		SELECT user_id 
			FROM friendship 
			WHERE friend_id = 10
			AND requested_at IS NOT NULL
			AND status_id IN (
			SELECT id FROM friendship_statuses WHERE name = 'Confirmed')
		)  
  ) as m
  GROUP BY m.uname
  ORDER BY COUNT(m.uname) DESC
  LIMIT 1; 


-- Подсчитать общее количество лайков, которые получили 10 самых молодых пользователей.
-- смог сделать только с использованием временной таблицыб куда были вставлены 
-- 10 самых молодых пользователей  
-- конструкция: WHERE user_id IN ( SELECT user_id 
#               FROM profiles
#               ORDER BY FLOOR(DATEDIFF(NOW(), birthday) / 365.25)
#               LIMIT 10); 
#   не работает
#   наверно есть другое решение ???
 
DROP TABLE IF EXISTS uids;
CREATE TEMPORARY TABLE uids SELECT user_id 
	FROM profiles
    ORDER BY FLOOR(DATEDIFF(NOW(), birthday) / 365.25)
    LIMIT 10;
    
SELECT COUNT(l.uid) as 'total likes' FROM (
SELECT from_user_id as uid
   FROM messages
   WHERE id IN (
       SELECT target_id FROM likes WHERE target_type_id = (
			SELECT id FROM target_types WHERE name = 'messages'
			)
       ) 
UNION ALL
SELECT id as uid
   FROM users
   WHERE id IN (
       SELECT target_id FROM likes WHERE target_type_id = (
			SELECT id FROM target_types WHERE name = 'users'
			)
       )
UNION ALL
SELECT user_id as uid
   FROM media
   WHERE id IN (
       SELECT target_id FROM likes WHERE target_type_id = (
			SELECT id FROM target_types WHERE name = 'media'
		    )
       )
UNION ALL
SELECT user_id as uid
   FROM posts
   WHERE id IN (
       SELECT target_id FROM likes WHERE target_type_id = (
			SELECT id FROM target_types WHERE name = 'posts'
			)
       )
) as l
WHERE l.uid IN (SELECT user_id FROM uids);   
  

-- Определить кто больше поставил лайков (всего) - мужчины или женщины?

SELECT  CONCAT('мужчины поставили ', COUNT(user_id), ' лайков') as mans,
        CONCAT('женщины поставили ',(SELECT COUNT(user_id)  from likes
				WHERE user_id IN (SELECT user_id FROM profiles WHERE sex = 'm')) , ' лайков') as woman,
		IF ( COUNT(user_id) > (SELECT COUNT(user_id) as mans  from likes
				WHERE user_id IN (SELECT user_id FROM profiles WHERE sex = 'm')), 
                'мужчины поставили больше лайков', 'женщины поставили больше лайков') as 'вывод'
        FROM likes
		WHERE user_id IN (SELECT user_id FROM profiles WHERE sex = 'f');



-- Найти 10 пользователей, которые проявляют наименьшую активность в использовании социальной сет
-- выбираем пользователей из всех таблиц где они обозначились и которые так или иначе характеризуют активность пользователей

SELECT  (SELECT CONCAT(first_name, ' ', last_name) 
        FROM users WHERE id = t.uid) as 'Имя',  COUNT(t.uid) as 'Количество вхождений' FROM  
(SELECT user_id as uid FROM media
UNION ALL
SELECT from_user_id as uid FROM messages
UNION ALL
SELECT user_id as uid FROM communities_users
UNION ALL
SELECT user_id as uid FROM posts
UNION ALL
SELECT user_id as uid FROM likes
UNION ALL 
SELECT user_id as uid FROM meetings_users
UNION ALL
SELECT user_id as uid FROM friendship
UNION ALL 
SELECT friend_id as uid FROM friendship WHERE confirmed_at IS NOT NULL) as t
GROUP BY t.uid
ORDER BY COUNT(t.uid)
LIMIT 10;



