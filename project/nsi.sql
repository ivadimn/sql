 
DROP DATABASE IF EXISTS hunter; 
CREATE DATABASE hunter;
use hunter;

# Уровни должности
DROP TABLE IF EXISTS positions_levels;
CREATE TABLE positions_levels (
	id SERIAL,
    name VARCHAR(128) NOT NULL UNIQUE
) COMMENT 'Таблица уровней должности';

INSERT INTO positions_levels (name) VALUES
	('Высший управленческий состав'), ('Руководители'), 
    ('Специалисты'), ('Служащие'), ('Рабочие');

# справочная таблица должностей 
DROP TABLE IF EXISTS positions;    
CREATE TABLE positions (
	id SERIAL,
    name VARCHAR(128) NOT NULL UNIQUE,
    level_id BIGINT UNSIGNED NOT NULL, 
    CONSTRAINT level_id_fk FOREIGN KEY(level_id) REFERENCES positions_levels(id)
) COMMENT 'Таблица должностей';

INSERT INTO positions (name, level_id) VALUES 
 ('Генеральный директор', 1),
 ('Начальник Департамента', 2),  ('Начальник Управления', 2), ('Начальник отдела', 2),
 ('Заместитель начальника Департамента', 2), ('Заместитель начальника Управления', 2),
 ('Заместитель начальника отдела', 2), ('главный специалист', 3), 
 ('ведущий специалист', 3), ('ведущий инженер', 3), ('секретарь', 4), ('референт', 4),
 ('ведущий программист', 3);
  
# Виды трудовых договоров  
DROP TABLE IF EXISTS contract_types;   
CREATE TABLE contract_types (
	id SERIAL,
    name VARCHAR(64)
) COMMENT 'Виды трудовых договоров';

INSERT INTO contract_types (name) VALUES
	('Срочный'), ('Бессрочный'); 
    
# Направления деятельности
DROP TABLE IF EXISTS activities;   
CREATE TABLE activities (
	id SERIAL,
    name VARCHAR(255)
) COMMENT 'Направления деятельности';

INSERT INTO activities (name) VALUES
	('Административное обеспечение'),
    ('Бурение'),
    ('Бухгалтерский учет и налогообложение'),
    ('Внешнеэкономическая деятельность'),
    ('Геологоразведка'),
    ('Геофизика'),
    ('Добыча газа, газового конденсата, нефти'),
    ('Инвестиции и строительство'),
    ('Маркетинг'),
    ('Мобилизационная подготовка и гражданская оборона'),
    ('Освоение морских месторождений'),
	('Переработка и использование газа'),
	('Подземное хранение газа'),
	('Связи с общественностью'),
	('Стратегическое развитие'),
	('Страхование'),
	('Транспортировка газа'),
	('Транспортные средства и спецтехника'),
	('Управление имуществом'),
	('Управление персоналом'),
	('Управление производственными объектами'),
	('Управление технологическими процессами'),
	('Финансы и экономика'),
	('Хозяйственное обеспечение'),
	('Электроэнергетика'),
	('Юридическое сопровождение');
    
# Справочник видов образования  
DROP TABLE IF EXISTS edu_types;
CREATE TABLE edu_types (
	id SERIAL,
    name VARCHAR(128) NOT NULL UNIQUE
) COMMENT 'Виды образования';  

INSERT INTO edu_types (name) VALUES 
('Основное общее образование'), ('Среднее (полное) общее образование'),
('Начальное профессиональное образование'),
('Среднее профессиональное образование'),
('Неполное высшее образование'),
('Высшее профессиональное образование'),
('Послевузовское профессиональное образование'),
('Ученое звание, ученая степень'),
('Повышение квалификации'),
('Профессиональная переподготовка'),
('Краткосрочные семинары'),
('Консультационные семинары'),
('Стажировка');

# Справочник видов документов  
DROP TABLE IF EXISTS doc_types;
CREATE TABLE doc_types (
	id SERIAL,
    name VARCHAR(128) NOT NULL UNIQUE,
    is_necessary BOOLEAN NOT NULL 
) COMMENT 'Виды документов';  

INSERT INTO doc_types (name, is_necessary) VALUES 
('Справка', FALSE), ('Аттесстат', FALSE),('Диплом', TRUE), ('Сертификат', FALSE), 
('Свидетельство', FALSE), ('Паспорт РФ', TRUE), ('Заграничный паспорт', FALSE),
('Свидетельство ИНН', TRUE), ('СНИЛС', TRUE), ('Автобиография', TRUE), ('Трудовая книжка', TRUE),
('Военный билет', FALSE), ('Самопрезентация', TRUE), ('Согласие на обработку персональных данных', TRUE),
('Резюме', TRUE);

# Справочник уровней владения иностранным языком  
DROP TABLE IF EXISTS foreign_levels;
CREATE TABLE foreign_levels (
	id SERIAL,
    name VARCHAR(64) NOT NULL UNIQUE
) COMMENT 'Виды документов';  

INSERT INTO foreign_levels (name) VALUES 
('A1'), ('A2'),('B1'), ('B2'), ('C1'), ('C2'), 
('Читает и переводит со словарем'),
('Умеет объясняться'), 
('Владеет свободно');

# Этапы прохождения отбора кандидатом  
DROP TABLE IF EXISTS selection_steps;
CREATE TABLE selection_steps (
	id INT1 UNSIGNED PRIMARY KEY,
    name VARCHAR(128) NOT NULL UNIQUE
) COMMENT 'Этапы прохождения отбора кандидатом';

INSERT INTO selection_steps (id, name) VALUES
	(1, 'Проверка полноты персональных данных и документов'),
    (2, 'Первичное собеседование в кадровой службе'),
    (3, 'Собеседование в подразделении подашем заявку на подбор'),
    (4, 'Собеседование с руководителем кадровой службы'),
    (5, 'Проверка кандидата в Службе безопасности'),
    (6, 'Принятие решение о приёме');
    

# Виды пожеланий кандидата  
DROP TABLE IF EXISTS wishes;
CREATE TABLE wishes (
	id SERIAL,
    name VARCHAR(128) NOT NULL UNIQUE
) COMMENT 'Виды пожеланий кандидата';

INSERT INTO wishes (name) VALUES
	('Готовность к командировкам'),
    ('Готовность к перезду'),
    ('Вид договора'),
    ('Характер занятости'),
    ('Ожидания по зарплате');
    
# Города  
DROP TABLE IF EXISTS places;
CREATE TABLE places (
	id SERIAL,
    name VARCHAR(128) NOT NULL UNIQUE
) COMMENT 'Города';    

INSERT INTO places (name) VALUES
('Москва'),
('Санкт-Петербург'),
('Новосибирск'),
('Екатеринбург'),
('Нижний Новгород'),
('Казань'),
('Челябинск'),
('Омск'),
('Самара'),
('Ростов-на-Дону'),
('Уфа'),
('Красноярск'),
('Воронеж'),
('Пермь'),
('Волгоград'),
('Краснодар'),
('Саратов'),
('Тюмень'),
('Тольятти'),
('Ижевск'),
('Барнаул'),
('Ульяновск');

DROP TABLE IF EXISTS relative_types;
CREATE TABLE relative_types (
	id SERIAL,
    name VARCHAR(16) NOT NULL UNIQUE
) COMMENT 'Родственники';

INSERT INTO relative_types (name) VALUES    
   ('Мать'), ('Отец'), ('Муж'), ('Жена'), ('Сын'), ('Дочь'), ('Брат'), ('Сестра');
    