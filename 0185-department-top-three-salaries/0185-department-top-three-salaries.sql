# Write your MySQL query statement below
WITH rank_sal AS (
    SELECT a.id,
           d.name AS Department,
           a.name AS Employee,
           departmentId,
           salary AS Salary,
           DENSE_RANK() OVER (PARTITION BY d.name ORDER BY a.salary DESC) AS rnk
    FROM Employee a 
    JOIN Department d ON a. departmentId = d.id
)
SELECT Department, Employee, Salary
FROM rank_sal
WHERE rnk <= 3