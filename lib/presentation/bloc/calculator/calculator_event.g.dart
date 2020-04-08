// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calculator_event.dart';

// **************************************************************************
// SuperEnumGenerator
// **************************************************************************

@immutable
abstract class CalculatorEvent extends Equatable {
  const CalculatorEvent(this._type);

  factory CalculatorEvent.getResult(
      {@required CalculatorRequest calculatorRequest}) = GetResult;

  factory CalculatorEvent.getDetailedResult(
      {@required CalculatorRequest calculatorRequest}) = GetDetailedResult;

  final _CalculatorEvent _type;

//ignore: missing_return
  R when<R>(
      {@required R Function(GetResult) getResult,
      @required R Function(GetDetailedResult) getDetailedResult}) {
    switch (this._type) {
      case _CalculatorEvent.GetResult:
        return getResult(this as GetResult);
      case _CalculatorEvent.GetDetailedResult:
        return getDetailedResult(this as GetDetailedResult);
    }
  }

  @override
  List get props => null;
}

@immutable
class GetResult extends CalculatorEvent {
  const GetResult({@required this.calculatorRequest})
      : super(_CalculatorEvent.GetResult);

  final CalculatorRequest calculatorRequest;

  @override
  String toString() => 'GetResult(calculatorRequest:${this.calculatorRequest})';
  @override
  List get props => [calculatorRequest];
}

@immutable
class GetDetailedResult extends CalculatorEvent {
  const GetDetailedResult({@required this.calculatorRequest})
      : super(_CalculatorEvent.GetDetailedResult);

  final CalculatorRequest calculatorRequest;

  @override
  String toString() =>
      'GetDetailedResult(calculatorRequest:${this.calculatorRequest})';
  @override
  List get props => [calculatorRequest];
}
