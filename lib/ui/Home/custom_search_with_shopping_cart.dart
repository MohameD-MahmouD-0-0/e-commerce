import 'package:ecommerce/ui/utils/MyTheme.dart';
import 'package:flutter/material.dart';

class CustomSearchWithShoppingCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: MyTheme.PrimaryLight),
            ),
            child: TextField(
              cursorColor: MyTheme.PrimaryLight,
              decoration: InputDecoration(
                hintText: 'What are you looking for?',
                hintStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
                prefixIcon: Icon(Icons.search, size: 20, color: MyTheme.PrimaryLight),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(vertical: 10),
              ),
            ),
          ),
        ),
        SizedBox(width: 10),
        Image.asset('assets/images/Vector.png', height: 30, width: 30),
      ],
    );
  }
}
