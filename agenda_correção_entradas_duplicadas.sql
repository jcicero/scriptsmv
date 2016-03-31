/*select * from agenda_central a where a.cd_agenda_central in (121004);
select * from it_agenda_central i where i.cd_agenda_central = 121004;
select * from agenda_central_ser_tipo acs where acs.cd_agenda_central = 121004 for update

select * from it_agenda_central i where i.cd_paciente in (535256,800210) and trunc(i.hr_agenda) = '07/05/2015';

select * from same s where s.cd_paciente = 535256;

select * from dbamv.agenda_central_item_agenda ag where ag.cd_agenda_central = 120559 for update;

select *
  from dbamv.agenda_central_item_agenda ag*/--, agenda_central ac--,it_agenda_central i
--  where ag.cd_agenda_central = ac.cd_agenda_central
      --  and ac.tp_agenda = 'A'
      --  and ag.cd_agenda_central = i.cd_agenda_central
       -- and trunc(i.hr_agenda) = '07/05/2015'
 --group by ag.cd_agenda_central
 --order by 2 asc
--769 728
select v.CODIGO_PACIENTE, count(*), v.nm_prestador, v.cd_agenda_central
  from vdic_agendamento_same v
 where v.DATA_AGENDA = '22/05/2015'
 group by v.CODIGO_PACIENTE, v.nm_prestador, v.cd_agenda_central
HAVING Count(*) > 1;

select * from dbamv.agenda_central_item_agenda ag where ag.cd_agenda_central in
 (121237) for update;
 
 select * from prestador p where p.nm_prestador = 'LUCIANA DE ANDRADE PEREIRA'
 select * from agenda_central ag where ag.cd_prestador = 927 and ag.dt_agenda > '14/05/2015'
