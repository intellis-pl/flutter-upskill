// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calculator_state.dart';

// **************************************************************************
// SuperEnumGenerator
// **************************************************************************

@immutable
abstract class CalculatorState extends Equatable {
  const CalculatorState(this._type);

  factory CalculatorState.initial() = Initial;

  factory CalculatorState.loading() = Loading;

  factory CalculatorState.loaded({@required CalculatorResponse calculator}) =
      Loaded;

  factory CalculatorState.error({@required String message}) = Error;

  final _CalculatorState _type;

//ignore: missing_return
  R when<R>(
      {@required R Function(Initial) initial,
      @required R Function(Loading) loading,
      @required R Function(Loaded) loaded,
      @required R Function(Error) error}) {
    switch (this._type) {
      case _CalculatorState.Initial:
        return initial(this as Initial);
      case _CalculatorState.Loading:
        return loading(this as Loading);
      case _CalculatorState.Loaded:
        return loaded(this as Loaded);
      case _CalculatorState.Error:
        return error(this as Error);
    }
  }

  @override
  List get props => null;
}

@immutable
class Initial extends CalculatorState {
  const Initial._() : super(_CalculatorState.Initial);

  factory Initial() {
    _instance ??= Initial._();
    return _instance;
  }

  static Initial _instance;
}

@immutable
class Loading extends CalculatorState {
  const Loading._() : super(_CalculatorState.Loading);

  factory Loading() {
    _instance ??= Loading._();
    return _instance;
  }

  static Loading _instance;
}

@immutable
class Loaded extends CalculatorState {
  const Loaded({@required this.calculator}) : super(_CalculatorState.Loaded);

  final CalculatorResponse calculator;

  @override
  String toString() => 'Loaded(calculator:${this.calculator})';
  @override
  List get props => [calculator];
}

@immutable
class Error extends CalculatorState {
  const Error({@required this.message}) : super(_CalculatorState.Error);

  final String message;

  @override
  String toString() => 'Error(message:${this.message})';
  @override
  List get props => [message];
}
