import 'dart:ffi';

import 'package:diario_de_classe/dto/tipo_usuario.dart';


class UsuarioDTO {
  late int id;
  String nome;
  String email;
  late String senha;
  late TipoUsuario tipoUsuario;

  UsuarioDTO(this.nome, this.email);
  
}

