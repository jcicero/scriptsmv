/*select i.* from it_agenda_central i where i.cd_agenda_central=43701 for update;

select i.* from it_agenda_central i where i.cd_agenda_central=45202 for update;*/

select 
         it.cd_paciente
        -- ,it.cd_usuario
       --  ,u.nm_usuario
       --  ,u.ds_observacao setor
       --  ,it.cd_item_agendamento
         ,pr.nm_prestador
       --  ,ag.ds_item_agendamento
       --  ,ac.cd_prestador
       --  ,pr.cd_prestador
         ,to_char(it.hr_agenda, 'dd/mm/yyyy') data
         ,ac.cd_unidade_atendimento
         ,ua.ds_unidade_atendimento
         ,p.nr_cep
from
         it_agenda_central it
         ,paciente p
         ,item_agendamento ag
         ,dbasgu.usuarios u
         ,agenda_central ac
         ,prestador pr
         ,unidade_atendimento ua
where 
         it.cd_paciente = p.cd_paciente
         and it.cd_item_agendamento=ag.cd_item_agendamento(+)
         and p.nr_cep='57000000'
         and it.hr_agenda > '20/08/2013'
         and it.cd_usuario=u.cd_usuario
    --     and u.ds_observacao='SAME'
         and it.cd_agenda_central=ac.cd_agenda_central
         and ac.cd_prestador=pr.cd_prestador
         and ac.cd_unidade_atendimento in (5)--,6,7,19,14,8)
         and ac.cd_unidade_atendimento=ua.cd_unidade_atendimento
         order by it.hr_agenda
         
         
         
         
--         (5,6,7,19,14,8)
--select * from unidade_atendimento
--select * from it_agenda_central

--select * from agenda_central
