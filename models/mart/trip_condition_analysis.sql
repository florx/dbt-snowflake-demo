with r_weather as (
    select * from {{ ref('raw_weather') }}
),
r_trips as (
    select * from {{ ref('raw_trips') }}
),
renamed as (
    select weather as conditions,
        count(*) as num_trips
    from r_trips
        left outer join r_weather on date_trunc('hour', observation_time) = date_trunc('hour', starttime)
    where conditions is not null
    group by 1
    order by 2 desc
)

select * from renamed