#
# Таблицы для хранения организационной струкутры и штатного расписания
USE hunter;

# Организационные единицы
# хранение орг. структуры организованов в виде вложенных подмножеств
# элементы орг структруры создаются, но не удаляются, а ограничиваются определённой датой 
# в целях хранения истории
DROP TABLE IF EXISTS units;
CREATE TABLE units (
	id SERIAL,
    parent_id BIGINT UNSIGNED,
    name VARCHAR(128) COMMENT 'Наименование орг. единицы',
    begin_at DATETIME DEFAULT NOW() COMMENT 'Дата создания орг. единицы',
    end_at DATETIME DEFAULT '9999-12-31' COMMENT 'Дата ограничения орг. единицы'
) COMMENT 'Организационные единиц';
# 

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
    
# Триггер используется при вставке орг единиц
# в таблице связей  создаются записи.
#    
DROP TRIGGER IF EXISTS add_unit;
DELIMITER //
CREATE TRIGGER add_unit AFTER INSERT ON units
FOR EACH ROW
BEGIN
	IF NEW.parent_id IS NULL THEN
		INSERT INTO unit_links (unit_id, parent_id, level)
			VALUES(NEW.id, NEW.id, 1);
    ELSE 
		SELECT level INTO @l FROM unit_links WHERE unit_id = NEW.parent_id AND parent_id = NEW.parent_id;
        INSERT INTO unit_links (unit_id, parent_id, level)
			VALUES(NEW.id, NEW.id, @l + 1);
        INSERT INTO unit_links (unit_id, parent_id, level)
					SELECT NEW.id, parent_id, level FROM unit_links WHERE unit_id = NEW.parent_id;	
    END IF;        
END//
DELIMITER ; 

 
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
    INSERT INTO units (id, parent_id, name) VALUES (1, NULL, 'Организация');
    WHILE (i < 4) DO
		INSERT INTO units (parent_id, name) VALUES (1, CONCAT(dep_name, i));
        SELECT MAX(id) INTO @maxdep_id FROM units;
        SET j = 1;
        WHILE j < 3 DO
			INSERT INTO units (parent_id, name) VALUES (@maxdep_id, CONCAT(subdep_name, i, j));
            SELECT MAX(id) INTO @maxsubdep_id FROM units;
            SET k = 1;
            WHILE k < 4 DO
				INSERT INTO units (parent_id, name) VALUES (@maxsubdep_id, CONCAT(unit_name, i, j, k));
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
SELECT * FROM unit_links;

# Запрос выводит иерархию до конкретного подразделения
SELECT u.name, u.id, s.parent_id, s.level FROM unit_links s
    LEFT JOIN units u ON u.id = s.parent_id
WHERE s.unit_id = 6
ORDER BY level;

# Запрос выводит всю иерархию от конкретного подразделения
SELECT u.name, u.id, s.parent_id, s.level FROM unit_links s
    LEFT JOIN units u ON u.id = s.unit_id
WHERE s.parent_id = 2
ORDER BY level;
 
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
		SELECT level INTO @level FROM unit_links WHERE parent_id = i AND unit_id = i;
        IF @level = 1 THEN  INSERT INTO staff_table (unit_id, position_id)
					VALUES (i, 1), (i, 11), (i, 12);  
        ELSEIF @level = 2 THEN INSERT INTO staff_table (unit_id, position_id)
					VALUES (i, 2), (i, 5), (i, 11);  
        ELSEIF @level = 3 THEN INSERT INTO staff_table (unit_id, position_id)
					VALUES (i, 3), (i, 6), (i, 11);              
        ELSE             
			INSERT INTO staff_table (unit_id, position_id)
					VALUES (i, 4), (i, 7); 
            WHILE j <= 3 DO			
				INSERT INTO staff_table (unit_id, position_id)
						VALUES (i, (8 + FLOOR(RAND() * 2)));
				SET j = j + 1;	
             END WHILE;        
        END IF;
		SET i = i + 1;
    END WHILE;
END//
DELIMITER ;

SELECT * FROM unit_links;
SELECT * FROM units;

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

			
