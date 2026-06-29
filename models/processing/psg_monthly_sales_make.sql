{{
    config(
            materialized = 'incremental',
            incremental_strategy='merge',
            unique_key=['DDATE','SALESPERSON','CARMAKE'],
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
{% if is_incremental() %}
    --filtra sólo los eventos nuevos desde la última ejecución
    WHERE DDATE > ( SELECT MAX(DDATE) FROM {{ this }} )
{% endif %}
GROUP BY DATE_TRUNC('MONTH',DDATE), SALESPERSON, CARMAKE