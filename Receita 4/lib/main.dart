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
        body: MytileWidget(objects:dataObjects),
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

// Define um widget Flutter que exibe uma tabela de dados
class MytileWidget extends StatelessWidget {
  
  // Lista de objetos que serão exibidos na tabela
  final List objects;
  // Construtor da classe MytileWidget
  MytileWidget({this.objects = const []});
  @override
  Widget build(BuildContext context) {   
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: objects.length,
      itemBuilder: (context,index){
      final obj = objects[index];
        return ListTile(
          title: Text(obj["name"]),
          subtitle: Text("Estilo: ${obj["style"]} | IBU: ${obj["ibu"]}"),
          onTap: () {
            print("Tapped on ${obj["name"]}");
          },
        );
      },
    );
  }
}

// Lista de objetos que serão exibidos na tabela
var dataObjects = [
  {
    "name": "La Fin Du Monde",
    "style": "Tripel",
    "ibu": "19",
  },
  {
    "name": "Sapporo Premium",
    "style": "Pale Lager",
    "ibu": "20",
  },
  {
    "name": "Duvel",
    "style": "Belgian Strong Ale",
    "ibu": "32",
  },
  {
    "name": "Weihenstephaner Hefeweissbier",
    "style": "Hefeweizen",
    "ibu": "14",
  },
  {
    "name": "Chimay Blue",
    "style": "Belgian Strong Dark Ale",
    "ibu": "35",
  },
  {
    "name": "Westvleteren 12",
    "style": "Quadrupel",
    "ibu": "35",
  },
  {
    "name": "Orval",
    "style": "Belgian Pale Ale",
    "ibu": "40",
  },
  {
    "name": "Ayinger Celebrator Doppelbock",
    "style": "Doppelbock",
    "ibu": "24",
  },
  {
    "name": "Guinness Draught",
    "style": "Irish Dry Stout",
    "ibu": "45",
  },
  {
    "name": "Rochefort 10",
    "style": "Quadrupel",
    "ibu": "27",
  },
  {
    "name": "Pliny the Elder",
    "style": "Double IPA",
    "ibu": "100+",
  },
  {
    "name": "Trappistes Rochefort 8",
    "style": "Belgian Strong Dark Ale",
    "ibu": "22",
  },
  {
    "name": "Pilsner Urquell",
    "style": "Czech Pilsner",
    "ibu": "40",

  },
  {
    "name": "Weihenstephaner Vitus",
    "style": "Weizenbock",
    "ibu": "17",
  },
  {
    "name": "North Coast Old Rasputin",
    "style": "Russian Imperial Stout",
    "ibu": "75",
  },
  {
    "name": "Schneider Weisse Aventinus",
    "style": "Weizenbock",
    "ibu": "16",
  },
  {
    "name": "Samuel Adams Boston Lager",
    "style": "Vienna Lager",
    "ibu": "30",
  },
  {
    "name": "Founders KBS (Kentucky Breakfast Stout)",
    "style": "Imperial Stout",
    "ibu": "70",
  },
  {
    "name": "Fuller's ESB (Extra Special Bitter)",
    "style": "ESB",
    "ibu": "40",
  },
  {
    "name": "Ayinger Bräuweisse",
    "style": "Hefeweizen",
    "ibu": "23",
  },
  {
    "name": "Köstritzer Schwarzbier",
    "style": "Schwarzbier",
    "ibu": "25",
  },
  {
    "name": "Founders All Day IPA",
    "style": "Session IPA",
    "ibu": "42",
  },
  {
    "name": "Paulaner Hefe-Weißbier Naturtrüb",
    "style": "Hefeweizen",
    "ibu": "12",
  },
];

   
