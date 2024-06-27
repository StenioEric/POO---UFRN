import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_hooks/flutter_hooks.dart';
import 'dart:convert';

class DataService {
  final ValueNotifier<List> tableStateNotifier = ValueNotifier([]);
  final ValueNotifier<List<String>> columnNamesNotifier = ValueNotifier([]);
  final ValueNotifier<List<String>> propertyNamesNotifier = ValueNotifier([]);
  final ValueNotifier<int> tamanho = ValueNotifier(5);

  void carregar(int index) {
    final funcoes = [carregarCafes, carregarCervejas, carregarNacoes];
    funcoes[index]();
  }

  Future<void> carregarCafes() async {
    var coffeeUri = Uri(
      scheme: 'https',
      host: 'random-data-api.com',
      path: 'api/coffee/random_coffee',
      queryParameters: {'size': tamanho.value.toString()},
    );

    var jsonString = await http.read(coffeeUri);
    var coffeeJson = jsonDecode(jsonString);

    tableStateNotifier.value = coffeeJson;
    columnNamesNotifier.value = ["Nome", "Origem", "Variedade"];
    propertyNamesNotifier.value = ["blend_name", "origin", "variety"];
  }

  Future<void> carregarCervejas() async {
    var beersUri = Uri(
      scheme: 'https',
      host: 'random-data-api.com',
      path: 'api/beer/random_beer',
      queryParameters: {'size': tamanho.value.toString()},
    );

    var jsonString = await http.read(beersUri);
    var beersJson = jsonDecode(jsonString);

    tableStateNotifier.value = beersJson;
    columnNamesNotifier.value = ["Nome", "Estilo", "IBU"];
    propertyNamesNotifier.value = ["name", "style", "ibu"];
  }

  Future<void> carregarNacoes() async {
    var nationsUri = Uri(
      scheme: 'https',
      host: 'random-data-api.com',
      path: 'api/nation/random_nation',
      queryParameters: {'size': tamanho.value.toString()},
    );

    var jsonString = await http.read(nationsUri);
    var nationsJson = jsonDecode(jsonString);

    tableStateNotifier.value = nationsJson;
    columnNamesNotifier.value = ["Nação", "Idioma", "Capital"];
    propertyNamesNotifier.value = ["nationality", "language", "capital"];
  }
}

final dataService = DataService();

void main() {
  MyApp app = MyApp();
  runApp(app);
}

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
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ValueListenableBuilder(
                valueListenable: dataService.tamanho,
                builder: (context, value, child) {
                  return DropdownButton<int>(
                    value: value,
                    items: [5, 10, 15].map((int tamanho) {
                      return DropdownMenuItem<int>(
                        value: tamanho,
                        child: Text('Size: $tamanho'),
                      );
                    }).toList(),
                    onChanged: (newSize) {
                      dataService.tamanho.value = newSize!;
                    },
                  );
                },
              ),
            ),
            Expanded(
              child: ValueListenableBuilder(
                valueListenable: dataService.tableStateNotifier,
                builder: (_, value, __) {
                  return ValueListenableBuilder(
                    valueListenable: dataService.columnNamesNotifier,
                    builder: (_, columnNames, __) {
                      return ValueListenableBuilder(
                        valueListenable: dataService.propertyNamesNotifier,
                        builder: (_, propertyNames, __) {
                          return DataTableWidget(
                            jsonObjects: value,
                            columnNames: columnNames,
                            propertyNames: propertyNames,
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
        bottomNavigationBar:
            NewNavBar(itemSelectedCallback: dataService.carregar),
      ),
    );
  }
}

class NewNavBar extends HookWidget {
  final Function(int) _itemSelectedCallback;

  NewNavBar({required Function(int) itemSelectedCallback})
      : _itemSelectedCallback = itemSelectedCallback;

  @override
  Widget build(BuildContext context) {
    var state = useState(0);

    return BottomNavigationBar(
      onTap: (index) {
        state.value = index;
        _itemSelectedCallback(index);
      },
      currentIndex: state.value,
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

class DataTableWidget extends StatelessWidget {
  final List jsonObjects;
  final List<String> columnNames;
  final List<String> propertyNames;

  DataTableWidget({
    this.jsonObjects = const [],
    this.columnNames = const [],
    this.propertyNames = const [],
  });

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: columnNames
          .map((name) => DataColumn(
                label: Expanded(
                  child: Text(
                    name,
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
              ))
          .toList(),
      rows: jsonObjects
          .map((obj) => DataRow(
                cells: propertyNames
                    .map((propName) => DataCell(Text(obj[propName].toString())))
                    .toList(),
              ))
          .toList(),
    );
  }
}
