import 'dart:ffi';

import 'package:diario_de_classe/dto/alunoDTO.dart';
import 'package:diario_de_classe/dto/conceitoDTO.dart';

class ConceitoAlunoDTO {
  late int id;
  AlunoDTO aluno;
  ConceitoDTO conceito;
  DateTime data;

  ConceitoAlunoDTO(this.aluno, this.conceito, this.data);

}