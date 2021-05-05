import 'package:flutter/material.dart';
import 'package:haoke/utils/common_toast.dart';

class Setting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('设置'),
      ),
      body: ListView(
        children: [
          RaisedButton(
            onPressed: () {
              CommonToast.showToast('已经退出登录');
            },
            child: Text('退出登录',style: TextStyle(color: Colors.red),),
          )
        ],
      ),
    );
  }
}
