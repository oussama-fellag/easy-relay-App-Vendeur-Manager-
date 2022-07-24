import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'livraison_event.dart';
part 'livraison_state.dart';

class LivraisonBloc extends Bloc<LivraisonEvent, LivraisonState> {
  LivraisonBloc() : super(LivraisonInitial()) {
    on<LivraisonEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
