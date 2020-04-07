import 'dart:async';
import 'dart:developer';

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
    log('data: $event');
    yield CalculatorLoading();
    if(event is GetResult) {
      try{
        final CalculatorResult result = await calculatorRepository.fetchVatResult(event.amount);
        yield CalculatorLoaded(result);
      } on ArgumentError {
        yield CalculatorError("Invalid Argument: ${event.amount}");
      }
    }
    if(event is GetDetailedResult) {
      try {
        final CalculatorResult result = await calculatorRepository
            .fetchDetailedVatResult(event.amount);
        yield CalculatorLoaded(result);
      } on ArgumentError {}
      yield CalculatorError("Invalid Argument: ${event.amount}");
    }

  }
}
