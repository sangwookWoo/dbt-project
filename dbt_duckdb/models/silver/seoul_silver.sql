with source_data as (
    select
        자치구명,
        datepart('year', today()) - 생년월일 as 나이,
        직업군,
        세대주여부,
        CAST(추정연소득 AS FLOAT) as 추정연소득,
        순자산평가금액,
        nullif(평균_통화량, 'NA') as 평균_통화량
    from {{ source('bronze', 'seoul_bronze') }}
    where 추정연소득 != 'NA'
)
select *
from source_data