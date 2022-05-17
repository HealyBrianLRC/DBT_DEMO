SELECT 
      date AS Q_date
    , RGDP AS RGDP
FROM {{source('Public','REALGDP_DUP')}}