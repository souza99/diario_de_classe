import 'package:diario_de_classe/dto/tipo_usuario.dart';
import 'package:diario_de_classe/dto/usuarioDTO.dart';

class ProfessorDTO extends UsuarioDTO {
  ProfessorDTO(super.nome, super.email, {tipoUsuario = TipoUsuario.professor});
}
