import 'package:flutter/material.dart';
import 'package:haoke/routes.dart';

class PageContent extends StatelessWidget {

  final String name;

  const PageContent({Key key, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('当前页面:$name'),
      ),
      body: ListView(
        children: [
          FlatButton(
            child: Text(Routes.home),
            onPressed: () {
              Navigator.pushNamed(context, Routes.home);
            },
          ),
          FlatButton(
            child: Text(Routes.login),
            onPressed: () {
              Navigator.pushNamed(context, Routes.login);
            },
          ),
           FlatButton(
            child: Text('房屋详情,id:2222'),
            onPressed: () {
              Navigator.pushNamed(context, '/room/2222');
            },
          ),
          FlatButton(
            child: Text('不存在的页面'),
            onPressed: () {
              Navigator.pushNamed(context, '/aaaa');
            },
          ),
        ],
      ),
    );
  }
}
