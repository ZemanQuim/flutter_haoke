import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('登录'),
      ),
      body: SafeArea(
        minimum: EdgeInsets.all(30.0),
              child: ListView(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: '用户名',
                hintText: '请输入用户名', //默认值
              ),
            ),
            Padding(padding: EdgeInsets.all(10),),
            TextField(
              obscureText: !showPassword,
              decoration: InputDecoration(
                  labelText: '密码',
                  hintText: '请输入密码', //默认值
                  suffixIcon: IconButton(
                    icon: Icon(showPassword ? Icons.visibility_off : Icons.visibility),
                    onPressed: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                  )),
            ),
            Padding(padding: EdgeInsets.all(10),),
            RaisedButton(
              color: Colors.green[300],
              child: Text('登录',style: TextStyle(color: Colors.white),),
              onPressed: () {
                //todo
              },
            ),
            Padding(padding: EdgeInsets.all(10),),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('还没有账号,'),
                FlatButton(
                  child: Text('去注册~',style: TextStyle(color: Colors.green),),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, 'register');
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
