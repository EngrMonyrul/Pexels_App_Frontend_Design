import 'package:flutter/material.dart';
import 'package:ncc/utils/routes/routes_manage.dart';
import 'package:ncc/utils/theme/base_theme_config.dart';
import 'package:ncc/views/home/screens/home_screen.dart';
import 'package:pexels_services/pexels_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initPackages(baseUrl: "https://api.pexels.com/v1/");
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MainWidget(
      onGenerateRoutes: RoutesManage.onGenerateRoutes,
      lightTheme: BaseThemeConfig.lightThemeData,
      darkTheme: BaseThemeConfig.darkThemeData,
      home: const HomeScreen(),
    );
  }
}
