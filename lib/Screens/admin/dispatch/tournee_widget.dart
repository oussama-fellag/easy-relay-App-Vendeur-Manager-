import 'package:flutter/material.dart';
import 'package:test12/constant.dart';

class TourneeWidget extends StatelessWidget {
  const TourneeWidget({Key? key, required this.barcode, required this.livreur})
      : super(key: key);
  final String barcode;
  final String livreur;
  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Column(children: [
        Row(
          children: [
            const Text(
              "ID:",
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
              "Vendeur:",
              style: TextStyle(color: kPrimaryColor, fontSize: 14),
            ),
            SizedBox(
              width: 30,
            ),
            Text(
              "Samir Lamine",
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
              "Téléphone:",
              style: TextStyle(color: kPrimaryColor, fontSize: 14),
            ),
            SizedBox(
              width: 30,
            ),
            Text(
              "0558229143",
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
              "Livreur:",
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
      ]),
    );
  }
}
