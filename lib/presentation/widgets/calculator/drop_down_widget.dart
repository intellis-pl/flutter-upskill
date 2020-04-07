
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:multilayerapp/domain/entities/var_rate_type.dart';

class DropDownWidget extends StatefulWidget {

  @override
  _DropDownWidgetState createState() => _DropDownWidgetState();

}

class _DropDownWidgetState extends State<DropDownWidget> {
  VatRateType dropdownValue = VatRateType.RATE_17;

  @override
  Widget build(BuildContext context) {
    return
      DropdownButton<VatRateType>(
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
        onChanged: (VatRateType newValue) {
          setState(() {
            dropdownValue = newValue;
          });
        },
        items: (VatRateType.values).map<DropdownMenuItem<VatRateType>>((VatRateType value) {
         return DropdownMenuItem<VatRateType> (
           value: value,
           child: Text(value.name)
         );
        },
        ).toList()
    );
  }
}