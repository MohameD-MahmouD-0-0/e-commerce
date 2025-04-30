import 'package:ecommerce/ui/Home/Category/Cuibt/get_cart_item_view_model.dart';
import 'package:flutter/material.dart';
import '../../../domain/entites/ResponseCartEntity.dart';
import '../../utils/MyTheme.dart';

class CustomCartItem extends StatelessWidget {
  GetProductsCartItemEntity getProductsCartItem;

  CustomCartItem({required this.getProductsCartItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: MyTheme.PrimaryLight, width: .5),
      ),
      child: Column(
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  getProductsCartItem.product?.imageCover ?? '',
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            getProductsCartItem.product?.title ?? '',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: MyTheme.PrimaryLight,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        InkWell(
                            onTap: () {
                              GetCartItemViewModel.get(context).deleteCartItem(
                                  getProductsCartItem.product!.id ?? "");
                            },
                            child: Icon(Icons.delete_outline,
                                color: MyTheme.PrimaryLight)),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                        ),
                        SizedBox(width: 5),
                        Text(
                          "Orange | Size: 40",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "EGP ${getProductsCartItem.price}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                          decoration: BoxDecoration(
                            color: MyTheme.PrimaryLight,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              InkWell(
                                  onTap: () {
                                    var counter = getProductsCartItem.count ?? 0;
                                    counter--;
                                    GetCartItemViewModel.get(context)
                                        .updateCartItem(
                                            getProductsCartItem.product!.id ??
                                                "",
                                            (counter).toString());
                                  },
                                  child: Icon(Icons.remove,
                                      color: Colors.white, size: 16)),
                              SizedBox(width: 10),
                              Text(
                                getProductsCartItem.count.toString(),
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(width: 10),
                              InkWell(
                                onTap: () {
                                  var counter = getProductsCartItem.count ?? 0;
                                  counter++;
                                  GetCartItemViewModel.get(context)
                                      .updateCartItem(
                                          getProductsCartItem.product!.id ?? "",
                                          (counter).toString());
                                },
                                child: Icon(Icons.add,
                                    color: Colors.white, size: 16),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}