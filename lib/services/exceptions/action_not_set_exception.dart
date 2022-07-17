class ActionNotSetException implements Exception {
  final dynamic exceptionMessage;
  ActionNotSetException([this.exceptionMessage = "action not set"]);
  @override
  String toString() {
    // TODO: implement toString
    return exceptionMessage;
  }
}
