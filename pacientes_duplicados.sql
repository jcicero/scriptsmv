SELECT 
     distinct(PACIENTE.nm_usuario) USUARIO,
   --  usu.cd_usuario,
     usu.nm_usuario NOME,
     usu.ds_observacao SETOR,
     count(PACIENTE.nm_usuario )  TOTAL
FROM DBAMV.PACIENTE PACIENTE, dbasgu.usuarios usu
  ,( SELECT
                COUNT( to_char(Paciente.Dt_Nascimento,'yyyymmdd')||Paciente.Nm_Paciente||Paciente.Nm_Mae ) VERIF,
                to_char(Paciente.Dt_Nascimento,'yyyymmdd')||Paciente.Nm_Paciente||Paciente.Nm_Mae Ds_Completa,
                PACIENTE.DS_CHECAPAC        DS_CHECAPAC
         FROM
                DBAMV.PACIENTE PACIENTE, DBAMV.PACIENTE PACI
      WHERE
                PACIENTE.DS_CHECAPAC = PACI.DS_CHECAPAC
      AND   PACIENTE.CD_PACIENTE <> PACI.CD_PACIENTE

     GROUP BY to_char(Paciente.Dt_Nascimento,'yyyymmdd')||Paciente.Nm_Paciente||Paciente.Nm_Mae,
                PACIENTE.DS_CHECAPAC

       HAVING COUNT(to_char(Paciente.Dt_Nascimento,'yyyymmdd')||Paciente.Nm_Paciente||Paciente.Nm_Mae) > 1
   )   V
WHERE to_char(Paciente.Dt_Nascimento,'yyyymmdd')||Paciente.Nm_Paciente||Paciente.Nm_Mae = V.Ds_Completa
and paciente.nm_usuario = usu.cd_usuario
and usu.sn_ativo='S'
and paciente.dt_cadastro > '01/01/2013'
GROUP BY PACIENTE.NM_USUARIO,  usu.cd_usuario,  usu.nm_usuario, usu.ds_observacao  ORDER BY  TOTAL DESC

--select * from dbasgu.usuarios u where u.cd_usuario='MARCIOLSF'
