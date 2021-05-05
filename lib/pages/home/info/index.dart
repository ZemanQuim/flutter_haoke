import 'package:flutter/material.dart';
import 'package:haoke/pages/home/info/data.dart';
import 'package:haoke/pages/home/info/item_widget.dart';

class Info extends StatelessWidget {
  final bool showTitle;

  final List<InfoItem> dataList;

  const Info({Key key, this.showTitle=false, this.dataList=infoData}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Offstage(
          offstage: !showTitle,
          child: Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.all(10.0),
            child: Text('最新资讯',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
          ),
        ),
        Column(
          children: dataList.map((e) => ItemWidget(e)).toList(),)
      ],),
    );
  }
}
