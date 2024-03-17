import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/database/fav_database.dart';
import 'package:movies/features/Splash/view/splash__screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SQLProvider.instance.open();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    theme: ThemeData(
      brightness: Brightness.light, // Set default theme to light
      primarySwatch: Colors.blue, // Define primary color
      // Other theme configurations...
    );
    darkTheme: ThemeData(
    brightness: Brightness.dark, // Set dark theme
    // Define dark theme configurations...
    );
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context,  child) {
        return MaterialApp(
          home:  splash(),
        );
      },
    );
  }
}
