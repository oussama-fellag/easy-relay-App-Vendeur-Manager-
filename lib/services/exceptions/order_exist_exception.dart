class OrderExistException implements Exception {
  final dynamic exceptionMessage;
  OrderExistException([this.exceptionMessage = "order already exists"]);
  @override
  String toString() {
    // TODO: implement toString
    return exceptionMessage;
  }
}
