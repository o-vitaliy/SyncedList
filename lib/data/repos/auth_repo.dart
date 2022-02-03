import 'package:get_it/get_it.dart';
import 'package:give_a_ride/data/sources/auth/auth_datasource.dart';

class AuthRepo {
  AuthDataSource get _dataSource => GetIt.I.get<AuthDataSource>();

  Future<bool> isAuthorized() => _dataSource.isAuthorized();

  Future loginAsAnonymous() => _dataSource.loginAsAnonymous();

  Future loginViaGoogle() => _dataSource.loginViaGoogle();

  Future loginViaFacebook() => _dataSource.loginViaFacebook();

  String? userId() => _dataSource.userId();
}
