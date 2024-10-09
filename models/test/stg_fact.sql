{{ config(materialized='table') }}

select *
from
{{source('chatbot_data','fact_table') }}
