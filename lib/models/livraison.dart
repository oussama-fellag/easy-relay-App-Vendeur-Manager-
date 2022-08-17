class Livraison {
  final String adresse;
  final String wilaya;
  final int prix;
  final String? commune;
  final String? etat;
  const Livraison({
    required this.adresse,
    required this.wilaya,
    required this.prix,
    this.etat,
    this.commune,
  });
}
