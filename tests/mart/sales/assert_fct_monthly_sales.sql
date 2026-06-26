SELECT
    DDATE,
    ID_SALESPERSON,
    ID_CARMAKE,
    TOTALSALE,
    TOTALCOM
FROM
    {{ ref("fct_monthly_sales") }}
WHERE
    TOTALSALE < 0 OR TOTALCOM < 0  