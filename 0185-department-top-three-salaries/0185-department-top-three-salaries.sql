# Write your MySQL query statement below
WITH highest_earner AS (
    SELECT e.id,
           e.name AS Employee,
           d.name AS Department,
           e.salary AS Salary,
           DENSE_RANK() OVER (PARTITION BY departmentId ORDER BY salary DESC) AS rnk
    FROM Employee e
    JOIN Department d ON e.departmentId = d.id
)
SELECT Department, Employee, Salary
FROM highest_earner
WHERE rnk <= 3