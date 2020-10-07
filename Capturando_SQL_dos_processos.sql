/* Capturando o SQL de um processo */
select s.sid, s.serial#, l.sql_text
  from v$sqltext l, v$session s, v$process p
 where l.address = s.sql_address
   and p.addr = s.paddr
   and sid = &sid
 order by l.address, l.piece;