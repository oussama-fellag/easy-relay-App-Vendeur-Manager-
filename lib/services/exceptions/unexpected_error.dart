class UnexpectedError implements Exception {
  final dynamic exceptionMessage;
  UnexpectedError([this.exceptionMessage = "unexpected error happened"]);
}
