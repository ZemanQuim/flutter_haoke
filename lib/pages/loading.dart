import 'dart:async';

import 'package:flutter/material.dart';
import 'package:haoke/utils/scoped_model_helper.dart';

class LoadingPage extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed('/');
    });
    // Timer.run(() {
    //   ScopedModelHelper.getModel<AuthModel>(context).initApp(context);
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('static/images/loading.jpg'))),
    );
  }
}
