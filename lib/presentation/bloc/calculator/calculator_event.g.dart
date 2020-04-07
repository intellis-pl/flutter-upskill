// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calculator_event.dart';

// **************************************************************************
// SuperEnumGenerator
// **************************************************************************

@immutable
abstract class CalculatorEvent extends Equatable {
  const CalculatorEvent(this._type);

  factory CalculatorEvent.getResult({@required String amount}) = GetResult;

  factory CalculatorEvent.getDetailedResult({@required String amount}) =
      GetDetailedResult;

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
  const GetResult({@required this.amount}) : super(_CalculatorEvent.GetResult);

  final String amount;

  @override
  String toString() => 'GetResult(amount:${this.amount})';
  @override
  List get props => [amount];
}

@immutable
class GetDetailedResult extends CalculatorEvent {
  const GetDetailedResult({@required this.amount})
      : super(_CalculatorEvent.GetDetailedResult);

  final String amount;

  @override
  String toString() => 'GetDetailedResult(amount:${this.amount})';
  @override
  List get props => [amount];
}
