select
  c.table_id,
  count(1) as number_of_columns
from
  columns c
group by
  c.table_id
order by number_of_columns desc
;
