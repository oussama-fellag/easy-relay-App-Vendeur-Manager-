import 'package:audioplayers/audioplayers.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:googleapis/transcoder/v1.dart';
import 'package:meta/meta.dart';
import 'package:test12/models/admin.dart';

part 'scan_colis_event.dart';
part 'scan_colis_state.dart';

class ScanColisBloc extends Bloc<ScanColisEvent, ScanColisState> {
  List<String> colis = [];
  Future playLocalAsset() async {
    String audioasset = "myCustomSoundEffect.mp3";

    AudioPlayer player = AudioPlayer();
    await player.play(AssetSource(audioasset));
  }

  ScanColisBloc() : super(ScanColisInitial()) {
    on<CommencerScan>((event, emit) {
      FlutterBarcodeScanner.getBarcodeStreamReceiver(
              '#ff6666', 'Terminer', true, ScanMode.BARCODE)!
          .listen((barcode) {
        if (barcode.toString()[0] != "-" && !colis.contains(barcode)) {
          playLocalAsset();
          add(OutputScan(barcode: barcode));
        }
      });
    });
    on<OutputScan>((event, emit) {
      colis.add(event.barcode);
      emit(ColisPret(colis: colis));
    });
    on<ConfirmerReception>((event, emit) {
      colis.clear();
      emit(ScanColisInitial());
    });
  }
}
