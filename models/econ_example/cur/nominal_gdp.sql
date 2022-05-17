WITH CPI AS (
        SELECT  Q_date
              , CPI
        FROM {{ref('CPI')}}
),

GDP AS ( 
        SELECT  Q_date
              , RGDP
        FROM {{ref('REALGDP')}}
),


final AS (
        SELECT   a.Q_date 
                , Concat('Q',quarter(a.Q_date)) as Quarter_period
               , a.RGDP
               , b.CPI
               , a.RGDP*(b.CPI/100) AS Nominal_GDP
        FROM GDP a

        JOIN CPI b ON a.Q_DATE=b.Q_DATE
)

SELECT * FROM final