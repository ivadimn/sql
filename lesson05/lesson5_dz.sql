
-- 1.Пусть в таблице users поля created_at и updated_at оказались незаполненными. 
-- Заполните их текущими датой и временем.
UPDATE users SET created_at = NOW(), updated_at = NOW();

-- 2. Таблица users была неудачно спроектирована. 
-- Записи created_at и updated_at были заданы типом VARCHAR 
-- и в них долгое время помещались значения в формате "20.10.2017 8:10". 
-- Необходимо преобразовать поля к типу DATETIME, сохранив введеные ранее значения.

ALTER TABLE users MODIFY COLUMN created_at DATETIME DEFAULT NOW(),
	MODIFY COLUMN updated_at DATETIME DEFAULT NOW() ON UPDATE NOW();

-- 3. В таблице складских запасов storehouses_products в поле value могут встречаться самые разные цифры: 
-- 0, если товар закончился и выше нуля, если на складе имеются запасы. 
-- Необходимо отсортировать записи таким образом, чтобы они выводились в порядке увеличения значения value. Однако, нулевые запасы должны выводиться в конце, после всех записей.

CREATE TABLE storehouses_products (
	id SERIAL,
    name VARCHAR(32),
    value INT 
);    

INSERT INTO storehouses_products (name, value) VALUES 
 ('p1', 2600), ('p2', 260), ('p3', 2000), ('p4', 20), ('p5', 100), ('p6', 160), ('p7', 0), ('p8', 0), ('p9', 0);
 
SELECT * FROM storehouses_products ORDER BY value > 0 DESC, value;


-- (по желанию) Из таблицы users необходимо извлечь пользователей, родившихся в августе и мае. 
-- Месяцы заданы в виде списка английских названий ('may', 'august')

SELECT name FROM users WHERE DATE_FORMAT(birthday_at, '%M') in ('may', 'august');

-- (по желанию) Из таблицы catalogs извлекаются записи при помощи запроса. 
-- SELECT * FROM catalogs WHERE id IN (5, 1, 2); 
-- Отсортируйте записи в порядке, заданном в списке IN.

CREATE TABLE catalogs  (
	id SERIAL,
    name VARCHAR(32)
);    

INSERT INTO catalogs (name) VALUES
	('one'), ('two'), ('three'), ('four'), ('five'), ('six');
    
SELECT * FROM catalogs WHERE id in (5, 1, 2) ORDER BY id < 5,  id;
-- ******************************************************************************************************

CREATE TABLE users (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,  
  name VARCHAR(100) NOT NULL,
  birthday_at DATE NOT NULL,
  created_at DATETIME DEFAULT NOW(),
  updated_at DATETIME DEFAULT NOW() ON UPDATE NOW()
);
INSERT INTO users (name, birthday_at, created_at, updated_at) VALUES ('Chanelle', '1980-03-16', '2006-04-04 13:07:29', '2014-05-22 05:30:26');
INSERT INTO users (name, birthday_at, created_at, updated_at) VALUES ('Vasia', '1985-06-16', '2006-04-04 13:07:29', '2014-05-22 05:30:26');
INSERT INTO users (name, birthday_at, created_at, updated_at) VALUES ('Petia', '1999-10-18', '2006-04-04 13:07:29', '2014-05-22 05:30:26');
INSERT INTO users (name, birthday_at, created_at, updated_at) VALUES ('Nike', '1991-12-05', '2006-04-04 13:07:29', '2014-05-22 05:30:26');
INSERT INTO users (name, birthday_at, created_at, updated_at) VALUES ('Olga', '1999-02-16', '2006-04-04 13:07:29', '2014-05-22 05:30:26');
INSERT INTO users (name, birthday_at, created_at, updated_at) VALUES ('Ura', '1977-05-02', '2006-04-04 13:07:29', '2014-05-22 05:30:26');
INSERT INTO users (name, birthday_at, created_at, updated_at) VALUES ('Misha', '1986-06-01', '2006-04-04 13:07:29', '2014-05-22 05:30:26');
INSERT INTO users (name, birthday_at, created_at, updated_at) VALUES ('Natasha', '1998-07-22', '2006-04-04 13:07:29', '2014-05-22 05:30:26');
INSERT INTO users (name, birthday_at, created_at, updated_at) VALUES ('Jack', '1995-04-10', '2006-04-04 13:07:29', '2014-05-22 05:30:26');
INSERT INTO users (name, birthday_at, created_at, updated_at) VALUES ('John', '1987-06-16', '2006-04-04 13:07:29', '2014-05-22 05:30:26');
INSERT INTO users (name, birthday_at, created_at, updated_at) VALUES ('Bob', '1987-11-16', '2006-04-04 13:07:29', '2014-05-22 05:30:26');

-- 1. Подсчитайте средний возраст пользователей в таблице users
SELECT AVG(FLOOR(DATEDIFF(NOW(), birthday_at) / 365.25)) as 'средний возраст' FROM users; 


-- Подсчитайте количество дней рождения, которые приходятся на каждый из дней недели. 
-- Следует учесть, что необходимы дни недели текущего года, а не года рождения.

SELECT COUNT(*), DAYNAME(DATE(CONCAT(DATE_FORMAT(NOW(), '%Y'), DATE_FORMAT(birthday_at, '-%m-%d')))) as d FROM users GROUP BY d; 


-- (по желанию) Подсчитайте произведение чисел в столбце таблицы

CREATE TABLE vals (
	id SERIAL,
    value INT NOT NULL
);    
INSERT INTO vals (value) VALUES (1), (2), (3), (4), (5), (6), (7), (8);

SELECT FLOOR(EXP(SUM(LOG(value)))) as 'произведение' FROM vals;











