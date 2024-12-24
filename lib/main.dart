import 'package:delevery_app/styles/app_colors.dart';
import 'package:flutter/material.dart';

import 'config/app_route.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          fontFamily: 'Urbanist',
          scaffoldBackgroundColor: AppColors.background,
          brightness: Brightness.dark
      ),
      initialRoute: AppRoute.login,
      routes:AppRoute.pages,
    );
  }

}




