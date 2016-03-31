/*
begin
   pkg_mv2000.Atribui_Empresa(1);
end;
*/

select st.nm_setor, 
       jan.valorfaturado Janeiro,  
       fev.valorfaturado Fevereiro, 
       mar.valorfaturado Marco, 
       abr.valorfaturado Abril, 
       mai.valorfaturado Maio, 
       jun.valorfaturado Junho, 
       jul.valorfaturado Julho, 
       ago.valorfaturado Agosto, 
       sete.valorfaturado Setembro, 
       outu.valorfaturado Outubro, 
       nov.valorfaturado Novembro, 
       dez.valorfaturado Dezembro,
       nvl(jan.valorfaturado, 0) + 
       nvl(fev.valorfaturado, 0) + 
       nvl(mar.valorfaturado, 0) + 
       nvl(abr.valorfaturado, 0) + 
       nvl(mai.valorfaturado, 0) + 
       nvl(jun.valorfaturado, 0) + 
       nvl(jul.valorfaturado, 0) + 
       nvl(ago.valorfaturado, 0) + 
       nvl(sete.valorfaturado, 0) + 
       nvl(outu.valorfaturado, 0) + 
       nvl(nov.valorfaturado, 0) + 
       nvl(dez.valorfaturado, 0) Total 

       from setor st, 

(select t.cd_setor setor,s.nm_setor,sum(t.vl_total)valorfaturado from dbamv.v_ffis_receitaglobal_p321 t , dbamv.setor s
       where t.cd_setor = s.cd_setor and to_char(t.dt_lancamento, 'MM/YYYY') = '01/' || &2013 
       group by t.cd_setor,s.nm_setor, to_char(t.dt_lancamento, 'MM/YYYY')) JAN,     
             
(select t.cd_setor setor,s.nm_setor,sum(t.vl_total)valorfaturado from dbamv.v_ffis_receitaglobal_p321 t , dbamv.setor s
       where t.cd_setor = s.cd_setor and to_char(t.dt_lancamento, 'MM/YYYY') = '02/' || &2013 
        group by t.cd_setor,s.nm_setor, to_char(t.dt_lancamento, 'MM/YYYY')) FEV,

(select t.cd_setor setor,s.nm_setor,sum(t.vl_total)valorfaturado from dbamv.v_ffis_receitaglobal_p321 t , dbamv.setor s
       where t.cd_setor = s.cd_setor and to_char(t.dt_lancamento, 'MM/YYYY') = '03/' || &2013 
        group by t.cd_setor,s.nm_setor, to_char(t.dt_lancamento, 'MM/YYYY')) MAR,

(select t.cd_setor setor,s.nm_setor,sum(t.vl_total)valorfaturado from dbamv.v_ffis_receitaglobal_p321 t , dbamv.setor s
       where t.cd_setor = s.cd_setor and to_char(t.dt_lancamento, 'MM/YYYY') = '04/' || &2013 
        group by t.cd_setor,s.nm_setor, to_char(t.dt_lancamento, 'MM/YYYY')) ABR,

(select t.cd_setor setor,s.nm_setor,sum(t.vl_total)valorfaturado from dbamv.v_ffis_receitaglobal_p321 t , dbamv.setor s
       where t.cd_setor = s.cd_setor and to_char(t.dt_lancamento, 'MM/YYYY') = '05/' || &2013 
        group by t.cd_setor,s.nm_setor, to_char(t.dt_lancamento, 'MM/YYYY')) MAI,

(select t.cd_setor setor,s.nm_setor,sum(t.vl_total)valorfaturado from dbamv.v_ffis_receitaglobal_p321 t , dbamv.setor s
       where t.cd_setor = s.cd_setor and to_char(t.dt_lancamento, 'MM/YYYY') = '06/' || &2013 
        group by t.cd_setor,s.nm_setor, to_char(t.dt_lancamento, 'MM/YYYY')) JUN,

(select t.cd_setor setor,s.nm_setor,sum(t.vl_total)valorfaturado from dbamv.v_ffis_receitaglobal_p321 t , dbamv.setor s
       where t.cd_setor = s.cd_setor and to_char(t.dt_lancamento, 'MM/YYYY') = '07/' || &2013 
        group by t.cd_setor,s.nm_setor, to_char(t.dt_lancamento, 'MM/YYYY')) JUL,                        

(select t.cd_setor setor,s.nm_setor,sum(t.vl_total)valorfaturado from dbamv.v_ffis_receitaglobal_p321 t , dbamv.setor s
       where t.cd_setor = s.cd_setor and to_char(t.dt_lancamento, 'MM/YYYY') = '08/' || &2013 
        group by t.cd_setor,s.nm_setor, to_char(t.dt_lancamento, 'MM/YYYY')) AGO,

(select t.cd_setor setor,s.nm_setor,sum(t.vl_total)valorfaturado from dbamv.v_ffis_receitaglobal_p321 t , dbamv.setor s
       where t.cd_setor = s.cd_setor and to_char(t.dt_lancamento, 'MM/YYYY') = '09/' || &2013 
        group by t.cd_setor,s.nm_setor, to_char(t.dt_lancamento, 'MM/YYYY')) SETE,

(select t.cd_setor setor,s.nm_setor,sum(t.vl_total)valorfaturado from dbamv.v_ffis_receitaglobal_p321 t , dbamv.setor s
       where t.cd_setor = s.cd_setor and to_char(t.dt_lancamento, 'MM/YYYY') = '10/' || &2013 
        group by t.cd_setor,s.nm_setor, to_char(t.dt_lancamento, 'MM/YYYY')) OUTU,                
        
(select t.cd_setor setor,s.nm_setor,sum(t.vl_total)valorfaturado from dbamv.v_ffis_receitaglobal_p321 t , dbamv.setor s
       where t.cd_setor = s.cd_setor and to_char(t.dt_lancamento, 'MM/YYYY') = '11/' || &2013 
        group by t.cd_setor,s.nm_setor, to_char(t.dt_lancamento, 'MM/YYYY')) NOV,
        
(select t.cd_setor setor,s.nm_setor,sum(t.vl_total)valorfaturado from dbamv.v_ffis_receitaglobal_p321 t , dbamv.setor s
       where t.cd_setor = s.cd_setor and to_char(t.dt_lancamento, 'MM/YYYY') = '12/' || &2013 
        group by t.cd_setor,s.nm_setor, to_char(t.dt_lancamento, 'MM/YYYY')) DEZ
                        
        where st.cd_setor = jan.setor(+)   
              and st.cd_setor = fev.setor(+)
              and st.cd_setor = mar.setor(+)
              and st.cd_setor = abr.setor(+)
              and st.cd_setor = mai.setor(+)
              and st.cd_setor = jun.setor(+)
              and st.cd_setor = jul.setor(+)
              and st.cd_setor = ago.setor(+)
              and st.cd_setor = sete.setor(+)
              and st.cd_setor = outu.setor(+)
              and st.cd_setor = nov.setor(+)
              and st.cd_setor = dez.setor(+)
              
order by st.cd_setor
