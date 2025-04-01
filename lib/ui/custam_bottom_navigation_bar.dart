import 'package:ecommerce/ui/utils/MyTheme.dart';
import 'package:flutter/material.dart';

Widget BulidCustomBottomNamvigationBar(
    {required int selectedInd,
    required Function(int) onTapFunction,
    required BuildContext context}) {
  return Theme(
    data: Theme.of(context).copyWith(canvasColor: MyTheme.PrimaryLight),
    child: ClipRRect(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      child: BottomNavigationBar(
          currentIndex: selectedInd,
          onTap: onTapFunction,
          items: [
            BottomNavigationBarItem(
                icon: selectedInd == 0
                    ? CircleAvatar(
                        child:Image.asset('assets/images/home (1) 3.png'),
                        backgroundColor: MyTheme.WhiteColor,
                      )
                    :Image.asset('assets/images/home (1) 3.png',color: MyTheme.WhiteColor,),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: selectedInd == 1
                    ? CircleAvatar(
                    child: Image.asset('assets/images/category (1) 3.png',color: MyTheme.PrimaryLight,),
                  backgroundColor: MyTheme.WhiteColor,
                )
                    : Image.asset('assets/images/category (1) 3.png'),label: 'Category'),
            BottomNavigationBarItem(
                icon: selectedInd == 2
                    ? CircleAvatar(
                    backgroundColor: MyTheme.WhiteColor,
                    child: Image.asset('assets/images/heart (3) 3.png',color: MyTheme.PrimaryLight,))
                    : Image.asset('assets/images/heart (3) 3.png'),label: 'Favorit'),
            BottomNavigationBarItem(
                icon: selectedInd == 3
                    ? CircleAvatar(
                    backgroundColor: MyTheme.WhiteColor,
                    child: Image.asset('assets/images/user (1) 3.png',color: MyTheme.PrimaryLight,))
                    : Image.asset('assets/images/user (1) 3.png'),label: 'Account')
          ]),
    ),
  );
}
