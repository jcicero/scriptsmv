--Inserindo usuários na escala
DECLARE
usuario   VARCHAR2(100) := 'ANDREAMF';

cursor escalas is
      select ast.cd_escala_central from escala_central_ser_tipo ast, escala_central ec
             where ast.cd_escala_central = ec.cd_escala_central
                   and ec.cd_unidade_atendimento = '7' --Unidade de atendimento (comentar se for pessoal do SAME)
                   and ec.cd_prestador = '435'  -- Prestador que precisa da configuração
                   and ast.cd_tip_mar = '16'  -- adicionar != se for pessoal do SAME
                   and ec.tp_escala = 'A';
                   --and ec.cd_escala_central in (283); --Comentar essa linha para inserir em todas as escalas ambulatoriais 
                                                      --que não são do tipo de atendimento CONSULTA RETORNO - AMBULATORIO
BEGIN
    FOR escalasInserir in escalas
        LOOP
            begin
            execute immediate ('insert into escala_central_usuario a ' ||
                               'values (:P1, :P2)')
               using            escalasInserir.cd_escala_central, usuario;       
            exception 
               when others then null;
            end;          
        END LOOP;
END;
