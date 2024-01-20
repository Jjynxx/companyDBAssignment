-- Sara McHattie
-- Assignment 2

-- Create company database
CREATE DATABASE company;
USE company;

-- Build each table
-- Employee table
CREATE TABLE employee
(
    fname   VARCHAR(50)   NOT NULL,
    minit   VARCHAR(1),
    lname   VARCHAR(50)   NOT NULL,
    ssn     INT  NOT NULL PRIMARY KEY,
    bdate   DATE,
    address VARCHAR(65),
    sex     VARCHAR(1),
    salary  DECIMAL(6, 2) NOT NULL,
    superssn INT NOT NULL ,
    dno     INT        NOT NULL,
    FOREIGN KEY(dno) REFERENCES department(dnumber)
);


-- Insert values into employee table
INSERT INTO employee VALUES("Jean", "P","Grey", 445224332, '1989-02-02', "223 Bonfield Rd","F", 2300.00, 656656656, 4);
INSERT INTO employee VALUES("Logan", "W","Howlett", 482838382, '1985-02-02', "2 Maple Ave","M", 2900.00, 656656656, 2);
INSERT INTO employee VALUES("Scott", "C","Summers", 321234344, '1987-06-12', "223 Bonfield Rd","M", 2300.00, 656656656, 1);
INSERT INTO employee VALUES("Hank", "B","MacCoy", 988767667, '1979-09-07', "43 Carol Dr","M", 3200.00, 656656656, 1);
INSERT INTO employee VALUES("Charles", "P","Xavier", 656656656, '1978-06-14', "1407 Graymalkn Lane","M", 3500.00, 656656656, 1);
INSERT INTO employee VALUES("Raven", "M","Darkholme", 776444665, '1980-10-30', "665 Queen St","F", 3800.00, 888777555, 7);
INSERT INTO employee VALUES("Eric", "M","Lancher", 888777555, '1977-01-15', "34-443 Blackwood Rd","M", 3700.00, 888777555, 7);
INSERT INTO employee VALUES("Bobby", "I","Drake", 576432445, '1999-02-14', "345 Wallace Rd","M", 2000.00, 656656656, 4);
INSERT INTO employee VALUES("Kitty", "S","Pride", 887544335, '2001-04-17', "22 Krombet Ave","M", 1980.00, 656656656, 4);
INSERT INTO employee VALUES("Kurt", "N","Wagner", 666555444, '1999-12-25', "98 Maple Blvd","M", 1950.00, 656656656, 4);

-- add foreign key btw manager and employee
ALTER TABLE employee
ADD FOREIGN KEY (superssn) REFERENCES employee(ssn);

-- Department table

CREATE TABLE department
(
    dname   VARCHAR(25) NOT NULL,
    dnumber INT PRIMARY KEY,
    mgrssn  INT NOT NULL,
    mgrstartdate    DATE
);


-- Insert values into department table
INSERT INTO department VALUE("X-Men command", 1, 656656656, '1998-02-23');
INSERT INTO department VALUE("X-Men IT", 2, 656656656, '1998-12-22');
INSERT INTO department VALUE("X-Men medical unit", 3, 445224332, '1999-07-24');
INSERT INTO department VALUE("X-Men stealth squad", 4, 445224332, '1998-02-23');
INSERT INTO department VALUE("X-Men garden", 5, 656656656, '1998-02-23');
INSERT INTO department VALUE("X-Men kitchen", 6, 656656656, '1998-02-23');
INSERT INTO department VALUE("X-Men villin counsel", 7, 888777555, '1998-02-23');
INSERT INTO department VALUE("X-Men recreatiion", 8, 656656656, '2005-02-23');
INSERT INTO department VALUE("X-Men event planning", 9, 656656656, '2001-02-23');
INSERT INTO department VALUE("X-Men project managment", 10, 656656656, '2003-02-23');

-- Assigning foreign keys
ALTER TABLE department
ADD FOREIGN KEY (mgrssn) REFERENCES employee(ssn);


-- Dept location table

CREATE TABLE dept_location
(
    dnumber INT PRIMARY KEY,
    dlocation   VARCHAR(50)
);

-- Insert values into dept_location table

INSERT INTO dept_location VALUE(1, "New York City");
INSERT INTO dept_location VALUE(2, "Long Island");
INSERT INTO dept_location VALUE (3, "New York City");
INSERT INTO dept_location VALUE(4, "Salem");
INSERT INTO dept_location VALUE(5, "Long Island");
INSERT INTO dept_location VALUE(6, "Salem");
INSERT INTO dept_location VALUE(7, "Las Vegas");
INSERT INTO dept_location VALUE(8, "New York City");
INSERT INTO dept_location VALUE(9, "Salem");
INSERT INTO dept_location VALUE(10, "Salem");

-- Assigning foreign keys

ALTER TABLE dept_location
ADD FOREIGN KEY (dnumber) REFERENCES department(dnumber);
-- Edit foreign key to delete location if department is deleted
ALTER TABLE dept_location
DROP CONSTRAINT dept_location_ibfk_1;
ALTER TABLE dept_location
ADD FOREIGN KEY (dnumber) REFERENCES department(dnumber)
    ON DELETE CASCADE;

-- Project table

CREATE TABLE project
(
    pname       VARCHAR(65),
    pnumber     INT PRIMARY KEY,
    plocation   VARCHAR(50),
    dnum        INT NOT NULL
);

-- Insert values into project table
INSERT INTO project VALUE ("Fire Starter Inquiry", 100, "New York City", 1);
INSERT INTO project VALUE ("Hope Diamond Heist", 101, "Las Vegas", 7);
INSERT INTO project VALUE ("Fall Garden Prep", 102, "Long Island", 5);
INSERT INTO project VALUE ("Anniversary Lunchen", 103, "Salem", 6);
INSERT INTO project VALUE ("Medical Supply Inventory", 104, "New York City", 3);
INSERT INTO project VALUE ("X-Men Marketing Strategies", 105, "Salem", 10);
INSERT INTO project VALUE ("X-Men Student Graduation", 106, "Salem", 9);
INSERT INTO project VALUE ("X-Men Full Database Restructure", 107, "Long Island", 2);
INSERT INTO project VALUE ("Diamond Heist Prevention", 108, "Salem", 4);
INSERT INTO project VALUE ("Theraputic recreation for X-Men", 109, "New York City", 8);

-- Assigning foreign keys

ALTER TABLE project
ADD FOREIGN KEY (dnum) REFERENCES department(dnumber);

-- works_on table
CREATE TABLE works_on
(
    essn    INT  NOT NULL  PRIMARY KEY,
    pno     INT     NOT NULL ,
    hours   INT
);


-- Insert values into works_on table
INSERT INTO works_on VALUE(482838382, 100, 74);
INSERT INTO works_on VALUE(321234344, 100, 57);
INSERT INTO works_on VALUE(988767667, 101, 175);
INSERT INTO works_on VALUE(656656656, 101, 189);
INSERT INTO works_on VALUE(445224332, 107, 164);
INSERT INTO works_on VALUE(776444665, 108, 124);
INSERT INTO works_on VALUE(888777555, 107, 235);
INSERT INTO works_on VALUE(576432445, 107, 165);
INSERT INTO works_on VALUE(887544335, 108, 210);
INSERT INTO works_on VALUE(666555444, 108, 168);

-- Assigning foreign keys

ALTER TABLE works_on
ADD FOREIGN KEY (essn) REFERENCES employee(ssn);

ALTER TABLE works_on
ADD FOREIGN KEY (pno) REFERENCES project(pnumber);


-- dependent table

CREATE TABLE dependent
(
    essn            INT   NOT NULL ,
    dependent_name  VARCHAR(50)     NOT NULL ,
    sex             VARCHAR(1),
    bdate           DATE,
    relationship    VARCHAR(10) NOT NULL
);


-- Insert values into dependent table
INSERT INTO dependent VALUE(445224332, "Teddy", "M", '2007-06-04', "child");
INSERT INTO dependent VALUE(482838382, "Savvy", "M", '2000-03-06', "spouse");
INSERT INTO dependent VALUE(321234344, "Sally", "F", '2010-03-06', "child");
INSERT INTO dependent VALUE(988767667, "Jonny", "M", '2000-05-30', "spouse");
INSERT INTO dependent VALUE(656656656, "Phoenix", "X", '2012-10-21', "child");
INSERT INTO dependent VALUE(776444665, "Raven", "M", '2019-12-20', "child");
INSERT INTO dependent VALUE(888777555, "Erik", "M", '1932-02-26', "elder");
INSERT INTO dependent VALUE(576432445, "Jason", "M", '2021-02-26', "child");
INSERT INTO dependent VALUE(887544335, "Lily", "F", '2014-05-04', "sister");
INSERT INTO dependent VALUE(666555444, "Sammy", "F", '2017-02-14', "sister");

-- Assigning foreign keys

ALTER TABLE dependent
ADD FOREIGN KEY (essn) REFERENCES employee(ssn);
ALTER TABLE dependent
DROP CONSTRAINT dependent_ibfk_1;
-- Dependants should be deleted if employee leaves organization
ALTER TABLE dependent
ADD FOREIGN KEY (essn) REFERENCES employee(ssn)
    ON DELETE CASCADE;

