{% macro get_distinct_values_simplified(table_relation, column_name) %}
    {% set query_text %}
        SELECT DISTINCT {{ adapter.quote(column_name)}} FROM {{ table_relation }} ORDER BY 1
    {% endset %}

    {% set results = run_query(query_text) %}

    {% if execute %}
        {# convierte la columna de resultados en una lista de python #}
        {% set distinct_values = results.columns[0].values() %}
    {% else %}
        {# durante el parseo, no hay resultados reales, devuelve una lista vacia #}
        {% set distinct_values = [] %}
    {% endif %}
    {{return (distinct_values) }}
{% endmacro %}