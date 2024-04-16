import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart'; // Importa os hooks do Flutter

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

class NewNavBar extends HookWidget {
  NewNavBar();

  void buttonTapped(int index) {
    print("Tocaram no botão $index");
  }

  @override
  Widget build(BuildContext context) {
    
    var state = useState(-1);

    print("no build da classe NewNavBar ${state.value}");

    if (state.value >= 0) {
      return BottomNavigationBar(
        selectedItemColor: Color.fromARGB(255, 150, 145, 145),
        currentIndex: state.value,
        onTap: (index) {
          state.value = index;
        },
        items: const [
          BottomNavigationBarItem(
            label: "Cafés",
            icon: Icon(Icons.coffee_outlined),
            // backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            label: "Cervejas",
            icon: Icon(Icons.local_drink_outlined),
            // backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            label: "Nações",
            icon: Icon(Icons.flag_outlined),
            // backgroundColor: Colors.black,
          ),
        ],
      );
    } else {
      return BottomNavigationBar(
        onTap: (index) {
          state.value = index;
        },
        selectedItemColor: Color.fromARGB(255, 139, 136, 136),
        items: const [
          BottomNavigationBarItem(
            label: "Cafés",
            icon: Icon(Icons.coffee_outlined),
            // backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            label: "Cervejas",
            icon: Icon(Icons.local_drink_outlined),
            // backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            label: "Nações",
            icon: Icon(Icons.flag_outlined),
            // backgroundColor: Colors.black,
          ),
        ],
      );
    }
  }
}