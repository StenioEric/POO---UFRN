import 'package:flutter/material.dart';

void main() {
  MyApp app = MyApp();
  runApp(app);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      debugShowCheckedModeBanner:false,
      home: Scaffold(
        appBar: AppBar( 
          title: const Text("Dicas"),
          ),
        body: DataBodyWidget(objects:[
          "La Fin Du Monde - Bock - 65 ibu",
          "Sapporo Premiume - Sour Ale - 54 ibu",
          "Duvel - Pilsner - 82 ibu"
        ]),

        bottomNavigationBar: NewNavBar(icones: const[
          Icons.abc,
          Icons.home,
          Icons.access_alarm,
        ],),
      ));
  }
}

class NewNavBar extends StatelessWidget {
  final List<IconData> icones;

  NewNavBar({this.icones = const []});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: icones.map((icon) => BottomNavigationBarItem(
        icon: Icon(icon), 
        label: "Button"))
      .toList(),
    );
  }
}

class DataBodyWidget extends StatelessWidget {

  List<String> objects;
  DataBodyWidget( {this.objects = const [] });

  Expanded processarUmElemento(String obj){
    return Expanded(                
      child: Center(
        child: 
          Text(obj)
      ),
    );
  }
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



