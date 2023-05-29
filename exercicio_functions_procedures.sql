DROP DATABASE IF EXISTS aula10;
CREATE DATABASE aula10;
USE aula10;

CREATE TABLE Aluno(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
firstname VARCHAR(45),
age INT,
course VARCHAR(3),
email VARCHAR(100)
);

DELIMITER $$
DROP FUNCTION IF EXISTS generate_email $$
CREATE FUNCTION generate_email(firstname VARCHAR(45), course VARCHAR(3)) RETURNS VARCHAR(45)
DETERMINISTIC
BEGIN
	DECLARE email VARCHAR(45);
    SET email = CONCAT(firstname,"@",course,".inatel.br");
    RETURN email;
END $$
DELIMITER ;

#SELECT generate_email("Mathz", "GEC") AS Email;

DELIMITER $$
DROP PROCEDURE IF EXISTS insert_student $$
CREATE PROCEDURE insert_student (IN firstname VARCHAR(45), IN age INT, IN course VARCHAR(3))
BEGIN
	INSERT INTO Aluno (firstname, age, course, email) VALUES (firstname, age, course, generate_email(firstname,course));
END $$
DELIMITER ;

CALL insert_student("Mathz", 20, "GEC");

SELECT * FROM Aluno;
