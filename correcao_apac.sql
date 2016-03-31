select a.cd_paciente,a.* from apac a where 
a.cd_fat_sia=54
--and a.cd_ori_ate=11
and a.cd_remessa=57
and a.cd_paciente in (762195,748783,641843,753214,748728,655468) for update;

select a.cd_paciente,a.* from apac a where 
--a.cd_fat_sia=54
a.cd_ori_ate=12
--and a.cd_remessa=57
and a.cd_paciente in (655468) for update;

--select * from apac a where a.nr_apac=2713200785735 for update
--2713200785735

SELECT * FROM eve_siasus e where/* e.cd_ori_ate=12 and*/ e.cd_paciente in ('655468','641843') and e.cd_fat_sia=54
