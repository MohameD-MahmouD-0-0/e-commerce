import 'package:flutter/material.dart';
import '../../utils/MyTheme.dart';

class CategorySection extends StatelessWidget {
  final List<String> imageList = [
    'assets/images/images.jpg',
    'assets/images/men.jpg',
    'assets/images/laptop.jpg',
    'assets/images/baby.jpg',
    'assets/images/beauty.jpg',
    'assets/images/headphone.jpg',
    'assets/images/skincare.jpg',
    'assets/images/camera.jpg',
  ];

  final List<String> categoryText = [
    'Women’s fashion',
    'Men’s fashion',
    'Laptops & Electronics',
    'Baby & Toys',
    'Beauty',
    'Headphones',
    'Skincare',
    'Cameras'
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10), // إضافة هامش بسيط
        itemCount: imageList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 15,
          crossAxisSpacing: 15,
          childAspectRatio: 0.9,
        ),
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                width: 75,
                height: 75,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(imageList[index]),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 5),
              Text(
                categoryText[index],
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontSize: 12, // تصغير حجم الخط
                  color: MyTheme.blackcolor,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
