class UnexpectedError implements Exception {
  final dynamic exceptionMessage;
  UnexpectedError([this.exceptionMessage = "unexpected error happened"]);
  @override
  String toString() {
    // TODO: implement toString
    return exceptionMessage;
  }
}
