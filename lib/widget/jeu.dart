import 'dart:math';

import 'package:flutter/material.dart';
import 'package:guessing/utils/customText.dart';

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

  int random_number = Random().nextInt(10000);
  String etat = ' ';
  late int tentative = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.pink.shade50,
        appBar: new AppBar(
          automaticallyImplyLeading: false,
          title: customText(
            "Devinez",
            fontSize: 25.0,
          ),
          centerTitle: true,
          backgroundColor: Colors.green[100],
          elevation: 0.0,
        ),
        body: Container(
          color: Colors.green[100],
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                customText(
                  "Devinez le bon nombre compris entre 1 et 10.000",
                  fontSize: 20.0,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 2,
                  width: MediaQuery.of(context).size.width / 1.25,
                  child: Card(
                    color: Colors.green[50],
                    elevation: 10.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        customText(
                          etat,
                          fontSize: 20.0,
                        ),
                        customText(
                          "Tentatives : ${tentative.toString()}",
                          fontSize: 20.0,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          height: MediaQuery.of(context).size.height * 0.07,
                          padding: EdgeInsets.only(left: 50.0, right: 50.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
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
        ));
  }

  Future<void> alert(title, msg, ppp) async {
    Widget cancelButton = TextButton(
      child: customText("ok"),
      onPressed: () {
        setState(() {
          if (ppp == true) {
            Navigator.pop(context);
            Navigator.pop(context);
          } else {
            Navigator.pop(context);
          }
        });
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: customText(title),
      content: customText(msg),
      actions: [cancelButton],
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
    if (str < 1 || str > 10000) {
      alert("⚠️ | ERREUR", "⚠️ | Le nombre doit être compris entre 1 et 10.000",
          false);
    }
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
        alert(
            "🎉 | Félicitation",
            " 🎉 Bravo , le nombre était ${random_number}\n 🎉. Vous avez reussi en ${tentative - 1} tentatives !",
            true);
      });
    }
  }
}
