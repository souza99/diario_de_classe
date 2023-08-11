import 'package:diario_de_classe/dto/tipo_usuario.dart';
import 'package:diario_de_classe/entidade/usuario.dart';
import 'package:diario_de_classe/portas/saida/i_aluno.dart';

import '../dto/alunoDTO.dart';

class Aluno extends Usuario {
  // Aluno(super.nome, super.email, {tipoUsuario = TipoUsuario.aluno});

   AlunoDTO salvar(AlunoDTO aluno, IAluno iAluno) {
    if (aluno.nome.isEmpty)
      throw Exception(
          "O aluno precisa possuir nome para ser cadastrado");
    return iAluno.salvar(aluno);
  }
}