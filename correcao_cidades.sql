declare

v_count number;

begin

for c in (select p.cd_paciente,c.cd_cidade 
from 
temp_paciente_mv tp,
paciente p,
cidade c
where p.cd_paciente = tp.cd_paciente_sisa
 and tp.ds_cidade_end = c.nm_cidade
 and p.cd_paciente < 700000
 and tp.ds_cidade_end = 'PALMEIRA DOS INDIOS'
 and c.cd_uf = 'AL'
 and p.cd_cidade is null) loop
 
 
 update paciente pp set pp.cd_cidade = c.cd_cidade where pp.cd_paciente = c.cd_paciente;
 
 v_count := v_count+1;
 
 if mod(v_count,200) = 0 then
   
   commit;
   
   
 end if;
 
 end loop;
 
 commit;
 
 end;
 
 
