import 'package:decimal/decimal.dart';
import 'package:injectable/injectable.dart';
import 'package:multilayerapp/domain/entities/calculator_result.dart';
import 'package:multilayerapp/domain/repositories/calculator_repository.dart';

@injectable
class CalculatorSimulatorRepository extends CalculatorRepository {
  @override
  Future<CalculatorResult> fetchVatResult(Decimal amount) {
    return Future.delayed(
      Duration(seconds: 1),
        () {
         return CalculatorResult(amount: amount);
        }
    );
  }

  @override
  Future<CalculatorResult> fetchDetailedVatResult(Decimal amount) {
    return Future.delayed(
      Duration(seconds: 1),
        () {
          return CalculatorResult(
            amount: amount
          );
        }
    );
  }

}