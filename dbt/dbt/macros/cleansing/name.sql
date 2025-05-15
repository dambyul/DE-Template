{% macro cleanse_name(name) %}
    {{
        return(
        "case
            when length(" ~ name ~ ") > 0 then
                regexp_replace(
                    regexp_replace(
                        regexp_replace(" ~ name ~ ", '\\\\s+', '', 'g'),
                        '\\\\([^)]*\\\\)', '', 'g'
                    ),
                    '[^a-zA-Z가-힣0-9()[] ]', '', 'g'
                )
            else '고객'
         end"
        )
    }}
{% endmacro %}