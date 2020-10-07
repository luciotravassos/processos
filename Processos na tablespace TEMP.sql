select u.session_num,
       s.last_call_et,
       s.status,
       s.username,
       s.machine,
       s.sid,
       s.serial#,
       u.inst_id,
       u.SESSION_ADDR,
       sum(u.EXTENTS)
  from gv$sort_usage u, gv$session s
 where s.saddr = u.session_addr
   and s.inst_id = u.inst_id
 group by u.SESSION_ADDR,
          u.inst_id,
          s.sid,
          s.status,
          s.username,
          s.machine,
          s.last_call_et,
          s.serial#,
          u.session_num
 order by 3;