USE hunter;


# таблица сотрудников, занимающихся рассмотрением кандидатов
# для упрощения фамилия имя и отчество в одном поле
# и идентификатор должности включён в эту таблицу
DROP TABLE IF EXISTS personal;
CREATE TABLE personal (
	id SERIAL,
    name VARCHAR(255) NOT NULL,
    staff_id BIGINT UNSIGNED COMMENT 'Занимаемая должность',
    CONSTRAINT personal_staff_id_idx FOREIGN KEY(staff_id) REFERENCES staff_table(id) 
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

UPDATE requests SET created_at='2020-02-01';   

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

# Процедура создания резюме
DROP PROCEDURE IF EXISTS insert_resumes;
DELIMITER //
CREATE PROCEDURE insert_resumes() 
BEGIN
	DECLARE i, lid INT DEFAULT 1;
    DECLARE lname VARCHAR(128);
    DECLARE bd DATE;
    DECLARE email VARCHAR(64);
    DECLARE phone VARCHAR(16);
	    
    WHILE (i < 50) DO
		SET lid =FLOOR(1 + RAND() * 10);
        SELECT name, ename INTO @n1, @en FROM fsn_m WHERE id = lid;
        SET lid = FLOOR(1 + RAND() * 10);
        SELECT name, im INTO @n2, @im FROM fan_m WHERE id = lid;
        SET lid = FLOOR(1 + RAND() * 10);
        SELECT name, io INTO @n3, @io FROM ffn_m WHERE id = lid;
        SET lname = CONCAT(@n1, ' ', @n2, ' ', @n3);
        SET bd = DATE(CONCAT(FLOOR(1970 + RAND() * 30),'-', FLOOR(1 + RAND() * 11), '-',
           + FLOOR(1 + RAND() * 27)));
        CASE
			WHEN i % 4 = 1 
				THEN SET email = CONCAT(@im, @io, @en, i, '@mail.ru');
			WHEN i % 4 = 2 
				THEN SET email = CONCAT(@im, @io, @en, i, '@gmail.com');
            WHEN i % 4 = 3 
				THEN SET email = CONCAT(@im, @io, @en, i, '@bk.ru');    
			ELSE SET email = CONCAT(@im, @io, @en, i, '@hotmail.com');
		END CASE;   
        SET phone = CONCAT('+7', FLOOR(900 + RAND() * 99), FLOOR(100 + RAND() * 800), 
           FLOOR(1 + RAND() * 98), FLOOR(1 + RAND() * 98));
        
        INSERT INTO resumes (name, birthday, sex, place_id, email, phone, salary_before, salary_after) 
          VALUES (lname, bd, 'мужской', FLOOR(1 + RAND() * 21), email, phone, 
				FLOOR(50000 + RAND() * 50000), FLOOR(700000 + RAND() * 50000));
		
        SET lid =FLOOR(1 + RAND() * 10);
        SELECT name, ename INTO @n1, @en FROM fsn_w WHERE id = lid;
        SET lid = FLOOR(1 + RAND() * 10);
        SELECT name, im INTO @n2, @im FROM fan_w WHERE id = lid;
        SET lid = FLOOR(1 + RAND() * 10);
        SELECT name, io INTO @n3, @io FROM ffn_w WHERE id = lid;
        SET lname = CONCAT(@n1, ' ', @n2, ' ', @n3);
        SET bd = DATE(CONCAT(FLOOR(1970 + RAND() * 30),'-', FLOOR(1 + RAND() * 11), '-',
           + FLOOR(1 + RAND() * 27)));
        CASE
			WHEN i % 4 = 1 
				THEN SET email = CONCAT(@im, @io, @en, i, '@mail.ru');
			WHEN i % 3 = 2 
				THEN SET email = CONCAT(@im, @io, @en, i, '@gmail.com');
            WHEN i % 3 = 3 
				THEN SET email = CONCAT(@im, @io, @en, i, '@bk.ru');    
			ELSE SET email = CONCAT(@im, @io, @en, i, '@hotmail.com');
		END CASE;   
        SET phone = CONCAT('+7', FLOOR(900 + RAND() * 99), FLOOR(100 + RAND() * 800), 
           FLOOR(1 + RAND() * 98), FLOOR(1 + RAND() * 98));
        
        INSERT INTO resumes (name, birthday, sex, place_id, email, phone, salary_before, salary_after) 
          VALUES (lname, bd, 'женский', FLOOR(1 + RAND() * 21), email, phone, 
				FLOOR(50000 + RAND() * 50000), FLOOR(70000 + RAND() * 50000));
		SET i = i + 1;
    END WHILE;
END//
DELIMITER ; 

call insert_resumes();


# Таблица образований по конкретному резюме
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

# Процедура создания образования по резюме
DROP PROCEDURE IF EXISTS insert_resume_edus;
DELIMITER //
CREATE PROCEDURE insert_resume_edus() 
BEGIN
	DECLARE i, j, eid, lcount INT DEFAULT 1;
    DECLARE bd, ed DATE;
       
    SELECT COUNT(*) INTO @count FROM resumes;    
    WHILE (i <= @count) DO
		SELECT birthday INTO @bdate FROM resumes WHERE id = i;
        SET lcount = FLOOR(1 + RAND() * 2);
        SET j = 1;
        WHILE (j <= lcount) DO
			SET bd = DATE_ADD(@bdate, INTERVAL 17 YEAR);
			SET ed = DATE_ADD(@bdate, INTERVAL 22 YEAR);
            SET eid = FLOOR(1 + RAND() * 11);
            SELECT name, edu_type_id INTO @ename, @edu_type FROM edu_m WHERE id = eid;
            INSERT INTO resume_edus (resume_id, name, begin_at, end_at, edu_type_id) VALUES
				(i, @ename, bd, ed, @edu_type);
            SET j = j + 1;
        END WHILE;
		
		SET i = i + 1;
    END WHILE;
END//
DELIMITER ; 

CALL insert_resume_edus();

# Таблица трудовой деятельности
DROP TABLE IF EXISTS labor_periods;
CREATE TABLE labor_periods (
	id SERIAL,
    resume_id BIGINT UNSIGNED NOT NULL,
    name VARCHAR(255) NOT NULL COMMENT 'Наименование окпфтш',
    begin_at DATE NOT NULL COMMENT 'Начало оучения',
    end_at DATE NOT NULL COMMENT 'Окночание обучения',
    CONSTRAINT labor_periods_resume_id_fk FOREIGN KEY(resume_id) REFERENCES resumes(id)
) COMMENT 'Данные о трудовой деятельности';

# Процедура создания образования по резюме
DROP PROCEDURE IF EXISTS insert_resume_labor;
DELIMITER //
CREATE PROCEDURE insert_resume_labor() 
BEGIN
	DECLARE i, fid, period INT DEFAULT 1;
    DECLARE bd, ed, today DATE;
       
    SET today = NOW();   
    SELECT COUNT(*) INTO @count FROM resumes;    
    WHILE (i <= @count) DO
		SELECT birthday INTO @bdate FROM resumes WHERE id = i;
        SET bd = DATE_ADD(@bdate, INTERVAL 22 YEAR);
        WHILE (bd < today) DO
			SET fid = FLOOR(1 + RAND() * 14);
            SELECT name INTO @fname FROM firms WHERE id = fid;
            SET ed = DATE_ADD(bd, INTERVAL FLOOR(1 + RAND() * 3) YEAR);    
            INSERT INTO labor_periods (resume_id, name, begin_at, end_at) VALUES
				(i, @fname, bd, ed);
            SET bd = ed;    
        END WHILE;
		SET i = i + 1;
    END WHILE;
END//
DELIMITER ; 

CALL insert_resume_labor();

# Таблица родственников, для простоты дату рождения не указываем
DROP TABLE IF EXISTS relatives;
CREATE TABLE relatives (
	id SERIAL,
    resume_id BIGINT UNSIGNED NOT NULL,
    name VARCHAR(128) NOT NULL COMMENT 'Имя родственника',
    relative_type_id BIGINT UNSIGNED,
    CONSTRAINT relatives_resume_id_fk FOREIGN KEY(resume_id) REFERENCES resumes(id),
    CONSTRAINT relatives_relative_type_id_fk FOREIGN KEY(relative_type_id) REFERENCES relative_types(id)
) COMMENT 'Данные о родственниках';

# Процедура создания родственников
DROP PROCEDURE IF EXISTS insert_relatives;
DELIMITER //
CREATE PROCEDURE insert_relatives() 
BEGIN
	DECLARE i, j, rid, lcount INT DEFAULT 1;
    DECLARE bd, ed, today DATE;
         
    SELECT COUNT(*) INTO @count FROM resumes;    
    WHILE (i <= @count) DO
		SET lcount = FLOOR(1 + RAND() * 3);
        SET j = 1;
        WHILE (j <= lcount) DO
			SET rid = FLOOR(1 + RAND() * 7);
            INSERT INTO relatives (resume_id, name, relative_type_id) VALUES
				(i, CONCAT('ФИО родственника ', i, j), rid);
            SET j = j + 1;
        END WHILE;
        SET i = i + 1;
     END WHILE;   
END//
DELIMITER ; 

CALL insert_relatives();

# Таблица документов кандидата
DROP TABLE IF EXISTS resume_docs;
CREATE TABLE resume_docs (
	resume_id BIGINT UNSIGNED NOT NULL,
    doc_type_id BIGINT UNSIGNED NOT NULL COMMENT 'Тип документа',
    doc_path VARCHAR(255),
    PRIMARY KEY(resume_id, doc_type_id),
    CONSTRAINT resume_docs_resume_id_fk FOREIGN KEY(resume_id) REFERENCES resumes(id),
    CONSTRAINT resume_docs_doc_type_id_fk FOREIGN KEY(doc_type_id) REFERENCES doc_types(id)
) COMMENT 'Перечень документов кандидата';


# Процедура создания родственников
DROP PROCEDURE IF EXISTS insert_docs;
DELIMITER //
CREATE PROCEDURE insert_docs() 
BEGIN
	DECLARE i, j, did, lcount INT DEFAULT 1;
    DECLARE path VARCHAR(255) DEFAULT 'http:/hrportal.ru/docs/'; 
         
    SELECT COUNT(*) INTO @count FROM resumes;    
    WHILE (i <= @count) DO
		SET lcount = FLOOR(1 + RAND() * 14);
        SET j = 1;
        WHILE (j <= lcount) DO
			SET did = FLOOR(1 + RAND() * 14);
            SELECT COUNT(*) INTO @dcount FROM resume_docs WHERE resume_id = i AND doc_type_id = did;
            IF (@dcount = 0) THEN
				SELECT name INTO @type_name FROM doc_types WHERE id = did;
				INSERT INTO resume_docs (resume_id, doc_type_id, doc_path) VALUES
					(i, did,  CONCAT(path, @type_name, i, j, '.pdf'));
            END IF;    
            SET j = j + 1;
        END WHILE;
        SET i = i + 1;
     END WHILE;   
END//
DELIMITER ; 

CALL insert_docs();

# Таблица пожеланий кандидата
DROP TABLE IF EXISTS resume_wishes;
CREATE TABLE resume_wishes (
	resume_id BIGINT UNSIGNED NOT NULL,
    wish_id BIGINT UNSIGNED NOT NULL COMMENT 'Пожелание',
    wish_value VARCHAR(32) COMMENT 'Значение пожелания',
    PRIMARY KEY(resume_id, wish_id),
    CONSTRAINT resume_wishes_resume_id_fk FOREIGN KEY(resume_id) REFERENCES resumes(id),
    CONSTRAINT resume_wishes_wish_id_fk FOREIGN KEY(wish_id) REFERENCES wishes(id)
) COMMENT 'Пожелания кандидата';

DROP PROCEDURE IF EXISTS insert_wishes;
DELIMITER //
CREATE PROCEDURE insert_wishes() 
BEGIN
	DECLARE i INT DEFAULT 1;
             
    SELECT COUNT(*) INTO @count FROM resumes;    
    WHILE (i <= @count) DO
		IF RAND() > 0.5 THEN
			INSERT INTO resume_wishes (resume_id, wish_id, wish_value) VALUES (i, 1, 'Да');
        ELSE
			INSERT INTO resume_wishes (resume_id, wish_id, wish_value) VALUES (i, 1, 'Нет');
        END IF;
        IF RAND() > 0.5 THEN
			INSERT INTO resume_wishes (resume_id, wish_id, wish_value) VALUES (i, 2, 'Да');
        ELSE
			INSERT INTO resume_wishes (resume_id, wish_id, wish_value) VALUES (i, 2, 'Нет');
        END IF;
        IF RAND() > 0.5 THEN
			INSERT INTO resume_wishes (resume_id, wish_id, wish_value) VALUES (i, 3, 'Бессрочный');
            INSERT INTO resume_wishes (resume_id, wish_id, wish_value) VALUES (i, 4, 'Постоянная работв');
        ELSE
			INSERT INTO resume_wishes (resume_id, wish_id, wish_value) VALUES (i, 3, 'Срочный');
            INSERT INTO resume_wishes (resume_id, wish_id, wish_value) VALUES (i, 4, 'Временная работв');
        END IF;
        SELECT salary_after INTO @salary FROM resumes WHERE id = i;
        INSERT INTO resume_wishes (resume_id, wish_id, wish_value) VALUES (i, 5, @salary);
        SET i = i + 1;
     END WHILE;   
END//
DELIMITER ; 

CALL insert_wishes();

# таблица процесса рассмотрения кандидатов
DROP TABLE IF EXISTS processing;
CREATE TABLE processing (
	request_id BIGINT UNSIGNED NOT NULL COMMENT 'Заявка на подбор',
    resume_id BIGINT UNSIGNED NOT NULL COMMENT 'Кандидат ',
    step_id INT1 UNSIGNED NOT NULL COMMENT 'Шаг рассмотрения ',
    begin_at DATE NOT NULL COMMENT 'Начало рассмотрения на шаге',
    end_at DATE NOT NULL COMMENT 'Окночание рассмотрения на шаге',
    person_id BIGINT UNSIGNED COMMENT 'Кто проводит мероприятие ',
    is_success BOOLEAN COMMENT 'Результат прохождения шага',
    comments TEXT,
    PRIMARY KEY(request_id, resume_id, step_id),
    CONSTRAINT processing_request_id_fk FOREIGN KEY(request_id) REFERENCES requests(id),
    CONSTRAINT processing_resume_id_fk FOREIGN KEY(resume_id) REFERENCES resumes(id),
    CONSTRAINT processing_step_id_fk FOREIGN KEY(step_id) REFERENCES selection_steps(id),
    CONSTRAINT processing_person_id_fk FOREIGN KEY(person_id) REFERENCES personal(id)
) COMMENT 'Процесс рассмотрения кандидата';


# Процедура генерации процессов рассмотрения кандидатов по заявкам на подбор
DROP PROCEDURE IF EXISTS insert_processing;
DELIMITER //
CREATE PROCEDURE insert_processing() 
BEGIN
	DECLARE i, j, k, cs, person INT DEFAULT 1;
    DECLARE bd, ed, today DATE;
    DECLARE count_line, count_step INT DEFAULT 1;   
    SET today = NOW();   
    SELECT COUNT(*) INTO @count_req FROM requests;
    SELECT COUNT(*) INTO @count_res FROM resumes;
    WHILE (i <= @count_req) DO
		SET count_line = FLOOR(1 + RAND() * 2);
        SET k = 1;
		SET bd = DATE('2020-02-02');
        WHILE (k <= count_line AND j <= @count_res) DO
			SET count_step = FLOOR(1 + RAND() * 5);
            SET cs = 1;
            WHILE (cs < count_step) DO
				SET ed = DATE_ADD(bd, INTERVAL FLOOR(1 + RAND() * 7) DAY);  
                IF (cs = 4 OR cs = 6) THEN 
					SET person = 2;
                ELSE
					CASE
						WHEN i % 3 = 1 
							THEN SET person = 3;
						WHEN i % 3 = 2 
							THEN SET person = 4;
						ELSE SET person = 5;
					END CASE;   
                END IF;
                
				INSERT INTO processing (request_id, resume_id, step_id, 
					begin_at, end_at, person_id, is_success, comments) 
                    VALUES (i, j, cs, bd, ed, person, TRUE, 'Пройдено успешно');
				SET bd = ed;    
                SET cs = cs + 1;
            END WHILE;
            IF (cs = 4 OR cs = 6) THEN 
				SET person = 2;
            ELSE
				CASE
					WHEN i % 3 = 1 
						THEN SET person = 3;
					WHEN i % 3 = 2 
						THEN SET person = 4;
					ELSE SET person = 5;
				END CASE;   
            END IF;
            INSERT INTO processing (request_id, resume_id, step_id, 
					begin_at, end_at, person_id, is_success, comments) 
                    VALUES (i, j, cs, bd, '9999-12-31', person, FALSE, NULL);
            SET k = k + 1;
            SET j = j + 1;
        END WHILE;
		SET i = i + 1;
    END WHILE;
END//
DELIMITER ; 

CALL insert_processing();

SELECT p.name FROM personal p JOIN staff_table st ON p.staff_id = st.id
			AND st.position_id = 2; 

SELECT p.name, ps.name FROM personal p JOIN staff_table st ON p.staff_id = st.id
			JOIN positions ps ON st.position_id = ps.id; 

SELECT 
	CONCAT((Select name from fsn_m WHERE id in (SELECT FLOOR(1 + RAND() * 10))), ' ',
    (Select name from fan_m WHERE id in (SELECT FLOOR(1 + RAND() * 10))), ' ', 
    (Select name from ffn_m WHERE id in (SELECT FLOOR(1 + RAND() * 10))));

Select name from fsn_m WHERE id = 6;

SELECT s.id, u.name, p.name, s.is_vacant FROM staff_table s
	JOIN units u ON s.unit_id = u.id
    JOIN positions p ON s.position_id = p.id
    ORDER BY s.id;
    
    

UPDATE staff_table SET position_id = 13 WHERE id = 1;   
DELETE FROM staff_table WHERE id = 2;  