import 'package:flutter/material.dart';
import 'package:guessing/jeu.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Geussing',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      routes: {
        '/': (context) => MyHomePage(),
        '/jeu': (context) => Jeu(),
      },
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
    );
  }
}

class MyHomePage extends StatefulWidget {


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Geussing Game"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 512 / 2,
              width: 512 / 2,
              child: Image.asset('assets/question.png'),
            ),
            Text("Trouver le bon nombre",textAlign: TextAlign.center,),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    Navigator.pushNamed(context, '/jeu');
                  });
                },
                child: Text("Commencer")
            ),
          ],
        ),
      ),
    );
  }
}
