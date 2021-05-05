import 'package:flutter/material.dart';
import 'package:haoke/pages/home/tab_index/index.dart';
import 'package:haoke/pages/home/tab_info/index.dart';
import 'package:haoke/pages/home/tab_profile/index.dart';
import 'package:haoke/pages/home/tab_search/index.dart';

//四个页面
List<Widget> tabViewList = [
  TabIndex(name: '首页',),
  TabSearch(),
  TabInfo(),
  TabProfile(),
];
//四个底部按钮
List<BottomNavigationBarItem> barItemList = [
  BottomNavigationBarItem(title: Text("首页"), icon: Icon(Icons.home)),
  BottomNavigationBarItem(title: Text("搜索"), icon: Icon(Icons.search)),
  BottomNavigationBarItem(title: Text("资讯"), icon: Icon(Icons.info)),
  BottomNavigationBarItem(title: Text("我的"), icon: Icon(Icons.account_circle)),
];

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  //定义一个选中的bar
  int _selectedIndex = 0;

  //bar点击改变选中状态
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: tabViewList.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type:  BottomNavigationBarType.fixed,
        items: barItemList,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        onTap: _onItemTapped,
      ),
    );
  }
}
