{{config(materialized= 'table')}}

SELECT    GEOFIPS
        , GEONAME 
        , YOY
        , Q1_Q2
        , Q2_Q3
        , Q3_Q4

FROM {{source('Public', 'STATE_2020_GDP')}}