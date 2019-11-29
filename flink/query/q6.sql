SELECT
      cityId, (MAX(actionTime)-MIN(actionTime)) as len, DAYOFMONTH(TO_TIMESTAMP(FROM_UNIXTIME(actionTime/1000),'yyyy-MM-dd HH:mm:ss')) as dt, HOUR(TO_TIMESTAMP(FROM_UNIXTIME(actionTime/1000))) as h, COUNT(sessionId) num
FROM
      userVisit
GROUP BY
      cityId, DAYOFMONTH(TO_TIMESTAMP(FROM_UNIXTIME(actionTime/1000),'yyyy-MM-dd HH:mm:ss')) , HOUR(TO_TIMESTAMP(FROM_UNIXTIME(actionTime/1000))), TUMBLE(rowtime, INTERVAL '10' SECOND)
HAVING
      (MAX(actionTime)-MIN(actionTime)) > 100