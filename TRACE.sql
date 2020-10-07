/* Script que pelo Request_id identifica o trace file */
SELECT 'Request id: '||request_id ,
'Trace id: '||oracle_Process_id,
'Trace Flag: '||req.enable_trace,
'Trace Name: '||dest.value||'/'||lower(dbnm.value)||'_ora_'||oracle_process_id|
|'.trc',
--'Prog. Name: '||prog.user_concurrent_program_name,
'File Name: '||execname.execution_file_name|| execname.subroutine_name ,
'Status : '||decode(phase_code,'R','Running') ||'-'||decode(status_code,'R','Normal'),
'SID Serial: '||ses.sid||','|| ses.serial#, 'Module : '||ses.module
from
apps.fnd_concurrent_requests req,
v$session ses,
v$process proc,
v$parameter dest,
v$parameter dbnm,
apps.fnd_concurrent_programs_vl prog,
apps.fnd_executables execname where req.request_id = '3038030'
and req.oracle_process_id=proc.spid(+)
and proc.addr = ses.paddr(+)
and dest.name='user_dump_dest'
and dbnm.name='db_name'
and req.concurrent_program_id = prog.concurrent_program_id
and req.program_application_id = prog.application_id
and prog.application_id = execname.application_id
and prog.executable_id=execname.executable_id
