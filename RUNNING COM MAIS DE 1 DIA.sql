/* Script informa o status do concurrent COM MAIS DE 1 DIA EM RUNNING*/
SELECT SUBSTR(a.request_id, 1, 20) request_id,
       SUBSTR(b.user_name, 1, 30) requestor,
       SUBSTR(a.completion_text, 1, 30) completion_text,
       a.phase_code "Phase Code",
       a.status_code,
       SUBSTR(a.program, 1, 40) program,
       a.USER_CONCURRENT_PROGRAM_NAME,
       a.ARGUMENT_TEXT,
       a.request_date,
       a.actual_completion_date,
       TRUNC((a.actual_completion_date - a.actual_start_date) * 60 * 24) tempo
  FROM apps.fnd_conc_req_summary_v a, apps.fnd_user b
 WHERE a.requested_by = b.user_id
   AND a.phase_code = 'R'
   AND a.status_code <> 'W'
   AND to_char(a.actual_start_date, 'DD/MM/YYYY') >
       (select to_char(sysdate, 'DD/MM/YYYY') from dual)
 ORDER BY a.request_id, a.request_date DESC