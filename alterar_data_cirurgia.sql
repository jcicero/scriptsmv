select * from aviso_cirurgia a where a.cd_aviso_cirurgia = '3549' for update --in (3675,3677,3678,3679,3680,3683,3685,3687) and a.tp_situacao='C' for update;

select *
  from aviso_cirurgia a
 where a.cd_aviso_cirurgia in
       (3811)
   and a.tp_situacao = 'C'
   for update;

select a.cd_aviso_cirurgia, vl_tempo_previsto
  from aviso_cirurgia a
 where a.cd_aviso_cirurgia in
       (677)
   and a.tp_situacao = 'C'
   for update;
/*select * from aviso_cirurgia a where a.cd_aviso_cirurgia = '3460'

select * from aviso_cirurgia b where b.cd_paciente = '705671'-- for update;

select * from cirurgia_aviso c where c.cd_aviso_cirurgia = '1806' for update

select * from aviso_cirurgia d where d.cd_atendimento = '7295';*/

--1995

--1  1995  9/12/2012 4:00:00 PM    L  C  GUSTAVO MATHEUS MOREIRA GONZAGA  88624980  M  9/12/2012 1:00:00 AM  9/12/2012 3:48:36 PM						571791					16		3	1								VILMAMOL	N	10			N		10	A	1	"
--MV2000: REALIZADA UMA TRANSFERÊNCIA DE CIRURGIA EM: 28/06/2012 09:03 - As guias associadas ao Aviso de Cirurgia foram canceladas em consequência ao cancelamento do Aviso de Cirurgia associado às mesmas."	9/12/2012 4:00:00 PM	S		VILMAMOL		9/12/2012 4:00:00 PM		<Long>		N	N		9/14/2012 4:00:00 PM	9/12/2012 5:20:00 PM				N	N						N			
