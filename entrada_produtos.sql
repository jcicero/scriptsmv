select * from ent_pro e where e.nr_documento='8043' for update;
select * from duplicata d where d.nr_documento='8043';-- for update;
select * from documento_entrada de where de.nr_documento = '8043';-- for update;
select * from mvto_estoque m where m.nr_documento='8043';-- for update;
select * from itent_pro i where i.cd_ent_pro='8043';-- for update;
select * from itmvto_estoque;

select * from contagem;
select * from itcontagem it,
       contagem c
        where it.cd_produto in (3688,508,863,69,71,1662,1661,1566)
and it.cd_contagem=c.cd_contagem
and c.cd_estoque=2
and c.dt_contagem > '22/08/2013';


--select * from con_pag c where c.nr_documento='29112013'


--CONSTRAINT DUPLICATA_DOCUMENTO_ENTRADA

--select * from ent_pro e where e.cd_ent_pro in ('29112013'); -- for update;

select * from duplicata d where d.nr_documento='29112013';

select * from ent_pro e where e.nr_documento='8043';
select * from duplicata d where d.nr_documento='8043';
select * from itent_pro i where i.cd_ent_pro='5004';

-- for update;
select * from ent_pro e where e.cd_ent_pro in ('29112013')

select * from itent_pro it where it.cd_produto=988 and it.cd_ent_pro='4570'



select * from lot_pro l where l.cd_lote in ('NLTT00167M','058119') and l.cd_produto=987 for update;
select * from lot_pro l where l.cd_lote in ('123SA','61212355') and l.cd_produto=988 for update;
select * from lot_pro l where l.cd_lote in ('232650') and l.cd_produto=511 for update;
select * from lot_pro l where l.cd_produto=511 for update;
--232650  280000.0000
select * from itent_pro it where it.cd_ent_pro in ('5194','5120') for update;

--select * from 265,00 N 1 

select * from duplicata d where d.nr_documento in ('39172') for update
