SELECT  data,
         SUM(CASE WHEN HORA >= 00 AND HORA <= 08 THEN  total  ELSE 0 END) AS "00:00 as 08:59",
         SUM(CASE WHEN HORA > 08 AND HORA <= 12 THEN  total  ELSE 0 END)  AS "09:00 as 12:59",
         SUM(CASE WHEN HORA > 12 AND HORA <= 16 THEN  total  ELSE 0 END)  AS "13:00 as 16:59",
         SUM(CASE WHEN HORA > 16 AND HORA <= 20 THEN  total  ELSE 0 END)  AS "17:00 as 20:59",
         SUM(CASE WHEN HORA > 20 AND HORA <= 23 THEN  total  ELSE 0 END)  AS "21:00 as 23:59"
  FROM (
  SELECT TO_CHAR(ACTUAL_COMPLETION_DATE, 'DD/MM/YYYY') AS DATA,
                  TO_CHAR(ACTUAl_COMPLETION_DATE, 'HH24') HORA,
         COUNT(*) AS TOTAL
           FROM   APPS.FND_CONCURRENT_REQUESTS
          WHERE actual_completion_date >= ((SELECT SYSDATE FROM DUAL)-15)
          GROUP BY TO_CHAR(ACTUAL_COMPLETION_DATE, 'DD/MM/YYYY'),TO_CHAR(ACTUAl_COMPLETION_DATE, 'HH24'))
GROUP BY DATA;
