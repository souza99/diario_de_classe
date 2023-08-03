import 'dart:ffi';

import 'package:diario_de_classe/entidade%20copy/tipo_usuario.dart';

class UsuarioDTO {
  late Long id;
  String nome;
  String email;
  late String senha;
  late TipoUsuario tipoUsuario;

  UsuarioDTO(this.nome, this.email);
  
}

