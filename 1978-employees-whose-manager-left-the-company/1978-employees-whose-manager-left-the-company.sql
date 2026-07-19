# Write your MySQL query statement below
WITH sa_sort AS (
    SELECT employee_id,
           name,
           manager_id,
           salary
    FROM Employees e
    WHERE salary < 30000 AND manager_id IS NOT null
    AND NOT EXISTS (
                   SELECT 1 
                   FROM Employees m
                   WHERE m.employee_id = e.manager_id
    )
    ORDER BY employee_id
)
SELECT employee_id
FROM sa_sort