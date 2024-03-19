import 'package:flutter/material.dart'; // Importa o pacote de widgets do Flutter

void main() { // Função principal que inicializa o aplicativo
  MyApp app = MyApp(); // Cria uma instância da classe MyApp
  runApp(app); // Executa o aplicativo
}

class NewScaffold extends StatelessWidget { // Classe que define um novo Scaffold
  NewScaffold(); // Construtor da classe

  @override
  Widget build(BuildContext context) { // Método responsável por construir a interface do widget
    return Scaffold( // Retorna um Scaffold
      appBar: CustomAppBar(), // Define a appBar como uma instância de CustomAppBar
      body: Center( // Corpo do Scaffold centralizado
        child: Column( // Coluna de widgets
          children: [ // Lista de widgets
            Expanded( // Widget expandido
              child: Text("La Fin Du Monde - Bock - 65 ibu"), // Texto
            ),
            Expanded( // Widget expandido
              child: Text("Sapporo Premiume - Sour Ale - 54 ibu"), // Texto
            ),
            Expanded( // Widget expandido
              child: Text("Duvel - Pilsner - 82 ibu"), // Texto
            ),
          ],
        ),
      ),
      bottomNavigationBar: NewNavBar( // Barra de navegação inferior como uma instância de NewNavBar
        items: [ // Lista de itens da barra de navegação
          NavBarItem( // Item da barra de navegação
            icon: Icon(Icons.analytics, color: Colors.blue), // Ícone do item
            label: "Análise", // Rótulo do item
          ),
          NavBarItem( // Item da barra de navegação
            icon: Icon(Icons.abc, color: Colors.green), // Ícone do item
            label: "ABC", // Rótulo do item
          ),
          NavBarItem( // Item da barra de navegação
            icon: Icon(Icons.home, color: Colors.red), // Ícone do item
            label: "Home", // Rótulo do item
          ),
          NavBarItem( // Item da barra de navegação
            icon: Icon(Icons.accessible, color: Color.fromARGB(255, 0, 0, 0)), // Ícone do item
            label: "Acessibilidade", // Rótulo do item
          ),
          NavBarItem( // Item da barra de navegação
            icon: Icon(Icons.access_alarm, color: Colors.greenAccent), // Ícone do item
            label: "Alarme", // Rótulo do item
          ),
        ],
      ),
    );
  }
}

class NavBarItem { // Classe que define um item da barra de navegação
  final Icon icon; // Ícone do item
  final String label; // Rótulo do item

  NavBarItem({required this.icon, required this.label}); // Construtor da classe
}

class NewNavBar extends StatelessWidget { // Classe que define uma nova barra de navegação
  final List<NavBarItem> items; // Lista de itens da barra de navegação

  NewNavBar({this.items = const []}); // Construtor da classe

  void botaoFoiTocado(int index) { // Método que trata o toque em um item da barra de navegação
    print("Tocaram no botão $index"); // Imprime uma mensagem no console
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      // Define o tipo de navegação da barra inferior
      type: BottomNavigationBarType.fixed,
      // Função chamada quando um item é tocado
      onTap: botaoFoiTocado,
      // Mapeia os itens da lista para BottomNavigationBarItems
      items: items
          .map((item) => BottomNavigationBarItem(
                // Ícone do item
                icon: item.icon,
                // Rótulo do item
                label: item.label,
              ))
          .toList(),
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar(); // Construtor da classe

  @override
  Widget build(BuildContext context) { // Método responsável por construir a interface do widget
    return AppBar( // Retorna uma AppBar
      title: Text("Dicas"),
      centerTitle:true, // Define o título da AppBar
    );
  }
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight); // Retorna o tamanho preferido da AppBar
}

class MyApp extends StatelessWidget { // Classe que define o aplicativo principal
  @override
  Widget build(BuildContext context) { // Método responsável por construir a interface do widget
    return MaterialApp( // Retorna um MaterialApp
      theme: ThemeData(primarySwatch: Colors.deepPurple), // Define o tema do aplicativo
      home: NewScaffold(), // Define a tela inicial do aplicativo como um NewScaffold
    );
  }
}
