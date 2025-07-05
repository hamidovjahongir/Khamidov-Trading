import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  ForgetPasswordCubit() : super(ForgetPasswordInitial());

  Future<void> sendResetLink(String email) async {
    emit(ForgetPasswordLoading());
    try {
      await _auth.sendPasswordResetEmail(email: email);
      emit(ForgetPasswordSuccess());
    } on FirebaseAuthException catch (e) {
      String errorMessage;
      switch (e.code) {
        case 'user-not-found':
          errorMessage = 'Bu email bilan foydalanuvchi topilmadi';
          break;
        case 'invalid-email':
          errorMessage = 'Email manzili noto\'g\'ri';
          break;
        case 'too-many-requests':
          errorMessage = 'Juda ko\'p urinish. Keyinroq qayta urinib ko\'ring';
          break;
        default:
          errorMessage = 'Xatolik yuz berdi: ${e.message}';
      }
      emit(ForgetPasswordFailure(errorMessage));
    } catch (e) {
      emit(ForgetPasswordFailure("Xatolik: ${e.toString()}"));
    }
  }
}