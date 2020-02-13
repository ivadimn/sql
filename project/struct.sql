#
# Таблицы для хранения организационной струкутры и штатного расписания
USE hunter;

# Организационные единицы
DROP TABLE IF EXISTS units;
CREATE TABLE units (
	id SERIAL,
    name VARCHAR(128) COMMENT 'Наименование орг. единицы',
    level INT1 UNSIGNED NOT NULL COMMENT 'Уровень подразделения в структуре',
    begin_at DATETIME DEFAULT NOW() COMMENT 'Дата создания орг. единицы',
    end_at DATETIME DEFAULT '9999-12-31' COMMENT 'Дата ограничения орг. единицы'
) COMMENT 'Организационные единиц';
# Организационные единицы не удаляются в целях хранения истории

# таблица иерархии орг единиц
DROP TABLE IF EXISTS unit_links;
CREATE TABLE unit_links (
	parent_id BIGINT UNSIGNED NOT NULL,
    unit_id BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY(parent_id, unit_id),
    CONSTRAINT parent_id_fk FOREIGN KEY(parent_id) REFERENCES units(id),
    CONSTRAINT unit_id_fk FOREIGN KEY(unit_id) REFERENCES units(id)
) COMMENT 'Иерархия организационных единиц';  
    
 
# Процедура для создания тестовой оргструктуры
DROP PROCEDURE IF EXISTS insert_units;
DELIMITER //
CREATE PROCEDURE insert_units() 
BEGIN
	DECLARE dep_name VARCHAR(64) DEFAULT 'Департамент ';
    DECLARE subdep_name VARCHAR(64) DEFAULT 'Управление ';
    DECLARE unit_name VARCHAR(64) DEFAULT 'отдел ';
    DECLARE i, j, k INT;
    SET i = 1;
    WHILE (i < 10) DO
		INSERT INTO units (name, level) VALUES (CONCAT(dep_name, i), 0);
        SELECT MAX(id) INTO @maxdep_id FROM units;
        SET j = 1;
        WHILE j < 3 DO
			INSERT INTO units (name, level) VALUES (CONCAT(subdep_name, i, j), 1);
            SELECT MAX(id) INTO @maxsubdep_id FROM units;
            INSERT INTO unit_links (parent_id, unit_id) VALUES(@maxdep_id, @maxsubdep_id);
            SET k = 1;
            WHILE k < 3 DO
				INSERT INTO units (name, level) VALUES (CONCAT(unit_name, i, j, k), 2);
				SELECT MAX(id) INTO @maxunit_id FROM units;
				INSERT INTO unit_links (parent_id, unit_id) VALUES(@maxsubdep_id, @maxunit_id);
                SET k = k + 1;
            END WHILE;
            SET j = j + 1;
        END WHILE;
        SET i = i + 1;
    END WHILE;
END//
DELIMITER ;

CALL insert_units();
SELECT * FROM units;
#таблица иерархии организационных единиц
 
# Таблица штатного расписания 
DROP TABLE IF EXISTS staff_table;
CREATE TABLE staff_table (
	id SERIAL,
	unit_id BIGINT UNSIGNED NOT NULL,
    position_id BIGINT UNSIGNED NOT NULL,
    is_vacant BOOLEAN DEFAULT TRUE, 
    vacant_from DATETIME DEFAULT NOW() COMMENT 'С какой даты уществует вакансия',
    begin_at DATETIME DEFAULT NOW() COMMENT 'Дата создания штатной единицы',
    end_at DATETIME DEFAULT '9999-12-31' COMMENT 'Дата ограничения штатноой единицы',
    CONSTRAINT staff_unit_id_fk FOREIGN KEY(unit_id) REFERENCES units(id),
    CONSTRAINT position_id_fk FOREIGN KEY(position_id) REFERENCES positions(id)
) COMMENT 'Штатное расписание';  

# Процедура заполнения штатного расписания
DROP PROCEDURE IF EXISTS insert_staffs;
DELIMITER //
CREATE PROCEDURE insert_staffs() 
BEGIN
	DECLARE i, j INT DEFAULT 1;
	SET i = 1;
    SELECT COUNT(*) INTO @count_units FROM units;
    WHILE (i < @count_units) DO
		SET j = 1;
		SELECT level INTO @level FROM units WHERE id = i;
        IF @level = 1 THEN  INSERT INTO staff_table (unit_id, position_id)
					VALUES (i, 1), (i, 4), (i, 10), (i, 11);  
        ELSEIF @level = 2 THEN INSERT INTO staff_table (unit_id, position_id)
					VALUES (i, 2), (i, 4), (i, 10);  
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

CALL insert_staffs();

SELECT * FROM staff_table;

# Таблица задач подразделей 
# здесь упрощённо 2 уровня задачи подразделений и функции должности
DROP TABLE IF EXISTS tasks;
CREATE TABLE tasks (
	id SERIAL,
	name TEXT NOT NULL COMMENT 'Текстовое описание задачи',
    begin_at DATETIME DEFAULT NOW() COMMENT 'Дата создания задачи',
    end_at DATETIME DEFAULT '9999-12-31' COMMENT 'Дата ограничения задачи'
) COMMENT 'Задачи подразделений'; 

# Таблица функций в привязке к задачам
DROP TABLE IF EXISTS functions;
CREATE TABLE functions (
	id SERIAL,
    task_id BIGINT UNSIGNED NOT NULL,
	name TEXT NOT NULL COMMENT 'Текстовое описание функции',
    begin_at DATETIME DEFAULT NOW() COMMENT 'Дата создания функции',
    end_at DATETIME DEFAULT '9999-12-31' COMMENT 'Дата ограничения функции',
    CONSTRAINT task_id_fk FOREIGN KEY(task_id) REFERENCES tasks(id)
) COMMENT 'Функции распределяются по должностям штатного расписания'; 

# Процедура заполнения штатного расписания
DROP PROCEDURE IF EXISTS insert_tasks;
DELIMITER //
CREATE PROCEDURE insert_tasks() 
BEGIN
	DECLARE i, j INT DEFAULT 1;
	WHILE (i < 51) DO
		INSERT INTO tasks (id, name) 
			VALUES (i, CONCAT('Задача ', i));
		SET j = 1;
		WHILE j < 4 DO			
			INSERT INTO functions (task_id, name)
						VALUES (i, CONCAT('Функция ', i, j));
			SET j = j + 1;	
        END WHILE;        
        SET i = i + 1;
    END WHILE;
END//
DELIMITER ;

CALL insert_tasks();

SELECT t.name, f.name FROM tasks t JOIN functions f ON f.task_id = t.id;
