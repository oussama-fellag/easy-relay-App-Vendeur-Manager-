import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../models/models.dart';

part 'vendeur_event.dart';
part 'vendeur_state.dart';

class VendeurBloc extends Bloc<VendeurEvent, VendeurState> {
  var vendeurRepository;
  Livraison? livraison;
  Client? client;
  GlobalKey<FormState> livraisonKey = GlobalKey<FormState>();
  GlobalKey<FormState> clientKey = GlobalKey<FormState>();
  GlobalKey<FormState> commandeKey = GlobalKey<FormState>();

  VendeurBloc() : super(VendeurInitial()) {
    on<AddCommande>((event, emit) {
      vendeurRepository.ajouterCommande();
    });
    on<AddLivraison>((event, emit) {
      if (livraisonKey.currentState!.validate()) {
        livraison = event.livraison;
      }
    });
    on<AddClient>((event, emit) {
      if (clientKey.currentState!.validate()) {
        client = event.client;
      }
    });
  }
}
