import 'package:test12/models/client.dart';
import 'package:test12/models/livraison.dart';

class Commande {
  final Client client;
  final Livraison livraison;
  final int numero1;
  final int? numero2;
  final int quantity;
  final int tracking;
  final double price;
  final String? designation;
  final String? commentaire;
  const Commande(
      {required this.client,
      required this.livraison,
      required this.numero1,
      required this.quantity,
      required this.tracking,
      required this.price,
      this.designation,
      this.commentaire,
      this.numero2});
  Map<String, dynamic> toJson() {
    return {
      "email": '',
      "password": '',
      "tracking_vendor": '',
      "client_name": client.prenom,
      "client_last_name": client.nom,
      "delivery_address": livraison.adresse,
      "delivery_wilaya": livraison.wilaya,
      "delivery_commune": livraison.commune ?? '',
      "delivery_price": livraison.prix,
      'phone1': numero1,
      'phone2': numero2 ?? '',
      'price': price,
      'qty': quantity,
      'tracking': tracking,
      'commentaire': commentaire ?? '',
      'designation': designation ?? '',
      "delivery_geo": livraison.geo ?? '',
    };
  }
}
