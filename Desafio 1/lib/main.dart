import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': {
      'app_title': 'Flutter Routing Example',
      'home_title': 'Home',
      'details_title': 'Put on me',
      'config_title': 'Put on others',
      'details_button': 'Back',
      'config_button': 'Back',
    },
    'pt_BR': {
      'app_title': 'Exemplo de Navegação em Flutter',
      'home_title': 'Início',
      'details_title': 'Bota em mim',
      'config_title': 'Bota nos outros',
      'details_button': 'Voltar',
      'config_button': 'Voltar',
    },
  };
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Routing Example',
      home: HomeScreen(),
      getPages: [
        GetPage(
            name: '/', 
            page: () => HomeScreen(), 
            transition: Transition.fade),
        GetPage(
            name: '/details',
            page: () => DetailsScreen(),
            transition: Transition.fade),
        GetPage(
            name: '/config', 
            page: () => Config(), 
            transition: Transition.fade),
      ],
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Home')),
        actions: [
          PopupMenuButton(
            icon: const Icon(Icons.menu),
            itemBuilder: (context) => [
              PopupMenuItem(
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: const Text('Português'),
                    )
                  ],
                ),
              ),
              PopupMenuItem(
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: const Text('Inglês'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/details');
              },
              child: Text('Detalhes'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/config');
              },
              child: Text('Configurações'),
            ),
          ],
        ),
      ),
    );
  }
}


class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tela 1'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Get.back();
          },
          child: Text('Voltar'),
        ),
      ),
    );
  }
}

class Config extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tela 2'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Get.back();
          },
          child: Text('Voltar'),
        ),
      ),
    );
  }
}
