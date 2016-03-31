select e.cd_exa_rx,
       e.ds_exa_rx,
       e.cd_procedimento_sia,
       p.ds_procedimento,
       e.cd_procedimento_sih,
       p1.ds_procedimento
  from exa_rx e, procedimento_sus p, procedimento_sus p1
 where e.sn_ativo = 'S'
   and e.cd_procedimento_sia = p.cd_procedimento
   and e.cd_procedimento_sih = p1.cd_procedimento(+);

-- select * from exa_rx rx where rx.sn_ativo = 'S';

-- and (e.cd_procedimento_sia = p.cd_procedimento or e.cd_procedimento_sih = p.cd_procedimento)
-- and (e.cd_procedimento_sia = p1.cd_procedimento or e.cd_procedimento_sih = p1.cd_procedimento);
