import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:test12/models/livraison.dart';

part 'livraison_event.dart';
part 'livraison_state.dart';

class LivraisonBloc extends Bloc<LivraisonEvent, LivraisonState> {
  late Livraison livraison;
  TextEditingController adresseController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  LivraisonBloc() : super(LivraisonInitial()) {
    on<AjouterLivraison>((event, emit) {
      emit(LivraisonLoading());
      if (formKey.currentState!.validate()) {
        emit(LivraisonSuccess());
        livraison = event.livraison;
      }
    });
  }
}
