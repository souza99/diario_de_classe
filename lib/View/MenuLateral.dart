import 'package:diario_de_classe/View/LancamentoNota/LancamentoNotas.dart';
import 'package:diario_de_classe/View/Turma/TurmaList.dart';
import 'package:flutter/material.dart';

class MenuLateral extends StatefulWidget {
  final farm;
  const MenuLateral({Key? key, required this.farm}) : super(key: key);
  @override
  State<MenuLateral> createState() => _MenuLateralState();
}

class _MenuLateralState extends State<MenuLateral> {
  var _farm;

  @override
  void initState() {
    super.initState();
    _farm = widget.farm;
  }

  // Lista de quadrados com ícone
  final List<Map<String, dynamic>> boiItems = [
    {'title': 'Lançamento de conseitos', 'icon': Icons.calendar_month_sharp},
    {'title': 'Turmas', 'icon': Icons.twenty_four_mp},
    {'title': 'Ver conseitos', 'icon': Icons.note_sharp},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Diario'),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('Joao P.'),
              accountEmail: Text('seu@email.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage:
                    NetworkImage('https://via.placeholder.com/150x150'),
              ),
            ),
            ListTile(
              title: Text('Tela 1'),
              onTap: () {
                // Código para navegar para outra tela
              },
            ),
            ListTile(
              title: Text('Página 3'),
              onTap: () {
                // Código para navegar para outra tela
              },
            ),
          ],
        ),
      ),
      body: Container(
        child: Center(
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Defina o número de colunas desejado
            ),
            itemCount: boiItems.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  // Ação a ser executada quando o quadrado for clicado
                  _onBoiItemClicked(index);
                },
                child: Card(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          boiItems[index]['icon'],
                          size: 50,
                        ),
                        SizedBox(height: 10),
                        Text(
                          boiItems[index]['title'],
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  void _onBoiItemClicked(int index) {
    // Ação a ser executada quando um quadrado for clicado
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LancamentoNota()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => TurmaList()),
        );
        break;
      case 2:
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => GadoList(farm: _farm)),
        // );
        break;
      // Adicione mais casos de acordo com os itens adicionados acima
      default:
        // Caso nenhum tratamento específico seja necessário
        break;
    }
  }
}
