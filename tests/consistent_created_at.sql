SELECT * FROM {{ ref('dim_listings_cleansed') }} dim_listings_cleansed
INNER JOIN {{ ref('fct_reviews') }} fct_reviews
ON dim_listings_cleansed.listing_id = fct_reviews.listing_id
WHERE fct_reviews.review_date <= dim_listings_cleansed.created_at
LIMIT 10