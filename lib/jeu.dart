import 'dart:math';

import 'package:flutter/material.dart';

class Jeu extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new JeuState();
  }
}

class JeuState extends State<Jeu> {
  late TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController()
      ..addListener(() {
        setState(() {});
      });
    print(random_number);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  int random_number = Random().nextInt(100);
  String etat = 'Deviner';
  late int tentative = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink.shade50,
      appBar: new AppBar(
        title: Text("Deviner !"),
        centerTitle: true,
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("Trouvez le nombre entre 1 et 100"),
              SizedBox(
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width / 1.25,
                child: Card(
                  elevation: 10.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(etat),
                      Text("Tentatives : ${tentative.toString()}"),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: MediaQuery.of(context).size.height * 0.07,
                        padding: EdgeInsets.all(
                            MediaQuery.of(context).size.width * 0.03),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: Colors.white,
                            border: Border.all(color: Colors.grey)),
                        child: TextField(
                          controller: controller,
                          onSubmitted: (str) {
                            setState(() {
                              validation(int.parse(str));
                              controller.clear();
                            });
                          },
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              hintText: 'Entrez un nombre',
                              hintStyle: TextStyle(color: Colors.grey)),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
    );
  }

  Future<void> alert(msg) async {
    Widget cancelButton = TextButton(
      child: Text("ok"),
      onPressed: () {
        setState(() {
          Navigator.pop(context);
          Navigator.pop(context);
        });
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Félicitaions 🎉 "),
      content: Text(msg),
      actions: [
        cancelButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  validation(str) {
      tentative++;
      if (str > random_number) {
        setState(() {
          etat = "C'est moins ⬇️ ";
        });
      } else if (str < random_number) {
        setState(() {
          etat = "C'est plus ⬆️ ";
        });
      } else if (str == random_number) {
        setState(() {
          etat = "🎉 | Bravo !";
          alert(" 🎉 Bravo , le nombre était ${random_number} 🎉. Vous avez reussi en ${tentative - 1} tentatives !");
        });
      }
    }
}
