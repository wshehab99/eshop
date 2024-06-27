import 'package:flutter/material.dart';

import '../../../config/response_code.dart';
import '../../../resources/base/state_failure.dart';
import 'no_internet_error_view.dart';
import 'not_found_error_view.dart';
import 'unauthenticated_error_view.dart';
import 'unknown_error_view.dart';

class ErrorView extends StatelessWidget {
  const ErrorView(this.failure, {super.key});

  final BaseFailure failure;

  @override
  Widget build(BuildContext context) {
    switch (failure.statusCode) {
      case ResponseCodeConfig.notFound:
        return NotFoundErrorView(failure);
      case ResponseCodeConfig.unauthorized:
        return UnauthenticatedErrorView(failure);
      case ResponseCodeConfig.noInternetConnection:
        return NoInternetErrorView(failure);
      default:
        return UnknownErrorView(failure);
    }
  }
}
