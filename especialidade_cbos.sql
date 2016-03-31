select 
  e.cd_especialid
  ,e.ds_especialid
  ,c.cd_cbos
  ,c.ds_cbos  
from 
   especialid e
   ,cbos      c
where 
   e.cd_cbos = c.cd_cbos
order by
   e.ds_especialid
