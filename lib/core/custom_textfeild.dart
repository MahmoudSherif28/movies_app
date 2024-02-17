
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({
    super.key,
    required this.usernameController,
  });

  final TextEditingController usernameController;

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: usernameController,
        decoration: InputDecoration(
            hintText: "Username",
            hintStyle: TextStyle(color: Colors.black),
            fillColor: Colors.grey,
            filled: true,
            contentPadding: EdgeInsets.symmetric(
                vertical: 10.0.sp, horizontal: 20.0.sp),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0.sp),
            )));
  }
}
