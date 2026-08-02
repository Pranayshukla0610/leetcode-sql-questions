# Write your MySQL query statement below
WITH dept_count AS (
    SELECT employee_id,
           department_id,
           primary_flag,
           COUNT(*) OVER (PARTITION BY employee_id) AS cnt
    FROM Employee
)
SELECT employee_id,
       department_id
FROM dept_count
WHERE primary_flag = 'Y' OR cnt = 1
       