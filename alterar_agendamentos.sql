--select * from agenda_central a where a.cd_agenda_central = 42421;

--select * from it_agenda_central i where i.cd_agenda_central=42421;

--agenda errada - SISREG
select i.* from it_agenda_central i where i.cd_agenda_central=43298;


--agenda correta - AMBUALATORIO
select i.* from it_agenda_central i where i.cd_agenda_central=43299 for update;



/*UPDATE it_agenda_central it
SET it.cd_tip_mar = 16
WHERE it.cd_tip_mar is null 
and it.cd_paciente is not null
and it.cd_ser_dis is not null

select * from it_agenda_central it 
where it.cd_tip_mar is null 
and it.cd_paciente is not null
and it.cd_ser_dis is not null

--1328041
*/
