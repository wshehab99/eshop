import '../../app/exceptions/api_validation.dart';
import '../../app/exceptions/extra_error.dart';
import '../../app/exceptions/failure.dart';

class BaseFailure {
  final bool success;
  final int statusCode;
  final String message;
  final ApiValidation error;
  final Extra? extra;
  final Function() retry;

  BaseFailure(
    this.success,
    this.message,
    this.error,
    this.retry,
    this.statusCode, {
    this.extra,
  });

  factory BaseFailure.fromFailure(Failure failure, Function() retry) =>
      BaseFailure(
        failure.success,
        failure.message,
        failure.error,
        retry,
        failure.status,
        extra: failure.extra,
      );
}
