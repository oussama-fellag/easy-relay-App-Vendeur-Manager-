class WrongCredentials implements Exception {
  final dynamic exceptionMessage;
  WrongCredentials([this.exceptionMessage = "Wrong credentials"]);
  @override
  String toString() {
    // TODO: implement toString
    return exceptionMessage;
  }
}
