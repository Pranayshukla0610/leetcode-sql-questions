# Write your MySQL query statement below
WITH entry_time AS (
    SELECT emp_id,
           event_day AS day,
           SUM(out_time - in_time) AS total_time
    FROM Employees
    GROUP BY emp_id, event_day
)
SELECT day,
       emp_id,
       total_time
FROM entry_time