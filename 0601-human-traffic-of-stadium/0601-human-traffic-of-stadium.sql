# Write your MySQL query statement below
WITH cte AS (
    SELECT
        id,
        visit_date,
        people,
        LAG(id, 1) OVER (ORDER BY id) AS prev_id,
        LAG(id, 2) OVER (ORDER BY id) AS prev_id2,
        LEAD(id, 1) OVER (ORDER BY id) AS next_id,
        LEAD(id, 2) OVER (ORDER BY id) AS next_id2,
        LAG(people, 1) OVER (ORDER BY id) AS prev_people,
        LAG(people, 2) OVER (ORDER BY id) AS prev_people2,
        LEAD(people, 1) OVER (ORDER BY id) AS next_people,
        LEAD(people, 2) OVER (ORDER BY id) AS next_people2
    FROM Stadium
)

SELECT
    id,
    visit_date,
    people
FROM cte
WHERE people >= 100
AND (
       -- Current row is the FIRST row of a group
       (
           next_id = id + 1
           AND next_id2 = id + 2
           AND next_people >= 100
           AND next_people2 >= 100
       )

       OR

       -- Current row is the MIDDLE row of a group
       (
           prev_id = id - 1
           AND next_id = id + 1
           AND prev_people >= 100
           AND next_people >= 100
       )

       OR

       -- Current row is the LAST row of a group
       (
           prev_id = id - 1
           AND prev_id2 = id - 2
           AND prev_people >= 100
           AND prev_people2 >= 100
       )

       OR

       -- Current row is part of a group of 4+,
       -- where it has qualifying rows on both sides
       (
           prev_id = id - 1
           AND next_id = id + 1
           AND prev_people >= 100
           AND next_people >= 100
       )
)
ORDER BY visit_date;