import 'dart:ffi';

import 'package:diario_de_classe/dto/tipo_usuario.dart';


class Usuario {
  late Long id;
  String nome;
  String email;
  late String senha;
  late TipoUsuario tipoUsuario;

  Usuario(this.nome, this.email);
  
}

