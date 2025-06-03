{# ファイルレベルのマテリアライゼーションの設定 #}
{# on_schema_change='fail'->スキーマが変更された場合は、dbtモデルの実行を失敗させる #}
{{ config(
    materialized = 'incremental',
    on_schema_change='fail'
    )
}}
WITH src_reviews AS (
  SELECT * FROM {{ ref('src_reviews') }}
)
SELECT
  {# 書き換え #}
  {{ dbt_utils.generate_surrogate_key(['listing_id', 'review_date', 'reviewer_name', 'review_text']) }} AS review_id,
  *
FROM src_reviews
WHERE review_text is not null
{# is_incrementalはモデルがインクリメンタルモデルで実行されているか判別するためのもの #}
{% if is_incremental() %}
 {# thisはfct_reviewsモデル(このファイル自身)を指す  #}
  AND review_date > (select max(review_date) from {{ this }})
{% endif %}