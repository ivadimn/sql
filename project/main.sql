USE hunter;


# таблица сотрудников, занимающихся рассмотрением кандидатов
# для упрощения фамилия имя и отчество в одном поле
# и идентификатор должности включён в эту таблицу
DROP TABLE IF EXISTS personal;
CREATE TABLE personal (
	id SERIAL,
    name VARCHAR(255) NOT NULL,
    staff_id BIGINT UNSIGNED COMMENT 'Занимаемая должность'
) COMMENT 'Таблица сотрудников';

# при добавлении в таблицу personal
# признак вакантной должности должен быть установлен FALSE
DROP TRIGGER IF EXISTS add_person;
DELIMITER //
CREATE TRIGGER add_person AFTER INSERT ON personal
FOR EACH ROW
BEGIN
	UPDATE staff_table SET is_vacant = FALSE, vacant_from = '9999-12-31'
		WHERE id = NEW.staff_id;
END//
DELIMITER ;  

# при удалении из таблицы personal
# признак вакантной должности должен быть установлен TRUE
DROP TRIGGER IF EXISTS delete_person;
DELIMITER //
CREATE TRIGGER delete_person AFTER DELETE ON personal
FOR EACH ROW
BEGIN
	UPDATE staff_table SET is_vacant = TRUE, vacant_from = NOW()
		WHERE id = OLD.staff_id;
END//
DELIMITER ;

INSERT INTO personal (name, staff_id) VALUES
	('Пупкин Иван Семёнович', 3), ('Тряпочкни Сергей Петрович', 6), 
    ('Сергеев Петр Сергеевич', 9), ('Тюлькин Сергей Иванович', 10), 
    ('Иванов Сидр Петрович', 12);

# таблица заявок на подбор
# заявки на подбор формируются руководителями подразделений
# где имеются вакантные должности
DROP TABLE IF EXISTS requests;
CREATE TABLE requests (
	id SERIAL,
    staff_id BIGINT UNSIGNED COMMENT 'Идентификатор вакантной должности',
    created_at DATETIME DEFAULT NOW(),
    closed_at DATETIME DEFAULT '9999-12-31'
) COMMENT 'заявка на подбор';

# Создание заявок на подбор
INSERT INTO requests (staff_id) SELECT id FROM staff_table WHERE is_vacant = TRUE LIMIT 50;

# Таблица детальных требований к должности указаываемых в заявке на подбор
DROP TABLE IF EXISTS request_detail;
CREATE TABLE requests_detail (
	request_id BIGINT UNSIGNED PRIMARY KEY,
    edu_id BIGINT UNSIGNED COMMENT 'Требование к образованию',
    experience INT1 UNSIGNED COMMENT 'Требования к стажу',
    language VARCHAR(32) COMMENT 'Иностранный язык',
    foreign_level_id BIGINT UNSIGNED COMMENT 'Требование к уровню знания иностранного языка',
    special_skills TEXT COMMENT 'Специальные умения и навыки',
    CONSTRAINT requests_detail_recuest_id_fk FOREIGN KEY(request_id) REFERENCES requests(id),
    CONSTRAINT requests_detail_edu_id_fk FOREIGN KEY(edu_id) REFERENCES edu_types(id),
    CONSTRAINT requests_detail_foreign_level_id_fk FOREIGN KEY(foreign_level_id) REFERENCES foreign_levels(id)
) COMMENT 'Детальные требования к должности';

INSERT INTO requests_detail (request_id, edu_id, experience, language, foreign_level_id, special_skills) 
	SELECT id, 
		FLOOR(1 + (RAND() * 6)) AS edu,
		FLOOR(1 + (RAND() * 10)) AS expr,
		CASE
			WHEN id % 3 = 1 
				THEN 'Английский'
			WHEN id % 3 = 2 
				THEN 'Немецкий'
			ELSE 'Китиайский'
		END AS lang, 
		FLOOR(1 + (RAND() * 9)) AS level, 
		CASE
			WHEN id % 3 = 1 
				THEN 'Навыки подготовки внутренних документов, ведения деловой переписки, аналитической работы'
			WHEN id % 3 = 2 
				THEN 'Высокий уровень владения стандартными приложениями MS Office (Word, Excel, PowerPoint и др.)'
			ELSE 'Способность оперативной обработки значительного объёма материала, обучаемость, логический склад ума'
		END AS skills
	FROM requests; 
    
#Таблица, содержащая данные кандидатов
DROP TABLE IF EXISTS recruits;
CREATE TABLE recruits (
	id SERIAL,
    name VARCHAR(128) NOT NULL COMMENT 'Для прототы ФИО поместим с одно поле',
    birthday DATE NOT NULL,
    sex ENUM('мужской', 'женский') NOT NULL,
    place_id BIGINT UNSIGNED,
    email VARCHAR(128) NOT NULL UNIQUE,
    phone VARCHAR(16) NOT NULL UNIQUE,
    CONSTRAINT recruits_place_id_fk FOREIGN KEY(place_id) REFERENCES places(id) 
) COMMENT 'Данные кандидатов';



    

SELECT s.id, u.name, p.name, s.is_vacant FROM staff_table s
	JOIN units u ON s.unit_id = u.id
    JOIN positions p ON s.position_id = p.id
    ORDER BY s.id;
    
    

UPDATE staff_table SET position_id = 13 WHERE id = 1;   
DELETE FROM staff_table WHERE id = 2;  