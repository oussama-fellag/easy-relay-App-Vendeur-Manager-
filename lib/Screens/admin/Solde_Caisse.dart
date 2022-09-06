import 'package:flutter/material.dart';

import '../../constant.dart';
import '../vendeur/widgets/wilya_button.dart';
import 'DetailSolde.dart';
import 'Envloppe.dart';
import 'caisse.dart';
import 'caisse2.dart';
import 'caisse3.dart';

String A ="  Transfert Virement                                                       ";
String B ="  Pret Inter Caisse                                                       ";
String C ="  Mouvement Extern Cash                                                      ";
class SoldeCaisse extends StatelessWidget {
  const SoldeCaisse({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        disabledElevation: 0.6,
        child: const Icon(Icons.add),
        onPressed: () =>
            showModalBottomSheet<dynamic>(
                isScrollControlled: true,
                context: context,
                builder: (BuildContext bc) {
                  return Wrap(
                      children: <Widget>[
                        Container(
                          child: Container(
                            decoration: new BoxDecoration(

                                borderRadius: new BorderRadius.only(
                                    topLeft: const Radius.circular(25.0),
                                    topRight: const Radius.circular(25.0))),
                            child: Column(
                              children: [
                                SizedBox(height: 10,),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return Caisse();
                                        },
                                      ),
                                    );
                                  },
                                  child: Text(
                                      A,
                                      style: TextStyle(
                                          fontSize: 18)
                                  ),
                                ),
                                SizedBox(height: 10,),
                                const Divider(
                                  thickness: 1, // thickness of the line
                                  indent: 1, // empty space to the leading edge of divider.
                                  endIndent: 1, // empty space to the trailing edge of the divider.
                                  color: Colors.grey, // The color to use when painting the line.
                                  height: 2, // The divider's height extent.
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return Caisse2();
                                        },
                                      ),
                                    );
                                  },
                                  child:  Text(
                                    B,
                                    style: TextStyle(
                                        fontSize: 18),
                                  ),
                                ),
                                SizedBox(height: 10,),
                                const Divider(
                                  thickness: 1, // thickness of the line
                                  indent: 1, // empty space to the leading edge of divider.
                                  endIndent: 1, // empty space to the trailing edge of the divider.
                                  color: Colors.grey, // The color to use when painting the line.
                                  height: 2, // The divider's height extent.
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return Caisse3();
                                        },
                                      ),
                                    );
                                  },
                                  child:  Text(
                                    C,
                                    style: TextStyle(
                                        fontSize: 18),
                                  ),
                                ),
                                SizedBox(height: 20,),
                              ],
                            ),
                          ),
                        )
                      ]
                  );
                }
            ),

      ),
      appBar: AppBar(
        title: Text("Caisse"),
        backgroundColor: kPrimaryColor,
      ),
      body: Form(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(
            height: 30,
          ),
          const Text(
            "  Solde des Caisses",
            style: TextStyle(
                fontSize: 20,
                color: kPrimaryColor,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 15,
          ),

          WilayaButton(items: [
            'Hub Alger',
            'Hub Oran',
            'Autre',
          ], hint: "Hub"),
          const SizedBox(
            height: 50,
          ),

          Row(children: [
            Container(
              width: 200,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: kPrimaryLightColor,
                  width: 2,
                ), //Border.all
                borderRadius: BorderRadius.circular(15),
              ), //
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                      child: Text(
                    "Vendeur",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: kPrimaryColor),
                  )),
                  SizedBox(
                    height: 9,
                  ),
                  Center(
                      child: Text(
                    "3333",
                    style: TextStyle(fontSize: 35, color: kPrimaryLightColor),
                  )),
                  const Divider(
                    thickness: 1, // thickness of the line
                    indent: 1, // empty space to the leading edge of divider.
                    endIndent: 1, // empty space to the trailing edge of the divider.
                    color: Colors.black, // The color to use when painting the line.
                    height: 2, // The divider's height extent.
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return DetailSolde();
                          },
                        ),
                      );
                    },
                    child: const Text(
                      "                           Voir les details ",
                      style: TextStyle(
                          color: kPrimaryColor ),
                    ),
                  )

                ],
              ), // BoxDecoration
            ),
            Spacer(),
            Container(
              width: 200,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: kPrimaryLightColor,
                  width: 2,
                ), //Border.all
                borderRadius: BorderRadius.circular(15),
              ), //
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                      child: Text(
                        "Easy Relay",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: kPrimaryColor),
                      )),
                  SizedBox(
                    height: 9,
                  ),
                  Center(
                      child: Text(
                        "14533",
                        style: TextStyle(fontSize: 35, color: kPrimaryLightColor),
                      )),
                  const Divider(
                    thickness: 1, // thickness of the line
                    indent: 1, // empty space to the leading edge of divider.
                    endIndent: 1, // empty space to the trailing edge of the divider.
                    color: Colors.black, // The color to use when painting the line.
                    height: 2, // The divider's height extent.
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return DetailSolde();
                          },
                        ),
                      );
                    },
                    child: const Text(
                      "                           Voir les details ",
                      style: TextStyle(
                          color: kPrimaryColor ),
                    ),
                  )

                ],
              ), // BoxDecoration
            ),
          ]),

          SizedBox(
            height: 20,
          ),

          Container(
            alignment: Alignment.center,
            child: Container(
              width: 200,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: kPrimaryLightColor,
                  width: 2,
                ), //Border.all
                borderRadius: BorderRadius.circular(15),
              ), //
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                      child: Text(
                        "Easy Display",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: kPrimaryColor),
                      )),
                  SizedBox(
                    height: 9,
                  ),
                  Center(
                      child: Text(
                        "430004",
                        style: TextStyle(fontSize: 35, color: kPrimaryLightColor),
                      )),
                  const Divider(
                    thickness: 1, // thickness of the line
                    indent: 1, // empty space to the leading edge of divider.
                    endIndent: 1, // empty space to the trailing edge of the divider.
                    color: Colors.black, // The color to use when painting the line.
                    height: 2, // The divider's height extent.
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return DetailSolde();
                          },
                        ),
                      );
                    },
                    child: const Text(
                      "                           Voir les details ",
                      style: TextStyle(
                          color: kPrimaryColor ),
                    ),
                  )

                ],
              ), // BoxDecoration
            ),
          ), //C
          SizedBox(
            height: 35,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Flexible(
                child: Text("Voir les enveloppes: ",
                    style: TextStyle(color: kPrimaryColor)),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return Envloppe();
                      },
                    ),
                  );
                },
                child: const Text(
                  "Tappez ici",
                  style: TextStyle(
                      color: kPrimaryColor, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
          // ontai// ner
        ]),


      ),
      bottomNavigationBar: new Stack(

        alignment: new FractionalOffset(.5, 1.0),
        children: [
          new Container(
            height: 40.0,

          ),

        ],
      ),
    );
  }
}
