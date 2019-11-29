SELECT
       a.device_id, a.strategy, a.site, a.pos_id, b.var1, count(*)
FROM
       (SELECT device_id, session_id, strategy, site, pos_id FROM click) a
JOIN
       (SELECT device_id, session_id, dau_time as var1 FROM dau) b
ON
       a.session_id = b.session_id
GROUP BY
       a.device_id, a.strategy, a.site, a.pos_id, b.var1