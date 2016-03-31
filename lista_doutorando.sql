--select * from dbasgu.usuarios u where u.ds_observacao like '%DOUTORAN%';

select u.sn_ativo,p.cd_prestador, u.cd_usuario, p.nm_prestador, p.dt_cadastro
  from dbamv.prestador p, dbasgu.usuarios u
 where p.cd_tip_presta = 69
   and u.cd_prestador = p.cd_prestador
   and u.sn_ativo = 'S'
   order by 5 asc;
   
 --  select p.dt_cadastro,p.* from prestador p where p.cd_tip_presta = 69 and p.tp_situacao = 'A' order by p.dt_cadastro asc for update
