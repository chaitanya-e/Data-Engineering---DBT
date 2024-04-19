/*This is a test to check if the particular column does not have any row <= 4.5*/
SELECT *
FROM {{ ref('film_ratings') }}
WHERE user_rating <= 4.5