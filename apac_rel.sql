select
  decode(laudo.nr_apac_autorizada,'','Apac ainda não digitada',laudo.nr_apac_autorizada) Apac_Autorizada,
  paciente.cd_paciente || ' - ' || paciente.nm_paciente              Paciente,
  to_char(apac.dt_inicial, 'dd/mm/yyyy') || 'a' || to_char(apac.dt_final, 'dd/mm/yyyy') validade,
  laudo.cd_procedimento                                              Codigo_Procedimento_Principal,
  substr(p.ds_procedimento,1,20)                                                  procedimento,
  laudo.qt_procedimento                                              qtd,
  psv.vl_servico_ambulatorial * laudo.qt_procedimento                valorAmb,
  to_char(laudo.dt_competencia,'MM/YYYY')                            Periodo_Competencia,
  apac.cd_apac                                                       apac, 
  laudo.cd_laudo                                                     Codigo_Laudo,
  laudo.dt_competencia                                               competencia,
  tip_ate_apac.cd_tip_ate                                            Codigo_Tipo_Atendimento,
  tip_ate_apac.ds_tip_ate                                            Tipo_de_Atendimento,
  to_char(laudo.dt_laudo,'DD/MM/YYYY')                               Data_do_Laudo,
  decode(laudo.tp_laudo,'N','NOVO','S','RENOVAÇÃO')                  Tipo_de_Laudo,
  prestador.cd_prestador || ' - ' || prestador.nm_prestador          Prestador,
  prestador.cd_prestador                                             Codigo_Prestador
from
  dbamv.laudo_sia_apac laudo,
  dbamv.paciente,
  dbamv.prestador,
  dbamv.tip_ate_apac,
  dbamv.procedimento_sus_valor psv,
  dbamv.procedimento_sus p,
  dbamv.apac
where
  laudo.cd_paciente = paciente.cd_paciente and
  laudo.cd_prestador = prestador.cd_prestador and
  laudo.cd_tip_ate   = tip_ate_apac.cd_tip_ate and
  laudo.cd_procedimento = psv.cd_procedimento and
  laudo.cd_procedimento = p.cd_procedimento and
  psv.dt_vigencia = (select max(s.dt_vigencia) from procedimento_sus_valor s) and --Selecionando a última vigência do procedimento
  laudo.nr_apac_autorizada = apac.nr_apac(+) and
  apac.cd_apac = (select max(a.cd_apac) from apac a where a.nr_apac = apac.nr_apac) --Selecionando apenas a ultima apac digitada
  --and paciente.cd_paciente = 658973 --Teste
  and (apac.dt_final between &dataInicial and &dataFinal or apac.dt_inicial between &dataInicial and &dataFinal) --Teste
  --and laudo.dt_competencia between &dataInicial and &dataFinal --Teste
  and laudo.cd_prestador = &#prestador#
order by laudo.cd_laudo;

select * from apac where apac.dt_inicial between '01/07/2013' and '30/07/2013' or apac.dt_final between '01/07/2013' and '30/07/2013'
