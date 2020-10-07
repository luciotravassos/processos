SELECT   vs.inst_id "Node", vs.SID "SID", vs.serial# "Serial#", 
          fcr.request_id "Request", fcp.user_concurrent_program_name "Program", 
          TO_CHAR (fcr.actual_start_date, 'DD-MON-YYYY HH24:MI:SS') "Started"
  FROM gv$session vs, 
          apps.fnd_concurrent_requests fcr,
          apps.fnd_concurrent_programs_tl fcp
  WHERE vs.audsid = fcr.oracle_session_id 
      AND fcr.phase_code = 'R' 
      AND fcr.program_application_id = fcp.application_id 
      AND fcr.concurrent_program_id = fcp.concurrent_program_id 
      AND fcp.LANGUAGE = 'PTB' 
  /*    AND FCR.REQUEST_ID = 3527512*/
ORDER BY 6 
