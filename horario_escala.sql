select * from escala_central_horario;

select * from escala_central e where e.qt_horario is not null
and e.tp_escala = 'A' --for update

UPDATE escala_central e 
SET e.qt_horario=1
WHERE e.qt_horario is null
and e.tp_escala = 'A'
