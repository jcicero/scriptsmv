--create or replace view vdic_forn_pago_por_classe as
select --cp.cd_processo processo,
       /*pp.cd_produto,*/ pp.ds_especie, pp.ds_classe, pp.valor_produto,
       cp.cd_fornecedor fornecedor,
       fn.nm_fornecedor fornec,
       cp.nr_documento nf,
  --     itc.dt_vencimento vencimento,
       to_char(itc.dt_vencimento, 'DD/MM/YYYY') data_vencimento,
   --    cp.dt_lancamento atesto,
       to_char(cp.dt_lancamento, 'DD/MM/YYYY') data_atesto,
       cp.vl_bruto_conta valor_total,
       cp.cd_portador,
       p.ds_portador,
     --  ppc.dt_pagamento pagamento,
       to_char(ppc.dt_pagamento, 'DD/MM/YYYY') data_pagamento
       --sum(cp.vl_bruto_conta) valor
       from 
       con_pag cp, 
       itcon_pag itc, 
       fornecedor fn, 
       portador p, 
       pagcon_pag ppc, (
            select 
            ep.cd_fornecedor, 
            esp.ds_especie, 
            c.ds_classe, 
            ep.nr_documento nf, 
            sum(itp.vl_total) valor_produto
            from 
            ent_pro ep, 
            itent_pro itp, 
            produto p, 
            especie esp, 
            classe c
            where 
            ep.cd_ent_pro = itp.cd_ent_pro 
            and itp.cd_produto = p.cd_produto 
            and p.cd_especie = esp.cd_especie 
            and p.cd_classe = c.cd_classe
                  and p.cd_especie = c.cd_especie 
                 -- and c.cd_especie = &especie
                  group by ep.cd_fornecedor, esp.ds_especie, c.ds_classe, ep.nr_documento) pp
       where cp.cd_con_pag = itc.cd_con_pag
             and itc.tp_quitacao = 'Q'
             and cp.cd_fornecedor = fn.cd_fornecedor
             and cp.nr_documento = pp.nf
             and cp.cd_fornecedor = pp.cd_fornecedor
             and cp.cd_portador = p.cd_portador
             and itc.cd_itcon_pag = ppc.cd_itcon_pag
             and ppc.dt_pagamento between '01/08/2013' and '31/08/2013'
            -- and cp.dt_lancamento between &dataInicial and &dataFinal
       -- group by cp.cd_fornecedor, fn.nm_fornecedor, cp.nr_documento, itc.dt_vencimento
       
        order by ppc.dt_pagamento; 
        
    --    select * from con_pag;
        
    --    select * from itcon_pag;
        
    --    select * from pagcon_pag
    
   -- select * from especie;
