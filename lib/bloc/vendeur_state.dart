part of 'vendeur_bloc.dart';

@immutable
abstract class VendeurState {
  int? currentIndex;
  VendeurState({required this.currentIndex});
}

class VendeurInitial extends VendeurState {
  VendeurInitial({int currentIndex = 0}) : super(currentIndex: currentIndex);
}

class ClientSuccess extends VendeurState {
  ClientSuccess({int currentIndex = 1}) : super(currentIndex: currentIndex);
}

class LivraisonSuccess extends VendeurState {
  LivraisonSuccess({int currentIndex = 2}) : super(currentIndex: currentIndex);
}

class CommandeSuccess extends VendeurState {
  CommandeSuccess({int currentIndex = 2}) : super(currentIndex: currentIndex);
}
