--PACIENTES COM TIPO DE RESULTADO INFORMADOS

select --atendime.cd_atendimento        Cod_Atendimento
      --,atendime.cd_paciente           Cod_paciente
      paciente.nm_paciente           Nome_Paciente
      ,TO_CHAR(PACIENTE.DT_NASCIMENTO, 'DD/MM/YYYY')         Dt_nascimento
      ,TRUNC(((SYSDATE) - NVL(PACIENTE.DT_NASCIMENTO,SYSDATE)) / 365.25)  IDADE_PACIENTE
      --,DECODE(paciente.tp_sexo,'M','MASCULINO','F','FEMININO') SEXO_PACIENTE
      --,to_char(atendime.dt_atendimento,'DD/MM/YYYY')         Dt_atendimento
      --,atendime.dt_atendimento        Data_de_Pesquisa
      ,To_CHAR(atendime.hr_atendimento, 'dd/mm/yyyy hh24:mi:ss')          Hr_atendimento
      --,atendime.cd_prestador          Cod_pretador
      ,prestador.nm_prestador         Nome_prestador
      --,PRESTADOR.cd_conselho          Cod_conselho
      --,conselho.ds_conselho           Ds_conselho
      --,conselho.cd_uf                 Cd_UF
      --,paciente.nr_identidade         Nr_identidade
      --,paciente.nr_cpf                Nr_cpf
      --,paciente.nm_pai                Nome_pai
      --,paciente.nm_mae                Nome_mae
      --,paciente.nm_conjuge            Nome_conjuge
      ,paciente.ds_endereco           Endereco
      ,paciente.nr_cep                Cep
      ,paciente.nm_bairro             Bairro
      ,paciente.ds_complemento        Complemento
      ,paciente.nr_endereco           Nr_endereco
      ,paciente.cd_tipo_logradouro    Logradouro
      --,paciente.nr_fone                Nr_telefone
      --,paciente.nr_celular            Nr_celular
      --,atendime.nm_usuario            Nome_Usuario
      --,ori_ate.ds_ori_ate
      ,dbamv.tip_res.ds_tip_res      Motivo_Resultado
      ,cidade.nm_cidade              Cidade
      ,paciente.nr_cns               CNS
      --, decode(paciente.nr_fone, null, decode(paciente.nr_celular, null, 'NÃO INFORMADO', paciente.nr_celular),
      --decode(paciente.nr_celular, null, paciente.nr_fone, paciente.nr_fone || ' / ' || paciente.nr_celular)) Fones

 from  dbamv.atendime
      ,dbamv.paciente
      ,dbamv.prestador
      ,dbamv.conselho
      ,dbamv.ori_ate
      ,dbamv.tip_res
      ,dbamv.cidade

WHERE atendime.cd_paciente=paciente.cd_paciente(+) and
      atendime.cd_prestador=prestador.cd_prestador(+) AND
      prestador.cd_conselho=conselho.cd_conselho(+)   and
      atendime.cd_ori_ate  = ori_ate.cd_ori_ate(+)    and
      atendime.cd_tip_res  = tip_res.cd_tip_res(+)    and
      cidade.cd_cidade = paciente.cd_cidade
      and atendime.tp_atendimento = 'U'

     /* and not exists (select '1' from dbamv.atendime b
                              where b.cd_paciente =  paciente.cd_paciente
                              --and b.cd_atendimento = atendime.cd_atendimento
                              and b.tp_atendimento = 'I'
                              and trunc(b.dt_atendimento) >= '01/01/2014'
                              and trunc(b.dt_atendimento) <= '15/03/2014'

                                 )*/
      and trunc(atendime.dt_atendimento) >= '01/08/2014'
      and trunc(atendime.dt_atendimento) <= '31/08/2014'
      and paciente.tp_sexo not in ('M')
      and tip_res.cd_tip_res is not null
