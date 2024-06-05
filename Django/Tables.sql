CREATE TABLE `student` (
  `id` CHAR(10) PRIMARY KEY NOT NULL,
  `name` VARCHAR(128) NOT NULL,
  `last_names` VARCHAR(128) NOT NULL,
  `alias` VARCHAR(128)
);

CREATE TABLE `classes` (
  `class_number` INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
  `question` VARCHAR(256),
  `topic` VARCHAR(128) NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIME
);

CREATE TABLE `questions` (
  `class_number` INT PRIMARY KEY NOT NULL,
  `question` VARCHAR(256)
);

CREATE TABLE `answers` (
  `class_number` INT PRIMARY KEY NOT NULL,
  `student_id` CHAR(10) NOT NULL,
  `given_answer` VARCHAR(256) NOT NULL
);

CREATE TABLE `attendance` (
  `class_number` INT PRIMARY KEY NOT NULL,
  `student_id` VARCHAR(256) NOT NULL,
  `attendance` bool NOT NULL DEFAULT 0
);

CREATE TABLE `quiz` (
  `student_id` CHAR(10) PRIMARY KEY,
  `question1` VARCHAR(256),
  `question2` VARCHAR(256),
  `question3` VARCHAR(256),
  `question4` VARCHAR(256),
  `question5` VARCHAR(256),
  `question6` VARCHAR(256),
  `answer1` VARCHAR(256),
  `answer2` VARCHAR(256),
  `answer3` VARCHAR(256),
  `answer4` VARCHAR(256),
  `answer5` VARCHAR(256),
  `answer6` VARCHAR(256)
);

CREATE TABLE `choices` (
  `question` VARCHAR(256),
  `choice` VARCHAR(256),
  `correct` bool NOT NULL DEFAULT 0
);

ALTER TABLE `questions` ADD FOREIGN KEY (`class_number`) REFERENCES `classes` (`class_number`);

ALTER TABLE `student` ADD FOREIGN KEY (`id`) REFERENCES `answers` (`student_id`);

ALTER TABLE `questions` ADD FOREIGN KEY (`question`) REFERENCES `answers` (`question`);

ALTER TABLE `classes` ADD FOREIGN KEY (`class_number`) REFERENCES `attendance` (`class_number`);

ALTER TABLE `student` ADD FOREIGN KEY (`id`) REFERENCES `attendance` (`student_id`);

ALTER TABLE `quiz` ADD FOREIGN KEY (`student_id`) REFERENCES `student` (`id`);

ALTER TABLE `choices` ADD FOREIGN KEY (`question`) REFERENCES `quiz` (`question1`);

ALTER TABLE `choices` ADD FOREIGN KEY (`question`) REFERENCES `quiz` (`question2`);

ALTER TABLE `choices` ADD FOREIGN KEY (`question`) REFERENCES `quiz` (`question3`);

ALTER TABLE `choices` ADD FOREIGN KEY (`question`) REFERENCES `quiz` (`question4`);

ALTER TABLE `choices` ADD FOREIGN KEY (`question`) REFERENCES `quiz` (`question5`);

ALTER TABLE `choices` ADD FOREIGN KEY (`question`) REFERENCES `quiz` (`question6`);

ALTER TABLE `choices` ADD FOREIGN KEY (`correct`) REFERENCES `quiz` (`answer1`);

ALTER TABLE `choices` ADD FOREIGN KEY (`correct`) REFERENCES `quiz` (`answer2`);

ALTER TABLE `choices` ADD FOREIGN KEY (`correct`) REFERENCES `quiz` (`answer3`);

ALTER TABLE `choices` ADD FOREIGN KEY (`correct`) REFERENCES `quiz` (`answer4`);

ALTER TABLE `choices` ADD FOREIGN KEY (`correct`) REFERENCES `quiz` (`answer5`);

ALTER TABLE `choices` ADD FOREIGN KEY (`correct`) REFERENCES `quiz` (`answer6`);


INSERT INTO myapp_student (id, name, last_names, alias) 
VALUES ('0224604', 'Paulina', 'Barba Mendoza', 'Pau'), 
        ('0213663', 'Eduardo', 'Solano Jaime', 'Eduardo'),
        ('0338765', 'Gabriela', 'Martinez Vega', 'Gaby'),
        ('0356712', 'Diego', 'Alvarez Flores', 'Diego'),
        ('0246789', 'Camila', 'Ortiz Navarro', 'Cami'),
        ('0374561', 'Daniel', 'Lozano Suarez', 'Dani'),
        ('0302984', 'Valeria', 'Ramos Pineda', 'Vale'),
        ('0291765', 'Pablo', 'Castillo Rojas', 'Pablito'),
        ('0389675', 'Fernanda', 'Guerra Medina', 'Fer'),
        ('0229785', 'Raul', 'Benitez Herrera', 'Raulito'),
        ('0365897', 'Natalia', 'Mendoza Aguilar', 'Nati'),
        ('0234568', 'Javier', 'Carrillo Torres', 'Javi'),
        ('0346785', 'Andrea', 'Silva Romero', 'Andy'),
        ('0317894', 'Jose', 'Reyes Gutierrez', 'Jose'),
        ('0278654', 'Lucia', 'Cruz Mendoza', 'Lucy'),
        ('0397654', 'Ricardo', 'Vargas Morales', 'Ricky'),
        ('0254987', 'Elena', 'Rios Dominguez', 'Eli'),
        ('0216789', 'Manuel', 'Guzman Ortega', 'Manny'),
        ('0387654', 'Santiago', 'Marin Herrera', 'Santi'),
        ('0298765', 'Renata', 'Salinas Ponce', 'Rena'),
        ('0329876', 'Adrian', 'Ortega Campos', 'Adri'),
        ('0265432', 'Victoria', 'Lopez Nunez', 'Vicky')ñ


INSERT INTO myapp_class (class_number, topic, created_at) 
VALUES (1, 'Django', CURRENT_TIMESTAMP()), 
        (2, 'Cloud Computing', CURRENT_TIMESTAMP()),
        (3, 'Artificial Intelligence', CURRENT_TIMESTAMP()),
        (4, 'Data Science', CURRENT_TIMESTAMP()),
        (5, 'Machine Learning', CURRENT_TIMESTAMP()),
        (6, 'Big Data', CURRENT_TIMESTAMP()),
        (7, 'Cybersecurity', CURRENT_TIMESTAMP()),
        (8, 'Internet of Things', CURRENT_TIMESTAMP()),
        (9, 'Blockchain', CURRENT_TIMESTAMP()),
        (10, 'Quantum Computing', CURRENT_TIMESTAMP());

INSERT INTO myapp_questions (class_number_id, question) 
VALUES (1, 'Favorite food'), 
        (2, 'Favourite Number'),
        (3, 'Favorite color'),
        (4, 'Preferred vacation destination'),
        (5, 'Best movie ever'),
        (6, 'Favorite book genre'),
        (7, 'Preferred music genre'),
        (8, 'Dream job'),
        (9, 'Favorite sport'),
        (10, 'Hobby');


INSERT INTO myapp_choices (question, choice, correct) 
VALUES ('Which SQL statement is used to retrieve data from a database?', 'GET', 0),
        ('Which SQL statement is used to retrieve data from a database?', 'RETRIEVE', 0),
        ('Which SQL statement is used to retrieve data from a database?', 'SELECT', 1),
        ('Which SQL statement is used to retrieve data from a database?', 'FETCH', 0),
        ('What is the correct SQL statement to create a database named test_db?', 'CREATE test_db;', 0),
        ('What is the correct SQL statement to create a database named test_db?', 'CREATE DATABASE test_db;', 1),
        ('What is the correct SQL statement to create a database named test_db?', 'CREATE DB test_db;', 0),
        ('What is the correct SQL statement to create a database named test_db?', 'MAKE DATABASE test_db;', 0),
        ('Which of the following is a valid data type in MySQL?', 'BINARY', 0),
        ('Which of the following is a valid data type in MySQL?', 'CHAR', 0),
        ('Which of the following is a valid data type in MySQL?', 'DATETIME', 0),
        ('Which of the following is a valid data type in MySQL?', 'All of the above', 1),
        ('What is the main purpose of an index in a database?', 'To ensure data integrity', 0),
        ('What is the main purpose of an index in a database?', 'To speed up queries', 1),
        ('What is the main purpose of an index in a database?', 'To create a primary key', 0),
        ('What is the main purpose of an index in a database?', 'To enforce unique values', 0),
        ('Which SQL keyword is used to combine rows from two or more tables, based on a related column between them?', 'JOIN', 1),
        ('Which SQL keyword is used to combine rows from two or more tables, based on a related column between them?', 'MERGE', 0),
        ('Which SQL keyword is used to combine rows from two or more tables, based on a related column between them?', 'LINK', 0),
        ('Which SQL keyword is used to combine rows from two or more tables, based on a related column between them?', 'LINK', 0),
        ('Which SQL function is used to calculate the number of rows in a table?', 'SUM()', 0),
        ('Which SQL function is used to calculate the number of rows in a table?', 'COUNT()', 1),
        ('Which SQL function is used to calculate the number of rows in a table?', 'AVG()', 0),
        ('Which SQL function is used to calculate the number of rows in a table?', 'TOTAL()', 0),
        ('Which of the following clauses is used to filter the results of a query in MySQL?', 'GROUP BY', 0),
        ('Which of the following clauses is used to filter the results of a query in MySQL?', 'WHERE', 1),
        ('Which of the following clauses is used to filter the results of a query in MySQL?', 'HAVING', 0),
        ('Which of the following clauses is used to filter the results of a query in MySQL?', 'ORDERED BY', 0),
        ("What does the SQL statement <SELECT COUNT(*) FROM employees WHERE department='Sales';> do?", "Counts the total number of employees in the 'Sales' department.", 1),
        ("What does the SQL statement <SELECT COUNT(*) FROM employees WHERE department='Sales';> do?", "Retrieves the names of all employees in the 'Sales' department.", 0),
        ("What does the SQL statement <SELECT COUNT(*) FROM employees WHERE department='Sales';> do?", "Deletes all employees in the 'Sales' department.", 0),
        ("What does the SQL statement <SELECT COUNT(*) FROM employees WHERE department='Sales';> do?", "Updates the 'Sales' department records.", 0),
        ("Which MySQL function is used to return the current date and time?", "NOW()", 1),
        ("Which MySQL function is used to return the current date and time?", "CURRENT_DATE()", 0),
        ("Which MySQL function is used to return the current date and time?", "GETDATE()", 0),
        ("Which MySQL function is used to return the current date and time?", "CURDATE()", 0);