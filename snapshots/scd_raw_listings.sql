{% snapshot scd_raw_listings %}
{{
config(
       target_schema='SANDBOX',
       unique_key='id',
       strategy='timestamp',
       updated_at='updated_at',
       invalidate_hard_deletes=True
) }}

select * FROM {{ source('onboarding', 'listings') }}


{% endsnapshot %}