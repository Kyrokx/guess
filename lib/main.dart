import 'package:flutter/material.dart';
import 'package:guessing/utils/customText.dart';
import 'package:guessing/widget/jeu.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Geussing',
      theme: ThemeData(
        primarySwatch: Colors.green,
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 512 / 2,
              width: 512 / 2,
              child: Image.asset('assets/question.png'),
            ),
            Divider(
              height: 20,
              thickness: 10,
              endIndent: 20,
              indent: 20,
              color: Colors.lightGreenAccent,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.question_mark,
                  color: Colors.lightGreenAccent,
                  size: 50.00,
                ),
                customText(
                  "Guess",
                  textAlign: TextAlign.center,
                  fontSize: 50.00,
                ),
              ],
            ),
            customText(
              "Devinez le bon nombre entre 1 et 10.000",
              fontSize: 20.00,
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    Navigator.pushNamed(context, '/jeu');
                  });
                },
                child: customText(
                  "Commencer",
                  fontSize: 40.00,
                )),
          ],
        ),
      ),
    );
  }
}
