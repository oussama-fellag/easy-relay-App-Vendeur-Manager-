class ActionNotFoundException implements Exception {
  final dynamic exceptionMessage;
  ActionNotFoundException([this.exceptionMessage = "action not found"])
      : super();
}
