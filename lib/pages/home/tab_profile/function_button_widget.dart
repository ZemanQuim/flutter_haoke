import 'package:flutter/material.dart';
import 'package:haoke/pages/home/tab_profile/function_button_data.dart';
import 'package:haoke/widgets/common_Image.dart';

class FunctionButtonWidget extends StatelessWidget {
  final FunctionButtonItem data;

  const FunctionButtonWidget(
    this.data, {
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (null != data.onTapHandle) data.onTapHandle(context);
      },
      child: Container(
        margin: EdgeInsets.only(top: 30.0),
        width: MediaQuery.of(context).size.width * 0.33,
        child: Column(
          children: [CommonImage(data.imageUri), Text(data.title)],
        ),
      ),
    );
  }
}
