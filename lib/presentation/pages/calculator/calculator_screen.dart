import 'dart:ui';

import 'package:decimal/decimal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multilayerapp/data/models/enums/payer_type.dart';
import 'package:multilayerapp/data/models/finance_type.dart';
import 'package:multilayerapp/data/models/income_tax_model.dart';
import 'package:multilayerapp/data/models/vat_payer_model.dart';
import 'package:multilayerapp/data/models/vat_rate_model.dart';
import 'package:multilayerapp/domain/entities/calculator_request.dart';
import 'package:multilayerapp/domain/entities/calculator_response.dart';
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
    VoidCallback onSelected;
    return Column(
      children: <Widget>[
        _buildAmountEntryRow(context),
        _buildSelectionRow(context, DropDownWidget(
                values: VatRateModel(),
                onSelected: (FinanceType value) =>
                    Provider.of<CalculatorModel>(context).addRate(value.valueType)),
            "Podaj stawkę VAT"),
        _buildSelectionRow(context, DropDownWidget(
            values: IncomeTaxModel(),
            onSelected: (FinanceType value) =>
                Provider.of<CalculatorModel>(context).addIncomeTaxType(value.valueType)),
            "Podatek dochodowy"),
        _buildSelectionRow(context, DropDownWidget(
            values: VatPayerModel(),
            onSelected: (FinanceType value) =>
                () {
              bool isPayer = PayerType.POSITIVE == value.valueType ? true : false;
              Provider.of<CalculatorModel>(context).addVatPayer(isPayer);
            }),
            "Czy jeteś płątnikiem VAT?"),
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

  Widget _buildSelectionRow(BuildContext context, Widget dropDownWidget, String label) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: LABEL_WIDTH,
          child:
            Container(
              padding: _layoutPadding(),
              child:
                Text(label),
            ),
        ),
        Expanded(
          flex: SELECTION_WIDTH,
          child:
            Container(
              padding: _layoutPadding(),
              child:
              dropDownWidget
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
        _buildResultLabel("Podana kwota", calculator.amount),
        _buildResultLabel("Kwota zaoszczędzona na podatku VAT", calculator.taxAmount),
        _buildResultLabel("Kwota do obliczenia podatku dochodowego", calculator.savedAmount),
        _buildResultLabel("Kwota zaoszczędzona na podatku dochodowym (%)", calculator.incomeTaxAmount),
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

  Widget _buildResultLabel(String label, Decimal amount) {
    return Container(
      child: Text("${label}: ${amount}"),
    );
  }
}