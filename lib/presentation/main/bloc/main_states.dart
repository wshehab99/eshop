import '../../../resources/base/base_state.dart';
import '../../../resources/base/state_failure.dart';

abstract class MainStates implements BaseState {}

class InitialMainState extends MainStates {}

class ChangeNavBarIndexMainState extends MainStates {}

class MainView extends MainStates {}

class MainLoading extends MainStates implements LoadingState {}

class MainError extends MainStates implements ErrorState {
  @override
  final BaseFailure failure;
  MainError(this.failure);
}
