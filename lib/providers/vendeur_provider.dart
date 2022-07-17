import 'package:flutter/cupertino.dart';
import 'package:test12/models/models.dart';

class VendeurProvider extends ChangeNotifier {
  final Vendeur _vendeur = Vendeur();
  Vendeur get vendeur => _vendeur;
  firstPart({String? nomVendeur, String? prenom, Compte? compte}) {
    _vendeur.setfirstPart(
        compte: compte, nomVendeur: nomVendeur, prenom: prenom);
  }

  secondPart(
      {String? adresse, int? communeId, int? num1, int? num2, String? nom}) {
    _vendeur.setSecondPart(
        adresse: adresse,
        communeId: communeId,
        nom: nom,
        num1: num1,
        num2: num2);
  }
}
