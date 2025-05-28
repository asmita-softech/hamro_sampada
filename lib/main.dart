import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hamrosampada/view/screens/dashboard/place_detail_screen.dart';
import 'package:hamrosampada/view/screens/dashboard/place_general_information.dart';
import 'package:hamrosampada/view/screens/onboarding/initial_onboarding_screen.dart';

import 'package:shared_preferences/shared_preferences.dart';


Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();
  prefs.setBool('showHome',true);

  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder:((context) => const MyApp()),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 885),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: InitialOnboardingScreen(),
      ),
    );
  }
}

