
enum VatRateType {
  RATE_17,
  RATE_18,
  RATE_19,
  RATE_32,
}

extension Type on VatRateType {
  static final Map<VatRateType, String> names = ({
    VatRateType.RATE_17: "17% - zasady ogólne od 2020 roku",
    VatRateType.RATE_18: "18% - zasady ogólne",
    VatRateType.RATE_19: "19% - podatek liniowy",
    VatRateType.RATE_32: "32% - drugi próg",
  });

  String get name {
    return names[this];
  }
}