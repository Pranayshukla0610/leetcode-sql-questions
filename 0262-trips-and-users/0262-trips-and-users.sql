# Write your MySQL query statement below
WITH data_sort AS (
    SELECT t.id,
           t.client_id,
           t.driver_id,
           t.status,
           u.users_id,
           t.request_at AS Day,
           u.banned
    FROM Trips t 
    JOIN Users u ON u.users_id = t.client_id
    JOIN Users c ON c.users_id = t.driver_id
    WHERE t.request_at BETWEEN '2013-10-01' AND '2013-10-03'
    AND u.banned = 'No' AND c.banned = 'No'
),
cancel_rate AS (
    SELECT
        Day, 
        ROUND(SUM(CASE WHEN status LIKE 'cancelled%' THEN 1 ELSE 0 END)
        /COUNT(*), 2) AS `Cancellation Rate`
    FROM data_sort
    GROUP BY Day
)
SELECT Day, `Cancellation Rate`
FROM cancel_rate