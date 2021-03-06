import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:haoke/utils/common_toast.dart';
import 'package:haoke/utils/dio_http.dart';
import 'package:haoke/utils/string_is_null_or_empty.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  var usenameController = TextEditingController();
  var passwordController = TextEditingController();
  var repeatPasswordController = TextEditingController();

  _registerHandler() async {
    // 拿到3个值
    var usename = usenameController.text;
    var password = passwordController.text;
    var repeatPassword = repeatPasswordController.text;
    if (password != repeatPassword) {
      CommonToast.showToast('两次输入的密码不一致!');
      return;
    }
    if (stringIsNullOrEmpty(usename) || stringIsNullOrEmpty(password)) {
      CommonToast.showToast('用户名或密码不能为空!');
      return;
    }

    //发送网络请求
    const url = '/user/registered';
    var params = {'usename': usename, 'password': password};
    var res = await DioHttp.of(context).post(url, params);
    var resString = json.decode(res.toString());
    int status = resString['status'];
    String description = resString['description'] ?? '内部错误!';
    CommonToast.showToast(description);
    if (status.toString().startsWith('2')) {
      Navigator.of(context).pushReplacementNamed('login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('注册'),
      ),
      body: SafeArea(
        minimum: EdgeInsets.all(30.0),
        child: ListView(
          children: [
            TextField(
              controller: usenameController,
              decoration: InputDecoration(
                labelText: '用户名',
                hintText: '请输入用户名', //默认值
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
            ),
            TextField(
              obscureText: true,
              controller: passwordController,
              decoration: InputDecoration(
                labelText: '密码',
                hintText: '请输入密码', //默认值
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
            ),
            TextField(
              obscureText: true,
              controller: repeatPasswordController,
              decoration: InputDecoration(
                labelText: '确认密码',
                hintText: '请确认密码', //默认值
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
            ),
            RaisedButton(
              color: Colors.green,
              child: Text(
                '注册',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                //todo
                _registerHandler();
              },
            ),
            Padding(
              padding: EdgeInsets.all(10),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('已有账号?'),
                FlatButton(
                  child: Text(
                    '去登录~',
                    style: TextStyle(color: Colors.green),
                  ),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, 'login');
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
