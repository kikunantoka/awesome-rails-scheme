select
  t.name, count(1)
from
  table_words t
group by
  t.name
;
