SELECT
       a.dt, a.h, a.m, SUM(a.len) total
FROM
       (SELECT
                sessionId, MAX(actionTime)-MIN(actionTime) as len, DAYOFMONTH(TO_TIMESTAMP(FROM_UNIXTIME(actionTime/1000),'yyyy-MM-dd HH:mm:ss'))  as dt,HOUR(TO_TIMESTAMP(FROM_UNIXTIME(actionTime/1000))) as h, MINUTE(TO_TIMESTAMP(FROM_UNIXTIME(actionTime/1000))) m
        FROM
                userVisit
        GROUP BY
                sessionId, DAYOFMONTH(TO_TIMESTAMP(FROM_UNIXTIME(actionTime/1000),'yyyy-MM-dd HH:mm:ss')), HOUR(TO_TIMESTAMP(FROM_UNIXTIME(actionTime/1000))), MINUTE(TO_TIMESTAMP(FROM_UNIXTIME(actionTime/1000)))) a
WHERE
       a.len < 100
GROUP BY
       a.dt, a.h, a.m