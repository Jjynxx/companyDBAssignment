-- Optional question 1
-- Sara McHattie


-- Queries
-- Find employees who have children as dependants
SELECT fname, lname, dependent_name, d.bdate
FROM employee AS e
INNER JOIN dependent AS d
ON e.ssn = d.essn
WHERE relationship LIKE("child");


-- Hours worked on each project
SELECT pname, pnumber, SUM(hours) AS total_hours
FROM project AS p
INNER JOIN works_on AS w
ON p.pnumber = w.pno
GROUP BY pnumber;


-- Department names and their manager, if they have one
SELECT d.dname, CONCAT(e.fname, " ", e.minit, ". ", e.lname) AS manager_name
FROM department AS d
LEFT JOIN employee AS e
ON d.mgrssn = e.ssn
ORDER BY d.dnumber;
