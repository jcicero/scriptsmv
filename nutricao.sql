select 
distinct (p.cd_paciente)    Prontuario,
A.CD_ATENDIMENTO Atendimento, 
p.nm_paciente    Paciente,
p.ds_endereco    Endereco,
p.nm_bairro      Bairro,
c.nm_cidade      Cidade,
a.CD_CID         CID
from 
atendime a,
paciente p,
cidade   c
where substr(a.cd_cid,1,3) in ('C06', 'C15', 'C16', 'C02', 'C18', 'C25', 'C22', 'C20', 'C17') and
a.cd_paciente     = p.cd_paciente                       and
p.cd_cidade       = c.cd_cidade                         and
a.tp_atendimento  = 'I'                                 and
a.dt_atendimento between '01/01/2014' and '31/12/2014'
order by p.cd_paciente



 
