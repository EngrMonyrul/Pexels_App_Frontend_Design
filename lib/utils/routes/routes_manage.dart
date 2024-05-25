import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ncc/common/widgets/error/error_widget_screen.dart';
import 'package:ncc/utils/routes/routes_name.dart';
import '../../views/home/screens/home_screen.dart';

class RoutesManage {
  RoutesManage._();

  static Map<String, WidgetBuilder> _routes({Object? args}) => {
        RoutesName.homeScreen: (context) => const HomeScreen(),
      };

  static Route onGenerateRoutes(RouteSettings routeSettings) {
    final builder = _routes(args: routeSettings.arguments)[routeSettings.name];
    if (builder != null) {
      return MaterialPageRoute(
          settings: routeSettings, builder: (context) => builder(context));
    } else {
      return MaterialPageRoute(
        builder: (context) => ErrorWidgetScreen(
          name: routeSettings.name,
        ),
      );
    }
  }
}
