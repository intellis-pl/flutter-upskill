import 'package:injectable/injectable.dart';
import 'package:multilayerapp/data/repositories/calculator_repository_impl.dart';
import 'package:multilayerapp/domain/entities/calculator_result.dart';
import 'package:multilayerapp/injection.dart';

//TODO add to bind repository implementation for production enviroment
@Bind.toType(CalculatorSimulatorRepository, env: Env.prod)
@Bind.toType(CalculatorSimulatorRepository, env: Env.dev)
@injectable
abstract class CalculatorRepository {
  Future<CalculatorResult> fetchVatResult(String amount);
  Future<CalculatorResult> fetchDetailedVatResult(String amount);
}