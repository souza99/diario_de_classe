import 'package:diario_de_classe/dto/usuarioDTO.dart';
import 'package:diario_de_classe/entidade%20copy/tipo_usuario.dart';

class AlunoDTO extends UsuarioDTO {
  AlunoDTO(super.nome, super.email, {tipoUsuario = TipoUsuario.aluno});

}