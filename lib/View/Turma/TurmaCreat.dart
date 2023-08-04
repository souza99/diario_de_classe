import 'package:diario_de_classe/View/components/input_fild.dart';
import 'package:flutter/material.dart';

class TurmaCreat extends StatefulWidget {
  final dynamic? breed;

  TurmaCreat({this.breed});

  @override
  _TurmaCreatState createState() => _TurmaCreatState();
}

class _TurmaCreatState extends State<TurmaCreat> {
  List<String> _alunosList = ["Joao Pedro", "Andrei", "Lucas", "Ruam", "Toby"];
  int? _id;
  @override
  void initState() {
    super.initState();
    if (widget.breed != null) {
      setState(() {
        _id = widget.breed!.id;
      });
    }
  }

  final TextEditingController _name = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  Future<void> _saveBreed() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Object breed = {
        'id': _id,
        'name': _name,
      };

      Navigator.pop(context);
      // Adicione aqui a chamada para a função de salvar
      // passando a nota como parâmetro
    }
  }

  TextEditingController _dataNascimento = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de turma'),
      ),
      body: Container(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                MyInputField(
                  hint: "Insira o nome",
                  title: "Nome",
                  controller: _name,
                ),
                MyInputField(
                  hint: "Insira o nome do aluno",
                  title: "Nome do Aluno",
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: _alunosList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(_alunosList[index]),
                    );
                  },
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Adicionar Aluno'),
                ),
                ElevatedButton(
                  onPressed: _saveBreed,
                  child: Text('Cadastrar'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
