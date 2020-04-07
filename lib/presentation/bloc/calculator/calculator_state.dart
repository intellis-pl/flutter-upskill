import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:multilayerapp/domain/entities/calculator_result.dart';

@immutable
abstract class CalculatorState extends Equatable {
  const CalculatorState();
}

class CalculatorInitialState extends CalculatorState {

  const CalculatorInitialState();

  @override
  List<Object> get props => [];
}

class CalculatorLoading extends CalculatorState {
  const CalculatorLoading();

  @override
  List<Object> get props => [];
}

class CalculatorLoaded extends CalculatorState {
  final CalculatorResult result;

  CalculatorLoaded(this.result);

  @override
  List<Object> get props => [result];
}

class CalculatorError extends CalculatorState {
  final String message;

  const CalculatorError(this.message);

  @override
  List<Object> get props => [message];

}
