import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test12/Screens/vendeur/widgets/wilayas.dart';
import 'package:test12/Screens/vendeur/widgets/wilya_button.dart';
import 'package:test12/bloc/vendeur_bloc.dart';

import '../../constant.dart';

class DeliveryForm extends StatefulWidget {
  const DeliveryForm({Key? key, this.adresseHint, this.wilayaHint})
      : super(key: key);
  final String? adresseHint;
  final String? wilayaHint;
  @override
  State<DeliveryForm> createState() => _DeliveryFormState();
}

class _DeliveryFormState extends State<DeliveryForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: BlocProvider.of<VendeurBloc>(context).livraisonKey,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text(
          "Informations Livraison",
          style: TextStyle(
              fontSize: 20, color: kPrimaryColor, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 15,
        ),
        TextFormField(
          controller: BlocProvider.of<VendeurBloc>(context).adresseController,
          decoration:
              InputDecoration(hintText: widget.adresseHint ?? "Adresse*"),
          validator: (value) => value!.isEmpty ? "Entrez une valeur" : null,
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Flexible(
              child: WilayaButton(
                items: wilayas,
                hint: widget.wilayaHint ?? "Wilaya",
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Flexible(
              child: TextFormField(
                decoration: const InputDecoration(hintText: "425 DZD"),
                keyboardType: TextInputType.number,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          decoration: const InputDecoration(hintText: "Localisation exacte"),
        ),
        const SizedBox(
          height: 10,
        ),
        WilayaButton(items: wilayas, hint: "Commune"),
        const SizedBox(
          height: 10,
        ),
      ]),
    );
  }
}
