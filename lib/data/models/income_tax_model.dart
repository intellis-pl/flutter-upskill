
import 'enums/rate_type.dart';
import 'enums/tax_type.dart';
import '../../data/models/finance_type.dart';

class IncomeTaxModel implements FinanceType<TaxType> {
  static final Map<TaxType, String> _names = ({
    TaxType.GENERAL_LOWER: "17% - zasady ogólne od 2020 roku",
    TaxType.GENERAL_HIGHER: "18% - zasady ogólne",
    TaxType.LINEAR: "19% - podatek liniowy",
    TaxType.SECOND_THRESHOLD: "32% - drugi próg",
  });
  TaxType valueType;

  factory IncomeTaxModel() {
    return IncomeTaxModel._();
  }

IncomeTaxModel._();

  @override
  String getName(TaxType name) {
    return _names[name];
  }

  @override
  List<TaxType> getValues() {
    return TaxType.values;
  }
}