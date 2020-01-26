# 3. Переписать запросы, заданые к ДЗ урока 6 с использованием JOIN (четыре запроса).

# Пусть задан некоторый пользователь. 
# из всех друзей этого пользователя найдите человека, который больше всех общался с нашим пользователем.
# пусть user_id = 10
# бралось так что "больше всех общался" это тот кто писал и тот кому наш пользователm писал" 
# полностью от вложенности избавится не удалось, 
# главная выборка делается из объединения запросов 

# наш пользователь user_id = 10
		        
SELECT m.uname, count(m.uname) FROM (			
# Сообщения к нашему пользователя, друзья нашего пользователя - friend_id
 (SELECT CONCAT(first_name, ' ', last_name) as uname
	FROM users u 
    JOIN messages m ON u.id = m.from_user_id
    AND m.to_user_id = 10 
    JOIN friendship f ON m.from_user_id = f.friend_id
    AND f.requested_at IS NOT NULL 
    AND f.user_id = 10
    JOIN friendship_statuses fs ON fs.id = f.status_id
    AND fs.name = 'Confirmed')
# Сообщения к нашему пользователя, друзья нашего пользователя - user_id   
 UNION ALL 
 (SELECT CONCAT(first_name, ' ', last_name) as uname
	FROM users u 
    JOIN messages m ON u.id = m.from_user_id
    AND m.to_user_id = 10 
    JOIN friendship f ON m.from_user_id = f.user_id
    AND f.requested_at IS NOT NULL 
    AND f.friend_id = 10
    JOIN friendship_statuses fs ON fs.id = f.status_id
    AND fs.name = 'Confirmed')
# Сообщения от нашего пользователя, друзья нашего пользователя - friend_id      
 UNION ALL
 (SELECT CONCAT(first_name, ' ', last_name) as uname
	FROM users u 
    JOIN messages m ON u.id = m.to_user_id
    AND m.from_user_id = 10 
    JOIN friendship f ON m.to_user_id = f.friend_id
    AND f.requested_at IS NOT NULL 
    AND f.user_id = 10
    JOIN friendship_statuses fs ON fs.id = f.status_id
    AND fs.name = 'Confirmed')
# Сообщения от нашего пользователя, друзья нашего пользователя - user_id     
 UNION ALL
 (SELECT CONCAT(first_name, ' ', last_name) as uname
	FROM users u 
    JOIN messages m ON u.id = m.to_user_id
    AND m.from_user_id = 10 
    JOIN friendship f ON m.to_user_id = f.user_id
    AND f.requested_at IS NOT NULL 
    AND f.friend_id = 10
    JOIN friendship_statuses fs ON fs.id = f.status_id
    AND fs.name = 'Confirmed')    
) as m
GROUP BY m.uname
ORDER BY COUNT(m.uname) DESC
LIMIT 1;


# Подсчитать общее количество лайков, которые получили 10 самых молодых пользователей.
# смог сделать только с использованием временной таблицыб куда были вставлены 
# 10 самых молодых пользователей  
# здесь не удалось до конца избавиться от вложенности

SELECT COUNT(t.uid) as 'total likes' FROM (
# количество сообщений
(SELECT from_user_id as uid
   FROM messages m
   JOIN likes l ON m.id = l.target_id
   JOIN target_types tt ON l.target_type_id = tt.id
   AND tt.name = 'messages')
UNiON ALL
#количество пользователей
(SELECT u.id as uid
   FROM users u
   JOIN likes l ON u.id = l.target_id
   JOIN target_types tt ON l.target_type_id = tt.id
   AND tt.name = 'users')
UNION ALL
# количество media   
(SELECT me.user_id as uid
   FROM media me
   JOIN likes l ON me.id = l.target_id
   JOIN target_types tt ON l.target_type_id = tt.id
   AND tt.name = 'media')
UNION ALL   
# количество posts   
(SELECT p.user_id as uid
   FROM posts p
   JOIN likes l ON p.id = l.target_id
   JOIN target_types tt ON l.target_type_id = tt.id
   AND tt.name = 'posts')
   ) as t
   WHERE t.uid IN (SELECT * FROM (
      SELECT user_id FROM profiles ORDER BY birthday DESC LIMIT 10) as b); 
      
      
-- Определить кто больше поставил лайков (всего) - мужчины или женщины?

SELECT CASE(p.sex)
		WHEN 'm' THEN 'мужчины'
		WHEN 'f' THEN 'женщины'
	END AS sex, 
	COUNT(*) as l_count 
    FROM likes l JOIN profiles p ON l.user_id = p.user_id
    GROUP BY sex
    ORDER BY l_count DESC
    LIMIT 1;

# Найти 10 пользователей, которые проявляют наименьшую активность в использовании социальной сет
# выбираем пользователей из всех таблиц где они обозначились и которые так или иначе характеризуют активность пользователей
# не удалось до конца избавиться от вложеннсти

SELECT  CONCAT(u.first_name, ' ', u.last_name) as 'Имя',  COUNT(t.uid) as 'Количество вхождений' 
FROM  
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
    JOIN users u ON u.id = t.uid
	GROUP BY t.uid
	ORDER BY COUNT(t.uid)
	LIMIT 10;  
   

    
    
    