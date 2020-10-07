/* Busca o concurrent pelo programa ou vice versa -em paralelo tem o cshort e o cprogram*/
SELECT DISTINCT fcpt.user_concurrent_program_name program,
                fcp.concurrent_program_name short_name,
                fa.application_name application
           FROM apps.fnd_application_tl fa,
                apps.fnd_concurrent_programs fcp,
                apps.fnd_concurrent_programs_tl fcpt
          WHERE fa.application_id = fcpt.application_id
            AND fcp.application_id = fcpt.application_id
            AND fcp.concurrent_program_id = fcpt.concurrent_program_id
            --BUSCA PELO PROGRAM SHORT NAME PARA ACHAR O NOME DO PROGRAMA QUE ESTÁ EM EXECUÇÃO
            --AND fcp.concurrent_program_name = 'CVRD_AR_ACOMP_FAT'
            --BUSCA PELO NOME DO PROGRAMA PARA ACHAR O SHORT NAME
            AND fcpt.user_concurrent_program_name like 'Bill Of Lading%'

