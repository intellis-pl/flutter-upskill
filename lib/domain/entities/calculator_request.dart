
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:multilayerapp/data/models/enums/rate_type.dart';
import 'package:multilayerapp/data/models/enums/tax_type.dart';

class CalculatorRequest extends Equatable {
  final String amount;
  final RateType vatRate;
  final TaxType incomeTaxType;
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