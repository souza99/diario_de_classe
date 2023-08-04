import 'package:diario_de_classe/dto/tipo_usuario.dart';
import 'package:diario_de_classe/dto/usuarioDTO.dart';

class AlunoDTO extends UsuarioDTO {
  AlunoDTO(super.nome, super.email, {tipoUsuario = TipoUsuario.aluno});

}