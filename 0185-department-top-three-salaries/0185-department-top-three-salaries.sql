# Write your MySQL query statement below
WITH top_sal AS (
    SELECT d.id,
           e.name AS Employee,
           d.name AS Department,
           e.salary AS Salary,
           DENSE_RANK() OVER (PARTITION BY d.id ORDER BY e.salary DESC) AS rnk
    FROM Employee e 
    JOIN Department d ON d.id = e.departmentId
)
SELECT Department,
       Employee,
       Salary
FROM top_sal
WHERE rnk <= 3