select p.nm_paciente
       ,ex.nm_exa_lab
       ,gm.ds_germe
       ,am.nm_antimicrob
       ,decode(ic.tp_resultado
       ,'N','Não testado'
       ,'R','Resistente'
       ,'M','Intermediário'
       ,'S','Sensível'
       ,'P','Positivo'
       ,'G','Negativo'
       ,'E','Sinergismo Sensível'
       ,'I','Sinergismo Resistente') 
from cultura_manual t
    ,dbamv.atendime a
    ,dbamv.paciente p 
    ,dbamv.germes_cult_manual g
    ,dbamv.exa_lab ex
    ,dbamv.germes gm
    ,dbamv.antimicrob am
    ,dbamv.itcultura_manual ic
where t.cd_atendimento = a.cd_atendimento
and a.cd_paciente = p.cd_paciente
and g.cd_cultura_manual = t.cd_cultura_manual
and ex.cd_exa_lab = t.cd_exa_lab
and gm.cd_germes = g.cd_germes
and ic.cd_cultura_manual = t.cd_cultura_manual
and gm.cd_germes = ic.cd_germes
and am.cd_antimicrob = ic.cd_antimicrob
and t.cd_atendimento = 384711









