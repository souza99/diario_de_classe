import 'dart:ffi';

import 'package:diario_de_classe/dto/turmaDTO.dart';
import 'package:diario_de_classe/dto/turma_alunoDTO.dart';

abstract class ITurma {
  Long salvarTurma(TurmaDTO turmaDTO);
  
  Long salvarTurmaAluno(TurmaAlunoDTO turmaAlunoDTO);
}