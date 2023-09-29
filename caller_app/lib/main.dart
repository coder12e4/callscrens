import 'package:caller_app/view/incoming_screen/incoming_call_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'controller/calll_screen_controller.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(390, 690),
        splitScreenMode: true,
        minTextAdapt: true,
        builder: (context, child) {
          
          return MaterialApp(
            title: 'Caller App',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              brightness: Brightness.dark,
              colorScheme: const ColorScheme.dark(),
              useMaterial3: true,
            ),
            home: const IncomingCallScreen(),
          );
        });
  }
}
