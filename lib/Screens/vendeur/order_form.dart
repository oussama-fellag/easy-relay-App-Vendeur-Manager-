import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/vendeur_bloc.dart';
import '../../constant.dart';

class OrderForm extends StatefulWidget {
  const OrderForm({Key? key}) : super(key: key);

  @override
  State<OrderForm> createState() => _OrderFormState();
}

class _OrderFormState extends State<OrderForm> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: BlocProvider.of<VendeurBloc>(context).commandeKey,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text(
          "Informations Commande",
          style: TextStyle(
              fontSize: 20, color: kPrimaryColor, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 15,
        ),
        TextFormField(
          decoration: const InputDecoration(hintText: "Numéro téléphone"),
          validator: (value) => value!.isEmpty ? "Entrez une value" : null,
          keyboardType: TextInputType.number,
        ),
        const SizedBox(
          height: 15,
        ),
        TextFormField(
          decoration: const InputDecoration(hintText: "Numéro téléphone 2*"),
          validator: (value) => value!.isEmpty ? "Entrez une value" : null,
          keyboardType: TextInputType.number,
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          decoration: const InputDecoration(hintText: "Prix"),
          validator: (value) => value!.isEmpty ? "Entrez une value" : null,
          keyboardType: TextInputType.number,
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          decoration: const InputDecoration(hintText: "Quantité"),
          validator: (value) => value!.isEmpty ? "Entrez une value" : null,
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          decoration: const InputDecoration(hintText: "Order ID"),
          validator: (value) => value!.isEmpty ? "Entrez une value" : null,
          keyboardType: TextInputType.number,
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          decoration: const InputDecoration(hintText: "Designation"),
          validator: (value) => value!.isEmpty ? "Entrez une value" : null,
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          maxLines: 3,
          decoration: const InputDecoration(hintText: "Commentaire"),
          validator: (value) => value!.isEmpty ? "Entrez une value" : null,
        )
      ]),
    );
  }
}
