WITH raw_hosts AS (
    {# SELECT * FROM SAMPLE_DATABASE.SANDBOX.RAW_HOSTS #}
    SELECT * FROM {{ source('onboarding', 'hosts') }}
)
SELECT
    id AS host_id,
    name AS host_name,
    is_superhost,
    created_at,
    updated_at
FROM
    raw_hosts