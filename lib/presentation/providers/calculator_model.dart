
import 'package:flutter/widgets.dart';
import 'package:multilayerapp/data/models/enums/rate_type.dart';
import 'package:multilayerapp/data/models/enums/tax_type.dart';
import 'package:multilayerapp/domain/entities/calculator_request.dart';

class CalculatorModel extends ChangeNotifier {
  CalculatorRequest _calculatorRequest;
  String _amount;
  RateType _vatRate;
  TaxType _incomeTaxType;
  bool _vatPayer;

  CalculatorRequest get calculatorRequest => _calculatorRequest;

  void addAmount(String amount) {
    _amount = amount;
  }

  void addRate(RateType vatRate) {
    _vatRate = vatRate;
  }

  void addIncomeTaxType(TaxType incomeTaxType) {
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