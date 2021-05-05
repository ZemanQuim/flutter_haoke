import 'package:flutter/material.dart';
import 'package:haoke/pages/home/info/index.dart';
import 'package:haoke/pages/home/tab_profile/advertisement.dart';
import 'package:haoke/pages/home/tab_profile/function_button.dart';
import 'package:haoke/pages/home/tab_profile/header.dart';

class TabProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,//边线隐藏
        title: Text('我的'),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.of(context).pushNamed('setting');
            },
          )
        ],
      ),
      body: ListView(
        children: [
          Header(),
          FunctionButton(),
          Advertisement(),
          Info(showTitle: true,),
        ],
      ),
    );
  }
}
