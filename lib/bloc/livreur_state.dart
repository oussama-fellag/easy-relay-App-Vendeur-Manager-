part of 'livreur_bloc.dart';

@immutable
abstract class LivreurState {}

class LivreurInitial extends LivreurState {}

class LivreurReady extends LivreurState {
  final List<Livreur> livreurs;
  LivreurReady({required this.livreurs});
}

class LivreurErreur extends LivreurState {
  final String error;
  LivreurErreur({required this.error});
}
