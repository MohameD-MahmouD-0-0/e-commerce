import 'package:dartz/dartz.dart';
import 'package:ecommerce/domain/datasource/Product_Remote_dataSource.dart';
import 'package:ecommerce/domain/reposatiory/product_reposatiory_contract.dart';
import '../../domain/entites/ProductResponseEntity.dart';
import '../../domain/entites/failer.dart';

 class ProductReposatioryImp implements ProductReposatioryContract{
  ProductRemoteDatasource productRemoteDatasource;
  ProductReposatioryImp({required this.productRemoteDatasource});
  Future<Either<Failer,ProductResponseEntity>> getAllProduct(){
    return productRemoteDatasource.getAllProduct();
  }
}