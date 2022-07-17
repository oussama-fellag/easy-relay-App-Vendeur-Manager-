import 'compte.dart';

class Vendeur {
  String? nom;
  String? nomVendeur;
  String? prenom;
  String? adresse;
  int? communeId;
  Compte? compte;
  int? num1;
  int? num2;
  String? ric;
  String? rib;

  setfirstPart({String? nomVendeur, String? prenom, Compte? compte}) {
    this.nomVendeur = nomVendeur;
    this.prenom = prenom;
    this.compte = compte;
  }

  setSecondPart(
      {String? adresse, int? communeId, int? num1, int? num2, String? nom}) {
    this.adresse = adresse;
    this.communeId = communeId;
    this.num1 = num1;
    this.num2 = num2;
    this.nom = nom;
  }

  Map<String, dynamic> toJson() => {
        'nom': nom,
        'nom_vendeur': nomVendeur,
        'prenom': prenom,
        'adresse': adresse,
        'commune_id': communeId,
        'emailVen': compte!.email,
        'mdp': compte!.password,
        'num': num1,
        'num2': num2,
        'ric': ric,
        'rib': rib,
      };
}
