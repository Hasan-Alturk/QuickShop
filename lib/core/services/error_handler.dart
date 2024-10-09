class ExceptionHandler implements Exception {
  final String message;

  ExceptionHandler({required this.message});

  @override
  String toString() {
    return message;
  }
}
