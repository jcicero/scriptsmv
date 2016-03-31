select * from atendime_sessao a where a.cd_atendimento is not null;

select 
  distinct(a.cd_paciente)        registro,
  pac.nm_paciente      paciente,
  TO_CHAR (s.dt_agendamento, 'mm/yyyy')     mes
from 
  atendime a,
  paciente pac,
  atendime_sessao s
where 
  a.cd_paciente = pac.cd_paciente and
  a.cd_atendimento = s.cd_atendimento_pai and
  s.cd_atendimento is not null and
  TO_CHAR (s.dt_agendamento, 'mm/yyyy') = '10/2013'
order by  pac.nm_paciente;
