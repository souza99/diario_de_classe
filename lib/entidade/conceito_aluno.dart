import 'dart:ffi';

import 'package:diario_de_classe/entidade/aluno.dart';
import 'package:diario_de_classe/entidade/conceito.dart';

class ConceitoAluno {
  late Long id;
  Aluno aluno;
  Conceito conceito;
  DateTime data;

  ConceitoAluno(this.aluno, this.conceito, this.data);

}