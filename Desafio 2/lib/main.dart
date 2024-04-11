import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart'; // Importa os hooks do Flutter
import 'package:get/get.dart';

class Traducoes extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'app_title': 'Flutter Routing Example',
          'home_title': 'Home',
          'details_title': 'Put on me',
          'config_title': 'Put on others',
          'back': 'Back',

        },
        'pt_BR': {
          'app_title': 'Exemplo de Navegação em Flutter',
          'home_title': 'Início',
          'details_title': 'Tela1',
          'config_title': 'Tela2',
          'back': 'Voltar',

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
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/', page: () => Tela0(), transition: Transition.fade),
        GetPage(
          name: '/details', page: () => Tela1(), transition: Transition.fade),
        GetPage(
          name: '/config', page: () => Tela2(), transition: Transition.fade),
      ],
      translations: Traducoes(),
      locale: Get.deviceLocale,
    );
  }
}

class Tela0 extends StatelessWidget {
  Tela0();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NewAppBar(nometela: 'home_title'.tr),
      bottomNavigationBar: NewNavBar(),
    );
  }
}

class Tela1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('details_title'.tr),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Get.back(),
              child: Text('back'.tr),
            ),
          ],
        ),
      ),
      bottomNavigationBar: NewNavBar(),
    );
  }
}

class Tela2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('config_title'.tr),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Get.back(),
              child: Text('back'.tr),
            ),
          ],
        ),
      ),
      bottomNavigationBar: NewNavBar(),
    );
  }
}

class NewNavBar extends HookWidget {
  @override
  Widget build(BuildContext context) {
    var routes = ['/', '/details', '/config'];

    return BottomNavigationBar(
      onTap: (index) => Get.toNamed(routes[index]),
      items: const [
        BottomNavigationBarItem(
          label: ' ',
          icon: Icon(Icons.home),
        ),
        BottomNavigationBarItem(
          label: ' ',
          icon: Icon(Icons.looks_two),
        ),
        BottomNavigationBarItem(
          label: ' ',
          icon: Icon(Icons.looks_3),
        ),
      ],
    );
  }
}

class NewAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String nometela;

  NewAppBar({required this.nometela});

  @override
  _NewAppBarState createState() => _NewAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _NewAppBarState extends State<NewAppBar> {
  void _onSelected(Locale value) {
    setState(() {
      Get.updateLocale(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(widget.nometela),
      actions: [
        PopupMenuButton(
          onSelected: _onSelected,
          itemBuilder: (_) => [
            PopupMenuItem(
              value: Locale('pt', 'BR'),
              child: Text('Português'),
            ),
            PopupMenuItem(
              value: Locale('en', 'US'),
              child: Text('Inglês'),
            ),
          ],
        ),
      ],
    );
  }
}
