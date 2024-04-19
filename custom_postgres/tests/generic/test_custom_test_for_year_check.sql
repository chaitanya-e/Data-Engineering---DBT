{%  test custom_test_for_year_check(model, column_name, max_year)    %}

WITH release_years AS (
SELECT 
    EXTRACT(YEAR FROM {{ column_name }}) as release_year
FROM
    {{ model }}
)

SELECT * FROM release_years
WHERE release_year > {{  max_year  }}

{%  endtest  %}