import 'package:diario_de_classe/adaptadores/salvar_turma_local.dart';
import 'package:diario_de_classe/dto/turmaDTO.dart';
import 'package:diario_de_classe/entidade/professor.dart';
import 'package:diario_de_classe/entidade/turma.dart';
import 'package:diario_de_classe/portas/saida/i_turma.dart';

class TurmaUserCase {

  final TurmaDTO turmaDTO;

  late ITurma iTurmaLocal = SalvarTurmaLocal();

  late Turma turma;

  TurmaUserCase(this.turmaDTO);

  String salvarTurmaLocal(alunos) {
    turma = Turma(turmaDTO.nome, turmaDTO.professor);
    return turma.salvar(alunos, iTurmaLocal);
  }
}