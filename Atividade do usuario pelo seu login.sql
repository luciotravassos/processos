SELECT d.user_name "User Name",
       b.SID SID,
       b.serial# "Serial#",
       c.spid "srvPID",
       a.spid "ClPID",
       TO_CHAR(start_time, 'DD-MON-YY HH:MM:SS') "STime"
  FROM apps.fnd_logins a, v$session b, v$process c, apps.fnd_user d
 WHERE b.paddr = c.addr
   AND a.pid = c.pid
   AND a.spid = b.process
   AND d.user_id = a.user_id
   AND (d.user_name = 'USER_NAME' OR 1 = 1)
      --   AND a.spid = &spid
      --and b.sid=&sid
   and d.user_name like '%25381225%'