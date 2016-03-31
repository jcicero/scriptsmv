select p.dt_nascimento,a.cd_atendimento,p.* from 
paciente p,
atendime a,
eve_siasus e
where 
p.dt_nascimento < '10/10/1900'
and a.cd_paciente = p.cd_paciente
and a.cd_paciente = e.cd_paciente
and e.cd_fat_sia=59
--and e.cd_remessa in (207,208)
and a.cd_atendimento is not null;


select * from eve_siasus e
where 
e.cd_fat_sia=53
and e.cd_remessa in (207,208)
and e.cd_procedimento=0301010072
and e.cd_paciente in (666018,32478,635221,643502,372825,372825,591799,632744);

select * from paciente pac where pac.cd_paciente in (168968,416334);

select * from eve_siasus e
where e.cd_cbo_prestador in ('223410','225190','225245','2231A2') and e.cd_fat_sia=50;

select e.cd_cbo_prestador,e.* from eve_siasus e
where e.cd_cbo_prestador in ('223415','225340','225135','225135') and e.cd_fat_sia=50;
