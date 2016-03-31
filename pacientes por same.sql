select sa1.cd_paciente Paciente,
       sa1.nr_matricula_same MAT_SAME,  
       sa2.nr_matricula_same MAT_RAIOX
       
       --sa1.cd_cad_same SAME01,
       --sa2.cd_cad_same SAME02, 
       --sa2.cd_paciente Paciente_RX
       
from (select sa.cd_cad_same, sa.nr_matricula_same, sa.cd_paciente from same sa where sa.cd_cad_same = 1) sa1, 
     (select sa.cd_cad_same, sa.nr_matricula_same, sa.cd_paciente from same sa where sa.cd_cad_same = 2) sa2 
where sa1.cd_paciente = sa2.cd_paciente 
order by sa1.cd_paciente;
