import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:haoke/routes.dart';
import 'package:haoke/scoped_model/room_filter.dart';
import 'package:scoped_model/scoped_model.dart';

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Router router = Router();
    Routes.configureRoutes(router);
    return ScopedModel<FilterBarModel>(
      model: FilterBarModel(),
      child: MaterialApp(
        theme: ThemeData(primaryColor: Colors.green), //主题色
        onGenerateRoute: router.generator,
        initialRoute: Routes.loading,
      ),
    );
  }
}
