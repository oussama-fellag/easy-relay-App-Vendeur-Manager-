import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:number_inc_dec/number_inc_dec.dart';
import 'package:test12/bloc/vendeur_bloc.dart';
import 'package:test12/constants.dart';
import 'widgets/wilya_button.dart';

class ClientForm extends StatefulWidget {
  const ClientForm(
      {Key? key,
      this.nomHint,
      this.prenomHint,
      this.numero,
      this.quantity,
      this.prix})
      : super(key: key);
  final String? nomHint;
  final String? prenomHint;
  final String? numero;
  final String? quantity;
  final String? prix;
  @override
  State<ClientForm> createState() => _ClientFormState();
}

class _ClientFormState extends State<ClientForm> {
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
        ),
        const SizedBox(
          height: 15,
        ),
        TextFormField(
          controller: BlocProvider.of<VendeurBloc>(context).num1,
          decoration:
              InputDecoration(hintText: widget.numero ?? "Numéro téléphone*"),
          validator: (value) => value!.isEmpty ? "Entrez une value" : null,
          keyboardType: TextInputType.number,
        ),
        const SizedBox(
          height: 15,
        ),
        TextFormField(
          controller: BlocProvider.of<VendeurBloc>(context).num2,
          decoration: const InputDecoration(hintText: "Numéro téléphone 2"),
          keyboardType: TextInputType.number,
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          controller: BlocProvider.of<VendeurBloc>(context).prix,
          decoration: InputDecoration(hintText: widget.prix ?? "Prix*"),
          validator: (value) => value!.isEmpty ? "Entrez une value" : null,
          keyboardType: TextInputType.number,
        ),
        const SizedBox(
          height: 10,
        ),
        NumberInputPrefabbed.roundedButtons(
          incDecBgColor: kPrimaryLightColor,
          separateIcons: true,
          decIconColor: kPrimaryColor,
          incIconColor: kPrimaryColor,
          textAlign: TextAlign.left,
          controller: BlocProvider.of<VendeurBloc>(context).quantite,
          onChanged: (newValue) => newValue == 0 ? "Entrez une valeur" : null,
          // validator: (value) => value == "0" ? "Entrez une valeur" : null,
          max: 100,
          enabled: true,
          numberFieldDecoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.always,
              labelText: "Quantité",
              hintText: "Quantité",
              hintStyle: TextStyle(color: Colors.black.withOpacity(0.3)),
              filled: true,
              fillColor: kPrimaryColor.withOpacity(0.1),
              iconColor: kPrimaryColor,
              prefixIconColor: kPrimaryColor,
              contentPadding: const EdgeInsets.symmetric(
                  horizontal: defaultPadding, vertical: defaultPadding),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                borderSide: BorderSide.none,
              ),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                borderSide: BorderSide(
                  color: kPrimaryColor,
                ),
              ),
              errorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                borderSide: BorderSide(
                  color: Colors.red,
                ),
              )),
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          controller: BlocProvider.of<VendeurBloc>(context).orderId,
          decoration: const InputDecoration(hintText: "Order ID*"),
          validator: (value) => value!.isEmpty ? "Entrez une value" : null,
          keyboardType: TextInputType.number,
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          controller: BlocProvider.of<VendeurBloc>(context).designation,
          decoration: const InputDecoration(hintText: "Designation"),
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          controller: BlocProvider.of<VendeurBloc>(context).commentaire,
          maxLines: 3,
          decoration: const InputDecoration(hintText: "Commentaire"),
        )
      ]),
    );
  }
}
