# вспомогательные таблицы для генерации данных
USE hunter;
# временные таблицы для генерации фамилии имени и отчества
# мужские
DROP TABLE IF EXISTS fsn_m;
CREATE TABLE fsn_m (
	id SERIAL,
    name VARCHAR(32),
    ename VARCHAR(32)
);
INSERT INTO fsn_m (name, ename) VALUES
('Смирнов', 'smirnov'),
('Иванов','iavnov'),
('Кузнецов','kuznecov'),
('Соколов','sokolov'),
('Попов','popov'),
('Лебедев','lebedev'),
('Козлов','kozlov'),
('Новиков','novikov'),
('Морозов','morozov'),
('Петров','petrov');   

DROP TABLE IF EXISTS fan_m;
CREATE TABLE fan_m (
	id SERIAL,
    name VARCHAR(32),
    im CHAR(2)
);
INSERT INTO fan_m (name, im) VALUES
('Иван','I'),
('Сергей','S'),
('Пётр','P'),
('Семён','S'),
('Василий','V'),
('Александр','Al'),
('Вячеслав','V'),
('Вадим','V'),
('Антон','An'),
('Виталий','Vi');   


DROP TABLE IF EXISTS ffn_m;
CREATE TABLE ffn_m (
	id SERIAL,
    name VARCHAR(32),
    io CHAR(2)
);
INSERT INTO ffn_m (name, io) VALUES
('Иванoвич', 'I'),
('Сергеевич', 'Se'),
('Петрович', 'Pe'),
('Семёнович', 'Sm'),
('Васильевич', 'Va'),
('Александрович', 'Al'),
('Вячеславович', 'Vi'),
('Вадимович', 'Va'),
('Антонович', 'An'),
('Витальевич', 'Vt');   

#Женские
DROP TABLE IF EXISTS fsn_w;
CREATE TABLE fsn_w (
	id SERIAL,
    name VARCHAR(32),
    ename VARCHAR(32)
);
INSERT INTO fsn_w (name, ename) VALUES
('Лазарева','lazareva'),
('Медведева','medvedeva'),
('Ершова','ershova'),
('Никитина','nikitina'),
('Соболева','soboleva'),
('Рябова','riabova'),
('Полякова','poliakova'),
('Цветкова','cvetkova'),
('Данилова','danilova'),
('Жукова','shgukova');

DROP TABLE IF EXISTS fan_w;
CREATE TABLE fan_w (
	id SERIAL,
    name VARCHAR(32),
    im CHAR(2)
);
INSERT INTO fan_w (name, im) VALUES
('Мария','Ma'),
('Ольга','Ol'),
('Татьяна','Ta'),
('Екатерина','Ek'),
('Анна','An'),
('Виктория','Vi'),
('Светланв','Sv'),
('Елена','El'),
('Людмила','Lu'),
('Мариа','Ma');

DROP TABLE IF EXISTS ffn_w;
CREATE TABLE ffn_w (
	id SERIAL,
    name VARCHAR(32),
    io CHAR(2)
);
INSERT INTO ffn_w (name, io) VALUES
('Иванoвна','Iv'),
('Сергеевна','Se'),
('Петровна','Pe'),
('Семёновна','Sm'),
('Васильевна','Va'),
('Александровна','Al'),
('Вячеславовна','Vi'),
('Вадимовна','Vd'),
('Антоновна','An'),
('Витальевна','Vt'); 

DROP TABLE IF EXISTS edu_m;
CREATE TABLE edu_m (
	id SERIAL,
    name VARCHAR(32),
    edu_type_id BIGINT UNSIGNED
);
INSERT INTO edu_m (name, edu_type_id) VALUES
('Университет 1', 6),
('Академия 1', 6),
('Институт 1', 6),
('Университет 2', 6),
('Академия 2', 6),
('Институт 2', 6),
('Университет 3', 6),
('Академия 3', 6),
('Институт 3', 6),
('Техникум 1', 4),
('Техникум 2', 4),
('Техникум 3', 4);

DROP TABLE IF EXISTS firms;
CREATE TABLE firms (
	id SERIAL,
    name VARCHAR(32)
);
INSERT INTO firms (name) VALUES
('Завод 123'),
('Фирма Рога и Копыта'),
('Фирма 789'),
('Швейная фабрика'),
('Нефтеперерабатывающий завод'),
('Завод имени Кирова'),
('Путиловский завод'),
('РЖД'),
('Транснефть'),
('Роснефть'),
('Новатэк'),
('Перекресток'),
('Аэрофлот'),
('Транснефть'),
('Кока-Кола');



