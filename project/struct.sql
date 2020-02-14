#
# Таблицы для хранения организационной струкутры и штатного расписания
USE hunter;

# Организационные единицы
DROP TABLE IF EXISTS units;
CREATE TABLE units (
	id SERIAL,
    name VARCHAR(128) COMMENT 'Наименование орг. единицы',
    begin_at DATETIME DEFAULT NOW() COMMENT 'Дата создания орг. единицы',
    end_at DATETIME DEFAULT '9999-12-31' COMMENT 'Дата ограничения орг. единицы'
) COMMENT 'Организационные единиц';
# Организационные единицы не удаляются в целях хранения истории

# таблица иерархии орг единиц
DROP TABLE IF EXISTS unit_links;
CREATE TABLE unit_links (
	unit_id BIGINT UNSIGNED NOT NULL,
    parent_id BIGINT UNSIGNED NOT NULL,
    level INT1 UNSIGNED NOT NULL COMMENT 'Уровень подразделения в структуре',
    PRIMARY KEY(unit_id, parent_id),
    CONSTRAINT unit_links_parent_id_fk FOREIGN KEY(parent_id) REFERENCES units(id),
    CONSTRAINT unit_links_unit_id_fk FOREIGN KEY(unit_id) REFERENCES units(id)
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
            WHILE k < 4 DO
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
    CONSTRAINT staff_table_unit_id_fk FOREIGN KEY(unit_id) REFERENCES units(id),
    CONSTRAINT staff_table_position_id_fk FOREIGN KEY(position_id) REFERENCES positions(id)
) COMMENT 'Штатное расписание';  

SELECT u.name, p.name FROM staff_table st JOIN units u ON u.id = st.unit_id
			JOIN positions p ON p.id = st.position_id
            WHERE st.unit_id = 5;
            
SELECT u.name  FROM units u JOIN unit_links ul ON ul.unit_id = u.id
			AND ul.parent_id = 1;
            
SELECT u.name  FROM units u JOIN unit_links ul ON ul.unit_id = u.id
				AND ul.parent_id = 1;
                
SELECT u.name FROM units u JOIN unit_links ul1 ON ul1.parent_id = u.id
				JOIN unit_links ul2 ON ul1.unit_id = ul2.parent_id
                WHERE ul2.unit_id = 5;
                
SELECT ul1.parent_id, ul1.unit_id  FROM unit_links ul1 
			JOIN unit_links ul2 ON ul2.parent_id = ul1.unit_id
			WHERE ul1.unit_id = 6;

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
        IF @level = 0 THEN  INSERT INTO staff_table (unit_id, position_id)
					VALUES (i, 1), (i, 4), (i, 10), (i, 11);  
        ELSEIF @level = 1 THEN INSERT INTO staff_table (unit_id, position_id)
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
    CONSTRAINT functions_task_id_fk FOREIGN KEY(task_id) REFERENCES tasks(id)
) COMMENT 'Функции распределяются по должностям штатного расписания'; 

# Процедура задач и функций
DROP PROCEDURE IF EXISTS insert_tasks;
DELIMITER //
CREATE PROCEDURE insert_tasks() 
BEGIN
	DECLARE i, j INT DEFAULT 1;
    SELECT COUNT(*) INTO @units_count FROM units;
	WHILE (i < @units_count + 1) DO
		INSERT INTO tasks (id, name) 
			VALUES (i, CONCAT('Задача ', i));
		SET j = 1;
		WHILE j < 5 DO			
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


# Таблица связки подразделений и задач
DROP TABLE IF EXISTS tasks_units;
CREATE TABLE tasks_units (
	unit_id BIGINT UNSIGNED NOT NULL,
    task_id BIGINT UNSIGNED NOT NULL,
	linked_at DATETIME DEFAULT NOW() COMMENT 'Дата привязки задачи к подразделению',
    unlinked_at DATETIME DEFAULT '9999-12-31' COMMENT 'Дата отсоединения задачи от подразделения',
    CONSTRAINT tasks_units_task_id_fk FOREIGN KEY(task_id) REFERENCES tasks(id),
    CONSTRAINT tasks_units_unit_id_fk FOREIGN KEY(unit_id) REFERENCES units(id)
) COMMENT 'Функции распределяются по должностям штатного расписания'; 

# Процедура привязки задач к подразделениям
DROP PROCEDURE IF EXISTS insert_tasks_units;
DELIMITER //
CREATE PROCEDURE insert_tasks_units() 
BEGIN
	DECLARE i INT DEFAULT 1;
    SELECT COUNT(*) INTO @units_count FROM units;
	WHILE (i < @units_count + 1) DO
		INSERT INTO tasks_units (unit_id, task_id) 
			VALUES (i, i);
	    SET i = i + 1;
    END WHILE;
END//
DELIMITER ;

CALL insert_tasks_units();
SELECT * from tasks_units;


# Таблица связки функций и штатных должностей
DROP TABLE IF EXISTS functions_staffs;
CREATE TABLE functions_staffs (
	staff_id BIGINT UNSIGNED NOT NULL,
    function_id BIGINT UNSIGNED NOT NULL,
	linked_at DATETIME DEFAULT NOW() COMMENT 'Дата привязки задачи к подразделению',
    unlinked_at DATETIME DEFAULT '9999-12-31' COMMENT 'Дата отсоединения задачи от подразделения',
    CONSTRAINT functions_staffs_staff_id_fk FOREIGN KEY(staff_id) REFERENCES staff_table(id),
    CONSTRAINT functions_staffs_function_id_fk FOREIGN KEY(function_id) REFERENCES functions(id)
) COMMENT 'Функции распределяются по должностям штатного расписания'; 

# Процедура привязки функций к должностям
DROP PROCEDURE IF EXISTS link_functions_staffs;
DELIMITER //
CREATE PROCEDURE link_functions_staffs() 
BEGIN
	DECLARE i INT DEFAULT 1;
    SELECT COUNT(*) INTO @staff_count FROM staff_table;
	WHILE (i < @staff_count + 1) DO
		INSERT INTO functions_staffs(staff_id, function_id) SELECT i, f.id 
					FROM functions f JOIN tasks_units tu ON f.task_id = tu.task_id
					JOIN staff_table st ON tu.unit_id = st.unit_id
					AND st.id = i;
	    SET i = i + 1;
    END WHILE;
END//
DELIMITER ;

CALL link_functions_staffs();
SELECT * FROM functions_staffs;

SELECT 1, f.id 
	FROM functions f JOIN tasks_units tu ON f.task_id = tu.task_id
		JOIN staff_table st ON tu.unit_id = st.unit_id
        WHERE st.unit_id = 1;
        
SELECT 1, f.id FROM functions f JOIN tasks_units tu ON f.task_id = tu.task_id
			JOIN staff_table st ON tu.unit_id = st.unit_id
            AND st.id = 1;
			
