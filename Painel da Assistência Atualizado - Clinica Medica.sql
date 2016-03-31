select ('<font size="2" color="blue">'||lt.ds_resumo||'</font>') leito   
       --,null codpaciente
       ,null atendimento
       ,null nomedopaciente
       --,null medico
       ,null internadoa
       ,null ALER
       ,null CIRUR
       ,null PREMED
       ,null EVOMED
       ,null PREENF
       ,null EVOENF
       ,null REGENF
       ,null ISOLAM     
       ,(case when
               lt.tp_ocupacao = 'C'  then
                  '<img src="/portal/bi/img/dash/ico_leitoinfectado.gif" border=0>'
              when
      /*        lt.tp_ocupacao = 'M'  then  
                  '<img src="/portal/bi/img/dash/ico_manutencao.gif" border=0>'
               when*/
              lt.tp_ocupacao = 'V'  then
                  '<img src="/portal/bi/img/dash/ico_leitovago.gif" border=0>'
            /*    when               
              lt.tp_ocupacao = 'L'  then     
                  '<img src="/portal/bi/img/dash/ico_limpeza.gif" border=0>'
                when
              lt.tp_ocupacao = 'R'  then
                  '<img src="/portal/bi/img/dash/ico_reserva.gif" border=0>' 
                when
              lt.tp_ocupacao = 'A'  then
                  '<img src="/portal/bi/img/dash/ico_acompanhante.gif" border=0>' */                     
          end
         )status         
from dbamv.leito lt
where lt.tp_situacao = 'A'
and lt.cd_unid_int = &#unidadedeinternacao#
and lt.tp_ocupacao  in ('V','C')
union
select ('<font size="2" color="blue">'||leito||'</font>')       leito  
      --, ('<font size="2" color="red">'||cdpaciente||'</font>')  codpaciente
      , ('<font size="2">'||atendimento||'</font>') atendimento
      , ('<font size="2">'||paciente||'</font>')    nomedopaciente
      --, ('<font size="2">'||prestador||'</font>')   medico   
      , ('<font size="2">'||internadoa||'</font>')  internadoa
      , (case
           when ALER = '1' then
                 '<img src="/portal/bi/img/dash/alergia.png" border=0>'
         end
         )ALER
      , (case 
             when CIRUR = '1' then    
                '<img src="/portal/bi/img/dash/cirurgias.png" border=0>'
         end
         )CIRUR
      , (case 
             when PREMED = '1' then    
                '<img src="/portal/bi/img/dash/prescricao1.png" border=0>'
         end
         )PREMED
      , (case 
             when EVOMED = '1' then    
                '<img src="/portal/bi/img/dash/evolucao1.png" border=0>'
         end
         )EVOMED      
      , (case 
             when PREENF = '1' then    
                '<img src="/portal/bi/img/dash/cuidados_enfermagem1.png" border=0>'
         end
         )PREENF
      , (case 
             when EVOENF = '1' then    
                '<img src="/portal/bi/img/dash/diagnostico_enfermagem1.png" border=0>'
         end
         )EVOENF
      , (case 
             when REGENF = '1' then    
                '<img src="/portal/bi/img/dash/anotacao_enfermagem1.png" border=0>'
         end
         )REGENF
      ,(case when ISOLAMENTO = '27731' then '<img src="/portal/bi/img/dash/n95.png" border=0>'
             when ISOLAMENTO = '27729' then '<img src="/portal/bi/img/dash/mascara_cirurgica3.png" border=0>'
             when ISOLAMENTO = '27732' then '<img src="/portal/bi/img/dash/capote.png" border=0>'
             when ISOLAMENTO = '27750' then '<img src="/portal/bi/img/dash/n95capote.png" border=0>'
             when ISOLAMENTO = '27751' then '<img src="/portal/bi/img/dash/mascaracapote.png" border=0>'      
             when ISOLAMENTO = '27730' then '' 
             when ISOLAMENTO = '27733' then ''
             when ISOLAMENTO = '27734' then ''
         end) ISOLAM   
      , (case 
              when status1 = 'S' then    
                '<img src="/portal/bi/img/dash/alta_medica2.gif" border=0>'
              when   
              status = 'O' then 
                  '<img src="/portal/bi/img/dash/ico_leitoocupado.gif" border=0>'
               when
              status = 'I'  then
                  '<img src="/portal/bi/img/dash/ico_leitoinfectado.gif" border=0>'
               when
              status = 'M'  then  
                  '<img src="/portal/bi/img/dash/ico_manutencao.gif" border=0>'
               when
              status = 'V'  then
                  '<img src="/portal/bi/img/dash/ico_leitovago.gif" border=0>'
                when               
              status = 'L'  then     
                  '<img src="/portal/bi/img/dash/ico_limpeza.gif" border=0>'
                when
              status = 'R'  then
                  '<img src="/portal/bi/img/dash/ico_reserva.gif" border=0>' 
                when
              status = 'A'  then
                  '<img src="/portal/bi/img/dash/ico_acompanhante.gif" border=0>'                      
          end
         )status
 from 
 (
Select  l.ds_resumo leito,
       pa.cd_paciente cdpaciente,
       a.cd_atendimento atendimento,
       pa.nm_paciente paciente,
       substr(p.nm_prestador,1,20) prestador,
       (round(trunc(sysdate)-trunc(a.dt_atendimento))||' '||'dia(s)') internadoa 
       ,(select distinct '1'
                   from dbamv.subs_pac s 
                   where s.cd_paciente = a.cd_paciente
                                 )ALER
           ,(select tp.cd_tip_presc from Dbamv.Pre_Med PM, dbamv.Itpre_Med ite, dbamv.tip_presc tp
                            where PM.Cd_Atendimento = a.Cd_Atendimento 
                            and ite.cd_tip_presc = tp.cd_tip_presc 
                            and PM.cd_pre_med = ite.cd_pre_med
                            and PM.TP_PRE_MED = 'E'
                            AND TP.CD_TIP_PRESC IN ('27731','27732','27729','27730','27733','27734','27750','27751')
                            /*and ite.sn_cancelado = 'N'*/
                            and pm.cd_pre_med = (select max(PM1.CD_PRE_MED) from Dbamv.Pre_Med PM1, dbamv.Itpre_Med ite1, dbamv.tip_presc tp1 where PM1.Cd_Atendimento = a.Cd_Atendimento 
                                                 and ite1.cd_tip_presc = tp1.cd_tip_presc and PM1.cd_pre_med = ite1.cd_pre_med and PM1.TP_PRE_MED = 'E' 
                                                 
                                                 /*and ite1.sn_cancelado = 'N'*/)) ISOLAMENTO
          ,(select '1'
          from   dbamv.age_cir agenda,dbamv.paciente pac
              ,dbamv.aviso_cirurgia aviso
        where  agenda.cd_aviso_cirurgia = aviso.cd_aviso_cirurgia
         and  aviso.cd_paciente = pac.cd_paciente
         and  trunc(nvl(agenda.dt_inicio_age_cir,aviso.dt_aviso_cirurgia)) = trunc(sysdate)
        and  aviso.cd_paciente = pa.cd_paciente
        and  aviso.tp_situacao = 'G') CIRUR
      ,(SELECT distinct '1' 
                   FROM Dbamv.Pre_Med, dbamv.Itpre_Med ate
                   WHERE Pre_Med.Cd_Atendimento    = a.Cd_Atendimento
                   and pre_med.cd_pre_med = ate.cd_pre_med
                   AND Trunc(Pre_Med.Dt_Referencia) = trunc(sysdate)
                   AND TP_PRE_MED = 'M'
                   AND pre_med.sn_fechado = 'S')PREMED
       ,(SELECT distinct '1' FROM Dbamv.Pre_Med
                   WHERE Pre_Med.Cd_Atendimento    = a.Cd_Atendimento
                   AND Trunc(Pre_Med.Dt_Referencia) = Trunc(sysdate)
                   AND Ds_Evolucao IS NOT null --VERIFICA SE EXISTE UMA EVOLUCAO TEXTO LIVRE NO DIA
                   AND TP_PRE_MED in('M','O')
                   AND pre_med.sn_fechado = 'S')EVOMED                 
       ,(SELECT distinct '1' 
                   FROM Dbamv.Pre_Med, dbamv.Itpre_Med ate
                   WHERE Pre_Med.Cd_Atendimento    = a.Cd_Atendimento
                   and pre_med.cd_pre_med = ate.cd_pre_med
                   AND Trunc(Pre_Med.Dt_Referencia) = trunc(sysdate)
                   AND TP_PRE_MED = 'E'
                   --AND pre_med.sn_fechado = 'S'
                   --AND Ds_Evolucao IS null
                   )PREENF
    /*   ,(SELECT distinct '1' FROM Dbamv.Pre_Med
                   WHERE Pre_Med.Cd_Atendimento    = a.Cd_Atendimento
                   AND Trunc(Pre_Med.Dt_Referencia) = Trunc(sysdate)
                   AND Ds_Evolucao IS not null --VERIFICA SE EXISTE UMA EVOLUCAO TEXTO LIVRE NO DIA
                   AND TP_PRE_MED = 'E'
                   AND pre_med.sn_fechado = 'S'
                   )EVOENF */
        ,( select distinct '1'
                  from pw_documento_clinico dc, pw_editor_clinico ec
                   where a.cd_atendimento = dc.cd_atendimento
                    and dc.cd_documento_clinico = ec.cd_documento_clinico
                    and dc.dh_referencia = Trunc(sysdate)
                    and ec.cd_documento = 157
                    and dc.tp_status = 'FECHADO' 
                  )EVOENF           
                   
        ,(SELECT DISTINCT '1' FROM Dbamv.EVO_ENF, dbamv.prestador p
                      WHERE Trunc(DT_EVO_ENF) = Trunc(sysdate)
                        AND EVO_ENF.Cd_Atendimento = a.Cd_Atendimento
                        and EVO_ENF.CD_PRESTADOR = p.cd_prestador
                        AND DS_EVO_ENF IS NOT NULL
                        AND 'E' = 'E' 
                        and p.cd_tip_presta in (14,31)           
                   )REGENF     
       ,(select distinct '1'
                   from dbamv.subs_pac s 
                   where s.cd_paciente = a.cd_paciente
                                       )alergico
       ,l.tp_ocupacao status
       ,l.sn_alta_medica status1  
  from dbamv.paciente  pa,
       dbamv.atendime  a,
       dbamv.convenio  c,
       dbamv.leito     l,
       dbamv.prestador p,
       dbamv.unid_int  u
 where u.cd_unid_int = l.cd_unid_int
   and a.cd_paciente = pa.cd_paciente
   and a.cd_convenio = c.cd_convenio
   and a.cd_prestador = p.cd_prestador
   and a.tp_atendimento = 'I'
   and l.tp_situacao = 'A'
   and u.cd_unid_int = &#unidadedeinternacao#
   and a.dt_alta is null
   and a.cd_leito = l.cd_leito
 order by 1 asc
)
