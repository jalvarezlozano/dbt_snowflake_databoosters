- - Este test pasa si esta consulta devuelve cero filas
- - Selecciona culaquier registro de la tabla de hecho donde las metricas claves sean negativas

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