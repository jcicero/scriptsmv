select * from pw_documento_clinico t
where t.cd_objeto = 21
and t.cd_usuario = 'JOELMASS'
--AND T.CD_DOCUMENTO_CLINICO = 106789
AND TRUNC(T.DH_CRIACAO) >= '02/06/2014'
AND T.CD_ATENDIMENTO = 400478



select * from pw_documento_clinico t
where T.CD_ATENDIMENTO = 701127







SELECT  'SID:'||sid||' SPID:'||spid||' Programa:'||program hint, STATUS, USERNAME, OSUSER, MACHINE, PROGRAM, ACTION, LOCKWAIT 
FROM (select s.sid, p.spid, s.status, s.osuser, s.machine,  s.action, s.program, s.username,s.lockwait from v$process p , v$session s 
where p.addr = s.paddr 
and s.username is not null 
order by s.machine) 
--WHERE status in (#Status#) 
order by status, machine
