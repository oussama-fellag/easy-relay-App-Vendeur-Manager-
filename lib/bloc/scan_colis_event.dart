part of 'scan_colis_bloc.dart';

@immutable
abstract class ScanColisEvent {}

class CommencerScan extends ScanColisEvent {}

class ConfirmerReception extends ScanColisEvent {}

class OutputScan extends ScanColisEvent {
  OutputScan({required this.barcode});
  final String barcode;
}
