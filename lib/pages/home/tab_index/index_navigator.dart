import 'package:flutter/material.dart';
import 'package:haoke/pages/home/tab_index/index_navigator_item.dart';
import 'package:haoke/widgets/common_Image.dart';

class IndexNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 6.0,bottom: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: navigatorItemList
              .map((e) => InkWell(
                    child: Column(
                      children: [
                        CommonImage(e.imageUrl,width: 47.5,), 
                        Text(e.title,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14.0),)
                        ],
                    ),
                    onTap: () {
                      e.onTap(context);
                    },
                  ))
              .toList(),
      ),
    );
  }
}
