import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/features/login/presntation/views/login_view.dart';
import 'package:movies/features/navigationbar/NavigationBar.dart';

class profile extends StatelessWidget {
  const profile({super.key});

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff111111),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios,color: Colors.grey,),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NavigationScreen()),
            );
          },
        ),
        backgroundColor: const Color(0xff111111),
        title: const Text(
          "Profile",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xff937900),
              fontSize: 22),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 50.h,
            ),
            Container(
              color: Color(0xff111111),
              width: 150.w,
              height: 150.h,
              child: CircleAvatar(
                child: Image.asset("assets/Profile.PNG"),
              ),
            ),
            SizedBox(
              height: 80.h,
            ),
            Container(
              color: Colors.grey.shade900,
              width: 320.w,
              height: 40.h,
              child: Column(
                children: [
                  TextButton(
                      onPressed: () { if (Theme.of(context).brightness == Brightness.light) {
                        ThemeManager._instance.setDarkMode();
                      } else {
                        ThemeManager._instance.setLightMode();
                      }},
                      child: Text(
                        "SWITCH MODE",
                        style: TextStyle(color: Colors.grey, fontSize: 18.sp),
                      ))
                ],
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            Container(
              color: Colors.grey.shade900,
              width: 320.w,
              height: 40.h,
              child: Center(
                child: Column(
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) => login()));
                        },
                        child: Text(
                          "LOGOUT",
                          style: TextStyle(color: Colors.grey, fontSize: 18.sp),
                        ))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


class ThemeManager {
  static final ThemeManager _instance = ThemeManager._internal();

  factory ThemeManager() {
    return _instance;
  }

  ThemeManager._internal();

  void setDarkMode() {
    _changeTheme(Brightness.dark);
  }

  void setLightMode() {
    _changeTheme(Brightness.light);
  }

  void _changeTheme(Brightness brightness) {
    _instance.currentTheme = ThemeData(brightness: brightness);
  }

  ThemeData currentTheme = ThemeData.light();
}
