import 'package:flutter/material.dart';
import 'package:test12/Screens/vendeur/menu/commandes/modifier_commande.dart';
import 'package:test12/Screens/vendeur/menu/commandes/plus_dinfos.dart';
import 'package:test12/constant.dart';
import 'package:test12/models/commande.dart';

class TourneeWidget extends StatelessWidget {
  const TourneeWidget({Key? key, required this.barcode, this.commande})
      : super(key: key);
  final String barcode;
  final Commande? commande;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PlusDinfosLivraison(commande: commande)));
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.only(bottom: 5, top: 10),
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
                "Abdelhak Razi",
                style: TextStyle(
                    color: Color.fromARGB(255, 123, 123, 123),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Icon(
                Icons.home,
                color: kPrimaryColor,
              ),
              SizedBox(
                width: 5,
              ),
              Text("Tlemcen, Imama",
                  style: TextStyle(
                      color: Color.fromARGB(255, 123, 123, 123), fontSize: 14)),
              Spacer(),
              Text("515220"),
            ],
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Livraison simple",
                style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              Icon(
                Icons.local_shipping,
                color: kPrimaryColor,
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
