import 'state_failure.dart';

abstract class BaseState {}

abstract class ErrorState extends BaseState {
  final BaseFailure failure;

  ErrorState(this.failure);
}

abstract class LoadingState extends BaseState {}

class NotFoundErrorMainState extends ErrorState {
  NotFoundErrorMainState(super.failure);
}
