select
       commodity, count(userId) num, TUMBLE_START(rowtime, INTERVAL '10' SECOND),TUMBLE_END(rowtime, INTERVAL '10' SECOND)
from
       shopping
group by
       TUMBLE(rowtime, INTERVAL '10' SECOND), commodity