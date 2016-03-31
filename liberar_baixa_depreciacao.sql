select * from bens b where  trunc(b.dt_baixa) > '01/01/2015';

select * from bens b where b.cd_bem = 46;

select * from bens b where b.ds_plaqueta = '20002989'

select * from itdeprecia t
where t.cd_bem = 10184 for update;

--EXCLUIR A ULTIMA DEPRECIAÇÃO
