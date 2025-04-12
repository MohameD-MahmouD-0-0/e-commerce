import 'package:dartz/dartz.dart';
import 'package:ecommerce/domain/reposatiory/product_reposatiory_contract.dart';

import '../entites/ProductResponseEntity.dart';
import '../entites/failer.dart';

class ProductUseCase{
  ProductReposatioryContract productReposatioryContract;
  ProductUseCase({required this.productReposatioryContract});
  Future<Either<Failer, ProductResponseEntity>> invoke(){
   return productReposatioryContract.getAllProduct();
  }
}