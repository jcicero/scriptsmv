 select * from dbamv.itmvto_estoque s where s.cd_mvto_estoque = 198855
--and s.cd_produto = 865 
for update
  

select * from dbamv.ent_pro e where e.nr_documento = '76339' for update

select * from dbamv.itent_pro i where i.cd_ent_pro = '8409' afor update

--2º 
select * from dbamv.itlot_ent l where l.cd_lote = '0988' for update

select * from dbamv.documento_entrada  de where de.nr_documento = '76339' for update
--1º 
select * from dbamv.duplicata d where d.nr_documento = '76339' for update


