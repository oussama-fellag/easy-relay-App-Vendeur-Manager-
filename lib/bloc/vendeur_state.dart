part of 'vendeur_bloc.dart';

@immutable
abstract class VendeurState {
  final int currentIndex;
  const VendeurState({required this.currentIndex});
}

class VendeurInitial extends VendeurState {
  const VendeurInitial({int currentIndex = 0})
      : super(currentIndex: currentIndex);
}

class ClientSuccess extends VendeurState {
  const ClientSuccess({int currentIndex = 1})
      : super(currentIndex: currentIndex);
}

class LivraisonSuccess extends VendeurState {
  const LivraisonSuccess({int currentIndex = 1})
      : super(currentIndex: currentIndex);
}

class QuitPage extends VendeurState {
  const QuitPage({final int currentIndex = 0})
      : super(currentIndex: currentIndex);
}
