import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test12/bloc/vendeur_bloc.dart';
import 'package:test12/constants.dart';
import 'package:test12/models/models.dart';

class ClientForm extends StatefulWidget {
  const ClientForm({Key? key, this.nomHint, this.prenomHint}) : super(key: key);
  final String? nomHint;
  final String? prenomHint;
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
          decoration: InputDecoration(hintText: widget.nomHint ?? "Nom*"),
          controller: BlocProvider.of<VendeurBloc>(context).nomController,
          validator: (value) => value!.isEmpty ? "Entrez une valeur" : null,
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          decoration: InputDecoration(hintText: widget.prenomHint ?? "Prénom*"),
          controller: BlocProvider.of<VendeurBloc>(context).prenomController,
          validator: (value) => value!.isEmpty ? "Entrez une valeur" : null,
        )
      ]),
    );
  }
}
