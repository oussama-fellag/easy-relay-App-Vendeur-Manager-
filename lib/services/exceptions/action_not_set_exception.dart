class ActionNotSetException implements Exception {
  final dynamic exceptionMessage;
  ActionNotSetException([this.exceptionMessage = "action not set"]);
}
