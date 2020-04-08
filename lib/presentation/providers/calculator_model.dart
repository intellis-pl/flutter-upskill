
import 'package:flutter/widgets.dart';
import 'package:multilayerapp/domain/entities/calculator_request.dart';
import 'package:multilayerapp/domain/entities/enums/income_tax_type.dart';
import 'package:multilayerapp/domain/entities/enums/rate_type.dart';

class CalculatorModel extends ChangeNotifier {
  CalculatorRequest _calculatorRequest;
  String _amount;
  RateType _vatRate;
  IncomeTaxType _incomeTaxType;
  bool _vatPayer;

  CalculatorRequest get calculatorRequest => _calculatorRequest;

  void addAmount(String amount) {
    _amount = amount;
  }

  void addRate(RateType vatRate) {
    _vatRate = vatRate;
  }

  void addIncomeTaxType(IncomeTaxType incomeTaxType) {
    _incomeTaxType = incomeTaxType;
  }

  void addVatPayer(bool vatPayer) {
    _vatPayer = vatPayer;
  }

  void onSubmit() {
    _calculatorRequest = new CalculatorRequest(
        amount: _amount,
        vatPayer: _vatPayer,
        incomeTaxType: _incomeTaxType,
        vatRate: _vatRate
    );
    notifyListeners();
  }
}