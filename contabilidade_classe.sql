--PLANILHA B - PLANILHA COM INFORMA합ES COMPLETAS
select b.cd_capitulo || ' - ' || iob.ds_capitulo CAPITULO
       ,count(b.cd_bem)           QTD_BENS
       --,b.cd_sub_cap || ' - ' || siob.Ds_Sub_Cap SUBCAPITULO 
       ,sum(b.vl_compra)          VALOR_DA_AQUISI플O
       ,sum(i.vl_deprecia_atual)  VALOR_ATUAL
      -- ,sum(i.tx_depreciacao)     TAXA_DE_DEPRECIA플O
  from bens                  b
       ,setor                s
       ,localidade           l
       ,fornecedor           f
       ,contato_fornec       c
       ,itdeprecia           i
       ,iob                  iob
       ,sub_iob              siob
  where b.cd_setor = s.cd_setor
        and b.cd_localidade = l.cd_localidade
        and b.cd_motivo is null
        and b.cd_fornecedor = f.cd_fornecedor(+)
        and f.cd_fornecedor = c.cd_fornecedor(+)
        and b.cd_bem = i.cd_bem
        and to_char(i.dt_competencia, 'mm/yyyy') = '&mesAno' 
     --   and (b.cd_capitulo = 5
      --       or b.cd_capitulo = 8 and b.cd_sub_cap in (5,99,98,97,95,96,89,80,78,6,56,55,53,51,39,36,34,25,24,17,126,125,123,120,118,116,115,105,121,124,48,38,70))
        and b.cd_capitulo = iob.cd_capitulo
        and b.cd_sub_cap = siob.cd_sub_cap
        and b.cd_capitulo = siob.cd_capitulo
   group by 
         b.cd_capitulo
         --,b.cd_sub_cap
         ,iob.ds_capitulo
         --,siob.Ds_Sub_Cap
  order by 1;


--PLANILHA B - PLANILHA COM INFORMA합ES COMPLETAS
select --b.cd_capitulo || ' - ' || iob.ds_capitulo CAPITULO
       b.cd_sub_cap || ' - ' || siob.Ds_Sub_Cap SUBCAPITULO 
       ,count(b.cd_bem)           QTD_BENS
       ,sum(b.vl_compra)          VALOR_DA_AQUISI플O
       ,sum(i.vl_deprecia_atual)  VALOR_ATUAL
      -- ,i.tx_depreciacao     TAXA_DE_DEPRECIA플O
  from bens                  b
       ,setor                s
       ,localidade           l
       ,fornecedor           f
       ,contato_fornec       c
       ,itdeprecia           i
       ,iob                  iob
       ,sub_iob              siob
  where b.cd_setor = s.cd_setor
        and b.cd_localidade = l.cd_localidade
        and b.cd_motivo is null
        and b.cd_fornecedor = f.cd_fornecedor(+)
        and f.cd_fornecedor = c.cd_fornecedor(+)
        and b.cd_bem = i.cd_bem
        and to_char(i.dt_competencia, 'mm/yyyy') = '&mesAno' 
     --   and (b.cd_capitulo = 5
      --       or b.cd_capitulo = 8 and b.cd_sub_cap in (5,99,98,97,95,96,89,80,78,6,56,55,53,51,39,36,34,25,24,17,126,125,123,120,118,116,115,105,121,124,48,38,70))
        and b.cd_capitulo = iob.cd_capitulo
        and b.cd_sub_cap = siob.cd_sub_cap
        and b.cd_capitulo = siob.cd_capitulo
   group by 
       --  b.cd_capitulo
         b.cd_sub_cap
        -- ,iob.ds_capitulo
         ,siob.Ds_Sub_Cap
    order by 1;
