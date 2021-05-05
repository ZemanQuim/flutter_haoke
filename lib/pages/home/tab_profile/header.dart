import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  Widget _notLoginBuilder(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.green),
      padding: EdgeInsets.only(top: 10.0, left: 20.0, bottom: 20.0),
      height: 95.0,
      child: Row(
        children: [
          Container(
              height: 65.0,
              width: 65.0,
              margin: EdgeInsets.only(right: 15.0),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://tva1.sinaimg.cn/large/006y8mN6ly1g6tbgbqv2nj30i20i2wen.jpg"),
              )),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 6.0),
              ),
              Row(
                children: [
                  GestureDetector(
                    child: Text(
                      '登录',
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      Navigator.of(context).pushNamed('login');
                    },
                  ),
                  Text(
                    '/',
                    style: TextStyle(color: Colors.white),
                  ),
                  GestureDetector(
                    child: Text(
                      '注册',
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      Navigator.of(context).pushNamed('register');
                    },
                  ),
                ],
              ),
              Text(
                '登录后可以体验更多',
                style: TextStyle(color: Colors.white),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _loginBuilder(BuildContext context) {
   final String userName = '已登录用户名';
   final String userImage =
        "https://tva1.sinaimg.cn/large/006y8mN6ly1g6tbnovh8jj30hr0hrq3l.jpg";
    return Container(
      decoration: BoxDecoration(color: Colors.green),
      padding: EdgeInsets.only(top: 10.0, left: 20.0, bottom: 20.0),
      height: 95.0,
      child: Row(
        children: [
          Container(
              height: 65.0,
              width: 65.0,
              margin: EdgeInsets.only(right: 15.0),
              child: CircleAvatar(
                backgroundImage: NetworkImage(userImage),
              )),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 6.0),
              ),
              Text(
                userName,
                style: TextStyle(color: Colors.white),
              ),
              Text(
                '查看编辑个人资料',
                style: TextStyle(color: Colors.white),
              )
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var isLogin = false;
    return isLogin ? _loginBuilder(context) : _notLoginBuilder(context);
  }
}
