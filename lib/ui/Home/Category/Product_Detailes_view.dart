import 'package:ecommerce/domain/entites/ProductResponseEntity.dart';
import 'package:ecommerce/ui/utils/MyTheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:readmore/readmore.dart';

class ProductDetailesView extends StatefulWidget {
  static const String routeName = 'ProductDetailes';

  @override
  State<ProductDetailesView> createState() => _ProductDetailesViewState();
}

class _ProductDetailesViewState extends State<ProductDetailesView> {
  int quantity = 1;
  int selectedSize = 38;
  int selectedColorIndex = 0;

  List<int> sizes = [38, 39, 40, 41, 42];
  List<Color> colors = [
    Colors.brown,
    Colors.black,
    Colors.blue,
    Colors.green,
    Colors.red
  ];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as DataEntity;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Product Details',
          style: TextStyle(color: MyTheme.PrimaryLight, fontSize: 20),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Stack(
                    alignment: Alignment.topRight,
                    children: [
                      ImageSlideshow(
                        isLoop: true,
                        initialPage: 0,
                        indicatorColor: MyTheme.PrimaryLight,
                        indicatorBackgroundColor: MyTheme.WhiteColor,
                        indicatorBottomPadding: 20,
                        children: args.images!
                            .map((url) => Image.network(url, fit: BoxFit.cover))
                            .toList(),
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
                ),
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(args.title!,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: MyTheme.PrimaryLight)),
                  Text('EGP ${args.price}',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: MyTheme.PrimaryLight)),
                ],
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                        color: Color.fromARGB(30, 100, 100, 100),
                        borderRadius: BorderRadius.circular(10)),
                    child: Text('${args.sold} Sold',
                        style: TextStyle(
                            fontSize: 16,
                            color: MyTheme.PrimaryLight,
                            fontWeight: FontWeight.w500)),
                  ),
                  SizedBox(width: 16),
                  Icon(Icons.star, color: Colors.amber),
                  SizedBox(width: 4),
                  Text('${args.ratingsAverage}', style: TextStyle(fontSize: 16))
                ],
              ),
              SizedBox(height: 12),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  width: 100,
                  height: 40,
                  decoration: BoxDecoration(
                      color: MyTheme.PrimaryLight,
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (quantity > 1) setState(() => quantity--);
                        },
                        child: Icon(Icons.remove_circle_outline,
                            color: MyTheme.WhiteColor),
                      ),
                      Text('$quantity',
                          style: TextStyle(color: MyTheme.WhiteColor)),
                      GestureDetector(
                        onTap: () {
                          setState(() => quantity++);
                        },
                        child: Icon(Icons.add_circle_outline_outlined,
                            color: MyTheme.WhiteColor),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text('Description',
                  style: TextStyle(
                      fontSize: 20,
                      color: MyTheme.PrimaryLight,
                      fontWeight: FontWeight.w800)),
              ReadMoreText(
                args.description!,
                trimMode: TrimMode.Line,
                trimLines: 2,
                moreStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: MyTheme.PrimaryLight),
                lessStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: MyTheme.PrimaryLight),
                trimCollapsedText: 'Show more',
                trimExpandedText: '...Show less',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w300,
                    color: MyTheme.PrimaryLight),
              ),
              SizedBox(height: 16),
              Text('Size',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: MyTheme.PrimaryLight)),
              Row(
                children: sizes
                    .map((s) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: ChoiceChip(
                            label: Text('$s'),
                            selected: selectedSize == s,
                            onSelected: (_) => setState(() => selectedSize = s),
                            selectedColor: MyTheme.PrimaryLight,
                            labelStyle: TextStyle(
                                color: selectedSize == s
                                    ? Colors.white
                                    : MyTheme.PrimaryLight),
                          ),
                        ))
                    .toList(),
              ),
              SizedBox(height: 16),
              Text('Color',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: MyTheme.PrimaryLight)),
              Row(
                children: List.generate(
                    colors.length,
                    (index) => GestureDetector(
                          onTap: () =>
                              setState(() => selectedColorIndex = index),
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 6, vertical: 10),
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: colors[index],
                              border: selectedColorIndex == index
                                  ? Border.all(
                                      color: MyTheme.PrimaryLight, width: 2)
                                  : null,
                            ),
                          ),
                        )),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total price\nEGP ${args.price! * quantity}',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: MyTheme.PrimaryLight)),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('',arguments: ProductDetailesView());
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: MyTheme.PrimaryLight,
                      padding:
                          EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    child: Text('Add to cart',
                        style: TextStyle(fontSize: 16, color: Colors.white)),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
