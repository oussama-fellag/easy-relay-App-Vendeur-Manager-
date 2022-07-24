part of 'vendeur_bloc.dart';

@immutable
abstract class VendeurEvent {}

class AddCommande extends VendeurEvent {
  final Commande commande;
  AddCommande({required this.commande});
}

class AddLivraison extends VendeurEvent {
  final Livraison livraison;
  AddLivraison({required this.livraison});
}

class AddClient extends VendeurEvent {
  final Client client;
  AddClient({required this.client});
}
