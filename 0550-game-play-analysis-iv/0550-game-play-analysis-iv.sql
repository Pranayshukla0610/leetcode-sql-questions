# Write your MySQL query statement below
WITH first_login AS (
    SELECT player_id,
           MIN(event_date) AS first_login_date
    FROM Activity
    GROUP BY player_id
),
cons_days AS (
    SELECT event_date,
           player_id,
           LEAD(event_date,1) OVER (PARTITION BY player_id ORDER BY event_date) AS next_login
    FROM Activity
)
SELECT ROUND(
    COUNT(*) * 1.0 /
    (SELECT COUNT(*) FROM first_login),2) AS fraction
FROM first_login a 
JOIN cons_days b ON a.player_id = b.player_id AND b.event_date = a.first_login_date
WHERE b.next_login = DATE_ADD(a.first_login_date, INTERVAL 1 DAY)

