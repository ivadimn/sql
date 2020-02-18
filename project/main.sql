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
    activity_id BIGINT UNSIGNED COMMENT 'Идентификатор направления деятельности',
    created_at DATETIME DEFAULT NOW(),
    closed_at DATETIME DEFAULT '9999-12-31',
    CONSTRAINT requests_staff_id_fk FOREIGN KEY(staff_id) REFERENCES staff_table(id),
    CONSTRAINT requests_activity_id_fk FOREIGN KEY(activity_id) REFERENCES activities(id)
) COMMENT 'заявка на подбор';

# Создание заявок на подбор
INSERT INTO requests (staff_id, activity_id) 
	SELECT id, FLOOR(1 + (RAND() * 25)) AS level FROM staff_table WHERE is_vacant = TRUE LIMIT 50;

# Таблица детальных требований к должности указаываемых в заявке на подбор
DROP TABLE IF EXISTS requests_detail;
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
    
#Таблица, содержащая резюме кандидатов
DROP TABLE IF EXISTS resumes;
CREATE TABLE resumes (
	id SERIAL,
    name VARCHAR(128) NOT NULL COMMENT 'Для прототы ФИО поместим с одно поле',
    birthday DATE NOT NULL,
    sex ENUM('мужской', 'женский') NOT NULL,
    place_id BIGINT UNSIGNED COMMENT 'Место рождения', 
    email VARCHAR(128) NOT NULL UNIQUE,
    phone VARCHAR(16) NOT NULL UNIQUE,
    salary_before BIGINT UNSIGNED COMMENT 'Текущий размер зарплаты', 
    salary_after BIGINT UNSIGNED COMMENT 'Желаемый размер зарплаты',  
    CONSTRAINT resumes_place_id_fk FOREIGN KEY(place_id) REFERENCES places(id) 
) COMMENT 'Данные кандидатов';


# Таблица образование по конкретному резюме
DROP TABLE IF EXISTS resume_edus;
CREATE TABLE resume_edus (
	id SERIAL,
    resume_id BIGINT UNSIGNED NOT NULL,
    name VARCHAR(255) NOT NULL COMMENT 'Наименование учебного заведения',
    begin_at DATE NOT NULL COMMENT 'Начало обучения',
    end_at DATE NOT NULL COMMENT 'Окночание обучения',
    edu_type_id BIGINT UNSIGNED NOT NULL,
    CONSTRAINT resume_edus_resume_id_fk FOREIGN KEY(resume_id) REFERENCES resumes(id),
    CONSTRAINT resume_edus_edu_type_id_fk FOREIGN KEY(edu_type_id) REFERENCES edu_types(id)
) COMMENT 'Данные об образовании';

# Таблица трудовой деятельности
DROP TABLE IF EXISTS labor_periods;
CREATE TABLE labor_periods (
	id SERIAL,
    resume_id BIGINT UNSIGNED NOT NULL,
    name VARCHAR(255) NOT NULL COMMENT 'Наименование учебного заведения',
    begin_at DATE NOT NULL COMMENT 'Начало обучения',
    end_at DATE NOT NULL COMMENT 'Окночание обучения',
    CONSTRAINT labor_periods_resume_id_fk FOREIGN KEY(resume_id) REFERENCES resumes(id)
) COMMENT 'Данные о трудовой деятельности';




# Процедура создания кандидатов
DROP PROCEDURE IF EXISTS insert_staffs;
DELIMITER //
CREATE PROCEDURE insert_staffs() 
BEGIN
	DECLARE i, j INT DEFAULT 1;
	SET i = 1;
    SELECT COUNT(*) INTO @count_units FROM units;
    WHILE (i < @count_units) DO
		SET j = 1;
		SELECT level INTO @level FROM unit_links WHERE parent_id = i AND unit_id = i;
        IF @level = 1 THEN  INSERT INTO staff_table (unit_id, position_id)
					VALUES (i, 13), (i, 10);  
        ELSEIF @level = 2 THEN INSERT INTO staff_table (unit_id, position_id)
					VALUES (i, 1), (i, 4), (i, 10);  
        ELSEIF @level = 3 THEN INSERT INTO staff_table (unit_id, position_id)
					VALUES (i, 2), (i, 5), (i, 10);              
        ELSE             
            WHILE j < 6 DO			
				INSERT INTO staff_table (unit_id, position_id)
						VALUES (i, (6 + FLOOR(RAND() * 4)));
				SET j = j + 1;	
             END WHILE;        
        END IF;
		SET i = i + 1;
    END WHILE;
END//
DELIMITER ; 

    


    

SELECT s.id, u.name, p.name, s.is_vacant FROM staff_table s
	JOIN units u ON s.unit_id = u.id
    JOIN positions p ON s.position_id = p.id
    ORDER BY s.id;
    
    

UPDATE staff_table SET position_id = 13 WHERE id = 1;   
DELETE FROM staff_table WHERE id = 2;  