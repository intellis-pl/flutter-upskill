
import 'package:decimal/decimal.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

class CalculatorResult extends Equatable {
  final Decimal amount;

  CalculatorResult({@required this.amount});

  @override
  // TODO: implement props
  List<Object> get props => [
    amount
  ];

}