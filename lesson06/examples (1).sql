-- Урок 6
-- Операторы, фильтрация, сортировка и ограничение


-- Разбор ДЗ

-- Тема Операции, задание 1
-- Пусть в таблице users поля created_at и updated_at оказались незаполненными.
-- Заполните их текущими датой и временем.
DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Имя покупателя',
  birthday_at DATE COMMENT 'Дата рождения',
  created_at DATETIME,
  updated_at DATETIME
) COMMENT = 'Покупатели';

INSERT INTO
  users (name, birthday_at, created_at, updated_at)
VALUES
  ('Геннадий', '1990-10-05', NULL, NULL),
  ('Наталья', '1984-11-12', NULL, NULL),
  ('Александр', '1985-05-20', NULL, NULL),
  ('Сергей', '1988-02-14', NULL, NULL),
  ('Иван', '1998-01-12', NULL, NULL),
  ('Мария', '2006-08-29', NULL, NULL);

UPDATE
  users
SET
  created_at = NOW(),
  updated_at = NOW();
  
  
-- Тема Операции, задание 2
-- Таблица users была неудачно спроектирована.
-- Записи created_at и updated_at были заданы типом VARCHAR и в них долгое время помещались
-- значения в формате "20.10.2017 8:10".
-- Необходимо преобразовать поля к типу DATETIME, сохранив введеные ранее значения.
DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Имя покупателя',
  birthday_at DATE COMMENT 'Дата рождения',
  created_at VARCHAR(255),
  updated_at VARCHAR(255)
) COMMENT = 'Покупатели';

INSERT INTO
  users (name, birthday_at, created_at, updated_at)
VALUES
  ('Геннадий', '1990-10-05', '07.01.2016 12:05', '07.01.2016 12:05'),
  ('Наталья', '1984-11-12', '20.05.2016 16:32', '20.05.2016 16:32'),
  ('Александр', '1985-05-20', '14.08.2016 20:10', '14.08.2016 20:10'),
  ('Сергей', '1988-02-14', '21.10.2016 9:14', '21.10.2016 9:14'),
  ('Иван', '1998-01-12', '15.12.2016 12:45', '15.12.2016 12:45'),
  ('Мария', '2006-08-29', '12.01.2017 8:56', '12.01.2017 8:56');

UPDATE
  users
SET
  created_at = STR_TO_DATE(created_at, '%d.%m.%Y %k:%i'),
  updated_at = STR_TO_DATE(updated_at, '%d.%m.%Y %k:%i');

ALTER TABLE
  users
CHANGE
  created_at created_at DATETIME DEFAULT CURRENT_TIMESTAMP;

ALTER TABLE
  users
CHANGE
  updated_at updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

DESCRIBE users;


-- Тема Операции, задание 3
-- В таблице складских запасов storehouses_products в поле value могут встречаться самые
-- разные цифры: 0, если товар закончился и выше нуля, если на складе имеются запасы.
-- Необходимо отсортировать записи таким образом, чтобы они выводились в порядке увеличения
-- значения value. Однако, нулевые запасы должны выводиться в конце, после всех записей.
DROP TABLE IF EXISTS storehouses_products;
CREATE TABLE storehouses_products (
  id SERIAL PRIMARY KEY,
  storehouse_id INT UNSIGNED,
  product_id INT UNSIGNED,
  value INT UNSIGNED COMMENT 'Запас товарной позиции на складе',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Запасы на складе';

INSERT INTO
  storehouses_products (storehouse_id, product_id, value)
VALUES
  (1, 543, 0),
  (1, 789, 2500),
  (1, 3432, 0),
  (1, 826, 30),
  (1, 719, 500),
  (1, 638, 1);

SELECT
  *
FROM
  storehouses_products
ORDER BY
  IF(value > 0, 0, 1),
  value;


SELECT
  *
FROM
  storehouses_products
ORDER BY
  value = 0, value;


-- Тема Операции, задание 4
-- (по желанию) Из таблицы users необходимо извлечь пользователей, родившихся в
-- августе и мае. Месяцы заданы в виде списка английских названий ('may', 'august')

SELECT name  
  FROM users
  WHERE DATE_FORMAT(birthday_at, '%M') IN ('may', 'august');

-- Тема Операции, задание 5
-- (по желанию) Из таблицы catalogs извлекаются записи при помощи запроса.
-- SELECT * FROM catalogs WHERE id IN (5, 1, 2);
-- Отсортируйте записи в порядке, заданном в списке IN.

INSERT INTO catalogs VALUES
  (NULL, 'Процессоры'),
  (NULL, 'Материнские платы'),
  (NULL, 'Видеокарты'),
  (NULL, 'Жесткие диски'),
  (NULL, 'Оперативная память');

SELECT
  *
FROM
  catalogs
WHERE
  id IN (5, 1, 2)
ORDER BY
  FIELD(id, 5, 1, 2);

-- Тема Агрегация, задание 1
-- Подсчитайте средний возраст пользователей в таблице users
SELECT
  AVG(TIMESTAMPDIFF(YEAR, birthday_at, NOW())) AS age
FROM
  users;
	  
-- Тема Агрегация, задание 2
-- Подсчитайте количество дней рождения, которые приходятся на каждый из дней недели.
-- Следует учесть, что необходимы дни недели текущего года, а не года рождения.
SELECT
  DATE_FORMAT(DATE(CONCAT_WS('-', YEAR(NOW()), MONTH(birthday_at), DAY(birthday_at))), '%W') AS day,
  COUNT(*) AS total
FROM
  users
GROUP BY
  day
ORDER BY
  total DESC;

-- Тема Агрегация, задание 3
-- (по желанию) Подсчитайте произведение чисел в столбце таблицы
INSERT INTO catalogs VALUES
  (NULL, 'Процессоры'),
  (NULL, 'Материнские платы'),
  (NULL, 'Видеокарты'),
  (NULL, 'Жесткие диски'),
  (NULL, 'Оперативная память');

SELECT ROUND(EXP(SUM(LN(id)))) FROM catalogs;


  

-- Предложенные варианты реализации лайков и доработки (только для анализа, не для создания!)

-- Вариант 1
CREATE TABLE `likes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `from_user_id` int(10) unsigned NOT NULL,
  `to_user_id` int(10) unsigned NOT NULL,
  `type_likes_id` int(10) unsigned DEFAULT NULL,
  `media_id` int(10) unsigned DEFAULT NULL,
  `posts_id` int(10) unsigned DEFAULT NULL,
  `messages_id` int(10) unsigned DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
);

-- Вариант 2
CREATE TABLE likes (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  user_id INT UNSIGNED NOT NULL ,
  media_id INT UNSIGNED NOT NULL ,
  media_types VARCHAR (255) NOT NULL,
  photo_id INT UNSIGNED NOT NULL,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Вариант 3
CREATE table if not exists likes (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  user_id INT UNSIGNED NOT NULL ,
  media_id INT UNSIGNED NOT NULL ,
  post_id INT unsigned not null ,
  like_amount INT NOT NULL,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP
 );
 
 
 -- Вариант 4
-- Создаем таблицу с лайками, для этого нужно знать кто оставил лайк, к какому именно объекту и
-- к какому классу этот объект относится
-- для того, чтобы реализовать категоризацию лайков (аудио, фото, видео и т.п.)
-- тип медиа добавил ниже через Alter TABLE
CREATE TABLE likes(
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
user_id INT UNSIGNED NOT NULL,
link VARCHAR(255) NOT NULL
);

ALTER TABLE likes ADD media_type INT NOT NULL;
ALTER TABLE media ADD link VARCHAR(255) NOT NULL;
-- Поле link в таблице likes должно соотноситься с полем link в таблице media, чтобы количество лайков не обновлялось постоянно
-- для каждого медиа в таблице, а формировалось через запрос
SELECT count(link) FROM likes GROUP BY link HAVING link = ...


-- Вариант 5
-- создаем таблицу с лайками
CREATE TABLE likes (
id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
content_id
liked_content_type_id INT UNSIGNED NOT NULL,
author_id INT UNSIGNED NOT NULL,
created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- создаем справочник с типами контента, который можно лайкнуть
CREATE TABLE liked_content_types (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL UNIQUE
);


-- Вариант 6
-- Таблица лайков
CREATE TABLE likes (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  user_id INT UNSIGNED NOT NULL ,
  content_id INT UNSIGNED NOT NULL ,
  content_type_id int(10) unsigned NOT NULL,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
 );
-- Тип контента которуму будет ставиться лайк 
CREATE TABLE type_content (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  content_type varchar(255) COLLATE utf8_unicode_ci NOT NULL
 );


-- Вариант 7
-- Предложение по лайкам
-- 1. Для того чтобы мы могли ставить лайки к разным видам таблиц, для постов, медиафайлов,
-- возможно на пользователей создадим еще одну таблицу в которой будем опишем те таблицы на
-- которые можно ставить лайик (то есть не на сами талицы а на записи в таблице)

-- создание таблицы like_tables:
CREATE TABLE like_tables (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(150) NOT NULL UNIQUE
);

-- внесем в нее несколько записей с названием таблиц:
INSERT INTO like_tables (name)
  VALUES ('media'), ('posts'), ('users');
  
-- теперь сама таблица лайков:
-- 1. Отдельный id для этой таблицы считаю не нужным заводить, первичный ключ установить на id
-- пользователя, id таблицы, id записи в таблице. 
-- Тогда автоматически один  и тот же пользователь не сможет создавать несколько лайков под
-- одну и ту же запись.
-- 2. Установим еще величину лайков, то есть либо 1 либо -1 (то есть лайк или дизлайк), тогда
-- можно по записям формировать не только общее количество пользователей, которые поставили
-- отметку, но и просуммировать общее значение лайков и дизлайков.

CREATE TABLE likes (
  user_id INT UNSIGNED NOT NULL ,
  like_tables_id INT UNSIGNED NOT NULL,
  row_id INT UNSIGNED NOT NULL,
  like_value ENUM('-1', '1') NOT NULL,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (user_id, like_tables_id, row_id)
 );


-- Вариант 8
-- По лайкам: лайки можно поставить картинкам (файлам), сообщениям. Вижу два варианта решения:
-- 1. Делаем одну (единую) таблицу для лайков: одна колонка - id сообщения или файла (или его
-- имя), вторая колонка - количество лайков.
-- 2. Второй вариант - включить в уже существующие таблицы столбец с количеством лайков.


-- Вариант 9
-- Для реализации лайков всех объектов, по моему мнению, необходимо реализовать единую
-- идентификацию этих объектов: т.е. создать таблицу идентификаторов : 
CREATE TABLE ids ( id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, );

-- Дальше при создании объектов media, messages, posts, users и т. д.
-- использовать id из ids в качестве первичных ключей
-- например:

CREATE TABLE media (
id INT UNSIGNED NOT NULL,
media_type_id INT UNSIGNED NOT NULL,
user_id INT UNSIGNED NOT NULL,
filename VARCHAR(255) NOT NULL,
size INT UNSIGNED NOT NULL,
metadata JSON,
created_at DATETIME DEFAULT NOW(),
updated_at DATETIME DEFAULT NOW() ON UPDATE NOW(),
FOREIGN KEY (id) REFERENCES ids(id),
PRIMARY KEY (id)
);

CREATE TABLE likes (
id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
user_id INT UNSIGNED NOT NULL ,
object_id INT UNSIGNED NOT NULL,
created_at DATETIME DEFAULT CURRENT_TIMESTAMP
FOREIGN KEY (object_id) REFERENCES ids(id)
);

-- В этом случае каждый объект в таблице likes будет однозначно идентифицироваться и можно
-- подсчитать количество лайков и т. п.

-- Вариант 10
-- Реализация лайков - таблица с 3 столбцами: 
-- 1 - id пользователя который ставит лайк, 
-- 2 - тип сущности которой этот лайк ставится (posts, media и любые другие, которые могут
-- быть добавлены позже),
-- 3 - id экземпляра сущности (id поста в таблице posts).


-- Для хранения типа ресурса, на который ставитьс лайк. Медиа файл, пользователи, пост и тд.
-- В случае расширения типов данных для лайков , добавляется новый тип
CREATE TABLE IF NOT EXISTS resource_type_like (
id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(150) NOT NULL UNIQUE
);

INSERT INTO resource_type_like (name) VALUES 
('users'),
('media'),
('posts');

SELECT * FROM resource_type_like;

-- Таблица для храниния лайков, которые поставил пользователь. resource_id - id ресурса,
-- который лайкнул пользователь, в таблице этого ресурса
-- status - текущий статус записи. 1 стоит лайк, 0 нет лайка
CREATE TABLE IF NOT EXISTS likes (
id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
user_id INT UNSIGNED NOT NULL,
resource_type_like_id INT UNSIGNED NOT NULL,
resource_id INT UNSIGNED NOT NULL,
status bool not null DEFAULT 1,
created_at datetime default now(),
updated_at datetime default now() on update now()
);

-- Таблица для хранения истории лайков /отмены лайков пользователя по ресусрсу. type_like -
-- 1 - установлен лайк, 0 - отменен лайк
CREATE TABLE IF NOT EXISTS history_likes (
id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
likes_id INT UNSIGNED NOT NULL,
type_like bool not null DEFAULT 1,
created_at datetime default now()
);



-- Немного изменим и применим (применяем к базе только этот вариант лайков!)
-- Таблица лайков
DROP TABLE IF EXISTS likes;
CREATE TABLE likes (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  user_id INT UNSIGNED NOT NULL,
  target_id INT UNSIGNED NOT NULL,
  target_type_id INT UNSIGNED NOT NULL,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Таблица типов лайков
DROP TABLE IF EXISTS target_types;
CREATE TABLE target_types (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL UNIQUE,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO target_types (name) VALUES 
  ('messages'),
  ('users'),
  ('media'),
  ('posts');

-- Заполняем лайки
INSERT INTO likes 
  SELECT 
    id, 
    FLOOR(1 + (RAND() * 100)), 
    FLOOR(1 + (RAND() * 100)),
    FLOOR(1 + (RAND() * 4)),
    CURRENT_TIMESTAMP 
  FROM messages;

-- Проверим
SELECT * FROM likes LIMIT 10;


-- Вариант 11
-- Есть желание как-то усовершенствовать таблицу friendship:
-- По-моему она получается очень громоздкой и не совсем правильной.
-- Получается, что у 1го user_id очень много Friendship_id. Лучше сделать так:
-- Friendship_id – сделать порядковым номером, просто id, для каждого user_id.
-- Т.е. для одного user_id приходится много других user_id в таблице friendship.
-- Не запоминать и не плодить friendship_id сделать из него просто порядковый номер id


-- Вариант 12
-- Группы также от своего имени могут выкладывать медиа файлы, предлагаю в таблицу Communities
-- добавить атрибут media_id

-- Применим для основной фотографии группы
DESC communities;
ALTER TABLE communities ADD COLUMN photo_id INT UNSIGNED;

 
-- Вариант 13
-- При заполнении новых таблиц данными также хотела добавить столбец other_users_id в таблицу
-- meetings, чтобы было видно, какие еще пользователи учавствуют во встрече. Но если добавлять
-- его по правилам нормальных форм, то в столбце будет только один пользователь. 

-- Вариант 14
-- Вопрос по ДЗ, по таблице meetings, там кроме id, имя и даты ничего нет, возможно стоит
-- туда пользователей добавить?

 
-- Вариант 15
 DROP TABLE IF EXISTS `meetings_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meetings_users` (
  `meeting_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `submited_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`,`meeting_id`)
);


-- Применим к нашей базе
CREATE TABLE meetings_users (
  meeting_id INT UNSIGNED NOT NULL,
  user_id INT UNSIGNED NOT NULL,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`,`meeting_id`)
); 

-- Заполняем
INSERT INTO meetings_users 
  SELECT 
    FLOOR(1 + (RAND() * 100)), 
    FLOOR(1 + (RAND() * 100)),
    CURRENT_TIMESTAMP 
  FROM posts;
 


-- Примеры на основе базы данных vk
USE vk;

-- Получаем данные пользователя
SELECT * FROM users WHERE id = 3;

SELECT first_name, last_name, 'main_photo', 'city' FROM users WHERE id = 3;

SELECT
  first_name,
  last_name,
  (SELECT filename FROM media WHERE id = 
    (SELECT photo_id FROM profiles WHERE user_id = 3)
  ) AS filename,
  (SELECT hometown FROM profiles WHERE user_id = 3) AS hometown
  FROM users
    WHERE id = 3;  

-- Дорабатывем условия    
SELECT
  first_name,
  last_name,
  (SELECT filename FROM media WHERE id = 
    (SELECT photo_id FROM profiles WHERE user_id = users.id)
  ) AS filename,
  (SELECT hometown FROM profiles WHERE user_id = users.id) AS hometown
  FROM users
    WHERE id = 3;          

-- Получаем фотографии пользователя
SELECT filename FROM media
  WHERE user_id = 3
    AND media_type_id = (
      SELECT id FROM media_types WHERE name = 'photo'
    );
    
SELECT * FROM media_types;

-- Выбираем историю по добавлению фотографий пользователем
SELECT CONCAT(
  'Пользователь добавил фото ', 
  filename, 
  ' ', 
  created_at) AS news 
    FROM media 
    WHERE user_id = 3 
      AND media_type_id = (
        SELECT id FROM media_types WHERE name LIKE 'photo'
);

-- Улучшаем запрос
SELECT CONCAT(
  'Пользователь ', 
  (SELECT CONCAT(first_name, ' ', last_name)
    FROM users WHERE id = media.user_id),
  ' добавил фото ', 
  filename, ' ', 
  created_at) AS news 
    FROM media 
    WHERE user_id = 3 
      AND media_type_id = (
        SELECT id FROM media_types WHERE name LIKE 'photo'
);

-- Найдём кому принадлежат 10 самых больших медиафайлов
SELECT user_id, filename, size 
  FROM media 
  ORDER BY size DESC
  LIMIT 10;

-- Улучшим запрос, используем алиасы для имён таблиц
SELECT 
  (SELECT CONCAT(first_name, ' ', last_name) 
    FROM users u 
      WHERE u.id = m.user_id) AS owner,
  filename, 
  size 
    FROM media m
    ORDER BY size DESC
    LIMIT 10;
  
 -- Выбираем друзей пользователя с двух сторон отношения дружбы
(SELECT friend_id FROM friendship WHERE user_id = 3)
UNION
(SELECT user_id FROM friendship WHERE friend_id = 3);

-- Выбираем только друзей с активным статусом
SELECT * FROM friendship_statuses;

(SELECT friend_id 
  FROM friendship 
  WHERE user_id = 3
    AND confirmed_at IS NOT NULL 
    AND status_id IN (
      SELECT id FROM friendship_statuses 
        WHERE name = 'Confirmed'
    )
)
UNION
(SELECT user_id 
  FROM friendship 
  WHERE friend_id = 3
    AND confirmed_at IS NOT NULL 
    AND status_id IN (
      SELECT id FROM friendship_statuses 
        WHERE name = 'Confirmed'
    )
);


-- Выбираем медиафайлы друзей
SELECT filename FROM media WHERE user_id IN (
  (SELECT friend_id 
  FROM friendship 
  WHERE user_id = 3
    AND confirmed_at IS NOT NULL 
    AND status_id IN (
      SELECT id FROM friendship_statuses 
        WHERE name = 'Confirmed'
    )
  )
  UNION
  (SELECT user_id 
    FROM friendship 
    WHERE friend_id = 3
      AND confirmed_at IS NOT NULL 
      AND status_id IN (
      SELECT id FROM friendship_statuses 
        WHERE name = 'Confirmed'
    )
  )
);

-- Объединяем медиафайлы пользователя и его друзей для создания ленты новостей
SELECT filename, user_id, created_at FROM media WHERE user_id = 3
UNION
SELECT filename, user_id, created_at FROM media WHERE user_id IN (
  (SELECT friend_id 
  FROM friendship 
  WHERE user_id = 3
    AND confirmed_at IS NOT NULL 
    AND status_id IN (
      SELECT id FROM friendship_statuses 
        WHERE name = 'Confirmed'
    )
  )
  UNION
  (SELECT user_id 
    FROM friendship 
    WHERE friend_id = 3
      AND confirmed_at IS NOT NULL 
      AND status_id IN (
      SELECT id FROM friendship_statuses 
        WHERE name = 'Confirmed'
    )
  )
);

-- Определяем пользователей, общее занимаемое место медиафайлов которых 
-- превышает 100МБ

SELECT user_id, SUM(size) AS total
  FROM media
  GROUP BY user_id
  HAVING total > 100000000
  ORDER BY total DESC;

-- Подсчитываем лайки для медиафайлов пользователя и его друзей

SELECT target_id AS mediafile, COUNT(*) AS likes 
  FROM likes 
    WHERE target_id IN (
      SELECT id FROM media WHERE user_id = 3
        UNION
      (SELECT id FROM media WHERE user_id IN (
        SELECT friend_id 
          FROM friendship 
            WHERE user_id = 3 
              AND status_id IN (
                SELECT id FROM friendship_statuses 
                  WHERE name = 'Confirmed'
              )))
        UNION
      (SELECT id FROM media WHERE user_id IN (
        SELECT user_id 
          FROM friendship 
            WHERE friend_id = 3 
              AND status_id IN (
                SELECT id FROM friendship_statuses 
                  WHERE name = 'Confirmed'
              ))) 
    )
    AND target_type_id = (SELECT id FROM target_types WHERE name = 'media')
    GROUP BY target_id;


-- Начинаем создавать архив новостей для медиафайлов по месяцам
SELECT COUNT(id) AS arhive, MONTHNAME(created_at) AS month 
  FROM media
  GROUP BY month;
  
-- Архив с правильной сортировкой новостей по месяцам
SELECT COUNT(id) AS news, 
  MONTHNAME(created_at) AS month,
  MONTH(created_at) AS month_num 
    FROM media
      WHERE YEAR(created_at) = YEAR(NOW())
    GROUP BY month_num
    ORDER BY month_num DESC;

SELECT COUNT(id) AS news, 
  MONTHNAME(created_at) AS month,
  MONTH(created_at) AS month_num 
    FROM media
    GROUP BY month_num
    ORDER BY month_num DESC;
    

-- Выбираем сообщения от пользователя и к пользователю
SELECT from_user_id, to_user_id, body, is_delivered, created_at 
  FROM messages
    WHERE from_user_id = 3
      OR to_user_id = 3
    ORDER BY created_at DESC;
    
-- Непрочитанные сообщения
SELECT from_user_id, 
  to_user_id, 
  body, 
  IF(is_delivered, 'delivered', 'not delivered') AS status 
    FROM messages
      WHERE (from_user_id = 3 OR to_user_id = 3)
        AND is_delivered IS NOT TRUE
    ORDER BY created_at DESC;
    
 -- Выводим друзей пользователя с преобразованием пола и возраста 
SELECT 
    (SELECT CONCAT(first_name, ' ', last_name) 
      FROM users 
      WHERE id = user_id) AS friend, 
      
    CASE (sex)
      WHEN 'm' THEN 'man'
      WHEN 'f' THEN 'women'
    END AS sex,
    
    TIMESTAMPDIFF(YEAR, birthday, NOW()) AS age
     
  FROM profiles
  
  WHERE user_id IN (
    SELECT friend_id 
      FROM friendship
      WHERE user_id = 3
        AND confirmed_at IS NOT NULL
        AND status_id IN (
          SELECT id FROM friendship_statuses 
            WHERE name = 'Confirmed'
          )
      UNION
      SELECT user_id 
      FROM friendship
      WHERE friend_id = 3
        AND confirmed_at IS NOT NULL
        AND status_id IN (
          SELECT id FROM friendship_statuses 
            WHERE name = 'Confirmed'
          )
  );
    
-- Поиск пользователя по шаблонам имени  
SELECT CONCAT(first_name, ' ', last_name) AS fullname  
  FROM users
  WHERE first_name LIKE 'M%';
  
-- Используем регулярные выражения
SELECT CONCAT(first_name, ' ', last_name) AS fullname  
  FROM users
  WHERE last_name RLIKE '^M.*n$';
  
  
-- Практическое задание по теме “Операторы, фильтрация, сортировка и ограничение. 
-- Агрегация данных”

-- Работаем с БД vk и тестовыми данными, которые вы сгенерировали ранее:

-- 1. Проанализировать запросы, которые выполнялись на занятии, определить возможные 
-- корректировки и/или улучшения (JOIN пока не применять).

-- 2. Пусть задан некоторый пользователь. 
-- Из всех друзей этого пользователя найдите человека, который больше всех общался 
-- с нашим пользователем.

-- 3. Подсчитать общее количество лайков, которые получили 10 самых молодых пользователей.

-- 4. Определить кто больше поставил лайков (всего) - мужчины или женщины?

-- 5. Найти 10 пользователей, которые проявляют наименьшую активность в использовании 
-- социальной сети.








 

  

 
 
 
