import 'dart:ffi';

import 'package:diario_de_classe/dto/alunoDTO.dart';
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
    var professor = Professor("Professor", "professor@gmail.com");
    var turma = Turma("Turma A", professor);
    List<AlunoDTO> alunos = [];
    ITurma iTurma = ITurmaFake();

    var resposta = turma.salvar(alunos, iTurma);
    expect(resposta, "A turma deve ter pelo menos 1 aluno para ser cadastrada");

    var aluno = AlunoDTO("Aluno", "aluno@gmail.com");
    alunos.add(aluno);
    resposta = turma.salvar(alunos, iTurma);
    expect(resposta, "Turma cadastrada com sucesso");
  });
}

class ITurmaFake implements ITurma {
  @override
  Long salvarTurma(TurmaDTO turmaDTO) {
    Long id = 1 as Long;
    return id;
  }

  @override
  Long salvarTurmaAluno(TurmaAlunoDTO turmaAlunoDTO) {
    Long id = 1 as Long;
    return id;
  }
  
}