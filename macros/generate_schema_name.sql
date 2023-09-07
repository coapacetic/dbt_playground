{% macro generate_schema_name(custom_schema_name, node) -%}

    {% set my_pref_schema = 'my_pr_schema' %}
    {%- set default_schema = target.schema -%}
    {%- if target.name == 'prod' and custom_schema_name is not none -%}

        {{ custom_schema_name | trim }}

    {%- elif target.name == 'ci' -%}

        {{ my_pref_schema }}

    {%- else -%}

        {{ default_schema }}
        
    {%- endif -%}

{%- endmacro %}




