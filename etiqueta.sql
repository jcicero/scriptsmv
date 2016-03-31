select * from identificador_etiqueta;

select * from dbamv.identificador_etiqueta i where i.cd_lote in ('14031649') for update;
select * from dbamv.identificador_etiqueta i where i.cd_lote in ('1EL36');

select * from uni_pro u where u.cd_uni_pro=1448

select * from dbamv.identificador_etiqueta i where i.cd_uni_pro is null
