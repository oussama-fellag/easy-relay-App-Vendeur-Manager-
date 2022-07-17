class CredentialException implements Exception {
  final dynamic exceptionMessage;
  CredentialException([this.exceptionMessage = "wrong email or password"]);
}
