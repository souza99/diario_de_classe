import 'package:diario_de_classe/dto/usuarioDTO.dart';
import 'package:diario_de_classe/entidade%20copy/tipo_usuario.dart';

class ProfessorDTO extends UsuarioDTO {
  ProfessorDTO(super.nome, super.email, {tipoUsuario = TipoUsuario.professor});
}