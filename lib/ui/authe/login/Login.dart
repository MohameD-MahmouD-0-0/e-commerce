import 'package:ecommerce/ui/utils/MyTheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/text_filed_item.dart';
import '../register/register.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = 'Login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var EmailController = TextEditingController();

  var PasswoedController = TextEditingController();

  var FormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.PrimaryLight,
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: 91.h, bottom: 46.h, left: 97.w, right: 97.w),
            child: Image.asset(
              'assets/images/Group 5.png',
              fit: BoxFit.cover,
            ),
          ),
          Form(
            key: FormKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.3,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Welcome Back To Route',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                            color: MyTheme.WhiteColor)),
                  ),
                  Text(' Please sign in with your mail',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                          color: MyTheme.WhiteColor, )),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFiledItem(
                        filedName: 'User Name',
                        hintText: 'Enter Your Email',
                        controller: EmailController,
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return 'Please Enter Valid Data';
                          }
                          bool emailValid = RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(text);
                          if (!emailValid) {
                            'Enter Valid Email';
                          }
                          return null;
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFiledItem(
                        filedName: 'Password',
                        hintText: 'Enter Your Password',
                        controller: PasswoedController,
                        isObscure: true,
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return 'Please Enter Valid Data';
                          }
                          if (text.length < 6) {
                            return 'The Password Should be at least 6 Letters';
                          } else {
                            return null;
                          }
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Forgot password',
                      style: TextStyle(
                          color: MyTheme.WhiteColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 18),
                      textAlign: TextAlign.end,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          'Login',
                          style: Theme.of(context).textTheme.labelLarge?.copyWith(color: MyTheme.PrimaryLight),
                        )),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Don‘t have an account',
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(color: MyTheme.WhiteColor)),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed(RegisterScreen.routeName);
                          },
                          child: Text(
                            'Create Account',
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(color: MyTheme.WhiteColor)),
                          )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
