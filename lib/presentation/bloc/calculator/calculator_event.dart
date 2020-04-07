import 'package:equatable/equatable.dart';

abstract class CalculatorEvent extends Equatable {
  const CalculatorEvent();
}

class GetResult extends CalculatorEvent {
  final String amount;

  GetResult(this.amount);

  @override
  List<Object> get props => [amount];
}

class GetDetailedResult extends CalculatorEvent {
  final String amount;

  GetDetailedResult(this.amount);

  @override
  List<Object> get props => [amount];


}
