# Write your MySQL query statement below
-- Name of user who has rated greatest number of movies
(SELECT u.name AS 'results'
FROM Users u
JOIN MovieRating m ON m.user_id = u.user_id
GROUP BY u.user_id
ORDER BY COUNT(m.movie_id) DESC, name ASC
LIMIT 1)

UNION ALL

(SELECT m.title AS 'results'
FROM Movies m
JOIN MovieRating mr ON m.movie_id = mr.movie_id
WHERE created_at BETWEEN '2020-02-01' AND '2020-02-29'
GROUP BY mr.movie_id
ORDER BY AVG(mr.rating) DESC, title ASC
LIMIT 1)

