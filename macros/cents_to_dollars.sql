{# A basic example for a project-wide macro to cast a column uniformly #}

{% macro cents_to_dollars(column_name) -%}
    {{ return(adapter.dispatch('cents_to_dollars')(column_name)) }}
{%- endmacro %}

{% macro default__cents_to_dollars(column_name) -%}
    ({{ column_name }} / 100)::numeric(16, 2)
{%- endmacro %}

{% macro postgres__cents_to_dollars(column_name) -%}
    ({{ column_name }}::numeric(16, 2) / 100)
{%- endmacro %}

{% macro bigquery__cents_to_dollars(column_name) %}
    round(cast(({{ column_name }} / 100) as numeric), 2)
{% endmacro %}

{% macro fabric__cents_to_dollars(column_name) %}
    cast({{ column_name }} / 100 as numeric(16,2))
{% endmacro %}

{% macro clickhouse__cents_to_dollars(column_name) %}
    toDecimal64(
        concat(
            toString(intDiv({{ column_name }}, 100)), 
            '.', 
            leftPad(toString({{ column_name }} % 100), 2, '0')
        ), 
        2
    )
{% endmacro %}
