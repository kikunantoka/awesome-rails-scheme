select cc.number_of_columns, count(1) as number_of_tables
from(
  select
    count(1) as number_of_columns
  from
    columns c
  group by
    c.table_id
) as cc
group by cc.number_of_columns
;
