import 'dart:developer';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multilayerapp/domain/entities/calculator_request.dart';
import 'package:multilayerapp/domain/entities/calculator_response.dart';
import 'package:multilayerapp/domain/entities/var_rate_type.dart';
import 'package:multilayerapp/presentation/bloc/calculator/bloc.dart';
import 'package:multilayerapp/presentation/bloc/calculator/calculator_state.dart' as calculator_state;
import 'package:multilayerapp/presentation/providers/calculator_model.dart';
import 'package:multilayerapp/presentation/widgets/calculator/drop_down_widget.dart';
import 'package:provider/provider.dart';

class CalculatorScreen extends StatelessWidget {
  static final int LABEL_WIDTH = 3;
  static final int SELECTION_WIDTH = 7;

  @override
  Widget build(BuildContext context) {
    return Consumer<CalculatorModel>(
      builder: (context, model, child) {
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
              Center(
                child:
                  Container(
                    child: FlatButton(
                        onPressed: () {
                          model.onSubmit();
                          _submitToBloc(context, model.calculatorRequest);
                        },
                        child: Column(
                          children: <Widget>[
                            Icon(Icons.drafts,
                              color: Colors.deepPurple,
                            ),
                            Container(
                              child: Text("Oblicz"),
                            )
                          ],
                        )),
                  ),
              )
            ],
          ),

        );
      },
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
              onChanged: (value) => {
              Provider.of<CalculatorModel>(context).addAmount(value)
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
              DropDownWidget(VatRateType())
            ),
        )
      ],
    );
  }

  void _submitToBloc(BuildContext context, CalculatorRequest calculatorRequest) {
    final calculatorBloc = BlocProvider.of<CalculatorBloc>(context);
    calculatorBloc.add(CalculatorEvent.getResult(calculatorRequest: calculatorRequest));
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
          child: Text("Podana kwota: ${calculator.amount}"),
        ),
        Container(
          child: Text("Kwota zaoszczędzona na podatku VAT: ${calculator.taxAmount}"),
        ),
        Container(
          child: Text("Kwota do obliczenia podatku dochodowego: ${calculator.savedAmount}"),
        ),
        Container(
          child: Text("Kwota zaoszczędzona na podatku dochodowym (%): ${calculator.incomeTaxAmount}"),
        ),
        Container(
          child: Text("Faktycznie poniesione koszta: ${calculator.realAmount}",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold
              )),
        ),
        _amountInputField(context)
      ],
    );
  }

  EdgeInsetsGeometry _layoutPadding() {
    return EdgeInsets.fromLTRB(10, 2, 10, 2);
  }
}