import 'package:diario_de_classe/entidade/usuario.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class Banco {
  //global instance of the database
  static final Banco instance = Banco._init();

  static Database? _database;

  String? user;

  //private constructor
  Banco._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('notes.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    // apaga os dados quando o app é iniciado
    // await deleteDatabase(path);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final boolType = 'BOOLEAN NOT NULL';
    final intType = 'INTEGER NOT NULL';
    final textType = 'TEXT NOT NULL';
    final dateType = 'DATE NOT NULL';
    final nullIntType = 'INTEGER';
    final nulltextType = 'TEXT';
    final nulldateType = 'DATE';
    final nullboolType = 'BOOLEAN';
    final nullfloatType = 'FLOAT';

    await db.execute('''
CREATE TABLE $tableUsuario(
  ${UsuarioFields.id} $idType,
  ${UsuarioFields.nome} $nulltextType,
  ${UsuarioFields.email} $nulltextType,
  ${UsuarioFields.tipoUsuario} $textType,
  ${UsuarioFields.senha} $textType
)
''');
  }

  Future<Object> create(Object object, String tableName) async {
    try {
      final db = await instance.database;

      if (tableName == 'turmas') {
        Usuario gado = object as Usuario;
        var id;
        if (gado.id != null) {
          id = await db.update('usuario', gado.toJson(),
              where: '${UsuarioFields.id} = ?', whereArgs: [gado.id]);
        } else {
          id = await db.insert('usuario', gado.toJson());
        }
        return gado.copy(id: id);
      } else {
        return [];
      }
    } catch (e) {
      print(e);
      return Exception("Algo deu errado");
    }
  }

  static Future<List<Map<String, dynamic>>> query() async {
    final db = await instance.database;
    print("Query function called");
    return await db!.query("task");
  }

  // Future<Object> readNote(String itemString, String argment) async {
  //   final db = await instance.database;

  //   if (itemString == "usuario") {
  //     final searchQuery = '%$argment%';
  //     final maps = await db.query(
  //       tableUsuario,
  //       columns: UsuarioFields.values,
  //       where: "${UsuarioFields.name} LIKE ?",
  //       whereArgs: [searchQuery],
  //     );
  //     final users = maps.map((userMap) => Usuario.fromJson(userMap)).toList();

  //     if (maps.isNotEmpty) {
  //       return users;
  //     } else {
  //       return [];
  //     }
  //   } else {
  //       return [];
  //   }
  // }

  static markTaskCompleted(int id) async {
    final db = await instance.database;
    return await db!.rawUpdate('''
      UPDATE task
      SET isCompleted = 1
      WHERE _id = $id 
    ''');
  }

  Future<List<Object>> receveSqlQuery(String sqlValeus) async {
    try {
      final db = await instance.database;

      final result = await db.rawQuery(sqlValeus);
      List<Map<String, dynamic>> resultList = result.toList();

      return resultList;
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
