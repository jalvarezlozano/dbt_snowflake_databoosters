{{
    config(
            materialized = 'table',
            tags=['processing','sales','carmake']
    )
}}

SELECT 
    SALESPERSON,
    
    CARMAKE,
    SUM(SALEPRICE -COMEARNED) AS TOTALSALE,
    SUM(COMEARNED) AS TOTALCOM ,
    DATE_TRUNC('MONTH',DDATE) AS DDATE
FROM {{ ref("stg_sales_sales_data_2020") }}
GROUP BY DATE_TRUNC('MONTH',DDATE), SALESPERSON, CARMAKE