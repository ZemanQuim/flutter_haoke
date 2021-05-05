import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:haoke/pages/home/index.dart';
import 'package:haoke/pages/home/setting.dart';
import 'package:haoke/pages/loading.dart';
import 'package:haoke/pages/login.dart';
import 'package:haoke/pages/not_found.dart';
import 'package:haoke/pages/register.dart';
import 'package:haoke/pages/room_add/index.dart';
import 'package:haoke/pages/room_detail/index.dart';
import 'package:haoke/pages/room_manage/index.dart';

class Routes {
  //定义路由名称
  static String home = '/';
  static String login = '/login';
  static String register = '/register';
  static String roomDetail = '/roomDetail/:roomId';
  static String setting = '/setting';
  static String roomManage = '/roomManage';
  static String roomAdd = '/roomAdd';
  static String loading = '/loading';

  //定义路由处理函数
  static Handler _homeHandler =
      Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return Homepage();
  });

  static Handler _loginHandler =
      Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return LoginPage();
  });

  static Handler _registerHandler =
      Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return RegisterPage();
  });

  static Handler _notFoundHandler =
      Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    print('Error======>route is not found!');
    return NotFoundPage();
  });

  static Handler _roomDetailHandler =
      Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return RoomDetailPage(roomId:params['roomId'][0]);
  });

  static Handler _settingHandler =
      Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return Setting();
  });

   static Handler _roomManageHandler =
      Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return RoomManage();
  });

   static Handler _roomAddHandler =
      Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return RoomAdd();
  });

   static Handler _loadingHandler =
      Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return LoadingPage();
  });

  //编写函数 configureRoutes 关联路由名称和处理函数
  static void configureRoutes(Router router) {
    router.notFoundHandler = _notFoundHandler;
    router.define(home, handler: _homeHandler);
    router.define(login, handler: _loginHandler);
    router.define(register, handler: _registerHandler);
    router.define(roomDetail, handler: _roomDetailHandler);
    router.define(setting, handler: _settingHandler);
    router.define(roomManage, handler: _roomManageHandler);
    router.define(roomAdd, handler: _roomAddHandler);
    router.define(loading, handler: _loadingHandler);
  }
}
