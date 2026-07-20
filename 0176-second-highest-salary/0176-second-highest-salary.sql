# Write your MySQL query statement below
WITH rank_sal AS (
    SELECT id,
           salary,
           DENSE_RANK() OVER (ORDER BY salary DESC) AS rnk
    FROM Employee
)
SELECT MAX(salary) AS SecondHighestSalary
FROM rank_sal
WHERE rnk = 2 