import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart'; // Importa os hooks do Flutter

var dataObjects = []; // Lista vazia para armazenar os objetos de dados

void main() {
  MyApp app = MyApp(); // Instancia o aplicativo
  runApp(app); // Inicia o aplicativo
}

// Aplicativo principal
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Constrói a interface do aplicativo
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Dicas"),
        ),
        body: DataTableWidget(jsonObjects: dataObjects), // Exibe a tabela de dados
        bottomNavigationBar: NewNavBar(), // Exibe a barra de navegação inferior
      ),
    );
  }
}

// Barra de navegação inferior
class NewNavBar extends StatefulWidget {
  @override
  NewNavBar2 createState() => NewNavBar2(); // Cria uma instância de NewNavBar2
}

// Estado da barra de navegação inferior
class NewNavBar2 extends State<NewNavBar> {
  int state = 1; // Estado inicial

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (index) {
        // Atualiza o estado ao clicar em um item da barra de navegação
        setState(() {
          state = index;
        });
      },
      currentIndex: state, // Índice do item atualmente selecionado
      items: const [
        BottomNavigationBarItem(
          label: "Cafés",
          icon: Icon(Icons.coffee_outlined),
        ),
        BottomNavigationBarItem(
          label: "Cervejas",
          icon: Icon(Icons.local_drink_outlined),
        ),
        BottomNavigationBarItem(
          label: "Nações",
          icon: Icon(Icons.flag_outlined),
        ),
      ],
    );
  }
}

// Tabela de dados
class DataTableWidget extends StatelessWidget {
  final List jsonObjects; // Lista de objetos JSON

  DataTableWidget({this.jsonObjects = const []}); // Construtor

  @override
  Widget build(BuildContext context) {
    var columnNames = ["Nome", "Estilo", "IBU"]; // Nomes das colunas
    var propertyNames = ["name", "style", "ibu"]; // Nomes das propriedades

    return DataTable(
      columns: columnNames
          .map(
            (name) => DataColumn(
              label: Expanded(
                child: Text(
                  name,
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
            ),
          )
          .toList(),
      rows: jsonObjects
          .map(
            (obj) => DataRow(
              cells: propertyNames
                  .map(
                    (propName) => DataCell(
                      Text(obj[propName]),
                    ),
                  )
                  .toList(),
            ),
          )
          .toList(),
    );
  }
}

// Código usado na primeira parte da receita

// class NewNavBar extends HookWidget {
//   NewNavBar();

//   void buttonTapped(int index) {
//     print("Tocaram no botão $index");
//   }

//   @override
//   Widget build(BuildContext context) {
//     print("no build da classe NewNavBar");
//     var state = useState(1);

//     return BottomNavigationBar(
//         onTap: (index) {
//           state.value = index;
//         },
//         currentIndex: state.value,
//         items: const [
//           BottomNavigationBarItem(
//             label: "Cafés",
//             icon: Icon(Icons.coffee_outlined),
//           ),
//           BottomNavigationBarItem(
//             label: "Cervejas",
//             icon: Icon(Icons.local_drink_outlined),
//           ),
//           BottomNavigationBarItem(
//             label: "Nações",
//             icon: Icon(Icons.flag_outlined),
//           ),
//         ]);
//   }
// }