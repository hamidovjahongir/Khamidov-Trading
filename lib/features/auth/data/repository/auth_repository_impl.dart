import 'package:trading_app/features/auth/data/datasource/remote_datasource.dart';
import 'package:trading_app/features/auth/data/model/auth_model.dart';
import 'package:trading_app/features/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource authRemoteDatasource;
  
  AuthRepositoryImpl(this.authRemoteDatasource);
  @override
  Future<AuthModel> signIn(AuthModel user) {
    return authRemoteDatasource.signIn(user);
  }

  @override
  Future<AuthModel> signUp(AuthModel user) {
    return authRemoteDatasource.signUp(user);
  }

  @override
  Future<void> signOut() {
    return authRemoteDatasource.signOut();
  }

  @override
  Future<void> refreshToken() async {
    await authRemoteDatasource.refreshToken();
  }
}