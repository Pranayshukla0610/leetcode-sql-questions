# Write your MySQL query statement below
WITH sortlist_data AS (
    SELECT user_id,
           time_stamp
    FROM Logins
    WHERE EXTRACT(YEAR FROM time_stamp) = 2020
)
SELECT user_id, MAX(time_stamp) AS last_stamp
FROM sortlist_data
GROUP BY user_id