  import 'package:flutter/material.dart';
import '../../../domain/entites/ResponseCartEntity.dart';
import '../../utils/MyTheme.dart';

class CustomCartItem extends StatelessWidget{
  GetProductsCartItem getProductsCartItem;
  CustomCartItem({required this.getProductsCartItem});
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(top: 20,left: 10),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                  width: 170,
                  decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(30)),
                  child: Image.network(
                    getProductsCartItem.product!.imageCover!,
                    fit: BoxFit.fill,
                  )),
              SizedBox(width: 10,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          getProductsCartItem.product!.title!,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: MyTheme.PrimaryLight),
                        ),
                        Icon(
                          Icons.delete_outline,
                          size: 25,
                          color: MyTheme.PrimaryLight,
                        )
                      ],
                    ),
                    SizedBox(height: 10),

                    Text(getProductsCartItem.price.toString()),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );}

}