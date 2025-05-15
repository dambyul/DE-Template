{% macro cleanse_address(addr) %}
    {{
        return(
        "case
            when length(trim(regexp_replace(regexp_replace(" ~ addr ~ ", E'\t', '', 'g'), E' ', '', 'g'))) < 2
                then null
            else trim(regexp_replace(regexp_replace(" ~ addr ~ ", E'\t', '', 'g'), E' ', '', 'g'))
         end"
        )
    }}
{% endmacro %}