import 'package:get_it/get_it.dart';
import 'package:shopping_list/data/entities/account.dart';
import 'package:shopping_list/data/sources/auth/auth_datasource.dart';

class AuthRepo {
  AuthDataSource get _dataSource => GetIt.I.get<AuthDataSource>();

  Future<bool> isAuthorized() => _dataSource.isAuthorized();

  Future loginAsAnonymous() => _dataSource.loginAsAnonymous();

  Future loginViaGoogle() => _dataSource.loginViaGoogle();

  Future loginViaFacebook() => _dataSource.loginViaFacebook();

  String? userId() => _dataSource.userId();

  Stream<Account?> accountChanges() => _dataSource.accountChanges();

  Future<LinkResult> linkGoogle() => _dataSource.linkGoogle();

  Future<LinkResult> linkFacebook() => _dataSource.linkFacebook();

  Future<void> signOut() => _dataSource.signOut();
}
