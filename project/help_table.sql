# вспомогательные таблицы для генерации данных
USE hunter;
# временные таблицы для генерации фамилии имени и отчества
# мужские
DROP TABLE IF EXISTS fsn_m;
CREATE TABLE fsn_m (
	id SERIAL,
    name VARCHAR(32)
);
INSERT INTO fsn_m (name) VALUES
('Смирнов'),
('Иванов'),
('Кузнецов'),
('Соколов'),
('Попов'),
('Лебедев'),
('Козлов'),
('Новиков'),
('Морозов'),
('Петров');   

DROP TABLE IF EXISTS fan_m;
CREATE TABLE fan_m (
	id SERIAL,
    name VARCHAR(32)
);
INSERT INTO fan_m (name) VALUES
('Иван'),
('Сергей'),
('Пётр'),
('Семён'),
('Василий'),
('Александр'),
('Вячеслав'),
('Вадим'),
('Антон'),
('Виталий');   


DROP TABLE IF EXISTS ffn_m;
CREATE TABLE ffn_m (
	id SERIAL,
    name VARCHAR(32)
);
INSERT INTO ffn_m (name) VALUES
('Иванoвич'),
('Сергеевич'),
('Петрович'),
('Семёнович'),
('Васильевич'),
('Александрович'),
('Вячеславович'),
('Вадимович'),
('Антонович'),
('Витальевич');   

#Женские
DROP TABLE IF EXISTS fsn_w;
CREATE TABLE fsn_w (
	id SERIAL,
    name VARCHAR(32)
);
INSERT INTO fsn_w (name) VALUES
('Лазарева'),
('Медведева'),
('Ершова'),
('Никитина'),
('Соболева'),
('Рябова'),
('Полякова'),
('Цветкова'),
('Данилова'),
('Жукова');

DROP TABLE IF EXISTS fan_w;
CREATE TABLE fan_w (
	id SERIAL,
    name VARCHAR(32)
);
INSERT INTO fan_w (name) VALUES
('Мария'),
('Ольга'),
('Татьяна'),
('Екатерина'),
('Анна'),
('Виктория'),
('Светланв'),
('Елена'),
('Людмила'),
('Марна');

DROP TABLE IF EXISTS ffn_w;
CREATE TABLE ffn_w (
	id SERIAL,
    name VARCHAR(32)
);
INSERT INTO ffn_w (name) VALUES
('Иванoвна'),
('Сергеевна'),
('Петровна'),
('Семёновна'),
('Васильевна'),
('Александровна'),
('Вячеславовна'),
('Вадимовна'),
('Антоновна'),
('Витальевна'); 

DROP TABLE IF EXISTS edu_m;
CREATE TABLE edu_m (
	id SERIAL,
    name VARCHAR(32),
    edu_type_id BIGINT UNSIGNED
);
INSERT INTO edu_m (name, edu_type_id) VALUES
('Университет 1', 6),
('Академия 1', 6),
('Институт 1', 6),
('Университет 2', 6),
('Академия 2', 6),
('Институт 2', 6),
('Университет 3', 6),
('Академия 3', 6),
('Институт 3', 6),
('Техникум 1', 4),
('Техникум 2', 4),
('Техникум 3', 4);

DROP TABLE IF EXISTS firms;
CREATE TABLE firms (
	id SERIAL,
    name VARCHAR(32)
);
INSERT INTO ffn_w (name) VALUES
('Завод 123'),
('Фирма Рога и Копыта'),
('Фирма 789'),
('Швейная фабрика'),
('Нефтеперерабатывающий завод'),
('Завод имени Кирова'),
('Путиловский завод'),
('РЖД'),
('Транснефть'),
('Роснефть'),
('Новатэк'),
('Перекресток'),
('Аэрофлот'),
('Транснефть'),
('Кока-Кола');


DROP TABLE IF EXISTS test_name;
CREATE TABLE test_name (
	id SERIAL,
    name VARCHAR(128),
    sex ENUM ('мужской', 'женский'),
    bd DATE
);

call insert_resumes();

# Процедура создания кандидатов
DROP PROCEDURE IF EXISTS insert_resumes;
DELIMITER //
CREATE PROCEDURE insert_resumes() 
BEGIN
	DECLARE i, lid INT DEFAULT 1;
    DECLARE lname VARCHAR(128);
    DECLARE bd DATE;
	    
    WHILE (i < 10) DO
		SET lid =FLOOR(1 + RAND() * 10);
        SELECT name INTO @n1 FROM fsn_m WHERE id = lid;
        SET lid = FLOOR(1 + RAND() * 10);
        SELECT name INTO @n2 FROM fan_m WHERE id = lid;
        SET lid = FLOOR(1 + RAND() * 10);
        SELECT name INTO @n3 FROM ffn_m WHERE id = lid;
        SET lname = CONCAT(@n1, ' ', @n2, ' ', @n3);
        SET bd = DATE(CONCAT(FLOOR(1970 + RAND() * 30),'-', FLOOR(1 + RAND() * 11), '-',
           + FLOOR(1 + RAND() * 27)));
        
        INSERT INTO test_name (name, sex, bd) VALUES (lname, 'мужской', bd);
		
        SET lid =FLOOR(1 + RAND() * 10);
        SELECT name INTO @n1 FROM fsn_w WHERE id = lid;
        SET lid = FLOOR(1 + RAND() * 10);
        SELECT name INTO @n2 FROM fan_w WHERE id = lid;
        SET lid = FLOOR(1 + RAND() * 10);
        SELECT name INTO @n3 FROM ffn_w WHERE id = lid;
        SET lname = CONCAT(@n1, ' ', @n2, ' ', @n3);
        SET bd = DATE(CONCAT(FLOOR(1970 + RAND() * 30),'-', FLOOR(1 + RAND() * 11), '-',
           + FLOOR(1 + RAND() * 27)));
        
        INSERT INTO test_name (name, sex, bd) VALUES (lname, 'женский', bd);
        
		SET i = i + 1;
    END WHILE;
END//
DELIMITER ; 

SELECT BIN(CHAR(161));


