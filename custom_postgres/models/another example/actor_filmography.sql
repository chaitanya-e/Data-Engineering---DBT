-- models/actor_filmography.sql

WITH actor_details AS (
    SELECT
        a.actor_id,
        a.actor_name,
        f.film_id,
        f.title,
        f.release_date,
        f.price,
        f.rating,
        f.user_rating
    FROM
        {{ref('actors')}} a
    JOIN
        {{ref('film_actors')}} fa ON fa.actor_id = a.actor_id
    JOIN
        {{ref('films')}} f ON f.film_id = fa.film_id
)

SELECT
    actor_id,
    actor_name,
    ARRAY_AGG(title) AS films,
    ARRAY_AGG(release_date) AS release_dates,
    ARRAY_AGG(price) AS prices,
    ARRAY_AGG(user_rating) AS user_ratings,
    AVG(user_rating) AS average_user_rating,
    AVG(price) AS average_film_price,
    COUNT(film_id) AS total_films
FROM
    actor_details
GROUP BY
    actor_id, actor_name
ORDER BY
    actor_name