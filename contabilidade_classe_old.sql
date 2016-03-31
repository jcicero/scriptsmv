select 
  b.cd_capitulo
  ,i.ds_capitulo
  ,sum(b.vl_compra) compra
  from bens b, iob i
  where b.dt_baixa is null
  and b.cd_capitulo = i.cd_capitulo
 group by b.cd_capitulo,i.ds_capitulo;


select 
  b.cd_capitulo
  ,i.ds_capitulo
  ,sum(b.vl_compra) compra
  from bens b, iob i
  where b.dt_baixa is null
  and b.cd_capitulo = i.cd_capitulo
 group by b.cd_capitulo,i.ds_capitulo;
 
0,00833333333333333

select * from bens b where b.cd_bem = 4190;

select * from itdeprecia i where i.cd_bem = 4155 order by 3 for update
