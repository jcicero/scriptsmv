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

(select s.cd_setor setor, s.nm_setor,sum(i.vl_total_ambulatorial) valorfaturado
       from dbamv.eve_siasus i, dbamv.procedimento_sus ps,dbamv.setor s
       where i.cd_procedimento = ps.cd_procedimento
       and s.cd_setor = i.cd_setor
       and i.vl_total_ambulatorial > 0 
       and to_char(i.dt_eve_siasus, 'MM/YYYY') = '01/' || #ano#
       group by s.cd_setor,s.nm_setor, to_char(i.dt_eve_siasus, 'MM/YYYY')) JAN,

(select s.cd_setor setor, s.nm_setor,sum(i.vl_total_ambulatorial) valorfaturado
       from dbamv.eve_siasus i, dbamv.procedimento_sus ps,dbamv.setor s
       where i.cd_procedimento = ps.cd_procedimento
       and s.cd_setor = i.cd_setor
       and i.vl_total_ambulatorial > 0
       and to_char(i.dt_eve_siasus, 'MM/YYYY') = '02/' || #ano#
       group by s.cd_setor,s.nm_setor, to_char(i.dt_eve_siasus, 'MM/YYYY')) FEV,

(select s.cd_setor setor, s.nm_setor,sum(i.vl_total_ambulatorial) valorfaturado
       from dbamv.eve_siasus i, dbamv.procedimento_sus ps,dbamv.setor s
       where i.cd_procedimento = ps.cd_procedimento
       and s.cd_setor = i.cd_setor
       and i.vl_total_ambulatorial > 0
       and to_char(i.dt_eve_siasus, 'MM/YYYY') = '03/' || #ano#
       group by s.cd_setor,s.nm_setor, to_char(i.dt_eve_siasus, 'MM/YYYY')) MAR,

(select s.cd_setor setor, s.nm_setor,sum(i.vl_total_ambulatorial) valorfaturado
       from dbamv.eve_siasus i, dbamv.procedimento_sus ps,dbamv.setor s
       where i.cd_procedimento = ps.cd_procedimento
       and s.cd_setor = i.cd_setor
       and i.vl_total_ambulatorial > 0
       and to_char(i.dt_eve_siasus, 'MM/YYYY') = '04/' || #ano#
       group by s.cd_setor,s.nm_setor, to_char(i.dt_eve_siasus, 'MM/YYYY')) ABR,

(select s.cd_setor setor, s.nm_setor,sum(i.vl_total_ambulatorial) valorfaturado
       from dbamv.eve_siasus i, dbamv.procedimento_sus ps,dbamv.setor s
       where i.cd_procedimento = ps.cd_procedimento
       and s.cd_setor = i.cd_setor
       and i.vl_total_ambulatorial > 0
       and to_char(i.dt_eve_siasus, 'MM/YYYY') = '05/' || #ano#
       group by s.cd_setor,s.nm_setor, to_char(i.dt_eve_siasus, 'MM/YYYY')) MAI,

(select s.cd_setor setor, s.nm_setor,sum(i.vl_total_ambulatorial) valorfaturado
       from dbamv.eve_siasus i, dbamv.procedimento_sus ps,dbamv.setor s
       where i.cd_procedimento = ps.cd_procedimento
       and s.cd_setor = i.cd_setor
       and i.vl_total_ambulatorial > 0
       and to_char(i.dt_eve_siasus, 'MM/YYYY') = '06/' || #ano#
       group by s.cd_setor,s.nm_setor, to_char(i.dt_eve_siasus, 'MM/YYYY')) JUN,

(select s.cd_setor setor, s.nm_setor,sum(i.vl_total_ambulatorial) valorfaturado
       from dbamv.eve_siasus i, dbamv.procedimento_sus ps,dbamv.setor s
       where i.cd_procedimento = ps.cd_procedimento
       and s.cd_setor = i.cd_setor
       and i.vl_total_ambulatorial > 0
       and to_char(i.dt_eve_siasus, 'MM/YYYY') = '07/' || #ano#
       group by s.cd_setor,s.nm_setor, to_char(i.dt_eve_siasus, 'MM/YYYY')) JUL,

(select s.cd_setor setor, s.nm_setor,sum(i.vl_total_ambulatorial) valorfaturado
       from dbamv.eve_siasus i, dbamv.procedimento_sus ps,dbamv.setor s
       where i.cd_procedimento = ps.cd_procedimento
       and s.cd_setor = i.cd_setor
       and i.vl_total_ambulatorial > 0
       and to_char(i.dt_eve_siasus, 'MM/YYYY') = '08/' || #ano#
       group by s.cd_setor,s.nm_setor, to_char(i.dt_eve_siasus, 'MM/YYYY')) AGO,

(select s.cd_setor setor, s.nm_setor,sum(i.vl_total_ambulatorial) valorfaturado
       from dbamv.eve_siasus i, dbamv.procedimento_sus ps,dbamv.setor s
       where i.cd_procedimento = ps.cd_procedimento
       and s.cd_setor = i.cd_setor
       and i.vl_total_ambulatorial > 0
       and to_char(i.dt_eve_siasus, 'MM/YYYY') = '09/' || #ano#
       group by s.cd_setor,s.nm_setor, to_char(i.dt_eve_siasus, 'MM/YYYY')) SETE,

(select s.cd_setor setor, s.nm_setor,sum(i.vl_total_ambulatorial) valorfaturado
       from dbamv.eve_siasus i, dbamv.procedimento_sus ps,dbamv.setor s
       where i.cd_procedimento = ps.cd_procedimento
       and s.cd_setor = i.cd_setor
       and i.vl_total_ambulatorial > 0
       and to_char(i.dt_eve_siasus, 'MM/YYYY') = '10/' || #ano#
       group by s.cd_setor,s.nm_setor, to_char(i.dt_eve_siasus, 'MM/YYYY')) OUTU,

(select s.cd_setor setor, s.nm_setor,sum(i.vl_total_ambulatorial) valorfaturado
       from dbamv.eve_siasus i, dbamv.procedimento_sus ps,dbamv.setor s
       where i.cd_procedimento = ps.cd_procedimento
       and s.cd_setor = i.cd_setor
       and i.vl_total_ambulatorial > 0
       and to_char(i.dt_eve_siasus, 'MM/YYYY') = '11/' || #ano#
       group by s.cd_setor,s.nm_setor, to_char(i.dt_eve_siasus, 'MM/YYYY')) NOV,

(select s.cd_setor setor, s.nm_setor,sum(i.vl_total_ambulatorial) valorfaturado
       from dbamv.eve_siasus i, dbamv.procedimento_sus ps,dbamv.setor s
       where i.cd_procedimento = ps.cd_procedimento
       and s.cd_setor = i.cd_setor
       and i.vl_total_ambulatorial > 0
       and to_char(i.dt_eve_siasus, 'MM/YYYY') = '12/' || #ano#
       group by s.cd_setor,s.nm_setor, to_char(i.dt_eve_siasus, 'MM/YYYY')) DEZ

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
              and jan.valorfaturado > 0
              and fev.valorfaturado > 0
              and mar.valorfaturado > 0
              and abr.valorfaturado > 0
              and mai.valorfaturado > 0
              and jun.valorfaturado > 0
              and jul.valorfaturado > 0
              and ago.valorfaturado > 0
              and sete.valorfaturado > 0
              and outu.valorfaturado > 0
              and nov.valorfaturado > 0
              and dez.valorfaturado > 0
              
order by st.cd_setor
