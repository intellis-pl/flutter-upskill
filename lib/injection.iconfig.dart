// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:multilayerapp/data/repositories/calculator_repository_impl.dart';
import 'package:multilayerapp/domain/repositories/calculator_repository.dart';
import 'package:multilayerapp/presentation/bloc/calculator/calculator_bloc.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void $initGetIt({String environment}) {
  getIt
    ..registerFactory<CalculatorSimulatorRepository>(
        () => CalculatorSimulatorRepository())
    ..registerFactory<CalculatorBloc>(
        () => CalculatorBloc(getIt<CalculatorRepository>()));
  if (environment == 'prod') {
    _registerProdDependencies();
  }
  if (environment == 'dev') {
    _registerDevDependencies();
  }
}

void _registerProdDependencies() {
  getIt
    ..registerFactory<CalculatorRepository>(
        () => CalculatorSimulatorRepository());
}

void _registerDevDependencies() {
  getIt
    ..registerFactory<CalculatorRepository>(
        () => CalculatorSimulatorRepository());
}
