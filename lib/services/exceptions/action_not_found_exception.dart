class ActionNotFoundException implements Exception {
  final dynamic exceptionMessage;
  ActionNotFoundException([this.exceptionMessage = "action not found"]);
  @override
  String toString() {
    // TODO: implement toString
    return exceptionMessage;
  }
}
