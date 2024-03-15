import 'package:flutter/material.dart';

void main() {

  MaterialApp app = MaterialApp(

      theme: ThemeData(
        primarySwatch: Colors.indigo,
        textTheme: TextTheme()
      ),

      home: Scaffold(
        appBar: AppBar(
          title: Text("Locações Stênio", 
          style: TextStyle(color: Color.fromARGB(255, 5, 5, 5),fontSize: 24))
        ),

        body: Center(

          child: Column(

            children: [

              Text('AI CALICA...........',style: TextStyle(fontWeight: FontWeight.bold)),
              Text('AI CALICA...........',style: TextStyle(fontWeight: FontWeight.bold)),
              FadeInImage.assetNetwork(
                placeholder: 'assets/loading.gif',
                image:'https://extra.globo.com/incoming/12094788-7ac-566/w448/ronaldo-zidane-1.jpg',
              ),
            ]
          )
        ),

        bottomNavigationBar: BottomAppBar (
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,

            children:[

              IconButton(             
                  icon: Icon(Icons.home),        
                  tooltip: 'HOME',
                  onPressed: () {
                    print('HOME pressionado!');
                  },              
                ),

              ElevatedButton(             
                  onPressed: () {             
                    print('Botão 1 pressionado!');             
                  },
                  child: Text('BOTÃO 1'),
                ),

              IconButton(
                  icon: Icon(Icons.cell_tower),        
                  tooltip: 'cell_tower',
                  onPressed: () {
                    print('CELL pressionado!');
                  },
                ),
              
              ElevatedButton(             
                onPressed: () {           
                  print('Botão 2 pressionado!');             
                },
                child: Text('BOTÃO 2'),
              ),
            ],                 
          ),
        ),
      ),
    );

  runApp(app);

}