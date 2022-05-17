SELECT 
      date AS Q_date
    , CPI AS CPI
FROM {{source('Public','CPI')}}