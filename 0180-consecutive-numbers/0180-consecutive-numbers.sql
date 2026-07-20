# Write your MySQL query statement below
WITH cons_nums AS (
    SELECT id,
           num,
           LEAD(num,1) OVER (ORDER BY id) AS ld1,
           LEAD(num,2) OVER (ORDER BY id) AS ld2
    FROM Logs
)
SELECT DISTINCT num AS ConsecutiveNums
FROM cons_nums
WHERE num = ld1 AND num = ld2



