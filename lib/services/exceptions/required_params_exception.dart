class RequiredParamsException implements Exception {
  final dynamic exceptionMessage;
  RequiredParamsException(
      [this.exceptionMessage = "one of the required parameters is not set"]);
}
