import 'package:ecommerce/ui/Splahe/SplahScreen.dart';
import 'package:ecommerce/ui/authe/login/Login.dart';
import 'package:ecommerce/ui/authe/register/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430,932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context,child){
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: SplashScreen.routeName,
          routes: {
            SplashScreen.routeName:(context)=> SplashScreen(),
            RegisterScreen.routeName:(context)=>RegisterScreen(),
            LoginScreen.routeName:(context)=>LoginScreen()
          },
        );
      },
    );
  }

}