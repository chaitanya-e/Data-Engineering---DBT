-- models/career_trajectory.sql

SELECT
    actor_id,
    actor_name,
    ARRAY_AGG(films ORDER BY release_dates) AS film_titles,
    ARRAY_AGG(release_dates ORDER BY release_dates) AS film_release_dates,
    ARRAY_AGG(user_ratings ORDER BY release_dates) AS film_ratings
FROM
    {{ ref('actor_filmography') }}
GROUP BY
    actor_id, actor_name
