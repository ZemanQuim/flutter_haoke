import 'package:flutter/material.dart';
import 'package:haoke/pages/home/info/index.dart';
import 'package:haoke/widgets/search_bar/index.dart';

class TabInfo extends StatefulWidget {
  @override
  _TabInfoState createState() => _TabInfoState();
}

class _TabInfoState extends State<TabInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(title: SearchBar(
        onSearch: (){
          Navigator.of(context).pushNamed('search');
        },
      ),
      backgroundColor: Colors.white,),
      body: ListView(children: [
        Padding(padding: EdgeInsets.only(top: 10.0),),
        Info(),
        Info(),
        Info(),
      ],),
    );
  }
}