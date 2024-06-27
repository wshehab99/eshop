import '../../resources/base/state_failure.dart';
import '../../resources/others/string_manager.dart';
import 'api_validation.dart';
import 'extra_error.dart';

class Failure {
  final String message;
  final bool success;
  final ApiValidation error;
  final Extra? extra;
  final int status;
  Failure(this.success, this.message, this.error, this.status, {this.extra});

  factory Failure.fromJson(Map<String, dynamic> json, int status) => Failure(
        json["success"] ?? false,
        json["message"] ?? StringManager.unknown,
        ApiValidation.fromJson(
          json["errors"] ?? {},
        ),
        status,
        extra: json['extra'] != null ? Extra.fromJson(json['extra']) : null,
      );

  BaseFailure toBase(Function() retry) => BaseFailure.fromFailure(this, retry);
}
