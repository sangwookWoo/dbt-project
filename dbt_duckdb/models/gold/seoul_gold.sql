with source_data as (
    select
        자치구명,
        avg(추정연소득) as 평균연소득
    from {{ ref('seoul_silver') }}
    group by 자치구명
    order by 평균연소득 desc
)
select *
from source_data