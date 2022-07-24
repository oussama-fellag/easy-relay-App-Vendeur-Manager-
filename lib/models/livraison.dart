class Livraison {
  final String adresse;
  final String wilaya;
  final int prix;
  final String? commune;
  final String? geo;
  const Livraison(
      {required this.adresse,
      required this.wilaya,
      required this.prix,
      this.commune,
      this.geo});
}
