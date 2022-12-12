import 'package:demo_eazy_atm/helper/app_routes.dart';
import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: AppRoutes.splashScreen,
      routes: AppRoutes.getRoutes(),
      debugShowCheckedModeBanner: false,
    );
  }
}
