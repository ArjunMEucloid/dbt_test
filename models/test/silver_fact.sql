/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/

{{ config(materialized='table') }}


SELECT ROW_NUMBER() OVER (ORDER BY ft.payment_key, coustomer_key, ft.time_key, item_key, store_key) AS fact_id,pk.trans_type, pk.bank_name, tm.date, ft.*
FROM {{ref('stg_fact')}} ft
LEFT JOIN {{ref('stg_trans')}} pk
ON ft.payment_key = pk.payment_key
LEFT JOIN {{ref('stg_time')}} tm
ON ft.time_key = tm.time_key