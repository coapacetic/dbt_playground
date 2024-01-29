{% macro generate_schema_name(custom_schema, node) %}

    {%- set default_schema = target.schema -%}
    {%- if target.name == 'default' and custom_schema_name is not none -%}

        {{ custom_schema_name | trim }}

    {%- else -%}

        {{ default_schema }}

    {%- endif -%}

{% endmacro %}