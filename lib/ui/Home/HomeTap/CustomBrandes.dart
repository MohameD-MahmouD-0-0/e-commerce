import 'package:ecommerce/domain/entites/BrandesResponseEntity.dart';
import 'package:ecommerce/ui/utils/MyTheme.dart';
import 'package:flutter/material.dart';

class CustomBrandes extends StatelessWidget {
  final DataBrandesEntity dataEntity;

  CustomBrandes({required this.dataEntity});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min, // منع تمدد العمود أكثر من اللازم
      children: [
        Container(
          width: 100, // تحديد عرض الصورة
          height: 100, // تحديد ارتفاع الصورة
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 8,
                spreadRadius: 2,
              ),
            ],
            image: dataEntity.image != null && dataEntity.image!.isNotEmpty
                ? DecorationImage(
              image: NetworkImage(dataEntity.image!),
              fit: BoxFit.cover, // التأكد من أن الصورة تغطي الدائرة بالكامل
            )
                : null,
          ),
          child: dataEntity.image == null || dataEntity.image!.isEmpty
              ? Center(
            child: Icon(
              Icons.image_not_supported,
              size: 40,
              color: Colors.grey[600],
            ),
          )
              : null,
        ),
        SizedBox(height: 10), // المسافة بين الصورة والنص
        Text(
          dataEntity.name ?? "Unknown", // تجنب الأخطاء عند `null`
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
            fontSize: 14,
            color: MyTheme.blackcolor,
            fontWeight: FontWeight.normal,
          ),
        ),
      ],
    );
  }
}
