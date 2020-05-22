# В базе данных shop и sample присутствуют одни и те же таблицы, учебной базы данных. 
# Переместите запись id = 1 из таблицы shop.users в таблицу sample.users. Используйте транзакции.
START TRANSACTION;
INSERT INTO sample.users SELECT * FROM shop.users WHERE shop.users.id = 1;
DELETE FROM shop.users WHERE id = 1;
COMMIT;

SELECT * from sample.users;

# Создайте представление, которое выводит название name товарной позиции из таблицы 
# products и соответствующее название каталога name из таблицы catalogs.

use shop;
CREATE VIEW products_name AS 
	SELECT p.name AS 'Наименование', c.name AS 'Каталог'
	FROM products p
	LEFT JOIN catalogs c ON p.catalog_id = c.id;

SELECT * FROM products_name;


# (по желанию) Пусть имеется любая таблица с календарным полем created_at. 
# Создайте запрос, который удаляет устаревшие записи из таблицы, оставляя только 5 самых свежих записей.

DROP TABLE IF EXISTS test_table;
CREATE TABLE test_table (
	id SERIAL,
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO test_table (created_at)
	VALUES ('1999-10-20'), ('1998-10-20'), ('1998-02-17'), ('2000-09-11'), ('2019-10-20'), ('2016-11-21');

SELECT * from test_table ORDER BY created_at DESC;

DELETE FROM test_table WHERE id NOT IN 
		(SELECT * FROM (SELECT id FROM test_table ORDER BY created_at DESC LIMIT 5) as tt);

# Создайте хранимую функцию hello(), 
# которая будет возвращать приветствие, 
# в зависимости от текущего времени суток. 
# С 6:00 до 12:00 функция должна возвращать фразу "Доброе утро", 
# с 12:00 до 18:00 функция должна возвращать фразу "Добрый день", 
# с 18:00 до 00:00 — "Добрый вечер", с 00:00 до 6:00 — "Доброй ночи".

DROP FUNCTION hello;
DELIMITER //
CREATE FUNCTION hello()
RETURNS VARCHAR(32) DETERMINISTIC
BEGIN
	DECLARE h INT DEFAULT HOUR(NOW());
	IF (h >= 6 AND h < 12) THEN RETURN 'Доброе утро';
    ELSEIF (h >= 12 AND h < 18) THEN RETURN 'Добрый день';
    ELSEIF (h >= 18 AND h < 24) THEN RETURN 'Добрый вечер';
    ELSE RETURN 'Доброй ночи';
    END IF;
END//    
DELIMITER ;

SELECT hello();

#В таблице products есть два текстовых поля: name с названием товара 
# и description с его описанием. 
# Допустимо присутствие обоих полей или одно из них. 
# Ситуация, когда оба поля принимают неопределенное значение NULL неприемлема. 
# Используя триггеры, добейтесь того, чтобы одно из этих полей или оба поля были заполнены. 
# При попытке присвоить полям NULL-значение необходимо отменить операцию.

SELECT name, description FROM products;
DELIMITER //
CREATE TRIGGER check_insert_products BEFORE INSERT ON products
FOR EACH ROW
BEGIN
	IF (NEW.name IS NULL AND NEW.description IS NULL) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'INSERT canceled, NAME and DESCRIPTION is NULL';
    END IF;
END//

INSERT INTO products
  (name, description, price, catalog_id)
VALUES
  (NULL, NULL, 7890.00, 1),

DELIMITER //
CREATE TRIGGER check_update_products BEFORE UPDATE ON products
FOR EACH ROW
BEGIN
	IF (NEW.name IS NULL AND NEW.description IS NULL) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'UPDATE canceled, NAME and DESCRIPTION is NULL';
    END IF;
END//

UPDATE products SET name = NULL, description = NULL WHERE id = 2;

# (по желанию) Напишите хранимую функцию для вычисления произвольного числа Фибоначчи. 
# Числами Фибоначчи называется последовательность в которой число равно сумме двух предыдущих чисел. 
# Вызов функции FIBONACCI(10) должен возвращать число 55.

DROP FUNCTION fibonacci;
DELIMITER //
CREATE FUNCTION fibonacci(n INT)
RETURNS INT DETERMINISTIC
BEGIN
	DECLARE last_v INT DEFAULT 0;
    DECLARE next_v INT DEFAULT 1;
    DECLARE i INT DEFAULT 1;
    DECLARE temp INT;
	IF (n < 2) THEN RETURN n;
    END IF;
    WHILE (i < n) DO
		SET temp = next_v;
		SET next_v = last_v + next_v;
		SET last_v = temp;
        SET i = i + 1;
    END WHILE;
    RETURN next_v;
END//    
DELIMITER ;

SELECT fibonacci(7);



