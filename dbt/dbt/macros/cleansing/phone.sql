{% macro cleanse_phone(phone) %}
    {% set phone = "regexp_replace(" ~ phone ~ ", '[^0-9]', '', 'g')" %}
    {{
        return(
        "case
            when length(" ~ phone ~ ") = 9 and left(" ~ phone ~ ", 2) = '02'
                then substring(" ~ phone ~ " from 1 for 2) || '-' ||
                     substring(" ~ phone ~ " from 3 for 3) || '-' ||
                     substring(" ~ phone ~ " from 6 for 4)
            when length(" ~ phone ~ ") = 10 and left(" ~ phone ~ ", 3) in
                ('011','016','017','018','019','050','070','032','042','051','052','053','062','064','031','033','041','043','054','055','061','063')
                then substring(" ~ phone ~ " from 1 for 3) || '-' ||
                     substring(" ~ phone ~ " from 4 for 3) || '-' ||
                     substring(" ~ phone ~ " from 7 for 4)
            when length(" ~ phone ~ ") = 11
                then substring(" ~ phone ~ " from 1 for 3) || '-' ||
                     substring(" ~ phone ~ " from 4 for 4) || '-' ||
                     substring(" ~ phone ~ " from 8 for 4)
            else null
         end"
        )
    }}
{% endmacro %}
