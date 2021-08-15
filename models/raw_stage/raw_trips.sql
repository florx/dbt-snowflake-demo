{{ config(materialized='table') }}

select * from {{ source('citibike','trips')}}