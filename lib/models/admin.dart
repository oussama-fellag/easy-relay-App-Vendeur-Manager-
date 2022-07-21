import 'compte.dart';

class Admin {
  String? id;
  String? nom;
  String? prenom;
  String? tel;
  Compte? compte;
  List<String>? roles;

  Map<String, dynamic> toJson() => {
        'email': compte!.email,
        'mdp': compte!.password,
      };
}
