import 'dart:ffi';

import 'package:diario_de_classe/dto/alunoDTO.dart';
import 'package:diario_de_classe/dto/turmaDTO.dart';

class TurmaAlunoDTO {
  late Long id;
  AlunoDTO aluno;
  TurmaDTO turma;

  TurmaAlunoDTO(this.aluno, this.turma);
}