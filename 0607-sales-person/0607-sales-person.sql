# Write your MySQL query statement below
WITH red_colour AS (
    SELECT sales_id
    FROM Orders a 
    JOIN Company b ON a.com_id = b.com_id
    WHERE b.name = 'RED'
)
SELECT name
FROM SalesPerson s 
WHERE s.sales_id NOT IN (
    SELECT sales_id
    FROM red_colour
)
