import 'package:cartoontv/features/home/views/pages/home_screen.dart';
import 'package:cartoontv/features/start/view/pages/start_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'config/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: EasyLoading.init(),
      debugShowCheckedModeBanner: false,
      title: 'Cartoon TV',
      theme: myAppTheme,
      home: const StartScreen(),
    );
  }
}
