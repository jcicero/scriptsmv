 SELECT rf.cd_reg_fat                                                           CD_REG_FAT
      , rf.sn_fechada                                                           SN_FECHADA
      , Nvl(rf.nr_guia,'0000000000000')                                         NR_AIH
      , To_Char(Add_Months(f.dt_competencia,1),'MM/YYYY')                       APRESENTACAO
      , rf.dt_emissao_laudo                                                     DATA_EMISSAO
      , es.cd_espec_sus || ' - ' ||es.ds_espec_sus                              ESPECIALIDADE
      , e.cd_orgao_emissor_aih                                                  ORGAO_EMISSOR
      , l.ds_enfermaria                                                         ENFERMARIA
      , l.ds_leito                                                              LEITO
      , a.cd_leito  a_leito
      , l.cd_leito   l_cd_leito
      , ps4.nr_cpf_cgc                                                          DOC_AUTORIZADOR
      , ps4.nr_cns                                                              CNS_AUTORIZADOR
      , ps1.nr_cpf_cgc                                                          CPF_MED_RESP
      , ps1.nr_cns                                                              CNS_MED_RESP
      , Decode(e.SN_AUDITOR_DIR_CLINICO, 'S', ps2.NR_CPF_CGC
                                            , ps4.nr_cpf_cgc)                   CPF_DIR_CLINICO
      , Decode(e.SN_AUDITOR_DIR_CLINICO, 'S', ps2.nr_cns
                                            , ps4.nr_cns)                       CNS_DIR_CLINICO
      , ps3.nr_cpf_cgc                                                          CPF_MED_SOLIC
      , ps3.nr_cns                                                              CNS_MED_SOLIC
      , e.nr_cnes || ' - ' || e.ds_multi_empresa                                NR_CNES
      , p.nm_paciente                                                           NM_PACIENTE
      , p.dt_nascimento                                                         DT_NASCIMENTO
      , Decode(p.tp_sexo, 'F', 'FEMININO'
                        , 'M', 'MASCULINO')                                     TP_SEXO
      , lpad(cd_cidadania_sus,3,0)                                              NACIONALIDADE
      , cd.ds_cidadania                                                         NACIONALIDADE_DESCRICAO
      , p.CD_PACIENTE                                                           CD_PACIENTE
      , p.CD_PACIENTE_EXTERNO                                                   CD_PACIENTE_EXTERNO
      , p.nr_cpf                                                                CPF_PACIENTE
      , p.nr_identidade                                                         RG_PACIENTE
      , p.nr_cns                                                                NR_CNS
      , p.nr_rg_nasc                                                            RGN_PACIENTE
      , Nvl(rs.nm_responsavel,p.nm_paciente)                                    RESPONSAVEL
      , p.nm_mae                                                                NM_MAE
      , p.ds_endereco || ' ' || p.nr_endereco                                   ENDERECO
      , p.nm_bairro                                                             NM_BAIRRO
      , decode(nvl(dbamv.pkg_mv2000.le_configuracao('FFIS','SN_VALIDA_TELEFONE_PACIENTE'),'N')
                   , 'S', dbamv.PKG_SUS_REGRA_PACIENTE.F_RETORNA_TELEFONE(p.CD_PACIENTE,'E')
                   , null)                                                      NR_FONE
      , Decode(p.Tp_Cor , 'B' , 'BRANCA'
                        , 'P' , 'PRETA'
                        , 'R' , 'PARDA'
                        , 'A' , 'AMARELA'
                        , 'I' , 'INDIGENA'
                              , 'SEM INFORMAÇÃO')                               TP_COR
      , c.cd_ibge || ' - ' || c.nm_cidade                                       CIDADE
      , c.cd_uf                                                                 UF
      , LPAD(p.nr_cep, 8, '0')                                                  CEP
      , rf.nr_aih_anterior                                                      NR_AIH_ANTERIOR
      , rf.nr_aih_posterior                                                     NR_AIH_POSTERIOR
      , pf.cd_procedimento                                                      CD_PROC_SOlIC
      , pf2.cd_procedimento                                                     CD_PROC_REALIZ
      , SUBSTR(pf.cd_procedimento,1,2) ||'.'||
        SUBSTR(pf.cd_procedimento,3,2) ||'.'||
        SUBSTR(pf.cd_procedimento,5,2) ||'.'||
        SUBSTR(pf.cd_procedimento,7,3) ||'-'||
        SUBSTR(pf.cd_procedimento,10,1)                                         PROCEDIMENTO_SOLIC_MASCARA
      , pf.ds_procedimento                                                      PROCEDIMENTO_SOLIC
      , SUBSTR(pf2.cd_procedimento,1,2) ||'.'||
        SUBSTR(pf2.cd_procedimento,3,2) ||'.'||
        SUBSTR(pf2.cd_procedimento,5,2) ||'.'||
        SUBSTR(pf2.cd_procedimento,7,3) ||'-'||
        SUBSTR(pf2.cd_procedimento,10,1)                                        PROCEDIMENTO_PRINCIPAL_MASCARA
      , pf2.ds_procedimento                                                     PROCEDIMENTO_PRINCIPAL
      , Decode( nvl(rf.cd_cid_principal,'X') , 'X', ''
                                                  , rf.cd_cid_principal
                                                    || ' - ' || cid.ds_cid )    DIAGNOSTICO_PRINC
      , Decode( nvl(rf.cd_cid_secundario,'X'), 'X', ''
                                                   , rf.cd_cid_secundario
                                                     || ' - ' || cid2.ds_cid )  DIAGNOSTICO_SECUNDARIO
      , Decode( A.CD_CID_OBITO, NULL, ''
                                    , A.CD_CID_OBITO ||' - '|| cid3.ds_cid )    DS_OBITO
      , Decode(nvl(rf.cd_carater_atendimento,0), 0, ''
                                                  , rf.cd_carater_atendimento)  CARATER_ATENDIMENTO
      , ca.ds_carater_atendimento                                               CARATER_ATENDIMENTO_DESCR
      , Decode(rf.tp_modalidade_atendimento, 'I', 'HOSPITALAR'
                                           , 'H', 'HOSPITAL DIA'
                                           , 'D', 'INTERNAÇÃO DOMICILAR')       MODALIDADE
      , rf.dt_inicio                                                            DATA_INTERNACAO
      , rf.dt_final                                                             DATA_SAIDA
      , Decode( nvl(rf.cd_mot_alt,0) , 0 , ''
                                         , rf.cd_mot_alt||' - '||ma.Ds_Motivo)  MOTIVO_ALTA
      , rf.cd_gestor_autorizou                                                  LIBERACAO_SISAIH
      , rf.nr_identificacao                                                     NR_IDENTIFICACAO
      , act.nr_cnpj_empregador                                                  NR_CNPJ_EMPREGADOR_ACID
      , act.cd_cbor ||' - '||cbor.ds_cbos                                       CD_CBOR_ACID
      , act.cd_cnaer||' - '||cnaer.ds_cnaer                                     CD_CNAER_ACID
      , Decode(act.tp_vinculo_prev, 1 , '1 - Autônomo'
                                  , 2 , '2 - Desempregado'
                                  , 3 , '3 - Aposentado'
                                  , 4 , '4 - Não Segurado'
                                  , 5 , '5 - Empregado'
                                  , 6 , '6 - Empregador'
                                      , ' - ')                                  TP_VINCULO_PREV_ACID
     , rf.nr_pre_natal                                                          NR_PRE_NATAL
     , ip.qt_rn_vivo                                                            QT_RN_VIVO
     , ip.qt_rn_morto                                                           QT_RN_MORTO
     , ip.qt_rn_alta                                                            QT_RN_ALTA
     , ip.qt_rn_transferido                                                     QT_RN_TRANSFERIDO
     , ip.qt_rn_obito                                                           QT_RN_OBITO
     , Decode(ET.CD_ETNIA, NULL, '0000 - Não Se Aplica'
                         , lPad(ET.CD_ETNIA,4,'0')||' - '||ET.DS_ETNIA)         DS_ETNIA
     , e.cd_multi_empresa                                                       CD_MULTI_EMPRESA
     , f.dt_competencia                                                         DT_COMPETENCIA_FATURA
     , rf.cd_remessa                                                            CD_REMESSA
  FROM dbamv.reg_fat                  rf
     , dbamv.procedimento_sus         pf
     , dbamv.procedimento_sus         pf2
     , dbamv.fatura                   f
     , dbamv.remessa_fatura           rm
     , dbamv.atendime                 a
     , dbamv.paciente                 p
     , dbamv.multi_empresas           e
     , dbamv.espec_sus                es
     , dbamv.cidadanias               cd
     , dbamv.responsa                 rs
     , dbamv.cidade                   c
     , dbamv.cid                      cid
     , dbamv.cid                      cid2
     , dbamv.cid                      cid3
     , dbamv.carater_atendimento      ca
     , dbamv.Motivo_Cobranca_SUS      ma
     , dbamv.leito                    l
     , dbamv.prestador                ps1
     , dbamv.prestador                ps2
     , dbamv.prestador                ps3
     , dbamv.prestador                ps4
     , dbamv.acidente_trabalho        act
     , dbamv.cnaer                    cnaer
     , dbamv.cbo                      cbor
     , dbamv.it_parto                 ip
     , dbamv.etnia                    et
 WHERE a.cd_atendimento              = rf.cd_atendimento
   and p.cd_etnia                    = et.cd_etnia(+)
   --and a.cd_leito                    = l.cd_leito
   and e.cd_prestador_dir_clinico    = ps2.cd_prestador
   and a.cd_prestador                = ps3.cd_prestador
   and a.cd_paciente                 = p.cd_paciente
   and a.cd_multi_empresa            = e.cd_multi_empresa
   and a.cd_atendimento              = rs.cd_atendimento         (+)
   and a.cd_cid_obito                = cid3.cd_cid               (+)
   and rf.cd_prestador_auditor       = ps4.cd_prestador       (+)
   and rf.cd_reg_fat                 = act.cd_reg_fat            (+)
   and act.cd_cnaer                  = cnaer.cd_cnaer            (+)
   and act.cd_cbor                   = c
   bor.cd_cbos              (+)
   and rf.cd_procedimento_realizado  = pf2.cd_procedimento
   and rf.cd_procedimento_solicitado = pf.cd_procedimento
   and rf.cd_reg_fat                 = ip.cd_reg_fat             (+)
   and NVL(rf.cd_prestador_responsavel, a.cd_prestador) = ps1.cd_prestador -- OP 21079
   and rf.cd_remessa                 = rm.cd_remessa             (+)
   and rm.cd_fatura                  = f.cd_fatura               (+)
   and p.cd_cidadania                = cd.cd_cidadania
   and rf.cd_espec_sus               = es.cd_espec_sus
   and p.cd_cidade                   = c.cd_cidade
   and rf.cd_cid_principal           = cid.cd_cid                (+)
   and rf.cd_cid_secundario          = cid2.cd_cid               (+)
   and rf.cd_carater_atendimento     = ca.cd_carater_atendimento (+)
   and rf.cd_mot_alt                 = ma.Cd_Motivo              (+)
   and e.CD_MULTI_EMPRESA            = 1
   and rf.cd_reg_fat                 = 23289

