import 'package:test12/models/client.dart';
import 'package:test12/models/commande.dart';
import 'package:test12/models/livraison.dart';

Client client1 = const Client(nom: "Oussama", prenom: "Fellag");
Livraison livraison1 = const Livraison(
    adresse: "Hey IMAMA", prix: 650, wilaya: "Tlemcen", commune: "Mansourah");

Commande commande1 = Commande(
    client: client1,
    livraison: livraison1,
    numero1: 0558221943,
    quantity: 5,
    tracking: 568,
    price: 800);
List<Commande> commandes = [
  commande1,
  commande1,
  commande1,
  commande1,
  commande1
];
