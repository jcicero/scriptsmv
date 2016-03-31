select
  decode(same.cd_cad_same, '1', same.nr_matricula_same, '')  MATRICULA_SAME,
  it_agenda_central.cd_paciente              CODIGO_PACIENTE,
  paciente.nr_cns                            cartao_sus,
  prestador.nm_prestador                     NM_PRESTADOR,
  --count(tip_mar.ds_tip_mar) qtd
  tip_mar.ds_tip_mar                         TIPO_SERVICO,
  paciente.nm_paciente                       NOME_PACIENTE,
  to_char(agenda_central.dt_agenda, 'DD/MM/YYYY')                   DT_AGENDA_CENTRAL,
  agenda_central.dt_agenda                   DATA_AGENDA,
  tip_mar.cd_tip_mar                         CODIGO_TIPO_MARCACAO,
  agenda_central.cd_prestador                CODIGO_PRESTADOR

from
       it_agenda_central, agenda_central,
       paciente, same,
       tip_mar, prestador,
       ser_dis, agenda_central_item_agenda acit
where
  it_agenda_central.cd_agenda_central           = agenda_central.cd_agenda_central and
  it_agenda_central.cd_tip_mar                  = tip_mar.cd_tip_mar(+) and
  it_agenda_central.cd_paciente                 = paciente.cd_paciente  and
  it_agenda_central.cd_ser_dis                  = ser_dis.cd_ser_dis(+)    and
  it_agenda_central.cd_paciente                 = same.cd_paciente(+) and
  agenda_central.cd_prestador                   = prestador.cd_prestador(+) and
  agenda_central.cd_agenda_central              = acit.cd_agenda_central(+) and

  nvl(same.cd_cad_same, 0) = decode((select count(sa.nr_matricula_same) from same sa where sa.cd_paciente = paciente.cd_paciente),
                                 '2', '2',
                                 '1', (select sa.cd_cad_same from same sa where sa.cd_paciente = paciente.cd_paciente),
                                 '0', (select 0 from dual))
  and it_agenda_central.cd_it_agenda_pai is null
  and it_agenda_central.cd_paciente is not null
  and agenda_central.dt_agenda >= '01/01/2013'
  and agenda_central.dt_agenda <= '31/12/2013'
  and tip_mar.cd_tip_mar in (2,15,16)--2,15,16/1,14,20
  --and prestador.cd_prestador = 812
  and prestador.cd_prestador = 867
  and ser_dis.cd_ser_dis in (22,62)
 /* group by decode(same.cd_cad_same, '1', same.nr_matricula_same, '')  MATRICULA_SAME,
  it_agenda_central.cd_paciente              CODIGO_PACIENTE,
  paciente.nr_cns                            cartao_sus,

  tip_mar.ds_tip_mar                         TIPO_SERVICO,
  paciente.nm_paciente                       NOME_PACIENTE,
  prestador.nm_prestador
  to_char(agenda_central.dt_agenda, 'DD/MM/YYYY')                   DT_AGENDA_CENTRAL,
  agenda_central.dt_agenda                   DATA_AGENDA,
  tip_mar.cd_tip_mar                         CODIGO_TIPO_MARCACAO,
  agenda_central.cd_prestador                CODIGO_PRESTADOR,
  
  order by 2 desc*/
