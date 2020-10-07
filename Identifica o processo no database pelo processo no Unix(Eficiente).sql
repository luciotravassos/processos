/* Script que identifica o processo no banco e no SO pelo PID DO UNIX*/
SELECT   SUBSTR (a.spid, 1, 10) "PID UNIX", SUBSTR (b.SID, 1, 5) SID,
         SUBSTR (b.serial#, 1, 5) ser#, SUBSTR (b.username, 1, 15) username,
         SUBSTR (TO_CHAR (b.logon_time, 'DD/MM/YYYY HH24:MI'),
                 1,
                 16
                ) data_hora,
         b.server, b.status, b.lockwait, SUBSTR (b.osuser, 1, 10) os_user,
         SUBSTR (b.machine, 1, 20) box, b.process "Processo", b.module,
         b.program program
    FROM v$session b, v$process a
   WHERE  a.spid = 17571
     AND ROWNUM = 1
     AND b.paddr = a.addr
   ORDER BY b.status, b.username

