SELECT
        *
FROM
    (SELECT
            *, ROW_NUMBER() OVER (PARTITION BY w.t ORDER BY w.num DESC) as rownum
     FROM
            (SELECT
                    strategy, site, pos_id, TUMBLE_START(rowtime, INTERVAL '10' SECOND), TUMBLE_END(rowtime, INTERVAL '10' SECOND) t, SUM(cost) num
             FROM
                    imp
             GROUP BY
                    strategy, site, pos_id, TUMBLE(rowtime, INTERVAL '10' SECOND)
            ) w
    ) v
WHERE
    v.rownum <= 10