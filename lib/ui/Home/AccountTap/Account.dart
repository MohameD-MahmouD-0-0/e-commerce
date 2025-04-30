import 'package:ecommerce/ui/authe/login/Login.dart';
import 'package:ecommerce/ui/utils/MyTheme.dart';
import 'package:ecommerce/ui/utils/Shared_prefrence_utils.dart';
import 'package:ecommerce/ui/utils/text_filed_item.dart';
import 'package:flutter/material.dart';

class Account extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var NameController = TextEditingController();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 30,left: 10,right: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('assets/images/Group 5 (1).png'),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Welcome,Rana',
                    style: TextStyle(
                        color: MyTheme.PrimaryLight,
                        fontWeight: FontWeight.w400,
                        fontSize: 16),
                  ),
                  InkWell(
                    onTap: (){
                      SharedPrefrenceUtils.removeData( s: 'token');
                      Navigator.of(context).pushNamed(LoginScreen.routeName);
                    },
                      child: Icon(Icons.login_outlined,color: MyTheme.PrimaryLight,size: 25,))
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  'rana@gmail.com',
                  style: TextStyle(
                      color: MyTheme.PrimaryLight,
                      fontWeight: FontWeight.w400,
                      fontSize: 16),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              TextFiledItem(
                filedName: 'Your Full Name',
                hintText: 'Rana mohamed',
                controller: NameController,
                filedNameStyle: TextStyle(
                    color: MyTheme.PrimaryLight,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
              TextFiledItem(
                filedName: 'Your E-mail',
                hintText: 'rana@gmail.com',
                controller: NameController,
                filedNameStyle: TextStyle(
                    color: MyTheme.PrimaryLight,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
              TextFiledItem(
                filedName: 'Your Password',
                hintText: '******',
                controller: NameController,
                filedNameStyle: TextStyle(
                    color: MyTheme.PrimaryLight,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
              TextFiledItem(
                filedName: 'Your Mobile Number',
                hintText: '01021212121',
                controller: NameController,
                filedNameStyle: TextStyle(
                    color: MyTheme.PrimaryLight,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
              TextFiledItem(
                filedName: 'Your Address',
                hintText: '6th of october,',
                controller: NameController,
                filedNameStyle: TextStyle(
                    color: MyTheme.PrimaryLight,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
