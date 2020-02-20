# 1. Запрос выводит список документов представленных кандидатом

SELECT dt.name  FROM doc_types dt LEFT JOIN resume_docs rd ON rd.doc_type_id = dt.id 
					 AND dt.is_necessary = TRUE AND rd.resume_id = 2
                     WHERE rd.resume_id IS NOT NULL;
				     
# 1. Запрос выводит список документов которых не хватает для рассмотрения
SELECT dt.name  FROM doc_types dt LEFT JOIN resume_docs rd ON rd.doc_type_id = dt.id 
					 AND dt.is_necessary = TRUE AND rd.resume_id = 2
                     WHERE rd.resume_id IS NULL;
				
                

# 2. функция формирует полный путь должности
DROP FUNCTION IF EXISTS get_path_unit;
DELIMITER //
CREATE FUNCTION get_path_unit(unit BIGINT UNSIGNED)
RETURNS VARCHAR(255) DETERMINISTIC
BEGIN
	DECLARE done INT DEFAULT FALSE;
    DECLARE unit_name VARCHAR(255) DEFAULT '';
    DECLARE uname VARCHAR(64) DEFAULT '';
    DECLARE unit_id BIGINT UNSIGNED;
	DECLARE cur_units CURSOR FOR SELECT u.name,  u.id FROM unit_links s
		LEFT JOIN units u ON u.id = s.parent_id
		WHERE s.unit_id = unit ORDER BY level;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    OPEN cur_units;
    cycle : LOOP
		FETCH cur_units INTO uname, unit_id;
		IF done THEN LEAVE cycle;
		END IF;
		SET unit_name = CONCAT(unit_name, uname,  '/');
	END LOOP cycle;

	CLOSE cur_units;
	RETURN unit_name;
END//
DELIMITER ;

SELECT get_path_unit(6);

# 2. Список должностей с указанием полного наименования подразделения
# заявки на подбор

DELIMITER //
DROP PROCEDURE IF EXISTS copy_catalogs;
DELIMITER //
CREATE PROCEDURE copy_catalogs ()
BEGIN
  DECLARE id INT;
  DECLARE is_end INT DEFAULT 0;
  DECLARE name TINYTEXT;

  DECLARE cur_staff CURSOR FOR SELECT id, unit_id FROM staff_table;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET is_end = 1;

  CREATE TEMPORARY TABLE temp_unit (
	 unit VARCHAR(255),
     position VARCHAR(32),
     staff_id BIGINT UNSIGNED
  );
  
  OPEN cur_staff;

  cycle : LOOP
	FETCH curcat INTO id, unit_id;
	IF is_end THEN LEAVE cycle;
	END IF;
    
	INSERT INTO upcase_catalogs VALUES(id, UPPER(name));
  END LOOP cycle;

  CLOSE curcat;
END//
DELIMITER ;

