SELECT *
  FROM v$transaction
 WHERE ses_addr = (SELECT saddr FROM v$session WHERE SID = 163)