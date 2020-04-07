import 'package:super_enum/super_enum.dart';

part 'calculator_event.g.dart';

@superEnum
enum _CalculatorEvent {
  @Data(fields: [
    DataField('amount', String)
  ])
  GetResult,
  //add other events here
}

/*class GetResult extends CalculatorEvent {
  final String amount;

  GetResult(this.amount);

  @override
  List<Object> get props => [amount];
}

class GetDetailedResult extends CalculatorEvent {
  final String amount;

  GetDetailedResult(this.amount);

  @override
  List<Object> get props => [amount];


}*/
