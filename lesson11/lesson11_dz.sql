# 1. Создайте таблицу logs типа Archive. 
# Пусть при каждом создании записи в таблицах users, catalogs и products 
# в таблицу logs помещается время и дата создания записи, 
# название таблицы, идентификатор первичного ключа и содержимое поля name.
 use shop;

# 

CREATE TABLE logs (
	id SERIAL,
    id_key BIGINT UNSIGNED NOT NULL,
    name VARCHAR(255),
    table_name VARCHAR(64) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE='ARCHIVE';

DROP TRIGGER IF EXISTS add_user_for_logs;
DELIMITER //
CREATE TRIGGER add_user_for_logs AFTER INSERT ON users
FOR EACH ROW
BEGIN
	INSERT INTO logs (id_key, name, table_name, created_at)
			VALUES(NEW.id, NEW.name, 'users', NEW.created_at);
END//
DELIMITER ;

#test
INSERT INTO users (name, birthday_at) 
	VALUES ('Петя', '1990-09-15'), ('Вася', '1994-03-10');
SELECT * FROM logs;


DROP TRIGGER IF EXISTS add_product_for_logs;
DELIMITER //
CREATE TRIGGER add_product_for_logs AFTER INSERT ON products
FOR EACH ROW
BEGIN
	INSERT INTO logs (id_key, name, table_name, created_at)
			VALUES(NEW.id, NEW.name, 'products', NEW.created_at);
END//
DELIMITER ;

INSERT INTO products (name, description, price, catalog_id) 
	VALUES ('Intel Core i9', 'Крутой процессор', 2000, 1), 
    ('NVIDIA', 'Крутая видеокарта', 3000, 3);
SELECT * FROM logs;

DROP TRIGGER IF EXISTS add_catalog_for_logs;
DELIMITER //
CREATE TRIGGER add_catalog_for_logs AFTER INSERT ON catalogs
FOR EACH ROW
BEGIN
	INSERT INTO logs (id_key, name, table_name)
			VALUES(NEW.id, NEW.name, 'catalogs');
END//
DELIMITER ;

INSERT INTO catalogs (name) 
	VALUES ('Флэшь накопители'), ('Мониторы');
SELECT * FROM logs;

# NoSQL
# В базе данных Redis подберите коллекцию для подсчета посещений с определенных IP-адресов.

#Наверно можно использовать пары ключ-значение
127.0.0.1:6379> SET 10.20.10.20 0
OK
127.0.0.1:6379> GET 10.20.10.20
"0"
127.0.0.1:6379> INCR 10.20.10.20
(integer) 1
127.0.0.1:6379> INCR 10.20.10.20
(integer) 2
127.0.0.1:6379> INCR 10.20.10.20
(integer) 3
127.0.0.1:6379> GET 10.20.10.20
"3"
127.0.0.1:6379> 




