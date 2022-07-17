class OrderExistException implements Exception {
  final dynamic exceptionMessage;
  OrderExistException([this.exceptionMessage = "order already exists"]);
}
