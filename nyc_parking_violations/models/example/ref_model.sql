select
  count(1) qty
from
  {{ref('first_model')}}