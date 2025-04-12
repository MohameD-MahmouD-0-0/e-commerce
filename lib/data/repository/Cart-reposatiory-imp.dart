import 'package:dartz/dartz.dart';
import 'package:ecommerce/domain/datasource/cart-remote-datasource.dart';
import 'package:ecommerce/domain/entites/ResponseCartEntity.dart';
import 'package:ecommerce/domain/entites/failer.dart';
import 'package:ecommerce/domain/reposatiory/Cart-reposatiory-contract.dart';

class CartReposatioryImp implements CartReposatioryContract{
  CartRemoteDataSource cartRemoteDataSource;
  CartReposatioryImp({required this.cartRemoteDataSource});
  @override
  Future<Either<Failer, ResponseCartEntity>> getCartItem() {
    return cartRemoteDataSource.getCartItem();
  }

}