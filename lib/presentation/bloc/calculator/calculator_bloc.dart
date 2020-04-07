import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:multilayerapp/domain/entities/calculator_result.dart';
import 'package:multilayerapp/domain/repositories/calculator_repository.dart';

import 'bloc.dart';

@injectable
class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  final CalculatorRepository calculatorRepository;

  CalculatorBloc(this.calculatorRepository);

  @override
  CalculatorState get initialState => CalculatorInitialState();

  @override
  Stream<CalculatorState> mapEventToState(
    CalculatorEvent event,
  ) async* {
    yield CalculatorLoading();
    if(event is GetResult) {
      final CalculatorResult result = await calculatorRepository.fetchVatResult(event.amount);
      yield CalculatorLoaded(result);
    }
    if(event is GetDetailedResult) {
      final CalculatorResult result = await calculatorRepository.fetchDetailedVatResult(event.amount);
      yield CalculatorLoaded(result);
    }
    if(event is CalculatorError) {
      yield CalculatorError("somethong goes wrong, ho hohoho");
    }

  }
}
