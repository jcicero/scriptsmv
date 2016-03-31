/*
begin
   pkg_mv2000.Atribui_Empresa(1);
end; 
*/
     SELECT  st.nm_setor
           -- it.cd_setor_produziu
           -- ,it.cd_setor
             ,psus.cd_procedimento procd
             ,psus.ds_procedimento
             --,val.cd_reg_fat
             --,rf.cd_atendimento
             , sum(nvl(it.qt_lancamento,0))   qt_lancamento
             --, 'GRUPO: '||initcap(grp.ds_grupo_procedimento) descricao
             , sum(nvl(val.vl_linha,0))       vl_total
            -- , sum(nvl(val.vl_sh_proprio,0))  vl_sh_proprio
            -- , sum(nvl(val.vl_sh_terceiro,0)) vl_sh_terceiro
            -- , sum(nvl(val.vl_sp_direto_proprio,0))
            -- + sum(nvl(val.vl_sp_rateio_proprio,0)) vl_sp_proprio
            -- , sum(nvl(val.vl_sp_direto_terceiro,0))
            -- + sum(nvl(val.vl_sp_rateio_terceiro,0))  vl_sp_terceiro
            -- , sum(nvl(val.vl_sp_direto_proprio,0))  vl_sp_dp
            -- , sum(nvl(val.vl_sp_direto_terceiro,0)) vl_sp_dt
            --, sum(nvl(val.vl_sp_rateio_proprio,0))  vl_sp_rp
            -- , sum(nvl(val.vl_sp_rateio_terceiro,0)) vl_sp_rt
            -- , sum(round(trunc(rf.dt_final)-trunc(rf.dt_inicio))) qt_dias_internacao
             --, decode(dvig.sn_aih_principal,'S','PRI',decode(dvig.sn_aih_especial,'S','ESP','SEC')) tp_instrumento
             --, val.cd_remessa
             --, re.tp_complexidade_procedimento tp_complexidade
             --, rf.cd_espec_sus
             --, it.cd_setor_produziu
             --, rf.cd_reg_fat
             --, it.cd_lancamento
             --, decode(substr(rf.cd_mot_alt,1,1),'2','SOMA_1',decode(substr(rf.cd_mot_alt,1,1),'3','SOMA_1',decode(substr(rf.cd_mot_alt,1,1),'4','SOMA_1','NORMAL'))) regra_motivo
             --, decode(it.cd_procedimento,dbamv.pkg_ffis_regra_conta_aih.f_proc_realizado_principal(rf.cd_reg_fat),'CONSIDERA_DIAS','N_CONSIDERA_DIAS') soma_dias
          FROM dbamv.v_ffis_valor_conta_aih val
             , dbamv.procedimento_sus psus
             , dbamv.grupo_procedimentos grp
             , dbamv.procedimento_detalhe_vigencia dvig
             , dbamv.reg_fat rf
             , dbamv.itreg_fat it
             , dbamv.remessa_fatura re
             , dbamv.setor st
          WHERE val.cd_procedimento       = psus.cd_procedimento
            and st.cd_setor = it.cd_setor_produziu
            AND grp.cd_grupo_procedimento = psus.cd_grupo_procedimento
            AND dvig.cd_procedimento      = psus.cd_procedimento
            AND rf.cd_reg_fat             = it.cd_reg_fat
            AND it.cd_reg_fat             = val.cd_reg_fat
            AND it.cd_lancamento          = val.cd_lancamento
            AND re.cd_remessa             = rf.cd_remessa
            AND rf.cd_multi_empresa       = dbamv.pkg_mv2000.le_empresa
            --AND TO_CHAR(val.DT_COMPETENCIA,'MM/YYYY') = '03/2014'
            AND trunc(val.dt_lancamento) >= '01/03/2014'
            and trunc(val.dt_lancamento) <= '31/03/2014'
            --and it.cd_setor_produziu = '81'
            --and val.cd_procedimento = '0407010173'
            --and it.cd_reg_fat = 20729
            and rf.cd_reg_fat not in (select gs.cd_reg_fat from dbamv.glosas_sus gs)
            AND dbamv.pkg_ffis_valida_lancamento_aih.fnc_retorna_cmpt_detalhe(it.cd_reg_fat, it.dt_lancamento)
                BETWEEN dvig.dt_validade_inicial
                    AND nvl(dvig.dt_validade_final, dbamv.pkg_ffis_valida_lancamento_aih.fnc_retorna_cmpt_detalhe(it.cd_reg_fat, it.dt_lancamento))
          GROUP BY st.nm_setor
                 --it.cd_setor_produziu
                 --,it.cd_setor 
                 ,psus.cd_procedimento 
                 --, grp.ds_grupo_procedimento
                 ,psus.ds_procedimento
                 --,val.cd_reg_fat           
                 --,rf.cd_atendimento
                 --, decode(dvig.sn_aih_principal,'S','PRI',decode(dvig.sn_aih_especial,'S','ESP','SEC'))
                 --, val.cd_remessa
                 --, re.tp_complexidade_procedimento
                 --, rf.cd_espec_sus
                 --, it.cd_setor_produziu
                 --, rf.cd_reg_fat
                 --, it.cd_lancamento
                 --, decode(substr(rf.cd_mot_alt,1,1),'2','SOMA_1',decode(substr(rf.cd_mot_alt,1,1),'3','SOMA_1',decode(substr(rf.cd_mot_alt,1,1),'4','SOMA_1','NORMAL')))
                 --, decode(it.cd_procedimento,dbamv.pkg_ffis_regra_conta_aih.f_proc_realizado_principal(rf.cd_reg_fat),'CONSIDERA_DIAS','N_CONSIDERA_DIAS')
          order by 1
