import 'package:multilayerapp/domain/entities/calculator_response.dart';
import 'package:super_enum/super_enum.dart';

part 'calculator_state.g.dart';

@superEnum
enum _CalculatorState {
  @object
  Initial,@object
  Loading,

  //class with constructor
  @Data(fields: [
    DataField('calculator', CalculatorResponse)
  ])
  Loaded,@Data(fields: [
    DataField('message', String)
  ])
Error
}
