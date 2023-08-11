import 'dart:ffi';

import 'package:diario_de_classe/dto/alunoDTO.dart';
import 'package:diario_de_classe/dto/professorDTO.dart';
import 'package:diario_de_classe/dto/turmaDTO.dart';
import 'package:diario_de_classe/dto/turma_alunoDTO.dart';
import 'package:diario_de_classe/entidade/aluno.dart';
import 'package:diario_de_classe/entidade/professor.dart';
import 'package:diario_de_classe/entidade/turma.dart';
import 'package:diario_de_classe/portas/saida/i_aluno.dart';
import 'package:diario_de_classe/portas/saida/i_turma.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:diario_de_classe/main.dart';

void main() {
  test('Teste de salvar aluno', () {
    AlunoDTO alunoDTO = AlunoDTO("Aluno", "aluno@gmail.com");
    Aluno aluno = Aluno(nome: alunoDTO.nome, email: alunoDTO.email);
    IAluno iAluno = IAlunoFake();
    AlunoDTO alunoSalvo = aluno.salvar(alunoDTO, iAluno);
    AlunoDTO alunoEsperado = alunoDTO;
    alunoEsperado.id = 1;
    expect(alunoSalvo, alunoEsperado);
  });
}

class IAlunoFake implements IAluno {
  @override
  AlunoDTO salvar(AlunoDTO alunoDTO) {
    alunoDTO.id = 1;
    return alunoDTO;
  }

  
}