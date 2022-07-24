class Livreur {
  String? nom;
  String? prenom;
 Livreur({required this.nom,required this.prenom});
 @override
 String toString() => nom!+prenom!;
 }