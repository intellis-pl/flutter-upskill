import 'package:multilayerapp/domain/entities/calculator_request.dart';
import 'package:super_enum/super_enum.dart';

part 'calculator_event.g.dart';

@superEnum
enum _CalculatorEvent {
  @Data(fields: [
    DataField('calculatorRequest', CalculatorRequest)
  ])
  GetResult,
  @Data(fields: [
    DataField('calculatorRequest', CalculatorRequest)
  ])
  GetDetailedResult
  //add other events here
}
