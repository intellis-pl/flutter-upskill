
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

import 'enums/income_tax_type.dart';
import 'enums/rate_type.dart';

class CalculatorRequest extends Equatable {
  final String amount;
  final RateType vatRate;
  final IncomeTaxType incomeTaxType;
  final bool vatPayer;


  CalculatorRequest(
      {
        @required this.amount,
        @required this.vatPayer,
        @required this.incomeTaxType,
        @required this.vatRate
      });

  @override
  List<Object> get props => [
    amount,
    vatRate,
    vatPayer,
    incomeTaxType
  ];

}