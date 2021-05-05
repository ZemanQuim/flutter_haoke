import 'package:flutter/material.dart';
import 'package:haoke/pages/home/tab_profile/function_button_data.dart';
import 'package:haoke/pages/home/tab_profile/function_button_widget.dart';

class FunctionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Wrap(
        spacing: 1.0,
        runSpacing: 1.0,
        children: list.map((e) => FunctionButtonWidget(e)).toList(),
      ),
    );
  }
}
