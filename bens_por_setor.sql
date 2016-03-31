 select    b.cd_multi_empresa||'  '||me.ds_multi_empresa as empresa
             , b.cd_bem Codigo
             ,b.ds_bem Descricao
             ,b.ds_plaqueta
             ,b.dt_compra
             ,b.vl_compra
             ,b.dt_ultima_preventiva
             ,b.dt_tombamento
             ,b.vl_historico
             ,b.cd_localidade
             ,b.cd_setor
             ,b.ds_modelo
             ,b.ds_marca
             ,b.nr_serie
             ,s.cd_setor codigo_setor
             ,s.nm_setor descricao_setor
             , l.cd_localidade codigo_localidade
             ,l.ds_localidade descricao_localidade,
             b.cd_multi_empresa CD_EMPRESA,
             me.ds_multi_empresa DS_EMPRESA,
             B.VL_DEPRECIACAO_HISTORICA,
             Dbamv.Pkg_Patrimonio.Fn_RetTotalDeprecBem( B.Cd_Bem, Trunc(Sysdate,'MM'), Null, Null, 'C' ) + NVL(B.VL_DEPRECIACAO_HISTORICA, 0)       VL_DEPREC_CUSTO,
             Dbamv.Pkg_Patrimonio.Fn_RetTotalDeprecBem( B.Cd_Bem, Trunc(Sysdate,'MM'), Null, Null, 'C' )                 VL_DEPREC_PROCESSADA,
             Dbamv.Pkg_Patrimonio.Fn_Ret_Dados_ReavaliacaoBem( B.Cd_Bem, Null, 'V', Null, Null )                          Vl_Total_Reavaliacao,
             Dbamv.Pkg_Patrimonio.Fn_RetTotalDeprecBem( B.Cd_Bem, Trunc(Sysdate,'MM'), Null, Null, 'R' )                  Vl_Total_Deprec_Reav
             ,b.sn_garantia_penhora
             ,b.nr_codigo_barra

From  dbamv.bens b
         ,dbamv.setor s
         ,dbamv.multi_empresas me
         ,dbamv.localidade l
         ,DBAMV.ESPECIE
         ,DBAMV.CLASSE
         ,DBAMV.SUB_CLAS
WHERE B.HR_BAIXA IS NULL
AND   CLASSE.CD_CLASSE     (+) = B.CD_CLASSE
AND   CLASSE.CD_ESPECIE    (+) = B.CD_ESPECIE
AND   SUB_CLAS.CD_CLASSE   (+) = B.CD_CLASSE
AND   SUB_CLAS.CD_SUB_CLA  (+) = B.CD_SUB_CLA
AND   SUB_CLAS.CD_ESPECIE  (+) = B.CD_ESPECIE
AND   ESPECIE.CD_ESPECIE   (+) = B.CD_ESPECIE
AND   ME.CD_MULTI_EMPRESA  (+) = B.CD_MULTI_EMPRESA
AND   S.CD_MULTI_EMPRESA   (+) = B.CD_MULTI_EMPRESA
AND   S.CD_SETOR           (+) = B.CD_SETOR
AND   L.CD_LOCALIDADE      (+) = B.CD_LOCALIDADE
AND   L.CD_SETOR           (+) = B.CD_SETOR
AND NOT EXISTS (SELECT 'X'
                  FROM dbamv.bens_agregados
                 WHERE bens_agregados.cd_bemagregado = b.cd_bem
                   AND Nvl(sn_agrega_valor,'N') = 'S')
AND   B.SN_GARANTIA_PENHORA =  'N' 








order by 2
