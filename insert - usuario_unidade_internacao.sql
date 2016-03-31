--Insert para usuários do almoxarifado
DECLARE
cod_setor NUMBER   := 1;
usuario   VARCHAR2(100) := 'EDUARDOJM';
begin
     WHILE cod_setor <= 110 LOOP
       begin
        execute immediate ('insert into usuario_unid_int u ' ||
                           '  values (null, :P1, :P2)')
               using       usuario, cod_setor;       
        exception 
          when others then null;
        end;          
        cod_setor := cod_setor + 1;
     END LOOP;     
END;
-------------------------------------------------------------------------------------------------------------------------------------------------
--insert para usuários da farmácia
--unidades de internação e setores
DECLARE
type VETOR is varray(13) of number;
vetorSetores VETOR;
uni_internacao NUMBER   := 1;
setor          NUMBER;
usuario   VARCHAR2(100) := 'EMANUELLACN';
begin
     vetorSetores := VETOR(25, 33, 42, 43, 45, 51, 56, 57, 59, 72, 73, 93, 95);     
     for s in 1..13 loop
       begin
         setor := vetorSetores(s);
         execute immediate ('insert into usuario_unid_int u values (:P1, :P2, :P3)')
                 using       '', usuario, setor;
         exception 
           when others then null;
         end;       
     end loop;          
     WHILE uni_internacao <= 10 LOOP
       begin
         if (uni_internacao = 1) then setor := 65; end if;
         if (uni_internacao = 2) or ((uni_internacao = 3)) then setor := 62; end if;
         if (uni_internacao = 4) then setor := 63; end if;
         if (uni_internacao = 5) then setor := 66; end if;
         if (uni_internacao = 6) then setor := 64; end if;
         if (uni_internacao = 7) then setor := 68; end if;
         if (uni_internacao = 8) then setor := 69; end if;
         if (uni_internacao = 9) then setor := 70; end if;
         if (uni_internacao = 10) then setor := 58; end if;
        execute immediate ('insert into usuario_unid_int u values (:P1, :P2, :P3)')
               using       uni_internacao, usuario, setor ;       
        exception 
          when others then null;
        end;          
        uni_internacao := uni_internacao + 1;
     END LOOP;     
END;
COMMIT;
select * from usuario_unid_int u where u.cd_id_usuario = 'EDUARDOJM';
--select * from usuario_unid_int u where u.cd_id_usuario LIKE '%TANIABBR%';
--select * from dbasgu.usuarios u where u.cd_usuario like '%ANDRESSARRSS%';
