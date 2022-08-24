import 'package:flutter/material.dart';
import 'package:test12/Screens/vendeur/menu/commandes/modifier_commande.dart';
import 'package:test12/Screens/vendeur/menu/commandes/plus_dinfos.dart';
import 'package:test12/constant.dart';
import 'package:test12/models/commande.dart';

class NavetteComponent extends StatelessWidget {
  const NavetteComponent({Key? key, required this.barcode}) : super(key: key);
  final String barcode;
  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text("Navette à réceptionner",
              style: TextStyle(
                  color: Color.fromARGB(255, 123, 123, 123), fontSize: 14)),
          const Spacer(),
          Text(barcode),
        ],
      ),
    );
  }
}
