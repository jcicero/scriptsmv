ALTER TABLE amostra
add CONSTRAINT ETIQUETA_AMOSTRA UNIQUE (nr_etiqueta_externa);

select a.nr_etiqueta_externa,a.* from amostra a
where a.nr_etiqueta_externa in ('B13-1190','B13-1199','B13-1443','C13-332','C13-435','C13-893')
 order by a.nr_etiqueta_externa for update;
 
 
 SELECT  a.nr_etiqueta_externa,COUNT(*) FROM amostra a GROUP BY a.nr_etiqueta_externa HAVING COUNT(*) > 1;
 
-- SELECT MIN(a.cd_amostra) AS amostra, a.nr_etiqueta_externa FROM amostra a GROUP BY a.nr_etiqueta_externa;
