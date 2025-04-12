import 'package:ecommerce/data/repository/Cart-reposatiory-imp.dart';
import 'package:ecommerce/data/repository/add_to_cart_reposatiory_imp.dart';
import 'package:ecommerce/data/repository/brandes_reposatiory_imp.dart';
import 'package:ecommerce/data/repository/category_reposatiory_imp.dart';
import 'package:ecommerce/data/repository/datasource/Cart-remote-datasource-imp.dart';
import 'package:ecommerce/data/repository/datasource/Product_Remote_DataSource_Imp.dart';
import 'package:ecommerce/data/repository/datasource/add_to_cart_remote_datasource_imp.dart';
import 'package:ecommerce/data/repository/datasource/category_remote_datasource_imp.dart';
import 'package:ecommerce/data/repository/product_reposatiory_imp.dart';
import 'package:ecommerce/domain/datasource/Product_Remote_dataSource.dart';
import 'package:ecommerce/domain/datasource/add_to_cart_remote_datasource.dart';
import 'package:ecommerce/domain/datasource/add_to_cart_use_case.dart';
import 'package:ecommerce/domain/datasource/brandes_Remote_datasource.dart';
import 'package:ecommerce/domain/datasource/brandes_use_case.dart';
import 'package:ecommerce/domain/datasource/cart-remote-datasource.dart';
import 'package:ecommerce/domain/datasource/category_use_case.dart';
import 'package:ecommerce/domain/datasource/get-cart-item-usecase.dart';
import 'package:ecommerce/domain/datasource/prodcut_Usecase.dart';
import 'package:ecommerce/domain/reposatiory/Cart-reposatiory-contract.dart';
import 'package:ecommerce/domain/reposatiory/add_to_cart_reposatiory_contract.dart';
import 'package:ecommerce/domain/reposatiory/authe_reposatiory_contract.dart';
import 'package:ecommerce/domain/reposatiory/brandes_reposatiory_contract.dart';
import 'package:ecommerce/domain/reposatiory/category_reposatiory_contract.dart';
import 'package:ecommerce/domain/reposatiory/product_reposatiory_contract.dart';
import '../data/api/api_manger.dart';
import '../data/repository/authe-reposatiory/dataSource/authe_datasource_imp.dart';
import '../data/repository/authe-reposatiory/reposatiory/authe_reposatiory_imp.dart';
import '../data/repository/datasource/brandes_remote_datasource_imp.dart';
import 'datasource/authe_datasource.dart';
import 'datasource/login_use_case.dart';
import 'datasource/register_usecase.dart';

AutheRemoteDataSource injectRemoteDataSource() {
  return AutheRemoteDataSourceImp(apiManger: ApiManger.getInstance());
}
AutheReposatioryContract injectAutheReposatioryContract() {
  return AutheReposatioryImp(autheDataSource: injectRemoteDataSource());
}
LoginUseCase injectloginUseCase(){
  return LoginUseCase(autheReposatioryContract: injectAutheReposatioryContract());
}
RegisterUseCase injectRegisterUesCase(){
  return RegisterUseCase(autheReposatioryContract: injectAutheReposatioryContract());
}

CategoryUseCase injectGetAllCategoryUseCase(){
  return CategoryUseCase(reposatioryContract:injectCategoryReposatioryContract());
}

CategoryReposatioryContract injectCategoryReposatioryContract(){
  return CategoryReposatioryImp(categoryRemoteDataSource: injectRemoteCategoryDataSource());
}
CategoryRemoteDataSourceImp injectRemoteCategoryDataSource() {
  return CategoryRemoteDataSourceImp(apiManger: ApiManger.getInstance());
}
BrandesUseCase injectGetAllBrandesUseCase(){
  return BrandesUseCase(brandesReposatioryContract:injectBrandesReposatioryContract());
}

BrandesReposatioryContract injectBrandesReposatioryContract(){
  return BrandesReposatioryImp(brandesRemoteDataSource:injectRemoteBrandesDataSource());
}
BrandesRemoteDataSourceImp injectRemoteBrandesDataSource() {
  return BrandesRemoteDataSourceImp(apiManger: ApiManger.getInstance());
}
ProductUseCase injectProductUseCase(){
  return ProductUseCase(productReposatioryContract: injectProductReposatioryContract());
}
ProductReposatioryContract injectProductReposatioryContract(){
  return ProductReposatioryImp(productRemoteDatasource:injectProductRemoteDataSource());
}
ProductRemoteDatasource injectProductRemoteDataSource(){
  return ProductRemoteDataSourceImp(apiManger: ApiManger.getInstance());
}
AddToCartUseCase injectAddtoCartUseCase(){
  return AddToCartUseCase(addToCartReposatioryContract: injectAddToCartReposatioryContract());
}
AddToCartReposatioryContract injectAddToCartReposatioryContract(){
  return AddToCartReposatioryImp(addToCartRemoteDataSource:injectAddToCartRemoteDataSource());
}
AddToCartRemoteDataSource injectAddToCartRemoteDataSource(){
  return AddToCartRemoteDataSourceImp(apiManger: ApiManger.getInstance());
}


GetCartItemUseCase injectGetCartItemUseCase(){
  return GetCartItemUseCase(cartReposatioryContract:injectCartReposatioryContract());
}
CartReposatioryContract injectCartReposatioryContract(){
  return CartReposatioryImp(cartRemoteDataSource:injectCartRemoteDataSource());
}
CartRemoteDataSource injectCartRemoteDataSource(){
  return CartRemoteDataSourceImp(apiManger: ApiManger.getInstance());
}