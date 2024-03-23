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
        body: DataBodyWidget(objects:[
          "La Fin Du Monde - Bock - 65 ibu",
          "Sapporo Premiume - Sour Ale - 54 ibu",
          "Duvel - Pilsner - 82 ibu"
        ]),
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

// Widget do corpo da aplicação
class DataBodyWidget extends StatelessWidget {

  List<String> objects;
  DataBodyWidget( {this.objects = const [] });

  @override
  Widget build(BuildContext context) {
    return Column(children: 
      objects.map((obj) => Expanded(
        child: Center(child: Text(obj)),
      ))
      .toList()
    );
  }
}
