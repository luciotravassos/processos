select trunc(start_time), login_type, count(*)
  from fnd_logins
 where start_time between to_date('01/12/05', 'DD/MM/YY') and
       to_date('01/01/06', 'DD/MM/YY')
 group by trunc(start_time), login_type