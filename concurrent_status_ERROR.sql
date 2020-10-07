/* Script informa o status do concurrent */
SELECT   SUBSTR (a.request_id, 1, 20) request_id,
         SUBSTR (b.user_name, 1, 30) requestor,
         SUBSTR (a.completion_text, 1, 30) completion_text,
         a.phase_code "Phase Code", a.status_code,
         SUBSTR (a.program, 1, 40) program, a.priority, a.request_date,
         a.actual_completion_date,a.USER_CONCURRENT_PROGRAM_NAME, a.ARGUMENT_TEXT,
         TRUNC ((a.actual_completion_date - a.actual_start_date) * 60 * 24
               ) tempo
    FROM apps.fnd_conc_req_summary_v a, apps.fnd_user b
   WHERE a.requested_by = b.user_id
     AND a.status_code = 'E'
     and a.phase_code = 'C'
     --    AND to_char(a.actual_completion_date, 'DD/MM/YYYY') = '24/08/2005'
     --AND a.actual_completion_date < ((SELECT SYSDATE FROM DUAL)-1)
     AND to_char(a.actual_completion_date, 'DD/MM/YYYY') = '19/12/2006'
ORDER BY a.request_id DESC


