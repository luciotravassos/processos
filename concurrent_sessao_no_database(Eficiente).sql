/* Com a mesma finalidade do ver concurrent, basta informar o request_id */
SELECT a.request_id,
       d.SID,
       d.serial#,
       d.osuser,
       d.process,
       c.spid,
       a.phase_code,
       a.status_code,
       round((d.LAST_CALL_ET) / 60 / 60, 2) "Last Call ET Horas"
  FROM apps.fnd_concurrent_requests  a,
       apps.fnd_concurrent_processes b,
       v$process                     c,
       v$session                     d
 WHERE a.controlling_manager = b.concurrent_process_id
   AND c.pid = b.oracle_process_id
   AND b.session_id = d.audsid
      /*opção variável ou fixo */
      --AND a.request_id = 8132409
      --fixo - Descomente a linha abaixo
   AND a.request_id in ('3527512', '3527518', '3527527', '3527530')
   AND a.phase_code = 'R'