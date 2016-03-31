-- Inserindo usuários nas agendas
DECLARE
usuario   VARCHAR2(100) := 'CASSIASA';

cursor agendas is
      select ast.cd_agenda_central from agenda_central_ser_tipo ast, agenda_central ac
             where ast.cd_agenda_central = ac.cd_agenda_central
                   and ac.cd_unidade_atendimento = '5' --Unidade de atendimento (comentar se for pessoal do SAME)
                   and ac.cd_prestador = '446'  -- Prestador que precisa da configuração
				           and ast.cd_tip_mar = '2' -- adicionar != se for pessoal do SAME
                   and ac.tp_agenda = 'A'
                   and ac.dt_agenda between '20/09/2013' and '31/12/2013';
                   --and ac.cd_agenda_central in (11248); --Comentar essa linha para inserir em todas as agendas ambulatoriais 
                                                        --que não são do tipo de atendimento CONSULTA RETORNO - AMBULATORIO                  
BEGIN
    FOR agendasInserir in agendas
        LOOP
            begin
            execute immediate ('insert into agenda_central_usuario a ' ||
                               'values (:P1, :P2)')
               using            agendasInserir.cd_agenda_central, usuario;       
            exception 
               when others then null;
            end;          
        END LOOP;
END;
