select
  a.cd_paciente,
  a.nr_apac,
  c.cd_paciente
  
 from 
   apac a,
  -- paciente p,
   contato_paciente c
where 
   a.cd_fat_sia=48
   and a.cd_paciente = c.cd_paciente;
   
--select * from contato_paciente
