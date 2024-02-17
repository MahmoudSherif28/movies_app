import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/Custom_Butoon.dart';
import 'package:movies/database/login_db.dart';
import 'package:movies/features/Screens/login_screen/ui.dart';

class Register extends StatelessWidget {
  Register({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  void _register(BuildContext context) async {
    String name = nameController.text;
    String username = usernameController.text;
    String password = passwordController.text;
    String confirmPassword = confirmPasswordController.text;

    if (password != confirmPassword) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Passwords do not match')));
      return;
    }

    List<Map<String, dynamic>> result =
        await DatabaseHelper.instance.queryUser(username);

    if (result.isNotEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Username already exists')));
    } else {
      await DatabaseHelper.instance.insertUser({
        'name': name,
        'username': username,
        'password': password,
      });
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('User registered successfully')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff111111),
      appBar: AppBar(
        backgroundColor: Color(0xff111111),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Color(0xff937900),
          ),
          onPressed: () {
            Navigator.pop(
              context,
            );
          },
        ),
        title: Text(
          "Register",
          style: TextStyle(
            color: Color(0xff937900),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 50.sp,
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                "NAME",
                style: TextStyle(color: Colors.grey, fontSize: 18.sp),
              ),
            ),
            SizedBox(
              height: 5.sp,
            ),
            TextField(
                controller: nameController,
                decoration: InputDecoration(
                    hintText: "your name",
                    hintStyle: TextStyle(color: Colors.black),
                    fillColor: Colors.grey,
                    filled: true,
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ))),
            SizedBox(
              height: 40.sp,
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
            TextField(
                controller: usernameController,
                decoration: InputDecoration(
                    hintText: "username",
                    hintStyle: TextStyle(color: Colors.black),
                    fillColor: Colors.grey,
                    filled: true,
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ))),
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
                    suffixIcon: Icon(
                      Icons.lock,
                      color: Colors.black,
                    ),
                    filled: true,
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ))),
            SizedBox(
              height: 40.sp,
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                "CONFIRM PASSWORD",
                style: TextStyle(color: Colors.grey, fontSize: 18.sp),
              ),
            ),
            SizedBox(
              height: 5.sp,
            ),
            TextField(
                controller: confirmPasswordController,
                obscureText: true,
                decoration: InputDecoration(
                    hintText: "confirm password",
                    hintStyle: TextStyle(color: Colors.black),
                    fillColor: Colors.grey,
                    suffixIcon: Icon(
                      Icons.lock,
                      color: Colors.black,
                    ),
                    filled: true,
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ))),
            SizedBox(
              height: 40,
            ),
            CustomButton(
              onPressed: () {},
              label: ("CREATE AN ACCOUNT"),
            ),
          ],
        ),
      ),
    );
  }
}
