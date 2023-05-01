DROP TABLE IF EXIST category;
DROP TABLE IF EXIST materiel;
DROP TABLE IF EXIST project;
DROP TABLE IF EXIST step;
DROP TABLE IF EXIST project_category;

CREATE TABLE project_category(
project_id INT,
category_id INT,
FOREIGN KEY(project_id) REFERENCES project(project_id),
FOREIGN KEY (category_id) REFERENCES category(category_id),
UNIQUE KEY(project_id, category_id) 
);

CREATE TABLE step(
step_id INT AUTO_INCREMENT NOT NULL,
PRIMARY KEY(step_id),
project_id INT,
FOREIGN KEY (project_id) REFERENCES project(project_id),
step_text TEXT NOT NULL,
step_order INT NOT NULL
);

CREATE TABLE project(
project_id INT AUTO_INCREMENT NOT NULL,
PRIMARY KEY(project_id),
project_name VARCHAR(128) NOT NULL,
estimated_hours DECIMAL(7, 2) ,
actual_hours DECIMAL(7,2),
difficulty INT,
notes TEXT
);

CREATE TABLE materiel(
materiel_id INT AUTO_INCREMENT NOT NULL,
PRIMARY KEY(materiel_id),
project_id INT ,
FOREIGN KEY(project_id) REFERENCES project(project_id),
materiel_name VARCHAR(128) NOT NULL,
num_required INT,
cost DECIMAL(7, 2)
);

CREATE TABLE category(
category_id INT AUTO_INCREMENT NOT NULL,
PRIMARY KEY (category_id),
category_name VARCHAR(128) not NULL
);

