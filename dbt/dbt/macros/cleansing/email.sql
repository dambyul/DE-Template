{% macro cleanse_email(email) %}
    {% set cleaned = email | lower | replace(" ", "") %}
    {{ cleaned | replace("(", "") | replace(")", "") }}

    {{ return(
        "regexp_replace(
            lower(regexp_replace(" ~email~ ", '[^a-zA-Z0-9._@-]', '', 'g')),
            E'\\\\.+', '.', 'g'
        )"
    ) }}
{% endmacro %}