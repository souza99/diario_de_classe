import 'package:diario_de_classe/entidade%20copy/tipo_usuario.dart';
import 'package:diario_de_classe/entidade/usuario.dart';

class Aluno extends Usuario {
  Aluno(super.nome, super.email, {tipoUsuario = TipoUsuario.aluno});

}