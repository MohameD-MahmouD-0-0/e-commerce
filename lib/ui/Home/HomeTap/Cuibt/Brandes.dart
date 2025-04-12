import 'package:ecommerce/domain/entites/BrandesResponseEntity.dart';
import 'package:flutter/material.dart';

import '../CustomBrandes.dart';

class Brandes extends StatelessWidget {
  final List<DataBrandesEntity> brandesList;

  Brandes({required this.brandesList});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.builder(
        itemCount: brandesList.length,  // عدد العناصر في القائمة
        itemBuilder: (context, index) {
          return CustomBrandes(dataEntity: brandesList[index]);  // استخدام CustomBrandes لعرض العنصر
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,  // عدد الأعمدة في الـ Grid
          mainAxisSpacing: 16,  // المسافة بين الصفوف
          crossAxisSpacing: 16,  // المسافة بين الأعمدة
        ),
      ),
    );
  }
}
