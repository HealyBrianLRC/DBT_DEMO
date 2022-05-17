

WITH GDP_2020 AS (
     {{ dbt_utils.unpivot(ref('STATE_2020_GDP'), cast_to ='float', exclude = ['GEONAME', 'GEOFIPS']) }}
),

state_cd AS (
    SELECT    State
            , Alpha_code
    FROM  {{ref('state_cd')}}
)

SELECT    GEONAME AS STATENAME
        , b.Alpha_code
        , GEOFIPS
        , FIELD_NAME AS PERIOD
        , RIGHT(FIELD_NAME, 2) AS End_Q
        , VALUE AS PERCENT_CHANGE
FROM GDP_2020 a
LEFT JOIN state_cd b ON b.State=a.GEONAME

