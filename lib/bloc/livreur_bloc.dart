import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test12/services/manager_requests.dart';

import '../models/models.dart';

part 'livreur_event.dart';
part 'livreur_state.dart';

class LivreurBloc extends Bloc<LivreurEvent, LivreurState> {
  final Compte compte;
  final ManagerRequests requests = ManagerRequests();
  LivreurBloc({required this.compte}) : super(LivreurInitial()) {
    on<GetLivreur>((event, emit) async {
      emit(LivreurInitial());
      var result = await requests.getLivreurs(compte);
      if (result is String) {
        emit(LivreurErreur(error: result));
      } else {
        emit(LivreurReady(livreurs: result));
      }
    });
  }
}
