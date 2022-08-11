import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test12/Screens/global%20widgets/bottom_button.dart';
import 'package:test12/Screens/vendeur/client_form.dart';
import 'package:test12/Screens/vendeur/delivery_form.dart';

import '../../bloc/vendeur_bloc.dart';
import '../../constant.dart';
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
      currentText = "confirmer";
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = const [ClientForm(), DeliveryForm()];
    return SafeArea(
      child: BlocConsumer<VendeurBloc, VendeurState>(
        listener: (context, state) {
          print(state);
          if (state is QuitPage) {
            Navigator.pop(context);
          }
        },
        buildWhen: ((previous, current) => current is! QuitPage),
        builder: (context, state) {
          return BlocBuilder<VendeurBloc, VendeurState>(
              builder: (context, state) {
            print(state);
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0.0,
                leading: IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    color: kPrimaryColor,
                  ),
                  onPressed: () {
                    BlocProvider.of<VendeurBloc>(context).add(Decrement());
                  },
                ),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              floatingActionButton: BottomButton(
                  text: currentText,
                  onTap: updateIndex,
                  currentIndex: state.currentIndex),
              body: Padding(
                padding:
                    const EdgeInsets.only(left: 16.0, right: 16, bottom: 76),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      CustomStepper(
                        currentIndex: state.currentIndex,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      widgets[state.currentIndex]
                    ],
                  ),
                ),
              ),
            );
          });
        },
      ),
    );
  }
}
