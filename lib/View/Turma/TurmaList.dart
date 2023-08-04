import 'package:diario_de_classe/View/Turma/TurmaCreat.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class TurmaList extends StatefulWidget {
  const TurmaList({super.key});

  @override
  State<TurmaList> createState() => _TurmaListState();
}

class _TurmaListState extends State<TurmaList> {
  List _breeds = [
    {'name': 'tirma 1 ano'},
    {'name': 'tirma 2 ano'}
  ];

  TextEditingController _filterInput = TextEditingController();

  _fetchDataBreed() async {
    final breeds = [];
    setState(() {
      _breeds = [
        {'name': 'tirma 1 ano'},
        {'name': 'tirma 2 ano'}
      ];
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchDataBreed();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context, false),
        ),
        title: Text('Lista de turmas'),
      ),
      body: ListView(
        children: [
          Container(
            decoration: BoxDecoration(),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 35,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 209, 203, 203),
                            borderRadius:
                                BorderRadius.all(Radius.circular(6.0)),
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Procurar...",
                              border: InputBorder.none,
                              contentPadding:
                                  EdgeInsets.only(left: 15, top: -10),
                            ),
                            controller: _filterInput,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        child: Text("Filtrar!"),
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.black,
                          primary:
                              Color.fromARGB(255, 31, 158, 218), //<-- SEE HERE
                        ),
                        onPressed: () async {
                          null;
                        },
                      ),
                    ],
                  ),
                ),
                buildTurmaList(),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TurmaCreat()),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Color.fromARGB(255, 34, 0, 187),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  buildTurmaList() {
    return Card(
      child: Column(
        children: [
          ListTile(
            visualDensity: VisualDensity.compact,
            tileColor: Colors.grey[300],
            title: Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.18),
              child: Text(
                'Nome',
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'excluir',
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 16),
                Text(
                  'editar',
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 1, horizontal: 40),
          ),
          ..._breeds
              .asMap()
              .map(
                (index, breed) => MapEntry(
                  index,
                  Container(
                    color: index % 2 == 0
                        ? Color.fromARGB(167, 103, 235, 235)
                        : Color.fromARGB(255, 84, 181, 194),
                    child: ListTile(
                      //leading: Icon(Icons.add_a_photo),
                      title: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  breed['name'],
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 0, 0, 0)),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Row(
                              children: [
                                IconButton(
                                  onPressed: () => {},
                                  icon: Icon(Icons.edit),
                                  color: Color.fromARGB(255, 20, 122, 16),
                                ),
                                IconButton(
                                  onPressed: () => {},
                                  icon: Icon(Icons.delete),
                                  color: Color.fromARGB(255, 189, 18, 18),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
              .values
              .toList(),
        ],
      ),
    );
  }
}
