part of 'livraison_bloc.dart';

@immutable
abstract class LivraisonEvent {}

class AjouterLivraison extends LivraisonEvent {
  final Livraison livraison;
  AjouterLivraison({required this.livraison});
}
