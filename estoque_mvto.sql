select * from ent_pro e where e.cd_ent_pro in (1660,597);

select * from itent_pro i where i.cd_ent_pro in (1660,597);

select * from duplicata d where d.nr_documento='687257' for update;

select * from duplicata d where d.cd_fornecedor=59 for update;

select * from duplicata d where d.nr_documento='592012';
--1	59	687257	1	7/26/2012	6730.00	10	10	

select * from documento_entrada doc where doc.nr_documento=687257;

select * from mvto_estoque m where m.nr_documento = '687257';

select * from documento_entrada d where d.sn_importado_financeiro='S';

select * from documento_entrada d where d.sn_importada_fnfi='S';

select * from documento_entrada d where d.nr_documento in ('761231','761233','761230','761232') for update;
select * from documento_entrada d where d.nr_documento='761233'-- for update;

select * from con_pag  c where c.nr_documento='761231'-- for update

select * from con_pag  c where c.nr_documento in ('761231','761233','761230','761232')

select * from
