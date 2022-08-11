import 'package:flutter/material.dart';
import 'package:test12/Screens/vendeur/client_form.dart';
import 'package:test12/Screens/vendeur/delivery_form.dart';
import 'package:test12/constant.dart';

import '../../../../models/commande.dart';
import '../../../global widgets/bottom_button.dart';

class ModifierCommande extends StatefulWidget {
  const ModifierCommande({Key? key, this.commande}) : super(key: key);
  final Commande? commande;
  @override
  State<ModifierCommande> createState() => _ModifierCommandeState();
}

class _ModifierCommandeState extends State<ModifierCommande> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: const BottomButton(
          text: "confirmer",
        ),
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          elevation: 0.0,
          title: const Text(
            "Modifier commande",
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 76),
          child: CustomScrollView(slivers: [
            const SliverToBoxAdapter(
              child: SizedBox(height: 20),
            ),
            SliverToBoxAdapter(
              child: ClientForm(
                nomHint: widget.commande!.client.nom,
                prenomHint: widget.commande!.client.prenom,
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: 10),
            ),
            SliverToBoxAdapter(
              child: DeliveryForm(
                adresseHint: widget.commande!.livraison!.adresse,
                wilayaHint: widget.commande!.livraison!.wilaya,
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: 10),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: 10),
            ),
          ]),
        ),
      ),
    );
  }
}
