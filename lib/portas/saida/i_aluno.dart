import 'package:diario_de_classe/dto/alunoDTO.dart';

abstract class IAluno {
  AlunoDTO salvar(AlunoDTO alunoDTO);
}