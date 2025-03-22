import 'package:ecommerce/ui/authe/login/Login.dart';
import 'package:ecommerce/ui/authe/register/Cuibt/register_screen_view_model.dart';
import 'package:ecommerce/ui/authe/register/Cuibt/register_states.dart';
import 'package:ecommerce/ui/utils/MyTheme.dart';
import 'package:ecommerce/ui/utils/text_filed_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = 'Register';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  RegisterScreenViewModel viewModel = RegisterScreenViewModel();

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterScreenViewModel, RegisterStates>(
      bloc: viewModel,
      listener: (context, state) {
        if (state is InitalRegisterState) {
        } else if (state is ErrorRegisterState) {
        } else if (state is SucessRegisterState) {}
      },
      child: Scaffold(
        body: Container(
          color: MyTheme.PrimaryLight,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Padding(
                padding: EdgeInsets.only(top: 1.h),
                child: Form(
                  key: viewModel.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            top: 91.h, bottom: 46.h, left: 97.w, right: 97.w),
                        child: Image.asset(
                          'assets/images/Group 5.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                      // Full Name
                      TextFiledItem(
                        filedName: 'Full Name',
                        hintText: 'Enter Your Name',
                        controller: viewModel.nameController,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                      ),

                      SizedBox(height: 10.h),

                      // Email
                      TextFiledItem(
                        filedName: 'Email',
                        hintText: 'Enter Your Email',
                        controller: viewModel.emailController,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Please enter your email address';
                          }
                          bool emailValid = RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value);
                          if (!emailValid) {
                            return 'Enter Valid Email';
                          }
                          return null;
                        },
                      ),

                      SizedBox(height: 10.h),

                      // Password
                      TextFiledItem(
                        filedName: 'Password',
                        hintText: 'Enter Your Password',
                        controller: viewModel.passwordController,
                        isObscure: viewModel.isObscure,
                        suffixIcon: InkWell(
                            child: viewModel.isObscure == true
                                ? Icon(Icons.visibility_off)
                                : Icon(Icons.visibility),
                            onTap: () {
                              if (viewModel.isObscure) {
                                viewModel.isObscure = false;
                              } else {
                                viewModel.isObscure = true;
                              }
                              setState(() {});
                            }),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Please enter a password';
                          }
                          if (value.length < 6) {
                            return 'The password should be at least 6 characters';
                          }
                          return null;
                        },
                      ),

                      SizedBox(height: 10.h),

                      // Confirm Password
                      TextFiledItem(
                        filedName: 'Confirm Password',
                        hintText: 'Re-enter Your Password',
                        controller: viewModel.confirmationPasswordController,
                        isObscure: true,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Please confirm your password';
                          }
                          if (value != viewModel.passwordController.text) {
                            return 'The passwords do not match';
                          }
                          return null;
                        },
                      ),

                      SizedBox(height: 10.h),

                      // Mobile Number
                      TextFiledItem(
                        filedName: 'Mobile Number',
                        hintText: 'Enter Your Mobile Number',
                        controller: viewModel.phoneController,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Please enter your phone number';
                          }
                          return null;
                        },
                      ),

                      SizedBox(height: 20.h),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () {
                            // if (formKey.currentState!.validate()) {
                            Navigator.of(context)
                                .pushNamed(LoginScreen.routeName);
                            // }
                          },
                          child: Text(
                            'Sign up',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
