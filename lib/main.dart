import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grock/grock.dart';
import 'package:mvvm_architecture/home_page.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        navigatorKey: Grock.navigationKey,
        scaffoldMessengerKey: Grock.scaffoldMessengerKey,
        debugShowCheckedModeBanner: false,
        title: 'Mvvm',
        theme: FlexThemeData.light(
          scheme: FlexScheme.shark,
        ),
        home: const HomeScreen());
  }
}
