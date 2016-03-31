/*select * from ped_lab;

select * from itped_lab it where it.cd_material=421 for update;

select * from pergunta_resposta_exalab;

select * from per_pedlab p where p.cd_ped_lab=28395

select * from exa_lab e where e.cd_exa_lab = 1621;*/

select * from exa_lab_material m where m.cd_exa_lab=1621 for update;

select * from material;

/*select * from exa_lab_material m, material t where m.cd_exa_lab=1621
and m.cd_material=t.cd_material;*/

--select * from material;
