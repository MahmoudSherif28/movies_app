import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/Custom_Butoon.dart';
import 'package:movies/core/custom_textfeild.dart';
import 'package:movies/database/databasehelper.dart';
import 'package:movies/features/Register/presntation/views/register_ui.dart';


class login extends StatelessWidget {
  login({super.key});

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void _login(BuildContext context) async {
    String username = usernameController.text;
    String password = passwordController.text;

    List<Map<String, dynamic>> result =
        await DatabaseHelper.instance.queryUser(username);

    if (result.isNotEmpty) {
      String dbPassword = result.first['password'];
      if (dbPassword == password) {
        // Successful login
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Login successful')));
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Incorrect password')));
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('User not found')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff111111),
      appBar: AppBar(
        backgroundColor: Color(0xff111111),
        title: Text(
          "LOGIN",
          style: TextStyle(
            color: Color(0xff937900),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 14.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 120.sp,
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  "USERNAME",
                  style: TextStyle(color: Colors.grey, fontSize: 18.sp),
                ),
              ),
              SizedBox(
                height: 5.sp,
              ),
              CustomTextfield(usernameController: usernameController),
              SizedBox(
                height: 40.sp,
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  "PASSWORD",
                  style: TextStyle(color: Colors.grey, fontSize: 18.sp),
                ),
              ),
              SizedBox(
                height: 5.sp,
              ),
              TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: "Password",
                      hintStyle: TextStyle(color: Colors.black),
                      fillColor: Colors.grey,
                      filled: true,
                      suffixIcon: Icon(
                        Icons.lock,
                        color: Colors.black,
                      ),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0.sp, horizontal: 20.0.sp),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0.sp),
                      ))),
              SizedBox(
                height: 40.sp,
              ),
              CustomButton(
                onPressed: () {},
                label: ("LOGIN"),
              ),
              SizedBox(
                height: 50.sp,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "didn't have an acoount ?",
                    style: TextStyle(color: Colors.grey, fontSize: 15.sp),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Register()),
                      );
                    },
                    child: Text(
                      "Register",
                      style: TextStyle(color: Color(0xff937900), fontSize: 13.sp),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
