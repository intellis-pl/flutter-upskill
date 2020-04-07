
import 'package:decimal/decimal.dart';
import 'package:equatable/equatable.dart';

class CalculatorResponse extends Equatable {
  final Decimal amount;
  final Decimal savedAmount;
  final Decimal taxAmount;
  final Decimal incomeTaxAmount;
  final Decimal realAmount;

  CalculatorResponse(
      {
        this.amount,
        this.savedAmount,
        this.taxAmount,
        this.realAmount,
        this.incomeTaxAmount
      });

  @override
  List<Object> get props => [
    amount,
    savedAmount,
    taxAmount,
    incomeTaxAmount,
    realAmount
  ];

}