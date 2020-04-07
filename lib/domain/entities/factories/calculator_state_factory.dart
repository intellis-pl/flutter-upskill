import 'package:multilayerapp/presentation/bloc/calculator/calculator_state.dart';

import '../state.dart';

class CalculatorStateFactory {
  static final Map<State, CalculatorState> calculatorStates = ({
    State.INIT: CalculatorInitialState(),
    State.LOADING: CalculatorLoading()
  });
}