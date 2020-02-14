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

