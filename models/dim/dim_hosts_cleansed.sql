{{ config(materialized = 'view') }}
WITH src_hosts AS (
    {# refは参照 -> src/src_hosts(モデル)を参照する #}
    SELECT * FROM {{ ref('src_hosts') }}
)
SELECT
    host_id,
    NVL(host_name, 'Anonymous') AS host_name,
    is_superhost,
    created_at,
    updated_at
FROM
  src_hosts