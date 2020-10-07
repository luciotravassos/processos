/* Identifica o request id pelo SID */
SELECT distinct fcr.request_id,vs.SID,vs.serial#, fcp.oracle_process_id, fcp.session_id,
       fcp.concurrent_process_id, fcp.os_process_id,fcp.logfile_name,vs.last_call_et
  FROM v$session vs,
       apps.fnd_concurrent_processes fcp,
       apps.fnd_concurrent_requests fcr
 WHERE fcp.concurrent_process_id = fcr.controlling_manager
   AND vs.audsid = fcp.session_id
 --  AND vs.SID = 351
 --  AND VS.SERIAL# = 4839
--   and fcr.request_id= 2245641
 and fcp.os_process_id=1839264   
