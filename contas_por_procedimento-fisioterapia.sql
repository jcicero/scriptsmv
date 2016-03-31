select it.* from itreg_fat it where it.cd_procedimento=0302010033
and it.dt_lancamento between '1/1/2012' and '31/12/2012';

select it.* from itreg_fat it where it.cd_procedimento=0302040021
and it.dt_lancamento between '1/1/2012' and '31/12/2012';

select * from 
itreg_fat it,
reg_fat r 
where it.cd_procedimento=0302060030
and it.dt_lancamento between '1/1/2012' and '31/12/2012'
and it.cd_reg_fat=r.cd_reg_fat;



select
r.nr_guia,
r.cd_atendimento,
r.cd_remessa,
r.dt_remessa,
it.cd_procedimento,
it.dt_lancamento
from 
itreg_fat it,
reg_fat r 
where it.cd_procedimento=0302010033
and it.dt_lancamento between '1/1/2012' and '31/12/2012'
and it.cd_reg_fat=r.cd_reg_fat;

select * from fatura;
