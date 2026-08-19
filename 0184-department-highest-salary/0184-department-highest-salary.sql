# Write your MySQL query statement below
WITH highest_sal AS (
    SELECT a.id,
           a.name AS Employee,
           b.name AS Department,
           a.departmentId,
           a.salary AS Salary,
           RANK() OVER (PARTITION BY departmentId ORDER BY salary DESC) AS rn
    FROM Employee a 
    JOIN Department b ON a.departmentId = b.id
)
SELECT Department, Employee, Salary
FROM highest_sal
WHERE rn = 1