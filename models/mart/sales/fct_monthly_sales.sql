{{ config(tags=['dash_sales_bi']) }}

SELECT 
    DIMSP.ID_SALESPERSON,
    DIMCM.ID_CARMAKE,
    PSGM.TOTALSALE,
    PSGM.TOTALCOM,
    DATE_TRUNC('MONTH', PSGM.DDATE) AS DDATE
FROM {{ ref("psg_monthly_sales_make") }} AS PSGM
LEFT JOIN {{ ref("dim_carmake") }} AS DIMCM 
    ON PSGM.CARMAKE = DIMCM.CARMAKE
LEFT JOIN {{ ref("dim_salesperson") }} AS DIMSP 
    ON PSGM.SALESPERSON = DIMSP.SALESPERSON