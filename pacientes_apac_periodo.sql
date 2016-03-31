select distinct(a.cd_paciente) from apac a where a.cd_cid_principal like 'C50%'
and a.dt_inicial between '01/03/2013' and '17/05/2013';
