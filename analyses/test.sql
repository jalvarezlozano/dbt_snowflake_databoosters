SELECT 
campaign_id,
    report_date
FROM {{ source('raw_bi_car', 'MARKETING_PIVOTED_PERFORMANCE') }}