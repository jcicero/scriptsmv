SELECT        
              UNID_INT.DS_UNID_INT
              --,procedimento_sus.ds_procedimento
              --,cid.cd_cid
              --,cid.ds_cid
              ,cidade.nm_cidade
              ,count(PACIENTE.Cd_Paciente)qtd
        --      ,paciente.cd_cidade
      --        ATENDIME.CD_ATENDIMENTO
      --        ,ATENDIME.CD_PACIENTE
      --        ,PACIENTE.NM_PACIENTE
      --        ,ATENDIME.DT_ATENDIMENTO
      --        ,ATENDIME.DT_ALTA
       --       ,CONVENIO.NM_CONVENIO
      --        ,PRESTADOR.NM_PRESTADOR
       --       ,PACIENTE.NR_IDENTIDADE
       --       ,PACK_INTERNAMENTO.RETORNA_IDADE( PACIENTE.DT_NASCIMENTO, SYSDATE)  NR_IDADE
       --       ,TIPO_INTERNACAO.DS_TIPO_INTERNACAO
       --       ,leito.ds_resumo
        --      , NVL(ATENDIME.DT_ALTA, TRUNC(SYSDATE)) - TRUNC(ATENDIME.DT_ATENDIMENTO) QTD_DIAS_INT
        --      , atendime.cd_procedimento
              
               
    FROM   DBAMV.ATENDIME
                ,DBAMV.PACIENTE
                ,DBAMV.PRESTADOR
                ,DBAMV.CONVENIO
                ,DBAMV.TIPO_INTERNACAO
                ,DBAMV.MOV_INT
                ,DBAMV.LEITO
                ,DBAMV.UNID_INT
                ,dbamv.procedimento_sus
                ,dbamv.cid
                ,dbamv.cidade 
        WHERE   ATENDIME.TP_ATENDIMENTO IN ( 'I', 'H' )
        AND      TRUNC(MOV_INT.DT_MOV_INT)  BETWEEN  '01/05/2014'  AND  '05/09/2014'
        and     cidade.cd_cidade = paciente.cd_cidade
        and     unid_int.cd_unid_int in (6)
        and     cid.cd_cid = atendime.cd_cid
        AND         ATENDIME.CD_PACIENTE  =  PACIENTE.CD_PACIENTE
        AND         ATENDIME.CD_PRESTADOR  =  PRESTADOR.CD_PRESTADOR
        AND         ATENDIME.CD_CONVENIO  =  CONVENIO.CD_CONVENIO
        AND         TIPO_INTERNACAO.CD_TIPO_INTERNACAO = ATENDIME.CD_TIPO_INTERNACAO
        AND         ATENDIME.CD_ATENDIMENTO = MOV_INT.CD_ATENDIMENTO
        AND         MOV_INT.TP_MOV = 'I'
        AND         MOV_INT.CD_LEITO  =  LEITO.CD_LEITO--(+)
        AND         LEITO.CD_UNID_INT  =  UNID_INT.CD_UNID_INT(+)
        and   procedimento_sus.cd_procedimento = atendime.cd_procedimento
         AND  ATENDIME.CD_MULTI_EMPRESA = 1
       /* $P!{CF_COND_UNID}
        $P!{COND_CONVENIO}
        $P!{COND_PRESTADOR}
        $P!{CF_MULTI_EMPRESA}
        $P!{CF_ATEND_FILHO}*/
    group by UNID_INT.DS_UNID_INT
              --,procedimento_sus.ds_procedimento
              --,cid.cd_cid
              --,cid.ds_cid
              ,cidade.nm_cidade
    ORDER BY  3 desc
