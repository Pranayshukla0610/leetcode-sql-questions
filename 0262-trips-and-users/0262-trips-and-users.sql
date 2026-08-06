# Write your MySQL query statement below
WITH date_sort AS (
    SELECT id,
           t.client_id,
           t.driver_id,
           t.city_id,
           t.status,
           t.request_at AS Day
    FROM Trips t 
    JOIN Users u ON u.users_id = t.driver_id
    JOIN Users d ON d.users_id = t.client_id
    WHERE request_at BETWEEN '2013-10-01' AND '2013-10-03'
    AND u.banned = 'No' AND d.banned = 'No'
)
SELECT Day,
       ROUND(SUM(
        CASE WHEN status <> 'completed' THEN 1 ELSE 0 END
       )/COUNT(*),2) AS 'Cancellation Rate'
FROM date_sort
GROUP BY Day
ORDER BY Day