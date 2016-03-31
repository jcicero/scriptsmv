select trunc((months_between(sysdate, '05/10/2013'/*to_char(p.nasc_pess,'dd/mm/yyyy')*/))/12) from dual ;

Select Round((Trunc(Sysdate) - To_Date('01/01/2013','dd/mm/yyyy'))/7,0) Semanas,
       mod(Trunc(Sysdate) - To_Date('01/01/2013','dd/mm/yyyy'),7) dias
from dual
