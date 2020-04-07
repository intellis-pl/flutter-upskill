import 'package:super_enum/super_enum.dart';

part 'calculator_event.g.dart';

@superEnum
enum _CalculatorEvent {
  @Data(fields: [
    DataField('amount', String)
  ])
  GetResult,
  @Data(fields: [
    DataField('amount', String)
  ])
  GetDetailedResult
  //add other events here
}
