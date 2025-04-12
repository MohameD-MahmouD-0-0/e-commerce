import 'package:ecommerce/domain/entites/ProductResponseEntity.dart';
import 'package:ecommerce/ui/utils/MyTheme.dart';
import 'package:flutter/material.dart';
import 'Cuibt/Product_tap_view_model.dart';

class CustomProduct extends StatelessWidget {
  final DataEntity dataEntity;
  CustomProduct({required this.dataEntity});

  @override
  Widget build(BuildContext context) {
    final viewModel = ProdcutTapViewModel.get(context); // تم جلب الـ ViewModel من BlocProvider

    return Container(
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: MyTheme.WhiteColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 6,
            offset: Offset(0, 2),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product Image with heart icon
          Stack(
            alignment: Alignment.topRight,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  dataEntity.imageCover!,
                  height: MediaQuery.of(context).size.height * 0.18,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 16,
                  child: Icon(Icons.favorite_border_rounded,
                      color: MyTheme.PrimaryLight, size: 18),
                ),
              )
            ],
          ),
          SizedBox(height: 8),
          // Title
          Text(
            dataEntity.title!,
            style: TextStyle(fontWeight: FontWeight.bold),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 4),
          // Description
          Text(
            dataEntity.description!,
            style: TextStyle(color: Colors.grey),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 10),
          Text(
            'EGP ${dataEntity.price}',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 6),
          // Rating and Add button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    'Review (${dataEntity.ratingsAverage})',
                    style: TextStyle(fontSize: 12),
                  ),
                  SizedBox(width: 4),
                  Icon(Icons.star, color: Colors.amber, size: 16),
                ],
              ),
              CircleAvatar(
                backgroundColor: MyTheme.PrimaryLight,
                radius: 14,
                child: InkWell(
                  onTap: () {
                    viewModel.addToCart(dataEntity.id!);
                  },
                  child: Icon(Icons.add, color: Colors.white, size: 18),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
