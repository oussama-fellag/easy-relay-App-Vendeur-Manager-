import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../models/models.dart';

part 'vendeur_event.dart';
part 'vendeur_state.dart';

class VendeurBloc extends Bloc<VendeurEvent, VendeurState> {
  Livraison? livraison;
  Commande? commande;
  int currentIndex = 0;
  Client? client;
  GlobalKey<FormState> livraisonKey = GlobalKey<FormState>();
  GlobalKey<FormState> clientKey = GlobalKey<FormState>();
  GlobalKey<FormState> commandeKey = GlobalKey<FormState>();
  TextEditingController nomController = TextEditingController();
  TextEditingController prenomController = TextEditingController();
  TextEditingController adresseController = TextEditingController();
  TextEditingController num1 = TextEditingController();
  TextEditingController num2 = TextEditingController();
  TextEditingController prix = TextEditingController();
  TextEditingController quantite = TextEditingController();
  TextEditingController orderId = TextEditingController();
  TextEditingController designation = TextEditingController();
  TextEditingController commentaire = TextEditingController();
  VendeurBloc() : super(VendeurInitial()) {
    on<AddCommande>((event, emit) {
      if (commandeKey.currentState!.validate()) {
        client = Client(nom: nomController.text, prenom: prenomController.text);
        commande = Commande(
            client: client!,
            // livraison: livraison!,
            numero1: int.parse(num1.text),
            price: double.parse(prix.text),
            quantity: int.parse(quantite.text),
            tracking: int.parse(orderId.text),
            commentaire: commentaire.text,
            designation: designation.text);
        emit(const ClientSuccess());
        currentIndex++;
      }

      //vendeurRepository.ajouterCommande();
    });
    on<AddLivraison>((event, emit) {
      if (livraisonKey.currentState!.validate()) {
        livraison = Livraison(
            adresse: adresseController.text,
            prix: 4000,
            wilaya: "Tlemcen",
            commune: "Maghnia");
        emit(const LivraisonSuccess());
      }
    });
    on<AddClient>((event, emit) {
      if (clientKey.currentState!.validate()) {
        emit(const ClientSuccess());
      }
    });
    on<Decrement>((event, emit) {
      print(currentIndex);
      print("we");
      if (currentIndex == 0) {
        emit(const QuitPage());
        emit(const VendeurInitial());
      } else {
        emit(const VendeurInitial());
        currentIndex--;
      }
    });
  }
}
