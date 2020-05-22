# 1. Проанализировать какие запросы могут выполняться 
# наиболее часто в процессе работы приложения и добавить необходимые индексы.

# во всех разработанных нами запросах таблицы соединяются по
# по внешним или первичным ключам по которым идексы уже существуют
# ничего дополнительного не требуется

# для запроса Подсчитать общее количество лайков, которые получили 10 самых молодых пользователей
# можно создать индекс в таблице profiles по полю birthday, время выполнения запроса снижается
# почти в 2 раза
 
# Пусть задан некоторый пользователь. 
# из всех друзей этого пользователя найдите человека, который больше всех общался с нашим пользователем.
# пусть user_id = 10

# для этого запроса дополнительные индексы не нужны 
# внешние ключи и так имеют индексы

SELECT CONCAT(u.first_name, ' ', u.last_name) as uname, 
	 COUNT(m.id) as 'количество сообщений'
     FROM users u
     JOIN friendship f ON (u.id = f.friend_id AND f.user_id = 10) 
			OR (u.id = f.user_id AND f.friend_id = 10)
     JOIN friendship_statuses fs ON f.status_id = fs.id AND fs.name = 'Confirmed' 
        AND f.requested_at IS NOT NULL        
     JOIN messages m ON (u.id = m.from_user_id AND m.to_user_id = 10) 
			OR (u.id = m.to_user_id AND m.from_user_id = 10)
     GROUP BY uname
     ORDER BY COUNT(m.id) DESC
     LIMIT 1;
   

# Подсчитать общее количество лайков, которые получили 10 самых молодых пользователей.
# Для такого запроса можно сделать индекс в тавлице profiles

CREATE INDEX profiles_birthday_idx ON profiles(birthday);

# с индексом запрос выполняется быстрее

SELECT COUNT(um.id) as 'количество лайков'
	FROM users um
    JOIN messages m ON um.id = m.from_user_id
    JOIN users u1 ON um.id = u1.id
    JOIN media me ON um.id = me.id  
    JOIN posts p ON um.id = p.id
    JOIN likes l ON (m.id = l.target_id 
			AND l.target_type_id = (SELECT id FROM target_types WHERE name = 'messages'))
            OR (u1.id = l.target_id 
			AND l.target_type_id = (SELECT id FROM target_types WHERE name = 'users'))
            OR (me.id = l.target_id 
			AND l.target_type_id = (SELECT id FROM target_types WHERE name = 'media'))
            OR (p.id = l.target_id 
			AND l.target_type_id = (SELECT id FROM target_types WHERE name = 'posts'))
    WHERE um.id IN (SELECT * FROM (
      SELECT user_id FROM profiles ORDER BY birthday DESC LIMIT 10) as b); 


# Определить кто больше поставил лайков (всего) - мужчины или женщины?
# здесь дополнительные индексы не нужны

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

#для этого запроса дополнительные индексы не нужны

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

# 2. Задание на оконные функции
# Построить запрос, который будет выводить следующие столбцы:
# имя группы
# среднее количество пользователей в группах
# самый молодой пользователь в группе
# самый пожилой пользователь в группе
# общее количество пользователей в группе
# всего пользователей в системе
# отношение в процентах (общее количество пользователей в группе / всего пользователей в системе) * 100

# не всё получилось сделать с помощью OVER
# 
        
SELECT DISTINCT c.name as 'group_name', 
    COUNT(cu.user_id) OVER() / (SELECT COUNT(*) FROM communities) as 'avereage count by group',
    COUNT(cu.user_id) OVER(PARTITION BY cu.community_id)  AS 'users in group',
    (SELECT COUNT(*) FROM users) AS 'total users',
    FIRST_VALUE(CONCAT(u.first_name, ' ', u.last_name)) 
		OVER(PARTITION BY cu.community_id ORDER BY p.birthday DESC)  AS 'youngest',
    FIRST_VALUE(CONCAT(u.first_name, ' ', u.last_name)) 
		OVER(PARTITION BY cu.community_id ORDER BY p.birthday)  AS 'oldest',  
    COUNT(cu.user_id) OVER(PARTITION BY cu.community_id) / (SELECT COUNT(*) FROM users) * 100 AS '%%'
    FROM communities_users cu JOIN communities c ON c.id = cu.community_id
    JOIN users u ON u.id = cu.user_id
    JOIN profiles p ON p.user_id = u.id;
		
# 3. (по желанию) Задание на денормализацию
# Разобраться как построен и работает следующий запрос:
#Найти 10 пользователей, которые проявляют наименьшую активность в использовании социальной сети.

#Правильно-ли он построен?
#Какие изменения, включая денормализацию, можно внести в структуру БД
#чтобы существенно повысить скорость работы этого запроса?


SELECT users.id,
	COUNT(DISTINCT messages.id) +
	COUNT(DISTINCT likes.id) +
	COUNT(DISTINCT media.id) AS activity
FROM users
LEFT JOIN messages
	ON users.id = messages.from_user_id
LEFT JOIN likes
	ON users.id = likes.user_id
LEFT JOIN media
	ON users.id = media.user_id
GROUP BY users.id
ORDER BY activity
LIMIT 10;

# я считаю, если запрос выдаёт правильный результат
# то построен он правильно
# переделывать, по моему, нужно тогда когда мы перестанем укладываться 
# в требования по времени или по каким нибудь другим параметрам 

# в БД можно создать специальную таблицу активности пользователей,
# где хранить количество активностей пользователя 
# колочество лайков, количество сообщений, количество медиа и т.п.

CREATE TABLE activity (
	user_id INT UNSIGNED,
    type_activity VARCHAR(32) NOT NULL,
    total INT UNSIGNED,
    FOREIGN KEY (user_id) REFERENCES users(id),
    PRIMARY KEY (user_id, type_activity)
);  
INSERT INTO activity SELECT from_user_id, 'messages', COUNT(*) FROM messages group by from_user_id;
INSERT INTO activity SELECT user_id, 'likes', COUNT(*) FROM likes group by user_id;
INSERT INTO activity SELECT user_id, 'media', COUNT(*) FROM media group by user_id;

# добавить триггеры вcтавки и удаления на таблицы messages, likes, media
DROP TRIGGER IF EXISTS add_message_user_activity;
DELIMITER //
CREATE TRIGGER add_message_user_activity AFTER INSERT ON messages
FOR EACH ROW
BEGIN
	SELECT user_id INTO @u FROM activity WHERE type_activity = 'messages' 
			AND user_id = NEW.from_user_id;
    IF @u IS NOT NULL THEN
		UPDATE activity SET total = total + 1 WHERE user_id = @u AND type_activity = 'messages';
    ELSE
		INSERT INTO activity (user_id, type_activity, total)
			VALUES(NEW.from_user_id, 'messages', 1);
    END IF;
END//
DELIMITER ;
DROP TRIGGER IF EXISTS delete_message_user_activity;
DELIMITER //
CREATE TRIGGER delete_message_user_activity AFTER DELETE ON messages
FOR EACH ROW
BEGIN
	SELECT user_id, total INTO @u, @c FROM activity WHERE type_activity = 'messages' 
			AND user_id = OLD.from_user_id;
    SET @c = @c - 1;        
    IF @u IS NOT NULL THEN
		IF @c > 0 THEN
			UPDATE activity SET total = @c WHERE user_id = @u AND type_activity = 'messages';
        ELSE 
			DELETE FROM activity WHERE user_id = @u AND type_activity = 'messages';
        END IF;    
    END IF;
END//
DELIMITER ;


# это для проверки
SELECT user_id, total FROM activity WHERE type_activity = 'messages' ORDER BY user_id;

INSERT INTO messages (id, from_user_id, to_user_id, body, is_important, is_delivered)
	VALUES(NULL, 2, 16, 'Some message  09-9-06767676', 1, 1);
DELETE FROM messages WHERE id = 130;

# таблица likes
	
DROP TRIGGER IF EXISTS add_like_user_activity;
DELIMITER //
CREATE TRIGGER add_like_user_activity AFTER INSERT ON likes
FOR EACH ROW
BEGIN
	SELECT user_id INTO @u FROM activity WHERE type_activity = 'likes' 
			AND user_id = NEW.user_id;
    IF @u IS NOT NULL THEN
		UPDATE activity SET total = total + 1 WHERE user_id = @u AND type_activity = 'likes';
    ELSE
		INSERT INTO activity (user_id, type_activity, total)
			VALUES(NEW.user_id, 'likes', 1);
    END IF;
END//
DELIMITER ;
DROP TRIGGER IF EXISTS delete_likes_user_activity;
DELIMITER //
CREATE TRIGGER delete_likes_user_activity AFTER DELETE ON likes
FOR EACH ROW
BEGIN
	SELECT user_id, total INTO @u, @c FROM activity WHERE type_activity = 'likes' 
			AND user_id = OLD.user_id;
    SET @c = @c - 1;        
    IF @u IS NOT NULL THEN
		IF @c > 0 THEN
			UPDATE activity SET total = @c WHERE user_id = @u AND type_activity = 'likes';
        ELSE 
			DELETE FROM activity WHERE user_id = @u AND type_activity = 'likes';
        END IF;    
    END IF;
END//
DELIMITER ;    
    
# это для проверки
SELECT user_id, total FROM activity WHERE type_activity = 'likes' ORDER BY user_id;

INSERT INTO likes (user_id, target_id, target_type_id)
	VALUES(1, 128, 1);
    
# таблица media
	
DROP TRIGGER IF EXISTS add_media_user_activity;
DELIMITER //
CREATE TRIGGER add_media_user_activity AFTER INSERT ON media
FOR EACH ROW
BEGIN
	SELECT user_id INTO @u FROM activity WHERE type_activity = 'media' 
			AND user_id = NEW.user_id;
    IF @u IS NOT NULL THEN
		UPDATE activity SET total = total + 1 WHERE user_id = @u AND type_activity = 'media';
    ELSE
		INSERT INTO activity (user_id, type_activity, total)
			VALUES(NEW.user_id, 'media', 1);
    END IF;
END//
DELIMITER ;

DROP TRIGGER IF EXISTS delete_media_user_activity;
DELIMITER //
CREATE TRIGGER delete_media_user_activity AFTER DELETE ON media
FOR EACH ROW
BEGIN
	SELECT user_id, total INTO @u, @c FROM activity WHERE type_activity = 'media' 
			AND user_id = OLD.user_id;
    SET @c = @c - 1;        
    IF @u IS NOT NULL THEN
		IF @c > 0 THEN
			UPDATE activity SET total = @c WHERE user_id = @u AND type_activity = 'media';
        ELSE 
			DELETE FROM activity WHERE user_id = @u AND type_activity = 'media';
        END IF;    
    END IF;
END//
DELIMITER ;    

# тепер информацию получаемую с помощью исходного запроса
# можно получить проще 

#Найти 10 пользователей, которые проявляют наименьшую активность в использовании социальной сети.

SELECT users.id, IF(SUM(a.total) IS NULL, 0, SUM(a.total)) 
	FROM users LEFT JOIN  activity a
		ON users.id = a.user_id
	GROUP BY users.id
	ORDER BY SUM(total)
	LIMIT 10;

    
    

    
