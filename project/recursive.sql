use hunter;

DROP TABLE IF EXISTS orgs;
CREATE TABLE orgs (
	id SERIAL,
    parent_id BIGINT UNSIGNED,
    name VARCHAR(128) COMMENT 'Наименование орг. единицы',
    level INT1 UNSIGNED NOT NULL COMMENT 'Уровень подразделения в структуре',
    CONSTRAINT orgs_parent_id_fk FOREIGN KEY(parent_id) REFERENCES orgs(id)
) COMMENT 'Организационные единиц';

INSERT INTO orgs(id, parent_id, name, level) VALUES
 (1, NULL, 'Firm1', 1), (2, 1, 'Dep1', 2), (3, 1, 'Dep12', 2), (4, 1, 'Dep13', 2),
 (5, 2, 'Unit111', 3), (6, 2, 'Unit112', 3), (7, 3, 'Unit121', 3), (8, 3, 'Unit122', 3),
 (9, 5, 'Otdel_1', 4), (10, 5, 'Otdel_2', 4), (11, 6, 'Otdel_3', 4), (12, 6, 'Otdel_4', 4);
 
 SELECT * FROM orgs;
 
 WITH RECURSIVE sub_orgs(id, name, parent_id, level) AS (
	SELECT id, name, parent_id, 1 FROM orgs WHERE id=5 /* код заданного узла поддерева */
	UNION ALL 
	SELECT o.id, o.name, o.parent_id, o.level+1
	FROM orgs o, sub_orgs so
	WHERE o.parent_id = so.id  
)
SELECT id, name, parent_id, level FROM sub_orgs;

WITH RECURSIVE sub_orgs(id, name, parent_id, level) AS (
	SELECT id, name, parent_id, 1 FROM orgs WHERE id=10 /* код заданного узла поддерева */
	UNION ALL 
	SELECT o.id, o.name, o.parent_id, o.level+1
	FROM orgs o, sub_orgs so
	WHERE o.id = so.parent_id  
)
SELECT id, name, parent_id, level FROM sub_orgs;


DROP TABLE IF EXISTS sets;
CREATE TABLE sets (
	id SERIAL,
    parent_id BIGINT UNSIGNED,
    name VARCHAR(128) COMMENT 'Наименование орг. единицы',
    CONSTRAINT sets_parent_id_fk FOREIGN KEY(parent_id) REFERENCES sets(id)
) COMMENT 'Организационные единиц';

# таблица иерархии орг единиц
DROP TABLE IF EXISTS set_links;
CREATE TABLE set_links (
	unit_id BIGINT UNSIGNED NOT NULL,
    parent_id BIGINT UNSIGNED NOT NULL,
    level INT1 UNSIGNED NOT NULL COMMENT 'Уровень подразделения в структуре',
    PRIMARY KEY(unit_id, parent_id),
    CONSTRAINT sets_links_parent_id_fk FOREIGN KEY(parent_id) REFERENCES sets(id),
    CONSTRAINT sets_links_unit_id_fk FOREIGN KEY(unit_id) REFERENCES sets(id)
) COMMENT 'Иерархия организационных единиц';

INSERT INTO sets (id, parent_id, name) VALUES (1, NULL, 'Firm');
INSERT INTO set_links (unit_id, parent_id, level) VALUES (1, 1, 1);
INSERT INTO sets (id, parent_id, name) VALUES (2, 1, 'Dep1');
INSERT INTO set_links (unit_id, parent_id, level) VALUES (2, 2, 2);
INSERT INTO set_links (unit_id, parent_id, level) VALUES (2, 1, 1);
INSERT INTO sets (id, parent_id, name) VALUES (3, 1, 'Dep2');
INSERT INTO set_links (unit_id, parent_id, level) VALUES (3, 3, 2);
INSERT INTO set_links (unit_id, parent_id, level) VALUES (3, 1, 1);
INSERT INTO sets (id, parent_id, name) VALUES (4, 2, 'Dep12');
INSERT INTO set_links (unit_id, parent_id, level) VALUES (4, 4, 3);
INSERT INTO set_links (unit_id, parent_id, level) VALUES (4, 2, 2);
INSERT INTO set_links (unit_id, parent_id, level) VALUES (4, 1, 1);

INSERT INTO sets (parent_id, name) VALUES (4, 'Otdel_parent_4');

SELECT c.name, c.id, s.parent_id, s.level FROM set_links s
    LEFT JOIN sets c ON c.id = s.unit_id
WHERE s.parent_id = 1 /* корень поддерева */
ORDER BY level;

SELECT c.name, c.id, s.parent_id, s.level FROM set_links s
    LEFT JOIN sets c ON c.id = s.parent_id
WHERE s.unit_id = 7 
ORDER BY level;

SELECT level FROM set_links WHERE unit_id = 4 AND parent_id = 4;
SELECT unit_id, parent_id FROM set_links WHERE unit_id = 4;
SELECT parent_id, level FROM set_links WHERE unit_id = 4;



SELECT * FROM set_links;
SELECT * FROM sets;


DROP TRIGGER IF EXISTS add_unit;
DELIMITER //
CREATE TRIGGER add_unit AFTER INSERT ON sets
FOR EACH ROW
BEGIN
	IF NEW.parent_id IS NULL THEN
		INSERT INTO set_links (unit_id, parent_id, level)
			VALUES(NEW.id, NEW.id, 1);
    ELSE 
		SELECT level INTO @l FROM set_links WHERE unit_id = NEW.parent_id AND parent_id = NEW.parent_id;
        INSERT INTO set_links (unit_id, parent_id, level)
			VALUES(NEW.id, NEW.id, @l + 1);
        INSERT INTO set_links (unit_id, parent_id, level)
					SELECT NEW.id, parent_id, level FROM set_links WHERE unit_id = NEW.parent_id;	
    END IF;        
END//
DELIMITER ; 
