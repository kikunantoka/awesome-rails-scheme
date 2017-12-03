select
  c.data_type,
  count(1) as number_of_columns
from
  columns c
group by
  c.data_type
order by number_of_columns desc
;
