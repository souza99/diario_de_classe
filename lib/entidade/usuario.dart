import 'dart:ffi';

import 'package:diario_de_classe/dto/tipo_usuario.dart';

class UsuarioFields {
  static final String id = "_id";
  static final String nome = "nome";
  static final String email = "email";
  static final String tipoUsuario = "tipoUsuario";
  static final String senha = 'senha';

}

final String tableUsuario = 'usuario';

class Usuario {
  final int? id;
  final String? nome;
  final String? email;
  final String? senha;
  final TipoUsuario? tipoUsuario;

  const Usuario({
    this.senha,
    this.id,
    this.nome,
    this.email,
    this.tipoUsuario,
  });

  Map<String, Object?> toJson() => {
        UsuarioFields.id: id,
        UsuarioFields.nome: nome,
        UsuarioFields.email: email,
        UsuarioFields.tipoUsuario: tipoUsuario,
      };

  static Usuario fromJson(Map<String, Object?> json) => Usuario(
        id: json[UsuarioFields.id] as int,
        nome: json[UsuarioFields.nome] as String,
        email: json[UsuarioFields.email] as String,
        tipoUsuario: json[UsuarioFields.tipoUsuario] as TipoUsuario,
      );

  Usuario copy({
    int? id,
    String? nome,
    String? email,
    TipoUsuario? tipoUsuario,
  }) =>
      Usuario(
        id: id ?? this.id,
        nome: nome ?? this.nome,
        email: email ?? this.email,
        tipoUsuario: tipoUsuario ?? this.tipoUsuario,
      );
}
