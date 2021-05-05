import 'package:flutter/material.dart';
import 'package:haoke/pages/home/tab_index/index_recommond_data.dart';
import 'package:haoke/pages/home/tab_index/index_recommond_item_widget.dart';

class IndexRecommond extends StatelessWidget {
  final List<IndexRecommendItem> dataList;

  const IndexRecommond({Key key, this.dataList=indexRecommendData}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(color: Colors.grey[200]),
      child:Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Text('房屋推荐',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600),),
          Text('更多',style: TextStyle(color: Colors.grey[600]),)
        ],),
        Padding(padding: EdgeInsets.all(5.0)),
        Wrap(
          spacing: 10.0,
          runSpacing: 10.0,
          children: 
          dataList.map((e) =>IndexRecommondItemWidget(e)
          ).toList()
        ,)
      ],),
    );
  }
}
