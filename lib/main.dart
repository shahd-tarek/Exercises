import 'package:exercises/core/navigation/app_router.dart';
import 'package:exercises/core/utils/constants.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
         scaffoldBackgroundColor:kBackground
      ),
      debugShowCheckedModeBanner: false,
      title: 'Exercises',
      routerConfig: AppRouter.router,
    );
  }
}
