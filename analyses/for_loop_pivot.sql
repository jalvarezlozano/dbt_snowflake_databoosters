{% set  target_makes = ['Nissan', 'Honda', 'Chevrolet','Ford', 'Toyota'] %}

SELECT 
DDATE,
SALESPERSON,
{% for make in target_makes %}
SUM( CASE WHEN CARMAKE = '{{ make }}' THEN TOTALSALE ELSE 0 END) AS SALES_{{ make | lower }} {% if not loop.last %},{% endif %}
{% endfor %}
FROM {{ ref("psg_monthly_sales_make") }}
GROUP BY DDATE, SALESPERSON