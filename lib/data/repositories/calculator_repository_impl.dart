import 'package:decimal/decimal.dart';
import 'package:injectable/injectable.dart';
import 'package:multilayerapp/domain/entities/calculator_response.dart';
import 'package:multilayerapp/domain/repositories/calculator_repository.dart';

@injectable
class CalculatorSimulatorRepository extends CalculatorRepository {
  @override
  Future<CalculatorResponse> fetchVatResult(String amount) {
    return Future.delayed(
      Duration(seconds: 1),
        () {
          var decimalAmount = Decimal.tryParse(amount);
          if(decimalAmount == null) {
            throw ArgumentError();
          }
          return CalculatorResponse(amount: decimalAmount);
        }
    );
  }

  @override
  Future<CalculatorResponse> fetchDetailedVatResult(String amount) {
    return Future.delayed(
      Duration(seconds: 1),
        () {
          var decimalAmount = Decimal.tryParse(amount);
          if(decimalAmount == null) {
            throw ArgumentError();
          }
          return CalculatorResponse(amount: decimalAmount);
        }
    );
  }

}