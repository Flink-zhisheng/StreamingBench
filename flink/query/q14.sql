SELECT
    *
FROM
    (SELECT
            *, ROW_NUMBER() OVER (PARTITION BY h ORDER BY v.totolLength DESC) as rownum
     FROM
         (SELECT
                cityId, h, sum(len) totolLength
          FROM
                (SELECT
                        sessionId, cityId, HOUR(TO_TIMESTAMP(FROM_UNIXTIME(actionTime/1000))) h, MAX(actionTime)-MIN(actionTime) as len
                 FROM
                        userVisit
                 GROUP BY
                        sessionId, cityId, HOUR(TO_TIMESTAMP(FROM_UNIXTIME(actionTime/1000)))
                 HAVING
                        (MAX(actionTime)-MIN(actionTime)) > 1000
                ) w
          GROUP BY
                w.cityId, w.h
         ) v
    ) x
WHERE
    x.rownum <= 5