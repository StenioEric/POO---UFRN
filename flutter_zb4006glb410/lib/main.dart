import 'package:flutter/material.dart';

void main() {

  MaterialApp app = MaterialApp(

      theme: ThemeData(
        primarySwatch: Colors.indigo,
        textTheme: TextTheme(
          
        )

      ),

      home: Scaffold(

        appBar: AppBar(

          title: Text("Locações Stênio", 
          style: TextStyle(color: Color.fromARGB(255, 5, 5, 5),fontSize: 24)) 

        ),

        body: Center(

          child: Column(

            children: [

              Text(
                'O homi tá apenas começando...',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),

              Text(
                'AI CALICA...........',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            
              CircularProgressIndicator(),

              Image.network(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSOccdrm73FT-ML9-kpBon_TwAWN5gzykePdg&usqp=CAU'
              ),

            ]

          )

        ),

        	
      

        bottomNavigationBar: Row (

          children:[

            Expanded (

              child: IconButton(
              
                icon: Icon(Icons.home),        
                tooltip: 'HOME',

                onPressed: () {

                  print('HOME pressionado!');

                },
              
              ),

            ),

            Expanded (

              child: ElevatedButton(
              
                onPressed: () {
              
                  print('Botão 1 pressionado!');
              
                },
                child: Text('BOTÃO 1'),
              ),

            ),

            Expanded (

              child: IconButton(
              
                icon: Icon(Icons.cell_tower),        
                tooltip: 'cell_tower',

                onPressed: () {

                  print('CELL pressionado!');

                },
              
              ),

            ),

            Expanded (

              child: ElevatedButton(
              
                onPressed: () {
              
                  print('Botão 2 pressionado!');
              
                },
                child: Text('BOTÃO 2'),
              ),

            ),

          ]
      
        )

      ));

  runApp(app);

}