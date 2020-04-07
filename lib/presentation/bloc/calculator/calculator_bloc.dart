import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:multilayerapp/domain/entities/calculator_response.dart';
import 'package:multilayerapp/domain/repositories/calculator_repository.dart';

import 'bloc.dart';

@injectable
class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  final CalculatorRepository calculatorRepository;

  CalculatorBloc(this.calculatorRepository);

  @override
  CalculatorState get initialState => CalculatorState.initial();

  @override
  Stream<CalculatorState> mapEventToState(CalculatorEvent event) async* {
    yield CalculatorState.loading();

    //yield every state emmited from the when statement (from every events like getResult, getDetailedResult etc.)
    yield* event.when(
        getResult: (getResultEvent) => mapGetResultToState(getResultEvent)
    );
  }

  Stream<CalculatorState> mapGetResultToState(GetResult getResultEvent) async* {
    try{
      final CalculatorResponse result = await calculatorRepository.fetchVatResult(getResultEvent.amount);
      yield CalculatorState.loaded(calculator: result);
    } on ArgumentError {
      yield CalculatorState.error(message: "Invalid Argument: ${getResultEvent.amount}");
    }
  }
}
