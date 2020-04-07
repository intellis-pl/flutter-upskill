import 'package:decimal/decimal.dart';
import 'package:equatable/equatable.dart';

abstract class CalculatorEvent extends Equatable {
  const CalculatorEvent();
}

class GetResult extends CalculatorEvent {
  final Decimal amount;

  GetResult(this.amount);

  @override
  List<Object> get props => [amount];
}

class GetDetailedResult extends CalculatorEvent {
  final Decimal amount;

  GetDetailedResult(this.amount);

  @override
  List<Object> get props => [amount];


}
