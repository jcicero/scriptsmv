 select * from dbamv.itmvto_estoque s where s.cd_mvto_estoque = 198855
--and s.cd_produto = 865 
for update
  

select * from dbamv.ent_pro e where e.nr_documento = '011348'

select * from dbamv.itent_pro i where i.cd_itent_pro = '6233' for update

--2º 
select * from dbamv.itlot_ent l where l.cd_lote = '0988' for update


--1º 
select * from dbamv.duplicata d where d.nr_documento = '011348' for update
