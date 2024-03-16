import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/features/login/presntation/views/login_view.dart';
import '';

class splash extends StatefulWidget {
  const splash({super.key});

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  void initState() {
    super.initState();
    _NavigationHome();
  }

  _NavigationHome() async {
    await Future.delayed(Duration(seconds: 3), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => login()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff111111),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 150.h,
                width: 150.h,
                child: Column(
                  children: [
                  Image.asset("assets/TV.PNG"),
                    Text(
                      "MOVIES",
                      style: TextStyle(
                          color: Color(0xff937900),
                          fontWeight: FontWeight.bold,
                      fontSize: 28.sp),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
