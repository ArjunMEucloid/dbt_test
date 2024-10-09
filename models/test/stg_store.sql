{{ config(materialized='table') }}

select *
from
{{source('chatbot_data','dim_store') }}
