import 'package:flutter/material.dart';

void main() {
  // Instancia o widget principal
  MyApp app = MyApp();
  // Inicia a aplicação com o widget principal
  runApp(app);
}

// Widget principal da aplicação
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Define o tema da aplicação
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      // Desabilita o banner de debug
      debugShowCheckedModeBanner: false,
      // Define a tela inicial da aplicação como um Scaffold
      home: Scaffold(
        // Define a app bar personalizada
        appBar: CustomAppBar(),
        // Define o corpo da aplicação
        body: MytileWidget(
          objects: dataObjects,
          propertyNames: ['year','country'],
        ),
        // Define a barra de navegação inferior personalizada
        bottomNavigationBar: NewNavBar(icones: const[
          Icons.abc,
          Icons.home,
          Icons.access_alarm,
        ]),
      )
    );
  }
}

// Widget da app bar personalizada
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar(); // Construtor da classe

  @override
  Widget build(BuildContext context) { // Método responsável por construir a interface do widget
    return AppBar( // Retorna uma AppBar
      title: const Text("Dicas"), // Texto do título da AppBar
      centerTitle: true, // Centraliza o título
      actions:[ // Define as ações da AppBar
        PopupMenuButton( // Cria um botão de menu pop-up
          icon: const Icon(Icons.menu), // Ícone do botão
          itemBuilder: (context) => [ // Define como os itens do menu devem ser construídos
            PopupMenuItem( // Define um item do menu
              child:Row( // Define um layout de linha para o item do menu
                children: [
                  const Icon(
                    Icons.add_circle,
                    color: Colors.red,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: const Text('Red'),
                  )
                ],
              )
            ),
            PopupMenuItem( // Outro item do menu
              child:Row(
                children: [
                  const Icon(
                    Icons.add_circle,
                    color: Colors.black,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: const Text('Black'),
                  )
                ],
              )
            ),
            PopupMenuItem( // Mais um item do menu
              child:Row(
                children: [
                  const Icon(
                    Icons.add_circle,
                    color: Colors.blue,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: const Text('Blue'),
                  )
                ],
              )
            )
          ],
        )
      ], 
    );
  }
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight); // Retorna o tamanho preferido da AppBar
}



// Widget da barra de navegação inferior personalizada
class NewNavBar extends StatelessWidget {
  final List<IconData> icones;

  NewNavBar({this.icones = const []});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      // Mapeia os ícones para itens da barra de navegação
      items: icones.map((icon) => BottomNavigationBarItem(
        icon: Icon(icon), 
        label: "Button")) // Adiciona um rótulo temporário
      .toList(), // Converte o resultado do mapeamento em uma lista
    );
  }
}

// // Define um widget Flutter que exibe uma tabela de dados
// class DataBodyWidget extends StatelessWidget {
  
//   // Lista de objetos que serão exibidos na tabela
//   final List<Map<String, dynamic>> objects;
//   final List columnNames;
//   final List propertyNames;

//   // Construtor da classe DataBodyWidget
//   DataBodyWidget({required this.objects,required this.propertyNames,required this.columnNames});
  
//   // Método obrigatório que constrói a interface do widget
//   @override
//   Widget build(BuildContext context) {  
//     return Center(
//       child: SingleChildScrollView(
//         scrollDirection: Axis.vertical,
//         child: DataTable(
//           // Altera o tamanho das bordas(linhas da tabela)
//           border: TableBorder.all(width: 5.0),
//           columns: columnNames.map( 
//             (name) => DataColumn(
//               label: Text(name, style: const TextStyle(fontStyle: FontStyle.italic))
//             )).toList(),

//           rows: objects.asMap().entries.map((entry){
//             final index = entry.key;
//             final obj = entry.value;
//             return DataRow(
//               color: MaterialStateProperty.resolveWith<Color>(
//                 (Set<MaterialState> states) {
//                   // Alternar as cores entre as linhas
//                   if (index % 2 == 0) return Colors.grey.withOpacity(0.7);
//                   return Theme.of(context).colorScheme.surface;
//                 }
//               ),
//               cells: propertyNames
//               .map((propName) => DataCell(
//                 Text(obj[propName]))
//               ).toList(),
//             );
//           }).toList(),
//         ),
//       ),
//     );
//   }
// }



// Lista de objetos que serão exibidos na tabela
var dataObjects = [
  {"name": "Ford Mustang", "year": "1980", "country": "USA"},
  {"name": "Chevrolet Corvette", "year": "1990", "country": "USA"},
  {"name": "Volkswagen Golf GTI", "year": "1985", "country": "Germany"},
  {"name": "Toyota Supra", "year": "1995", "country": "Japan"},
  {"name": "Ferrari F40", "year": "1987", "country": "Italy"},
  {"name": "Nissan Skyline GT-R", "year": "1999", "country": "Japan"},
  {"name": "BMW M3", "year": "1992", "country": "Germany"},
  {"name": "Porsche 911", "year": "1989", "country": "Germany"},
  {"name": "Honda NSX", "year": "1991", "country": "Japan"},
  {"name": "Audi Quattro", "year": "1980", "country": "Germany"},
  {"name": "Lamborghini Countach", "year": "1985", "country": "Italy"},
  {"name": "Mercedes-Benz 190E 2.3-16", "year": "1984", "country": "Germany"},
  {"name": "Mazda RX-7", "year": "1986", "country": "Japan"},
  {"name": "Ford Sierra RS Cosworth", "year": "1986", "country": "USA"},
  {"name": "Buick Grand National", "year": "1987", "country": "USA"},
];



// Define um widget Flutter que exibe uma tabela de dados
class MytileWidget extends StatelessWidget {
  // Lista de objetos que serão exibidos na tabela
  final List objects;
  final List propertyNames;
  // Construtor da classe MytileWidget
  MytileWidget({required this.objects, required this.propertyNames});
  @override
  Widget build(BuildContext context) { 
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: objects.length,
      itemBuilder: (context, int index) {
        final obj = objects[index];
        return ListTile(
          title: Text(obj["name"]),
          subtitle: Text("${propertyNames[0]}: ${obj["year"]} -- country: ${obj["country"]}"),
          onTap: () {
            print("Tapped on ${obj["name"]}");
          },
        );
      },
    );
  }
}
