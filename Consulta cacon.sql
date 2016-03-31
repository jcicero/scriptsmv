select 
pa.cd_paciente                  Código_Prontuario, 
pa.nm_paciente                  Nome_paciente,
a.cd_procedimento               Codigo_procedimento,
pr.ds_procedimento              Procedimento,
a.cd_laudo                      Código_laudo,
a.dt_inicio_trat_solicitado     Data_Inicio,
tp.ds_tip_ate                   Tratamento

from 
dbamv.paciente           pa,
dbamv.laudo_sia_apac     a,
dbamv.procedimento_sus   pr,
dbamv.tip_ate            tp

where 
a.cd_tip_ate       in (28, 29)          and 
pa.cd_paciente      = a.cd_paciente     and
pr.cd_procedimento  = a.cd_procedimento and
tp.cd_tip_ate       = a.cd_tip_ate

order by pa.nm_paciente


