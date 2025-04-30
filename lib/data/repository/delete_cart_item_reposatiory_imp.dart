import 'package:dartz/dartz.dart';
import 'package:ecommerce/domain/datasource/delete_cart_item_remote_datasource.dart';
import 'package:ecommerce/domain/entites/RemoveCartitemResponseEntity.dart';
import 'package:ecommerce/domain/entites/failer.dart';
import 'package:ecommerce/domain/reposatiory/delete_cartitem_reposatiory_contract.dart';

class DeleteCartItemReposatioryImp implements DeleteCartItemReposatioryContract{
  DeleteCartItemRemoteDatasource deleteCartItemRemoteDatasource;
  DeleteCartItemReposatioryImp({required this.deleteCartItemRemoteDatasource});
  @override
  Future<Either<Failer, RemoveCartitemResponseEntity>> deleteItem(String ProductID) {
    return deleteCartItemRemoteDatasource.deleteItem(ProductID);
  }

}