import 'package:flutter/material.dart';
import 'package:haoke/pages/home/tab_search/data_list.dart';
import 'package:haoke/widgets/common_floating_active_button.dart';
import 'package:haoke/widgets/room_list_item_widget.dart';

class RoomManage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: CommonFloatingActionButton('发布房源', () {
          Navigator.of(context).pushNamed('roomAdd');
        }),
        appBar: AppBar(
          title: Text('房屋管理'),
          bottom: TabBar(tabs: [
            Tab(
              text: '空闲',
            ),
            Tab(
              text: '已租',
            )
          ]),
        ),
        body: TabBarView(
          children: [
            ListView(
              children: dataList.map((e) => RoomListItemWidget(e)).toList(),
            ),
            ListView(
              children: dataList.map((e) => RoomListItemWidget(e)).toList(),
            )
          ],
        ),
      ),
    );
  }
}
