import 'package:flutter/material.dart';
import 'package:haoke/pages/home/tab_search/data_list.dart';
import 'package:haoke/pages/home/tab_search/filter_bar/filter_drawer.dart';
import 'package:haoke/pages/home/tab_search/filter_bar/index.dart';
import 'package:haoke/widgets/room_list_item_widget.dart';
import 'package:haoke/widgets/search_bar/index.dart';

class TabSearch extends StatefulWidget {
  @override
  _TabSearchState createState() => _TabSearchState();
}

class _TabSearchState extends State<TabSearch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: FilterDrawer(),
      appBar: AppBar(
        actions: [Container()],//隐藏drawer按钮
        elevation: 0,
        title: SearchBar(
        showLoaction: true,
        showMap: true,
        onSearch: (){
          Navigator.of(context).pushNamed('search');
        },
      ),
      backgroundColor: Colors.white,),
      body: Column(children: [
        Container(
          height: 40.0,
          child: FilterBar(onChange:(data){}),
        ),
        Expanded(
          child: ListView(
           children: dataList.map((e) => RoomListItemWidget(e)).toList()
            ),)
      ],),
      
    );
  }
}