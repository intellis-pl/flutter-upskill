abstract class FinanceType<T> {
  T get valueType;
  set valueType(T type);
  List<T> getValues();
  String getName(T name);
}