{% set channels_to_pivot = get_distinct_values_simplified (
    table_relation = source('raw_bi_car','MARKETING_PIVOTED_PERFORMANCE'),
    column_name = 'CHANNEL_NAME'
) %}
{% set metrics_to_privot = get_distinct_values_simplified(
    table_relation = source('raw_bi_car','MARKETING_PIVOTED_PERFORMANCE'),
    column_name = 'METRIC_NAME'
) %}

SELECT
    campaign_id,
    report_date,
    {% for channel in channels_to_pivot %}
        {% for metric in metrics_to_privot %}
            SUM (CASE WHEN CHANNEL_NAME= '{{ channel }}' AND METRIC_NAME = '{{ metric }}' THEN METRIC_VALUE ELSE 0 END) AS {{ channel.lower().replace(' ','_') }}_{{ metric.lower() }}
            {% if not loop.last %},{% endif %}
        {% endfor %}
        {% if not loop.last %},{% endif %}
    {% endfor %}
FROM {{ source('raw_bi_car', 'MARKETING_PIVOTED_PERFORMANCE') }}
GROUP BY
    campaign_id,
    report_date
ORDER BY
    campaign_id,
    report_date