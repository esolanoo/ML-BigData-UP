CREATE TABLE `students` (
  `id` CHAR(10) PRIMARY KEY NOT NULL,
  `name` VARCHAR(128) NOT NULL,
  `last_names` VARCHAR(128) NOT NULL,
  `alias` VARCHAR(128)
);

CREATE TABLE `classes` (
  `class` INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
  `student_id` CHAR(10) NOT NULL,
  `question` VARCHAR(256),
  `topic` VARCHAR(128) NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIME
);

CREATE TABLE `questions` (
  `class` INT PRIMARY KEY NOT NULL,
  `question` VARCHAR(256)
);

CREATE TABLE `answers` (
  `class` INT PRIMARY KEY NOT NULL,
  `student_id` CHAR(10) NOT NULL,
  `given_answer` VARCHAR(256) NOT NULL
);

CREATE TABLE `attendance` (
  `class` INT PRIMARY KEY NOT NULL,
  `student_id` VARCHAR(256) NOT NULL,
  `attendance` bool NOT NULL DEFAULT 0
);

ALTER TABLE `classes` ADD FOREIGN KEY (`student_id`) REFERENCES `students` (`id`);

ALTER TABLE `questions` ADD FOREIGN KEY (`class`) REFERENCES `classes` (`class`);

ALTER TABLE `questions` ADD FOREIGN KEY (`class`) REFERENCES `answers` (`class`);

ALTER TABLE `students` ADD FOREIGN KEY (`id`) REFERENCES `answers` (`student_id`);

ALTER TABLE `classes` ADD FOREIGN KEY (`class`) REFERENCES `attendance` (`class`);

ALTER TABLE `students` ADD FOREIGN KEY (`id`) REFERENCES `attendance` (`student_id`);
