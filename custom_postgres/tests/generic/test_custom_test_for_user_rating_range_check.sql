{% test custom_test_for_user_rating_range_check(model, column_name, max_rating, min_rating) %}

WITH User_Ratings AS (
    SELECT
        DISTINCT {{ column_name }} AS ratings
    FROM
        {{ model }}
)

SELECT
    *
FROM
    User_Ratings
WHERE
    ratings < {{ min_rating }} or
    ratings > {{ max_rating }}
    
{% endtest %}