select a.sid,
       a.message,
       round(a.sofar / a.totalwork * 100, 2) pct_complete,
       round(a.elapsed_seconds / 60, 2) Min,
       round((b.LAST_CALL_ET) / 60 / 60, 2) "Last Call ET Horas",
       a.start_time,
       round(a.TIME_REMAINING / 60, 2) TIME_REMAINING
  from v$session_longops a, gv$session b
 where round(a.sofar / a.totalwork * 100, 2) <> '100'
   and a.sid = b.sid
   and (b.status IN ('ACTIVE', 'KILLED', 'INACTIVE') or
        b.lockwait is not null)