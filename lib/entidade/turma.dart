import 'dart:ffi';

import 'package:diario_de_classe/dto/alunoDTO.dart';
import 'package:diario_de_classe/dto/professorDTO.dart';
import 'package:diario_de_classe/dto/turmaDTO.dart';
import 'package:diario_de_classe/dto/turma_alunoDTO.dart';
import 'package:diario_de_classe/entidade/aluno.dart';
import 'package:diario_de_classe/entidade/professor.dart';
import 'package:diario_de_classe/portas/saida/i_turma.dart';
import 'package:get/get.dart';

class Turma {
  late int id;
  String nome;
  ProfessorDTO professorDTO;

  Turma(this.nome, this.professorDTO);

  String salvar(List<AlunoDTO> alunos, ITurma iTurma) {
    if (alunos.isEmpty) return "A turma deve ter pelo menos 1 aluno para ser cadastrada";
    TurmaDTO turmaDTO = TurmaDTO(nome, professorDTO);
    int idTurma = iTurma.salvarTurma(turmaDTO);
    turmaDTO.id = idTurma;
    String retorno = '';
    int idTurmaAluno;
    for (AlunoDTO aluno in alunos) {
      TurmaAlunoDTO turmaAlunoDTO = TurmaAlunoDTO(aluno, turmaDTO);
      idTurmaAluno = iTurma.salvarTurmaAluno(turmaAlunoDTO);
      if (idTurmaAluno.isBlank!) {
        if (retorno.isEmpty) {
          retorno = "Ocorreu um erro ao vincular o(s) seguinte(s) aluno(s) a turma: ";
        }
        retorno += '${turmaAlunoDTO.turma.nome}, ';
      }
    }
    if (retorno.isEmpty) retorno = "Turma cadastrada com sucesso";
    return retorno;
  }
  
}