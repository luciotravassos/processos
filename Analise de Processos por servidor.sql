/* Faz um relatorio detalhado dos processos concorrentes dentro de uma fila especifica */
SELECT   SUBSTR (user_concurrent_queue_name, 1, 30) "CONCURRENT",
         SUBSTR (target_node, 1, 12) "SERVIDOR", 
                  a.phase_code "Phase Code", a.status_code,sleep_seconds,A.actual_start_date,A.program_short_name,A.program,A.request_id
    FROM apps.fnd_concurrent_queues_vl b, apps.fnd_conc_req_summary_v a
   WHERE enabled_flag = 'Y'
     --AND user_concurrent_queue_name = 'VISA OM Geral'--like upper('%VISA OM%')
     AND A.PHASE_CODE <> 'C'
     AND a.status_code <> 'C'
     --AND target_node = 'ALBAPP0111'
     --AND A.actual_completion_date > ((SELECT SYSDATE FROM DUAL)-5)
ORDER BY DECODE (application_id, 0, DECODE (concurrent_queue_id, 1, 1, 4, 2)),
         SIGN (max_processes) DESC,
         concurrent_queue_name,
         application_id,
         a.actual_start_date

