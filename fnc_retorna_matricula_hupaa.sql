CREATE OR REPLACE FUNCTION fnc_retorna_matricula_hupaa (pcd_atendimento dbamv.atendime.cd_atendimento%TYPE,

                                                        --     pcd_ori_ate     dbamv.atendime.cd_ori_ate%TYPE,
                                                               pcd_same        dbamv.cad_same.cd_cad_same%TYPE,

                                                             pcd_paciente    dbamv.paciente.cd_paciente%TYPE )

Return Varchar2 IS

  Cursor cCdCadSame Is

  Select cd_cad_same

    From dbamv.cad_same,

         dbamv.atendime

   WHERE /*ori_same.cd_ori_ate = atendime.cd_ori_ate

     AND */atendime.cd_atendimento = pcd_atendimento

     AND cad_same.cd_cad_same = pcd_same;

   vCdCadSame NUMBER;

   

   CURSOR cNrMatriculaSame (pCdCadSame number) IS

   SELECT nr_matricula_same

     FROM dbamv.same

    WHERE cd_paciente = pcd_paciente

      AND cd_cad_same = pCdCadSame;

    

   -- OP 14370: Pega a matrícula do paciente em qualquer SAME, para os casos em que a matrícula é única

   cursor cMatriculaGeral is

   SELECT nr_matricula_same

     FROM dbamv.same

    WHERE cd_paciente = pcd_paciente;

    vNrMatriculaSame NUMBER;

Begin

  if pcd_atendimento is not null then -- OP 14370

    OPEN cCdCadSame;

      FETCH cCdCadSame INTO vCdCadSame;

    CLOSE cCdCadSame;

    OPEN cNrMatriculaSame (vCdCadSame);

      FETCH cNrMatriculaSame INTO vNrMatriculaSame;

    CLOSE cNrMatriculaSame;

    return vNrMatriculaSame;

  else

    -- OP 14370: Pega a matrícula do paciente em qualquer SAME, para os casos em que a matrícula é única

    OPEN cMatriculaGeral;

      FETCH cMatriculaGeral INTO vNrMatriculaSame;

    CLOSE cMatriculaGeral;

    return vNrMatriculaSame;

  end if;



End fnc_retorna_matricula_hupaa;
