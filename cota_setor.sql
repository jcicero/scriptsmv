select * from cota_setor c where c.cd_setor=68

UPDATE cota_setor c
SET c.cd_setor=103


/*UPDATE cota_setor c
SET c.cd_setor=68
WHERE c.cd_produto in (975,1973,1854,2265,513,120,360,386,1390,1609,1608,3239,153,93,152,1520,1519,2126,1658,1668,1536,1612);*/

select * from dbasgu.usuarios u where u.cd_usuario = 'VIVIANEOSC'

select * from agenda_central a where a.cd_agenda_central=31229;
select * from it_agenda_central i where i.cd_agenda_central=31229 for update;
select * from it_agenda_central i where i.cd_agenda_central=30708;
