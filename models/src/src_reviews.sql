WITH raw_reviews AS (
    {# SELECT * FROM SAMPLE_DATABASE.SANDBOX.RAW_REVIEWS #}
    SELECT * FROM {{ source('onboarding', 'reviews') }}
)
SELECT
    listing_id,
    date AS review_date,
    reviewer_name,
    comments AS review_text,
    sentiment AS review_sentiment
FROM
    raw_reviews