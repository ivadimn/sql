# 1. Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине.

SELECT name, COUNT(*) as 'количество заказов' FROM users u JOIN orders o ON u.id = o.user_id
GROUP BY u.id; 

# 2. Выведите список товаров products и разделов catalogs, который соответствует товару ????.
# Здесь не совсем понятно задание 

SELECT c.name,  p.name FROM catalogs c JOIN products p ON p.catalog_id = c.id;


# 3 (по желанию) Пусть имеется таблица рейсов flights (id, from, to) 
# и таблица городов cities (label, name). 
# Поля from, to и label содержат английские названия городов, поле name — русское. 
# Выведите список рейсов flights с русскими названиями городов.


DROP TABLE IF EXISTS flights;
CREATE TABLE flights (
  id SERIAL PRIMARY KEY,
  from_city VARCHAR(64) NOT NULL,
  to_city VARCHAR(64) NOT NULL
) COMMENT = 'Рейсы';

INSERT INTO flights (from_city, to_city) VALUES
	('moscow', 'omsk'), 
    ('novgorod', 'kazan'), 
    ('irkutsk', 'moscow'),
    ('omsk', 'irkutsk'),
    ('moscow', 'kazan');
    
DROP TABLE IF EXISTS cities;
CREATE TABLE cities (
  label VARCHAR(64) NOT NULL PRIMARY KEY,
  name VARCHAR(64) NOT NULL
) COMMENT = 'Города';

INSERT INTO cities (label, name) VALUES
	('moscow', 'Москва'), 
    ('irkutsk', 'Иркутск'),
    ('novgorod', 'Новгород'), 
    ('kazan', 'Казань'),
    ('omsk', 'Омск');

SELECT c1.name as 'From', c2.name as 'To' 
	FROM cities c1 JOIN flights f ON c1.label = f.from_city
    JOIN cities c2 ON c2.label = f.to_city;


