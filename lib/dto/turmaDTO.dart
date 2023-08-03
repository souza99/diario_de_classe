import 'dart:ffi';

import 'package:diario_de_classe/dto/professorDTO.dart';

class TurmaDTO {
  late Long id;
  String nome;
  ProfessorDTO professor;

  TurmaDTO(this.nome, this.professor);
}