
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:multilayerapp/domain/entities/finance_type.dart';
import 'package:multilayerapp/presentation/providers/calculator_model.dart';
import 'package:provider/provider.dart';

class DropDownWidget<T extends FinanceType> extends StatefulWidget {
  final T values;

  const DropDownWidget(this.values);

  @override
  _DropDownWidgetState createState() => _DropDownWidgetState(this.values);

}

class _DropDownWidgetState<T extends FinanceType> extends State<DropDownWidget> {
  final T values;
  var dropdownValue;

  _DropDownWidgetState(this.values) {
    dropdownValue = values.getValues()[0];
  }

  @override
  Widget build(BuildContext context) {
    return
      DropdownButton(
          value: dropdownValue,
          icon: Icon(Icons.arrow_drop_down),
          iconSize: 32,
          elevation: 16,
          style: TextStyle(
              color: Colors.deepPurple
          ),
          underline: Container(
            height: 2,
            color: Colors.deepPurpleAccent,
          ),
          onChanged: (newValue) {
            setState(() {
              _registerValueToProvider(newValue);
              dropdownValue = newValue;
            });
          },
          items: values.getValues().map<DropdownMenuItem>((value) {
            return DropdownMenuItem(
                value: value,
                child: Text(values.getName(value))
            );
          },
          ).toList()
      );
  }

  void _registerValueToProvider(newValue) {
    Provider.of<CalculatorModel>(context).addRate(newValue);
  }
}