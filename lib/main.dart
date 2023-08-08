import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sizer/sizer.dart';
import 'package:stacked_services/stacked_services.dart';

import 'app/app.locator.dart';
import 'app/app.router.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (BuildContext context, Orientation orientation,
          DeviceType deviceType) {
        return ScreenUtilInit(
            designSize: const Size(360, 690),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (context, child) {
              return MaterialApp(
                title: 'Flutter Stacked Starter',
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                  primarySwatch: Colors.orange,
                  appBarTheme: const AppBarTheme(
                    titleTextStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                    centerTitle: true,
                  ),
                ),
                navigatorKey: StackedService.navigatorKey,
                onGenerateRoute: StackedRouter().onGenerateRoute,
              );
            });
      },
    );
  }
}
