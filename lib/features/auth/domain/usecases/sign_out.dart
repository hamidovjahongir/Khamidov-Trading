
import 'package:trading_app/features/auth/domain/repository/auth_repository.dart';

class SignOutUseCase {
  final AuthRepository repository;
  SignOutUseCase(this.repository);

  Future<void> call() async {
    return await repository.signOut();
  }
}