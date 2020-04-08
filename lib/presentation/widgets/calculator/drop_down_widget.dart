import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:multilayerapp/data/models/finance_type.dart';

class DropDownWidget<T extends FinanceType> extends StatefulWidget {
  final T values;
  final Function(T) onSelected;

  const DropDownWidget({this.values, this.onSelected});

  @override
  _DropDownWidgetState createState() =>
      _DropDownWidgetState(values: this.values, onSelected: this.onSelected);
}

class _DropDownWidgetState<T extends FinanceType>
    extends State<DropDownWidget> {
  final T values;
  final Function(T) onSelected;

  var dropdownValue;

  _DropDownWidgetState({this.values, this.onSelected}) {
    dropdownValue = values.getValues()[0];
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
        value: dropdownValue,
        icon: Icon(Icons.arrow_drop_down),
        iconSize: 32,
        elevation: 16,
        style: TextStyle(color: Colors.deepPurple),
        underline: Container(
          height: 2,
          color: Colors.deepPurpleAccent,
        ),
        onChanged: (newValue) {
          setState(() {
            values.valueType = newValue;
            onSelected(values);
            dropdownValue = values.valueType;
          });
        },
        items: values.getValues().map<DropdownMenuItem>(
          (value) {
            return DropdownMenuItem(
                value: value, child: Text(values.getName(value)));
          },
        ).toList());
  }
}
