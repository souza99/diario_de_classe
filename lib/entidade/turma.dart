import 'dart:ffi';

import 'package:diario_de_classe/entidade/professor.dart';

class Turma {
  late Long id;
  String nome;
  Professor professor;

  Turma(this.nome, this.professor);
}