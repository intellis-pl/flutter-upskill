
import '../../data/models/finance_type.dart';
import 'enums/payer_type.dart';

class VatPayerModel implements FinanceType<PayerType> {
  static final Map<PayerType, String> _names = ({
    PayerType.POSITIVE: "TAK",
    PayerType.NEGATIVE: "NIE"
  });
  PayerType valueType;

  factory VatPayerModel() {
    return VatPayerModel._();
  }

  VatPayerModel._();

  @override
  String getName(PayerType name) {
    return _names[name];
  }

  @override
  List<PayerType> getValues() {
    return PayerType.values;
  }
}