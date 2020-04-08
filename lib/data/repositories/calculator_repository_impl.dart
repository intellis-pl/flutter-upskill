import 'dart:developer';

import 'package:decimal/decimal.dart';
import 'package:injectable/injectable.dart';
import 'package:multilayerapp/domain/entities/calculator_request.dart';
import 'package:multilayerapp/domain/entities/calculator_response.dart';
import 'package:multilayerapp/domain/repositories/calculator_repository.dart';

@injectable
class CalculatorSimulatorRepository extends CalculatorRepository {
  @override
  Future<CalculatorResponse> fetchVatResult(CalculatorRequest calculatorRequest) {
    return Future.delayed(
      Duration(seconds: 1),
        () {
          var decimalAmount = Decimal.tryParse(calculatorRequest.amount);
          log("${calculatorRequest.amount}");
          if(decimalAmount == null) {
            throw ArgumentError();
          }
          return CalculatorResponse(
              amount: decimalAmount,
              incomeTaxAmount: Decimal.fromInt(100),
              realAmount: Decimal.fromInt(100),
              savedAmount: Decimal.fromInt(100),
              taxAmount: Decimal.fromInt(100)
          );
        }
    );
  }

  @override
  Future<CalculatorResponse> fetchDetailedVatResult(CalculatorRequest calculatorRequest) {
    return Future.delayed(
      Duration(seconds: 1),
        () {
          var decimalAmount = Decimal.tryParse(calculatorRequest.amount);
          if(decimalAmount == null) {
            throw ArgumentError();
          }
          return CalculatorResponse(
              amount: decimalAmount,
              incomeTaxAmount: Decimal.fromInt(100),
              realAmount: Decimal.fromInt(100),
              savedAmount: Decimal.fromInt(100),
              taxAmount: Decimal.fromInt(100)
          );
        }
    );
  }

}