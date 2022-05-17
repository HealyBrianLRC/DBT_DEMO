
    SELECT  Alpha_code AS State_code
        , End_Q
        , PERCENT_CHANGE
        FROM {{ref('State_GDP_cleaned')}}
    WHERE End_Q like '%Q%' AND STATENAME != 'United States'