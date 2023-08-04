
import 'package:diario_de_classe/dto/tipo_usuario.dart';
import 'package:diario_de_classe/entidade/usuario.dart';

class Professor extends Usuario {
  Professor(super.nome, super.email, {tipoUsuario = TipoUsuario.professor});
}