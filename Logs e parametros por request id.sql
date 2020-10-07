/* Buscar os arquivos out dos relatórios */
SELECT * --logfile_name, logfile_node_name, outfile_name, outfile_node_name
  FROM apps.fnd_concurrent_requests
 -- podemos buscar o arquivo pela request id ou pelo próprio out
 --WHERE REQUEST_ID = 'xxxxx'
 --WHERE outfile_name like '%&p1%'
WHERE --outfile_name like '%5706125%'
       request_id = '2103221 '

