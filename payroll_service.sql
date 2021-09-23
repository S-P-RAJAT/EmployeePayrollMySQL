SHOW DATABASES;
CREATE DATABASE payroll;
use payroll
SELECT DATABASE();

CREATE TABLE employee_payroll
(id INT unsigned NOT NULL AUTO_INCREMENT,
name VARCHAR(150) NOT NULL,
salary DOUBLE NOT NULL,
start DATE NOT NULL,
PRIMARY KEY (id)
);

SHOW TABLES;
DESCRIBE employee_payroll;

INSERT INTO employee_payroll (name, salary, start) VALUES
	("Bill",1000000.00,"2018-01-03"),
	("Terisa",2000000.00,"2019-11-13"),
	("Charlie",3000000,"2020-05-21");

SELECT salary FROM employee_payroll WHERE name = "Bill";

ALTER TABLE employee_payroll ADD gender CHAR(1) AFTER name;

DESCRIBE employee_payroll;

UPDATE employee_payroll set gender = "M" WHERE name = "Bill" or name = "Charlie";
UPDATE employee_payroll set gender = "F" WHERE name = "Terisa";
Select * FROM employee_payroll;

SELECT SUM(salary) FROM employee_payroll WHERE gender  = 'M' GROUP BY gender;
SELECT AVG(salary) FROM employee_payroll WHERE gender  = 'M' GROUP BY gender;

SELECT gender, SUM(salary) FROM employee_payroll GROUP BY gender;
SELECT gender, AVG(salary) FROM employee_payroll GROUP BY gender;
SELECT gender, Count(name) FROM employee_payroll GROUP BY gender;
SELECT gender, MIN( salary ) FROM employee_payroll GROUP BY gender;
SELECT gender, MAX( salary ) FROM employee_payroll GROUP BY gender;

DELETE FROM employee_payroll where name='Bill';
Select * from employee_payroll;

DROP TABLE IF EXISTS employee_payroll;
SHOW TABLES;
DROP DATABASE IF EXISTS payroll;
SHOW DATABASES;
