import 'dart:ffi';

import 'package:diario_de_classe/dto/alunoDTO.dart';
import 'package:diario_de_classe/dto/professorDTO.dart';
import 'package:diario_de_classe/dto/turmaDTO.dart';
import 'package:diario_de_classe/dto/turma_alunoDTO.dart';
import 'package:diario_de_classe/entidade/aluno.dart';
import 'package:diario_de_classe/entidade/professor.dart';
import 'package:diario_de_classe/entidade/turma.dart';
import 'package:diario_de_classe/portas/saida/i_turma.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:diario_de_classe/main.dart';

void main() {
  test('A turma deve ser criada com pelo menos 1 aluno, criar a turma e turma_aluno juntos na criação de turma', () {
    var professor = ProfessorDTO("Professor", "professor@gmail.com");
    
    professor.id = 1;
    var turma = Turma("Turma A", professor);
    List<AlunoDTO> alunos = [];
    ITurma iTurma = ITurmaFake();

    var resposta = turma.salvar(alunos, iTurma);
    expect(resposta, "A turma deve ter pelo menos 1 aluno para ser cadastrada");

    var aluno = AlunoDTO("Aluno", "aluno@gmail.com");
    aluno.id = 1;
    alunos.add(aluno);
    resposta = turma.salvar(alunos, iTurma);
    expect(resposta, "Turma cadastrada com sucesso");
  });
}

class ITurmaFake implements ITurma {
  @override
  int salvarTurma(TurmaDTO turmaDTO) {
    int id = 1;
    return id;
  }

  @override
  int salvarTurmaAluno(TurmaAlunoDTO turmaAlunoDTO) {
    int id = 1;
    return id;
  }
  
}