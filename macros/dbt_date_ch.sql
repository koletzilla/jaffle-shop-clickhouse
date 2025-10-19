{% macro clickhouse__convert_timezone(column, target_tz, source_tz) -%}
    toTimeZone(
        toDateTime({{ column }}, '{{ source_tz }}'),
        '{{ target_tz }}'
    )
{%- endmacro -%}
