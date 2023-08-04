import 'dart:ffi';
import 'dart:js_interop';

import 'package:diario_de_classe/dto/alunoDTO.dart';
import 'package:diario_de_classe/dto/professorDTO.dart';
import 'package:diario_de_classe/dto/turmaDTO.dart';
import 'package:diario_de_classe/dto/turma_alunoDTO.dart';
import 'package:diario_de_classe/entidade/aluno.dart';
import 'package:diario_de_classe/entidade/professor.dart';
import 'package:diario_de_classe/portas/saida/i_turma.dart';

class Turma {
  late Long id;
  String nome;
  Professor professor;

  Turma(this.nome, this.professor);

  salvar(List<AlunoDTO> alunos, ITurma iTurma) {
    if (alunos.isEmpty) return "A turma deve ter pelo menos 1 aluno para ser cadastrada";
    ProfessorDTO professorDTO = ProfessorDTO(professor.nome, professor.email);
    professorDTO.id = professor.id;
    TurmaDTO turmaDTO = TurmaDTO(nome, professorDTO);
    Long idTurma = iTurma.salvarTurma(turmaDTO);
    if (!idTurma.isDefinedAndNotNull) return "Ocorreu um erro as salvar a turma";
    turmaDTO.id = idTurma;
    String retorno = '';
    Long idTurmaAluno;
    for (AlunoDTO aluno in alunos) {
      TurmaAlunoDTO turmaAlunoDTO = TurmaAlunoDTO(aluno, turmaDTO);
      idTurmaAluno = iTurma.salvarTurmaAluno(turmaAlunoDTO);
      if (!idTurma.isDefinedAndNotNull) {
        if (retorno.isEmpty) {
          retorno = "Ocorreu um erro ao vincular o(s) seguinte(s) aluno(s) a turma: ";
        }
        retorno += '${turmaAlunoDTO.turma.nome}, ';
      }
      if (retorno.isEmpty) retorno = "Turma cadastrada com sucesso";

      return retorno;
    }
  }
  
}