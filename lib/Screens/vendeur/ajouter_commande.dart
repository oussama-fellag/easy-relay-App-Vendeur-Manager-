import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test12/Screens/global%20widgets/bottom_button.dart';
import 'package:test12/Screens/vendeur/client_form.dart';
import 'package:test12/Screens/vendeur/delivery_form.dart';
import 'package:test12/Screens/vendeur/order_form.dart';

import '../../bloc/vendeur_bloc.dart';
import '../../models/client.dart';
import 'custom_stepper.dart';

class AjouterCommande extends StatefulWidget {
  const AjouterCommande({Key? key}) : super(key: key);

  @override
  State<AjouterCommande> createState() => _AjouterCommandeState();
}

class _AjouterCommandeState extends State<AjouterCommande> {
  int selectedIndex = 0;
  String currentText = "suivant";
  updateIndex() {
    setState(() {
      if (selectedIndex == 1) {
        currentText = "confirmer";
      }
      if (selectedIndex != 2) {
        selectedIndex++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = const [ClientForm(), DeliveryForm(), OrderForm()];
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton:
            BottomButton(text: currentText, onTap: updateIndex),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              CustomStepper(
                currentIndex: selectedIndex,
              ),
              const SizedBox(
                height: 30,
              ),
              widgets[selectedIndex]
            ],
          ),
        ),
      ),
    );
  }
}
