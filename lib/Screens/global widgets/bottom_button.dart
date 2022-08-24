import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test12/bloc/vendeur_bloc.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({
    Key? key,
    required this.text,
    this.currentIndex,
    this.onTap,
  }) : super(key: key);
  final String text;
  final int? currentIndex;
  final Function? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 76,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            blurRadius: 4,
            offset: const Offset(0, -3),
            color: Colors.black.withOpacity(0.05)),
      ]),
      child: ElevatedButton(
          child: Text(
            text.toUpperCase(),
          ),
          onPressed: () {
            if (text == "edit profile" ||
                text == "enregistrer" ||
                text == "receptionner") {
              print("wlad hawmti ");
              onTap!();
            }
            if (text == "confirmer") {
              Navigator.pop(context);
            } else {
              if (currentIndex != null) {
                if (currentIndex == 0) {
                  BlocProvider.of<VendeurBloc>(context).add(AddCommande());
                }
                if (currentIndex == 1) {
                  BlocProvider.of<VendeurBloc>(context).add(AddLivraison());
                }
              }
            }
            // onTap!();
          }),
    );
  }
}
