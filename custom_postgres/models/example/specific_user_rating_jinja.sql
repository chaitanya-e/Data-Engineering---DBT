{% set user_rating = '4.5' %}

SELECT *
FROM {{ ref('film_ratings') }}
WHERE user_rating > '{{ user_rating }}'