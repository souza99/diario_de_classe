import 'dart:ffi';

import 'package:diario_de_classe/entidade/aluno.dart';
import 'package:diario_de_classe/entidade/turma.dart';

class TurmaAluno {
  late Long id;
  Aluno aluno;
  Turma turma;

  TurmaAluno(this.aluno, this.turma);

  
}