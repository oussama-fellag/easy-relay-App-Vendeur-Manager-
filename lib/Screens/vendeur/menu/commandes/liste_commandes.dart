import 'package:test12/models/client.dart';
import 'package:test12/models/commande.dart';
import 'package:test12/models/livraison.dart';

Client client1 = const Client(nom: "Oussama", prenom: "Fellag");
Livraison livraison1 = const Livraison(
    adresse: "Hey IMAMA",
    prix: 650,
    wilaya: "Tlemcen",
    commune: "Mansourah",
    etat: "En attente");
Livraison livraison2 = const Livraison(
    adresse: "Hey IMAMA",
    prix: 650,
    wilaya: "Tlemcen",
    commune: "Mansourah",
    etat: "Validé");
Livraison livraison3 = const Livraison(
    adresse: "Hey IMAMA",
    prix: 650,
    wilaya: "Tlemcen",
    commune: "Mansourah",
    etat: "Validé");
Livraison livraison4 = const Livraison(
    adresse: "Hey IMAMA",
    prix: 650,
    wilaya: "Tlemcen",
    commune: "Mansourah",
    etat: "En cours");
Commande commande1 = Commande(
    client: client1,
    livraison: livraison1,
    numero1: 0558221943,
    quantity: 5,
    tracking: 568,
    price: 800);
Commande commande2 = Commande(
    client: client1,
    livraison: livraison2,
    numero1: 0558221943,
    quantity: 5,
    tracking: 568,
    price: 800);
Commande commande3 = Commande(
    client: client1,
    livraison: livraison3,
    numero1: 0558221943,
    quantity: 5,
    tracking: 568,
    price: 800);
Commande commande4 = Commande(
    client: client1,
    livraison: livraison4,
    numero1: 0558221943,
    quantity: 5,
    tracking: 568,
    price: 800);
List<Commande> commandes = [
  commande1,
  commande2,
  commande3,
  commande4,
  commande1
];
