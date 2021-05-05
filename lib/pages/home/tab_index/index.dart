import 'package:flutter/material.dart';
import 'package:haoke/pages/home/info/index.dart';
import 'package:haoke/pages/home/tab_index/index_navigator.dart';
import 'package:haoke/pages/home/tab_index/index_recommond.dart';
import 'package:haoke/widgets/common_swiper.dart';
import 'package:haoke/widgets/search_bar/index.dart';

class TabIndex extends StatelessWidget {

  final String name;

  const TabIndex({Key key, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: SearchBar(
        showLoaction: true,
        showMap: true,
        onSearch: (){
          Navigator.of(context).pushNamed('search');
        },
      ),
      backgroundColor: Colors.white,),
      body: ListView(
        children: [
          CommonSwiper(),//轮播图
          IndexNavigator(),//导航栏
          IndexRecommond(),//推荐
          Info(showTitle: true,),
        ],
      ),
    );
  }
}