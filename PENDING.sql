/* Script informa o status do concurrent e os seus argumentos e pode ser
filtrado por programa e por status, bem como por user */
SELECT   SUBSTR (a.request_id, 1, 20) request_id,
         SUBSTR (b.user_name, 1, 30) requestor,
         SUBSTR (a.completion_text, 1, 30) completion_text,
         a.phase_code "Phase Code", a.status_code,
         SUBSTR (a.program, 1, 40) program,a.USER_CONCURRENT_PROGRAM_NAME, a.ARGUMENT_TEXT, a.request_date,
         a.actual_completion_date,a.printer,--c.logfile_name,c.outfile_name,
         TRUNC ((a.actual_completion_date - a.actual_start_date) * 60 * 24
               ) tempo
    FROM apps.fnd_conc_req_summary_v a, apps.fnd_user b--, fnd_concurrent_requests c
   WHERE a.requested_by = b.user_id
     AND a.phase_code = 'P'
     --AND a.status_code ='F'
    and a.program = 'Relatório de Pick Ticket (VISA)'
   -- AND to_char(a.actual_completion_date, 'DD/MM/YYYY') = '11/09/2005'
ORDER BY a.request_id DESC


