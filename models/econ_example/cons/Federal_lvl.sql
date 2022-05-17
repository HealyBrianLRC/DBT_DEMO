WITH PER_CHANGE AS (
    SELECT  STATENAME AS Country
        , End_Q
        , PERCENT_CHANGE
        FROM {{ref('State_GDP_cleaned')}}
    WHERE End_Q like '%Q%' AND Country = 'United States'),

GDP_VALUES as (
    SELECT    Q_date 
            , Quarter_period
            , RGDP
            , CPI
            , Nominal_GDP
    FROM {{ref('nominal_gdp')}}
    WHERE YEAR(Q_date) = '2020'
)

SELECT    b.Country
        , Q_date
        , Quarter_period
        , RGDP
        , CPI
        , Nominal_GDP
        , b.PERCENT_CHANGE
FROM GDP_VALUES a 

JOIN PER_CHANGE b on a.Quarter_period = b.End_Q


