
import 'enums/rate_type.dart';
import '../../data/models/finance_type.dart';

class VatRateModel implements FinanceType<RateType> {
  static final Map<RateType, String> _names = ({
    RateType.RATE_23: "23%",
    RateType.RATE_8: "8%",
    RateType.RATE_0: "0% / Rachunek bez VAT"
  });
  RateType valueType;

  factory VatRateModel() {
    return VatRateModel._();
  }

  VatRateModel._();

  @override
  String getName(RateType name) {
    return _names[name];
  }

  @override
  List<RateType> getValues() {
    return RateType.values;
  }
}