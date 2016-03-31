select p.nm_bairro,p.* from paciente p where p.cd_cidade != '7813' and p.nm_bairro is null;-- and p.nr_cns='898001215193485' for update


UPDATE paciente p
SET p.nm_bairro = 'CENTRO'
WHERE p.cd_cidade != '7813' and p.nm_bairro is null

commit

--31250

select p.nr_ddd_celular,p.nr_celular,p.* from paciente p where p.nr_ddd_celular is null and p.nr_celular is not null

UPDATE paciente p
SET p.nr_ddd_celular = '82'
WHERE p.nr_ddd_celular is null and p.nr_celular is not null


select p.nr_ddd_fone,p.nr_fone,p.* from paciente p where p.nr_ddd_fone is null and p.nr_fone is not null

UPDATE paciente p
SET p.nr_ddd_fone = '82'
WHERE p.nr_ddd_fone is null and p.nr_fone is not null


