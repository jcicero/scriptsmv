select * from apac a where a.cd_fat_sia='51'
and a.cd_apac=9680;

select e.cd_cbo_prestador,e.* from eve_siasus e where e.cd_fat_sia=51 and e.cd_cbo_prestador=223415 and e.cd_ori_ate=10-- and e.cd_apac='9680' for update

update eve_siasus e 
   set e.cd_cbo_prestador='221105',e.cd_prestador_executante='878'
  where e.cd_fat_sia=51 and e.cd_cbo_prestador=225335 and e.cd_prestador_executante='70' and e.cd_ori_ate=10
  
--  185

/*select * from contagem c where c.cd_contagem=530; 

select * FROM ITCONTAGEM_DA_ABERTURA I WHERE I.CD_CONTAGEM=498;*/

select p.cd_cbos,p.* from prestador p where p.cd_cbos=225335;

select * from prestador_cbo pc where pc.cd_cbo='225335' for update;

select e.cd_prestador_executante,e.* from eve_siasus e where e.cd_fat_sia=51 and e.cd_prestador_executante=70 and e.cd_ori_ate=10 for update

select a.cd_prestador,a.* from apac a where a.cd_prestador=758 and a.cd_fat_sia=51 and a.cd_remessa=54 /*and a.cd_tip_ate=8*/ for update

select e.cd_prestador_executante,e.cd_prestador,e.* from eve_siasus e where e.cd_fat_sia=51 and e.cd_ori_ate=7-- and e.cd_prestador=758 and e.cd_remessa=54 for update
--2713200790620           9646
