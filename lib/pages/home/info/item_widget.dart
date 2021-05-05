import 'package:flutter/material.dart';
import 'package:haoke/pages/home/info/data.dart';
import 'package:haoke/widgets/common_Image.dart';

var textStyle = TextStyle(color: Colors.black54);

class ItemWidget extends StatelessWidget {
  final InfoItem data;

  const ItemWidget(
    this.data, {
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
      height: 100.0,
      child: Row(
        children: [
          CommonImage(
            data.imageUri,
            width: 120.0,
            height: 90.0,
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.0),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  data.title,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      data.source,
                      style: textStyle,
                    ),
                    Text(
                      data.time,
                      style: textStyle,
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
