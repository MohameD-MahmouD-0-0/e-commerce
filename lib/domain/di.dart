import 'package:ecommerce/domain/reposatiory/authe_reposatiory_contract.dart';

import '../data/api/api_manger.dart';
import '../data/repository/authe-reposatiory/dataSource/authe_datasource_imp.dart';
import '../data/repository/authe-reposatiory/reposatiory/authe_reposatiory_imp.dart';
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
