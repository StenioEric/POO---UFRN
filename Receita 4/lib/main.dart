import 'package:flutter/material.dart';

void main() {
  MyApp app = MyApp();
  runApp(app);
}

// Classe principal da aplicação
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Dicas"),
        ),
        body: DataBodyWidget(
          objects: dataObjects,
        ),
        bottomNavigationBar: NewNavBar(),
      ),
    );
  }
}

// Widget para a barra de navegação inferior
class NewNavBar extends StatelessWidget {
  NewNavBar();

  // Função para lidar com o toque em um item da barra de navegação
  void botaoFoiTocado(int index) {
    print("Tocaram no botão $index");
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      // Define a função a ser chamada quando um item é tocado
      onTap: botaoFoiTocado,
      // Define os itens da barra de navegação
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

// Widget para exibir os dados em forma de tabela
class DataBodyWidget extends StatelessWidget {
  // Lista de objetos de dados
  final List<Map<String, String>> objects;

  // Construtor
  DataBodyWidget({required this.objects});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columns: [
          // Define as colunas da tabela
          DataColumn(label: Text("Nome")),
          DataColumn(label: Text("Estilo")),
          DataColumn(label: Text("IBU")),
        ],
        rows: objects.map(
          (obj) => DataRow(
            cells: [
              // Células da tabela
              DataCell(Text(obj["name"] ?? "")),
              DataCell(Text(obj["style"] ?? "")),
              DataCell(Text(obj["ibu"] ?? "")),
            ],
          ),
        ).toList(),
      ),
    );
  }
}

// Lista de objetos de dados
var dataObjects = [
  {
    "name": "La Fin Du Monde",
    "style": "Bock",
    "ibu": "65",
  },
  {
    "name": "Sapporo Premiume",
    "style": "Sour Ale",
    "ibu": "54",
  },
  {
    "name": "Duvel",
    "style": "Pilsner",
    "ibu": "82",
  },
];
