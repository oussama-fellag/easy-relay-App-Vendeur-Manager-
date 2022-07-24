import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test12/bloc/vendeur_bloc.dart';
import 'package:test12/constants.dart';

class ClientForm extends StatefulWidget {
  const ClientForm({Key? key}) : super(key: key);

  @override
  State<ClientForm> createState() => _ClientFormState();
}

class _ClientFormState extends State<ClientForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: BlocProvider.of<VendeurBloc>(context).clientKey,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text(
          "Informations Client",
          style: TextStyle(
              fontSize: 20, color: kPrimaryColor, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 15,
        ),
        TextFormField(
          decoration: const InputDecoration(hintText: "Nom"),
          validator: (value) => value!.isEmpty ? "Entrez une valeur" : null,
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          decoration: const InputDecoration(hintText: "Prénom"),
          validator: (value) => value!.isEmpty ? "Entrez une valeur" : null,
        )
      ]),
    );
  }
}
