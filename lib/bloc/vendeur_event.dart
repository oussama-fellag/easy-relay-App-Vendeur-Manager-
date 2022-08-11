part of 'vendeur_bloc.dart';

@immutable
abstract class VendeurEvent {}

class AddCommande extends VendeurEvent {}

class AddLivraison extends VendeurEvent {}

class AddClient extends VendeurEvent {}

class Decrement extends VendeurEvent {}
