part of 'scan_colis_bloc.dart';

@immutable
abstract class ScanColisState {}

class ScanColisInitial extends ScanColisState {}

class ColisPret extends ScanColisState {
  final List<String> colis;
  ColisPret({required this.colis});
}
