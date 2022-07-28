import 'package:flutter/material.dart';
import 'package:test12/Screens/vendeur/menu/commandes/modifier_commande.dart';
import 'package:test12/Screens/vendeur/widgets/wilya_button.dart';
import 'package:test12/constant.dart';
import 'package:test12/models/commande.dart';

class TourneeWidget extends StatelessWidget {
  const TourneeWidget({Key? key, required this.barcode, this.commande})
      : super(key: key);
  final String barcode;
  final Commande? commande;
  @override
  Widget build(BuildContext context) {
    return Container(
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Informations",
              style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) =>
                              ModifierCommande(commande: commande!))));
                },
                icon: const Icon(
                  Icons.edit,
                  color: kPrimaryColor,
                )),
          ],
        ),
        const Divider(),
        Row(
          children: [
            const Text(
              "ID Produit:",
              style: TextStyle(color: kPrimaryColor, fontSize: 14),
            ),
            const SizedBox(
              width: 30,
            ),
            Text(
              barcode,
              style: const TextStyle(
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
          children: [
            const Text(
              "Nom Client:",
              style: TextStyle(color: kPrimaryColor, fontSize: 14),
            ),
            const SizedBox(
              width: 30,
            ),
            Text(
              commande!.client.nom,
              style: const TextStyle(
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
          children: [
            const Text(
              "Prix Produit:",
              style: TextStyle(color: kPrimaryColor, fontSize: 14),
            ),
            const SizedBox(
              width: 30,
            ),
            Text(
              commande!.price.toString(),
              style: const TextStyle(
                  color: Color.fromARGB(255, 123, 123, 123),
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ]),
    );
  }
}
