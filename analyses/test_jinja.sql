SELECT 
    DDATE,
    SALESPERSON,
    CARMAKE,
    SALEPRICE,
    COMRATE
FROM {{ ref("stg_sales_sales_data_2020") }}
{% if target.name != 'prod_databoosters' %}
QUALIFY ROW_NUMBER() OVER (ORDER BY DDATE) <= 10
{% endif %}