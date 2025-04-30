import 'package:dartz/dartz.dart';
import 'package:ecommerce/domain/datasource/update_cart_item_remote_datasource.dart';
import 'package:ecommerce/domain/reposatiory/update_cart_item_reposatiory_contract.dart';
import '../../domain/entites/UpdateCartItemEntity.dart';
import '../../domain/entites/failer.dart';

class UpdateCartItemReposatioryImp implements UpdateCartItemReposatioryContract{
  UpdateCartItemRemoteDatasource updateCartItemRemoteDatasource;
  UpdateCartItemReposatioryImp({ required this.updateCartItemRemoteDatasource});
  @override
  Future<Either<Failer,UpdateCartItemEntity>> updateCart(String cartID,String Count) {
    return updateCartItemRemoteDatasource.updateCart(cartID, Count);
  }
}