part of 'livraison_bloc.dart';

@immutable
abstract class LivraisonState {}

class LivraisonInitial extends LivraisonState {}

class LivraisonLoading extends LivraisonState {}

class LivraisonSuccess extends LivraisonState {}
