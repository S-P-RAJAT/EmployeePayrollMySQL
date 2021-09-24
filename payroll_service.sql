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


ALTER TABLE  employee_payroll ADD phone_number VARCHAR(200) AFTER name;
ALTER TABLE  employee_payroll ADD address VARCHAR(200) AFTER phone_number;
ALTER TABLE  employee_payroll ADD department VARCHAR(200) NOT NULL AFTER address;
ALTER TABLE  employee_payroll ALTER address SET default 'TBD';
describe  employee_payroll;
ALTER TABLE  employee_payroll RENAME COLUMN salary TO basic_pay;
ALTER TABLE  employee_payroll ADD deductions DOUBLE NOT NULL AFTER basic_pay;
ALTER TABLE  employee_payroll ADD taxable_pay DOUBLE NOT NULL AFTER deductions;
ALTER TABLE  employee_payroll ADD tax DOUBLE NOT NULL AFTER taxable_pay;
ALTER TABLE  employee_payroll ADD net_pay DOUBLE NOT NULL AFTER tax;
describe  employee_payroll;
select * from employee_payroll;
update  employee_payroll set department = 'Sales' where name = 'Terisa';
INSERT INTO   employee_payroll(name, department, gender, basic_pay, deductions, taxable_pay, tax, net_pay, start) VALUES ('Terisa', 'Marketing', 'F', 300000.00, 100000.00, 200000.00, 500000.00, 1500000.00, '2020-01-01');
select * from  employee_payroll;

CREATE TABLE company (  company_id INT PRIMARY KEY,   company_name VARCHAR(30) NOT NULL );
describe company;
CREATE TABLE employee  (  id  INT unsigned NOT NULL AUTO_INCREMENT PRIMARY KEY,  company_id INT REFERENCES company(company_id), employee_name VARCHAR(30), phone_number VARCHAR(20) NOT NULL,  address  VARCHAR(50) NOT NULL DEFAULT 'TBD',  gender  CHAR(1) NOT NULL  );
describe employee;
CREATE TABLE payroll
(
emp_id  INT REFERENCES employee(id),
basic_pay  DOUBLE NOT NULL,
deductions      DOUBLE NOT NULL,
taxable_pay     DOUBLE NOT NULL,
tax  DOUBLE NOT NULL,
net_pay  DOUBLE NOT NULL
);

describe payroll;
CREATE TABLE department
(
dept_id  INT PRIMARY KEY,
dept_name  VARCHAR(50) NOT NULL
);
describe department;
CREATE TABLE employee_department
(
emp_id  INT REFERENCES employee(id),
dept_id  INT REFERENCES department(dept_id)
);
describe employee_department;

INSERT INTO company VALUES    (1,'CompanyA'),    (2,'CompanyB'),    (3,'CompanyC');
select * from company;

INSERT INTO employee VALUES  (101, 1, 'Bill', '9876543210', 'California', 'M' ),  (102, 1, 'Terisa', '8876543211', 'San Francisco', 'F' ),  (103, 2, 'Charlie', '7876543212', 'New York', 'M' );
select * from employee;

INSERT INTO payroll VALUES    (101,50000,5000,45000,5000,40000),    (102,20000,2000,18000,3000,15000),    (103,60000,6000,54000,4000,50000);
select * from payroll;

INSERT INTO department VALUES  (201, 'Sales'),    (202, 'Marketing'),    (203, 'Logistics'),    (204, 'Management');
select * from department;

INSERT INTO employee_department VALUES  (101,203),    (102,201),    (102,202),    (103,204);
select * from employee_department;

SELECT gender,COUNT(id) FROM employee  GROUP BY gender;

SELECT net_pay FROM payroll WHERE emp_id =(    SELECT id FROM employee where gender = 'F'    );

SELECT SUM(p.net_pay) FROM employee e left join payroll p  on  p.emp_id = e.id  GROUP BY e.gender;
SELECT AVG(p.net_pay) FROM employee e left join payroll p  on  p.emp_id = e.id  GROUP BY e.gender;
SELECT MAX(p.net_pay) FROM employee e left join payroll p  on  p.emp_id = e.id  GROUP BY e.gender;
SELECT MIN(p.net_pay) FROM employee e left join payroll p  on  p.emp_id = e.id  GROUP BY e.gender;

DROP TABLE IF EXISTS employee_payroll;
SHOW TABLES;
DROP DATABASE IF EXISTS payroll;
SHOW DATABASES;
