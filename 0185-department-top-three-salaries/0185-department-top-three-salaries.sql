# Write your MySQL query statement below
WITH high_earners AS (
    SELECT a.name AS Employee,
           a.salary AS Salary,
           d.name AS Department,
           DENSE_RANK() OVER (PARTITION BY d.name ORDER BY a.salary DESC) AS rnk
    FROM Employee a 
    JOIN Department d ON a.departmentId = d.id
)
SELECT Department, Employee, Salary
FROM high_earners
WHERE rnk <= 3