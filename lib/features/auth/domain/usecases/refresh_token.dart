
import 'package:trading_app/features/auth/domain/repository/auth_repository.dart';

class RefreshToken {
  final AuthRepository repository;
  RefreshToken(this.repository);

  Future<void> call() async {
    await repository.refreshToken();
  }
}