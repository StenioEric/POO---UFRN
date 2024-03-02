import 'package:flutter/material.dart';

void main() {

  MaterialApp app = MaterialApp(

      theme: ThemeData(primarySwatch: Colors.deepPurple),

      home: Scaffold(

        appBar: AppBar(title: Text("Locações Stênio")),

        body: Center(

          child: Column(

            children: [

              Text("O homi tá apenas começando..."),

              const Text(
                'Ai Calica..........',
                style: TextStyle(fontWeight:FontWeight.bold),
              ),
              
              Text("Stênio Aprendizado!"),

            ]

          )

        ),

        	
      

        bottomNavigationBar: Row (

          children:[

            IconButton(
            
              icon: Icon(Icons.home),        
              tooltip: 'HOME',

              onPressed: () {

                print('HOME pressionado!');

              },
            
            ),
              
            ElevatedButton(

              child: Text('BOTÃO 1'),
            
              onPressed: () {
            
                print('Botão 1 pressionado!');
            
              },

            ),

            IconButton(
              icon: Icon(Icons.add_ic_call),
              onPressed: () {
                print('CELL pressionado!');
              },
            ),

            ElevatedButton(

              child: Text('BOTÃO 2'),
            
              onPressed: () {
            
                print('Botão 2 pressionado!');
            
              },

            ),
          ]
      
        )

      ));

  runApp(app);

}