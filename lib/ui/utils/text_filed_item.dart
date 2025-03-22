import 'package:ecommerce/ui/utils/MyTheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFiledItem extends StatelessWidget {
  String filedName;
  String hintText;
  Widget? suffixIcon;
  bool isObscure;
  var KeyboardType;
  String? Function(String?)? validator;
  TextEditingController controller;

  TextFiledItem(
      {required this.filedName,
      required this.hintText,
      this.suffixIcon,
      this.isObscure = false,
      this.validator,
      required this.controller,
      this.KeyboardType = TextInputType.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          filedName,
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(fontSize: 18.sp, color: MyTheme.WhiteColor),
        ),
        Padding(
          padding: EdgeInsets.only(top: 24.h, bottom: 20.h),
          child: TextFormField(
            decoration: InputDecoration(
                // fillColor: AppColor.whiteColor,
                filled: true,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.r)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.r)),
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.r)),
                hintText: hintText,
                hintStyle: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: MyTheme.blackcolor),
                suffixIcon: suffixIcon),
            style: TextStyle(color: MyTheme.blackcolor),
            validator: validator,
            controller: controller,
            obscureText: isObscure,
            keyboardType: KeyboardType,
          ),
        )
      ],
    );
  }
}
