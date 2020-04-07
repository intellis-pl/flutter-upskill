import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multilayerapp/domain/entities/calculator_response.dart';
import 'package:multilayerapp/presentation/bloc/calculator/bloc.dart';
import 'package:multilayerapp/presentation/bloc/calculator/calculator_state.dart' as calculator_state;
import 'package:multilayerapp/presentation/widgets/calculator/drop_down_widget.dart';

class CalculatorScreen extends StatelessWidget {
  static final int LABEL_WIDTH = 3;
  static final int SELECTION_WIDTH = 7;

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
                if(state is calculator_state.Error) {
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
    //underscore means no init data
    return state.when(
        initial: (_) => _amountInputField(context),
        loading: (_) => _buildLoadingLayout(),
        loaded: (s) => _buildLoadedLayoutWithData(context, s.calculator),
        error: (_) => _amountInputField(context));
  }

  Widget _amountInputField(BuildContext context) {
    return Column(
      children: <Widget>[
        _buildAmountEntryRow(context),
        _buildVatRateSelectionRow(context)
      ],
    );
  }

  Widget _buildAmountEntryRow(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: LABEL_WIDTH,
          child:
          Container(
            padding: _layoutPadding(),
            child:
            Text("Podaj kwotę:"),
          ),
        ),
        Expanded(
          flex: SELECTION_WIDTH,
          child:
          Container(
            padding: _layoutPadding(),
            child:
            TextField(
              cursorWidth: 2,
              onSubmitted: (value) => {
                _submitToBloc(context, value),
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildVatRateSelectionRow(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: LABEL_WIDTH,
          child:
            Container(
              padding: _layoutPadding(),
              child:
                Text("Podaj stawkę VAT"),
            ),
        ),
        Expanded(
          flex: SELECTION_WIDTH,
          child:
            Container(
              padding: _layoutPadding(),
              child:
              DropDownWidget()
            ),
        )
      ],
    );
  }

  void _submitToBloc(BuildContext context, String value) {
    final calculatorBloc = BlocProvider.of<CalculatorBloc>(context);
    calculatorBloc.add(CalculatorEvent.getResult(amount: value));
  }

  Widget _buildLoadingLayout() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CircularProgressIndicator()
      ],
    );
  }

  Widget _buildLoadedLayoutWithData(BuildContext context, CalculatorResponse calculator) {
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

  EdgeInsetsGeometry _layoutPadding() {
    return EdgeInsets.fromLTRB(10, 2, 10, 2);
  }
}