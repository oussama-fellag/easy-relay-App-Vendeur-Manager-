import 'package:flutter/material.dart';

import '../../../../constant.dart';
import '../../../../models/models.dart';
import 'modifier_commande.dart';

class PlusDinfosLivraison extends StatelessWidget {
  const PlusDinfosLivraison({Key? key, this.commande}) : super(key: key);
  final Commande? commande;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Abdelhak Razi"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) =>
                            ModifierCommande(commande: commande))));
              },
              icon: const Icon(
                Icons.edit,
                color: Colors.white,
              ))
        ],
        elevation: 0.0,
        backgroundColor: kPrimaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 4,
                        offset: const Offset(0, 3),
                        color: Colors.black.withOpacity(0.1)),
                  ],
                  color: Colors.white),
              child: Column(
                children: [
                  const ListTile(
                    title: Text(
                      "Tlemcen",
                      style: TextStyle(
                          color: Color.fromARGB(255, 123, 123, 123),
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Divider(),
                  ListTile(
                    title: const Text(
                      "0558229143",
                      style: TextStyle(
                          color: Color.fromARGB(255, 123, 123, 123),
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    trailing: IconButton(
                      icon: const Icon(
                        Icons.phone,
                        color: kPrimaryColor,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.only(bottom: 10, top: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 4,
                        offset: const Offset(0, 3),
                        color: Colors.black.withOpacity(0.1)),
                  ],
                  color: Colors.white),
              child: Column(children: [
                Row(
                  children: const [
                    Text(
                      "ID Produit:",
                      style: TextStyle(color: kPrimaryColor, fontSize: 14),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      "1551",
                      style: TextStyle(
                          color: Color.fromARGB(255, 123, 123, 123),
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const Divider(),
                Row(
                  children: const [
                    Text(
                      "Etat:",
                      style: TextStyle(color: kPrimaryColor, fontSize: 14),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      "Pending",
                      style: TextStyle(
                          color: Color.fromARGB(255, 123, 123, 123),
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const Divider(),
                Row(
                  children: const [
                    Text(
                      "Nom Client:",
                      style: TextStyle(color: kPrimaryColor, fontSize: 14),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      "Abdelhak Razi",
                      style: TextStyle(
                          color: Color.fromARGB(255, 123, 123, 123),
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const Divider(),
                Row(
                  children: const [
                    Text(
                      "Etat paiement:",
                      style: TextStyle(color: kPrimaryColor, fontSize: 14),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      "Non livré",
                      style: TextStyle(
                          color: Color.fromARGB(255, 123, 123, 123),
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const Divider(),
                Row(
                  children: const [
                    Text(
                      "Prix Produit:",
                      style: TextStyle(color: kPrimaryColor, fontSize: 14),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      "5600",
                      style: TextStyle(
                          color: Color.fromARGB(255, 123, 123, 123),
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const Divider(),
                Row(
                  children: const [
                    Text(
                      "Total:",
                      style: TextStyle(color: kPrimaryColor, fontSize: 14),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      "6000 DZD",
                      style: TextStyle(
                          color: Color.fromARGB(255, 123, 123, 123),
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ]),
            ),
            const Spacer(),
            Row(
              children: [
                if (commande!.livraison!.etat == "En attente")
                  Expanded(
                    child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          "Valider".toUpperCase(),
                        )),
                  ),
                const SizedBox(
                  width: 10,
                ),
                if (commande!.livraison!.etat == "En attente" ||
                    (commande!.livraison!.etat == "Validé"))
                  Expanded(
                      child: OutlinedButton(
                          onPressed: () {},
                          child: Text(
                            "Annuler".toUpperCase(),
                            style: const TextStyle(color: kPrimaryColor),
                          )))
              ],
            ),
            const SizedBox(
              width: 10,
            ),
          ],
        ),
      ),
    );
  }
}
