
import 'enums/rate_type.dart';
import 'finance_type.dart';

class VatRateType implements FinanceType<RateType> {
static final Map<RateType, String> _names = ({
    RateType.RATE_17: "17% - zasady ogólne od 2020 roku",
    RateType.RATE_18: "18% - zasady ogólne",
    RateType.RATE_19: "19% - podatek liniowy",
    RateType.RATE_32: "32% - drugi próg",
  });

  factory VatRateType() {
    return VatRateType._();
  }

  VatRateType._();

  @override
  String getName(RateType name) {
    return _names[name];
  }

  @override
  List<RateType> getValues() {
    return RateType.values;
  }
}