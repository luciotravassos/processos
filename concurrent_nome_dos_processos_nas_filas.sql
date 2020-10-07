/* Identifica pelo nome do programa qual fila ele está */
SELECT distinct q.concurrent_queue_name, p.user_concurrent_program_name
  FROM apps.fnd_concurrent_requests r,
       apps.fnd_concurrent_programs_tl p,
       apps.fnd_concurrent_processes pr,
       apps.fnd_concurrent_queues q
 WHERE q.concurrent_queue_id = pr.concurrent_queue_id
   AND r.controlling_manager = pr.concurrent_process_id
   AND r.concurrent_program_id = p.concurrent_program_id
   --AND q.concurrent_queue_name like 'VISA%WIP%' --NOME DA FILA
   --AND p.user_concurrent_program_name = 'Gather Schema Statistics'--NOME DO PROGRAMA CONCORRENTE
   --AND p.user_concurrent_program_name like 'Us%'
   --AND p.language = 'PTB'

