abstract class Failure {
  const Failure({this.message, this.statusCode});

  final String? message;
  final int? statusCode;

  @override
  String toString() => 'Failure(message: $message, statusCode: $statusCode)';
}

class ApiFailure extends Failure {
  const ApiFailure({
    super.message = 'Something went wrong',
    super.statusCode = -1,
  });
}
