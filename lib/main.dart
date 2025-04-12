import 'package:ecommerce/ui/Home/Category/CartTap.dart';
import 'package:ecommerce/ui/Home/Category/Cuibt/Product_tap_view_model.dart';
import 'package:ecommerce/ui/Home/Category/Cuibt/add_to_cart_view_model.dart';
import 'package:ecommerce/ui/Home/Category/Product_Detailes_view.dart';
import 'package:ecommerce/ui/Home/Category/custom_cart_item.dart';
import 'package:ecommerce/ui/Home/HomeTap/Home.dart';
import 'package:ecommerce/ui/Splahe/SplahScreen.dart';
import 'package:ecommerce/ui/authe/login/Login.dart';
import 'package:ecommerce/ui/authe/register/register.dart';
import 'package:ecommerce/ui/Home/home_screen_view.dart';
import 'package:ecommerce/ui/utils/Shared_prefrence_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'domain/di.dart';
import 'domain/entites/AddToCartResponseEntity.dart';


void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefrenceUtils.init();

 var user =  SharedPrefrenceUtils.getData( key: 'Token');
 String route;
 if(user == null){
   route = LoginScreen.routeName;
 }
 else{
   route = HomeScreenView.routeName;
   print(user);
 }

  runApp(MyApp(route));
}
class MyApp extends StatelessWidget{
  String route;
  MyApp(this.route);
  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(providers: [
      BlocProvider(
        create: (_) => ProdcutTapViewModel(
          productuseCase: injectProductUseCase(), addToCartUseCase: injectAddtoCartUseCase(),
        )..getAllProduct(),
      ),
    
      
    ], child:ScreenUtilInit(
      designSize: const Size(430,932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context,child){
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: route,
          routes: {
            ProductDetailesView.routeName:(context)=> ProductDetailesView(),
            HomeScreenView.routeName:(context)=> HomeScreenView(),
            SplashScreen.routeName:(context)=> SplashScreen(),
            RegisterScreen.routeName:(context)=>RegisterScreen(),
            LoginScreen.routeName:(context)=>LoginScreen(),
            AddToCartTap.routeName:(context)=>AddToCartTap()
          },
        );
      },
    )
    );
  }

}