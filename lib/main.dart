
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/constants/app_config.dart';
import 'app/routes/index.dart';
import 'app/routes/routes.dart';
import 'app/themes/index.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppConfig.appName,
      getPages: AppPages.pages,
      initialRoute: Routes.splash,
      theme: ThemeData(
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: EMAppTheme.themeColors.primary,
          selectedItemColor: EMAppTheme.themeColors.primary,
          unselectedItemColor: EMAppTheme.themeColors.text,
          showUnselectedLabels: true,
        ),
      )
      ,
    );
  }

}
