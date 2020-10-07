/* Script informa o status do concurrent pela Request ID */
SELECT SUBSTR(a.request_id, 1, 20) request_id,
       SUBSTR(b.user_name, 1, 30) requestor,
       SUBSTR(a.completion_text, 1, 30) completion_text,
       a.ARGUMENT_TEXT,
       a.phase_code "Phase Code",
       a.status_code,
       SUBSTR(a.program, 1, 40) program,
       a.priority,
       a.request_date,
       a.actual_completion_date, --c.printer_name, c.description,
       TRUNC((a.actual_completion_date - a.actual_start_date) * 60 * 24) tempo,
       CASE
         WHEN a.status_code = 'A' THEN
          'Waiting'
         WHEN a.status_code = 'B' THEN
          'Resuming'
         WHEN a.status_code = 'C' THEN
          'Normal'
         WHEN a.status_code = 'D' THEN
          'Cancelled'
         WHEN a.status_code = 'E' THEN
          'Error'
         WHEN a.status_code = 'F' THEN
          'Scheduled'
         WHEN a.status_code = 'G' THEN
          'Warning'
         WHEN a.status_code = 'H' THEN
          'On Hold'
         WHEN a.status_code = 'I' THEN
          'Normal'
         WHEN a.status_code = 'M' THEN
          'No Manager'
         WHEN a.status_code = 'Q' THEN
          'Standby'
         WHEN a.status_code = 'R' THEN
          'Normal'
         WHEN a.status_code = 'S' THEN
          'Suspended'
         WHEN a.status_code = 'T' THEN
          'Terminating'
         WHEN a.status_code = 'W' THEN
          'Paused'
         WHEN a.status_code = 'X' THEN
          'Terminated'
         WHEN a.status_code = 'U' THEN
          'Disabled'
         WHEN a.status_code = 'Z' THEN
          'Waiting'
       END status_cod
  FROM apps.fnd_conc_req_summary_v a, apps.fnd_user b --, fnd_printer_vl c
 WHERE a.requested_by = b.user_id
   AND a.request_id = '4369340'
--AND a.actual_completion_date > ((SELECT SYSDATE FROM DUAL)-5)
-- and rownum =1
 ORDER BY a.request_id DESC