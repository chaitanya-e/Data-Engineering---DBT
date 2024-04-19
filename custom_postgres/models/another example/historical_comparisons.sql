-- models/historical_comparisons.sql

SELECT
    actor_id,
    actor_name,
    MIN(release_dates) AS career_start,
    MAX(release_dates) AS career_end,
    MAX(user_ratings) AS Max_user_rating,
    MIN(user_ratings) AS Min_user_rating,
    COUNT(*) AS total_films
FROM
    {{ ref('actor_filmography') }}
GROUP BY
    actor_id, actor_name