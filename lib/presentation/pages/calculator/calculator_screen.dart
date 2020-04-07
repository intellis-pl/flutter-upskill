import 'package:decimal/decimal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multilayerapp/presentation/bloc/calculator/bloc.dart';

class CalculatorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('VAT Calculator'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(vertical: 16),
            alignment: Alignment.center,
            child: BlocListener<CalculatorBloc, CalculatorState>(
              listener: (context, state) {
                if(state is CalculatorError) {
                  Scaffold.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.message),
                    ),
                  );
                }
              },
              child: BlocBuilder<CalculatorBloc, CalculatorState>(
                builder: (context, state) {
                  return _buildLayoutForState(context, state);
                },
              ),
            )
          )
        ],
      ),
    );
  }


  Widget _buildLayoutForState(BuildContext context, CalculatorState state) {
    return _cityNameInputField(context);
  }

  Widget _cityNameInputField(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          onSubmitted: (value) => {
            _submitToBloc(context, value),
          },
        ),
      ],
    );
  }

  void _submitToBloc(BuildContext context, String value) {
    final calculatorBloc = BlocProvider.of<CalculatorBloc>(context);
    var amount = Decimal.parse(value);
    calculatorBloc.add(GetResult(amount));
  }
}