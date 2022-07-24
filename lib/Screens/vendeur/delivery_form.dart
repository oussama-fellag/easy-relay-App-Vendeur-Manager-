import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test12/bloc/vendeur_bloc.dart';

import '../../constant.dart';

class DeliveryForm extends StatefulWidget {
  const DeliveryForm({Key? key}) : super(key: key);

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
          decoration: const InputDecoration(hintText: "Adresse"),
          validator: (value) => value!.isEmpty ? "Entrez une value" : null,
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          decoration: const InputDecoration(hintText: "Wilaya"),
          validator: (value) => value!.isEmpty ? "Entrez une value" : null,
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          decoration: const InputDecoration(hintText: "Prix livraison"),
          validator: (value) => value!.isEmpty ? "Entrez une value" : null,
          keyboardType: TextInputType.number,
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          decoration: const InputDecoration(hintText: "Commune*"),
          validator: (value) => value!.isEmpty ? "Entrez une value" : null,
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          decoration: const InputDecoration(hintText: "Localisation exacte*"),
          validator: (value) => value!.isEmpty ? "Entrez une value" : null,
        )
      ]),
    );
  }
}
