import 'package:trading_app/features/auth/data/datasource/local_datasource.dart';
import 'package:trading_app/features/profile/data/repository/user_local_repository.dart';

final localDb = AuthLocalDatasource();
final userDb = UserLocalRepository();
void chiq() async {
  await localDb.removeToken();
  await userDb.removeUserId();
}