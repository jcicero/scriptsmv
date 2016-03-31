/*--select * from agenda_central a where a.cd_agenda_central=63025 for update;

select * from it_agenda_central i where i.cd_agenda_central=63025 for update;

select max(cd_it_agenda_central)from it_agenda_central*/

SELECT 
       b.ds_plaqueta,
      -- b.cd_localidade,
       s.nm_setor,
       l.ds_localidade,
       b.nr_serie,b.dt_baixa
--       b.* 
FROM 
       bens b,
       setor s,
       localidade l where 
b.cd_setor=s.cd_setor and
b.cd_localidade=l.cd_localidade and
b.ds_plaqueta in (
'20000641',
'20002242',
'20002443',
'20002244',
'20000214',
'20000653',
'20002126',
'10063467',
'20000580',
'20002441',
'20002222',
'20002451',
'20002253',
'20002446',
'20002240'

) 
order by 1
