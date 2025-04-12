import 'package:ecommerce/domain/datasource/login_use_case.dart';
import 'package:ecommerce/ui/Home/home_screen_view.dart';
import 'package:ecommerce/ui/authe/login/Cuibt/LoginScreenViewModel.dart';
import 'package:ecommerce/ui/authe/login/Cuibt/LoginState.dart';
import 'package:ecommerce/ui/utils/Dialoge.dart';
import 'package:ecommerce/ui/utils/MyTheme.dart';
import 'package:ecommerce/ui/utils/Shared_prefrence_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../domain/di.dart';
import '../../utils/text_filed_item.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = 'Login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginScreenViewModel viewModel =
      LoginScreenViewModel(loginUseCase: injectloginUseCase());

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginScreenViewModel, LoginState>(
        bloc: viewModel,
        listener: (context, state) {
          if (state is LodingLoginState) {
            return DialogUtils.showLoading(context, state.LodingMessage);
          } else if (state is ErrorLoginState) {
            DialogUtils.closeLoading(context);
            return DialogUtils.showMessage(context, state.errorMessage,
                message: state.errorMessage,
                title: 'Failed Login',
                posActionName: 'Ok');
          } else if (state is SucessLoginState) {
            DialogUtils.closeLoading(context);
            return DialogUtils.showMessage(
                context, state.loginResponse.userEntity?.name,
                message: 'Acceptable Login', title: 'Succse',posActionName: 'Ok',posAction:(){
                  SharedPrefrenceUtils.SaveData(key: 'Token', value: state.loginResponse.token);
              Navigator.of(context).pushNamed(HomeScreenView.routeName);
            }  );
          } else {
            return null;
          }
        },
        child: Scaffold(
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
                key: viewModel.formKey,
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
                            color: MyTheme.WhiteColor,
                          )),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFiledItem(
                            filedName: 'User Name',
                            hintText: 'Enter Your Email',
                            controller: viewModel.emailController,
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
                            controller: viewModel.passwordController,
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
                            onPressed: () {
                              viewModel.login();
                            },
                            child: Text(
                              'Login',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge
                                  ?.copyWith(color: MyTheme.PrimaryLight),
                            )),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Don‘t have an account',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(color: MyTheme.WhiteColor)),
                          TextButton(
                            onPressed: () {
                              viewModel.loginUseCase;
                            },
                            child: Text('Create Account',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(color: MyTheme.WhiteColor)),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
