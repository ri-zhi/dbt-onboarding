WITH raw_listings AS (
    {# SELECT * FROM SAMPLE_DATABASE.SANDBOX.RAW_LISTINGS #}
    SELECT * FROM {{ source('onboarding', 'listings') }}
)
SELECT
    id AS listing_id,
    name AS listing_name,
    listing_url,
    room_type,
    minimum_nights,
    host_id,
    price AS price_str,
    created_at,
    updated_at
FROM
    raw_listings