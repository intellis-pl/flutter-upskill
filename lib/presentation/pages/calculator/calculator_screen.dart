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
          ),
        ],
      ),

    );
  }


  Widget _buildLayoutForState(BuildContext context, CalculatorState state) {
    if(state is CalculatorInitialState) {
      return _amountInputField(context);
    } else if(state is CalculatorLoading) {
      return _buildLoadingLayout();
    } else if(state is CalculatorLoaded) {
      return _buildLoadedLayoutWithData(context, state.calculator);
    } else if(state is CalculatorError) {
      return _amountInputField(context);
    }
  }

  Widget _amountInputField(BuildContext context) {
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
    calculatorBloc.add(GetResult(value));
  }

  Widget _buildLoadingLayout() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CircularProgressIndicator()
      ],
    );
  }

  Widget _buildLoadedLayoutWithData(BuildContext context, calculator) {
    return Column(
      children: <Widget>[
        Container(
          child:
          Text("Calculator result: ${calculator.amount}"),
        ),
        _amountInputField(context)
      ],
    );
  }
}