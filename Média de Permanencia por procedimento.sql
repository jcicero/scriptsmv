--Manter Procedimneto
select c1.ds_unid_int Clínica, sum(c1.dias_internado) diasInternacao,
       sum(c2.saidas) saidas,
       c1.procedimento proc_int,
       (sum(c1.dias_internado) / sum(c2.saidas)) media_permanencia
from 
(select ui.ds_unid_int, nvl(a.cd_procedimento_alta, a.cd_procedimento) procedimento,
       sum((trunc(case when trunc(a.dt_alta) > trunc(to_date(#dataFinal#)) then to_date(#dataFinal#) else trunc(a.dt_alta) end) - a.dt_atendimento)) dias_Internado
       from atendime a, leito l, unid_int ui
            where a.tp_atendimento = 'I'
                  and a.cd_leito = l.cd_leito
                  and l.cd_unid_int = ui.cd_unid_int
            and a.dt_atendimento between #dataInicial# and #dataFinal#
            and substr(nvl(a.cd_procedimento_alta, a.cd_procedimento),1,2) in ('03', '04')
            and ui.cd_unid_int like decode(#unidadeInternacao#, 00, '%%', #unidadeInternacao#)
            group by ui.ds_unid_int, nvl(a.cd_procedimento_alta, a.cd_procedimento)) c1,

(select ui1.ds_unid_int, nvl(a1.cd_procedimento_alta, a1.cd_procedimento) procedimento, count(a1.cd_atendimento) saidas 
        from atendime a1, leito l1, unid_int ui1
        where a1.tp_atendimento = 'I'
              and a1.cd_leito = l1.cd_leito
              and l1.cd_unid_int = ui1.cd_unid_int
              and a1.dt_alta between #dataInicial# and #dataFinal# and a1.dt_alta is not null
              and substr(nvl(a1.cd_procedimento_alta, a1.cd_procedimento),1,2) in ('03', '04')
              and ui1.cd_unid_int like decode(#unidadeInternacao#, 00, '%%', #unidadeInternacao#)
              group by ui1.ds_unid_int, nvl(a1.cd_procedimento_alta, a1.cd_procedimento)
) c2

where c1.ds_unid_int = c2.ds_unid_int  
      and c1.procedimento = c2.procedimento          
group by c1.ds_unid_int, c1.procedimento
