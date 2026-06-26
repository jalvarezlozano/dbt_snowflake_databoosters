{{ config(tags=['dash_sales_bi'] ) }}

SELECT 
    CARMAKE,
    {{ generate_id('CARMAKE') }} AS ID_CARMAKE
FROM {{ ref("psg_monthly_sales_make") }}
GROUP BY CARMAKE