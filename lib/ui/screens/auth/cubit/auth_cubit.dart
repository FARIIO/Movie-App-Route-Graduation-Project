import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  final Dio _dio = Dio();


  Future<void> register({required String email, required String password}) async {
    emit(AuthLoadingStat());
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      emit(RegisterSuccessState());
    } catch (e) {
      emit(AuthFailureState(errorMessage: e.toString()));
    }
  }

  // 2. Login Logic
  Future<void> login({required String email, required String password}) async {
    emit(AuthLoadingStat());
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      emit(LoginSuccessState());
    } catch (e) {
      emit(AuthFailureState(errorMessage: "Something went wrong"));
    }
  }

  Future<void> signInWithGoogle() async {
    emit(AuthLoadingStat());
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) { emit(AuthInitial()); return; }
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
      await FirebaseAuth.instance.signInWithCredential(credential);
      emit(GoogleSuccessState());
    } catch (e) {
      emit(AuthFailureState(errorMessage: e.toString()));
    }
  }

  Future<void> verifyEmail(String email) async {
    emit(AuthLoadingStat());
    try {
      final response = await _dio.post(
        "https://route-ecommerce.onrender.com/api/v1/auth/forgotPasswords",
        data: {"email": email},
      );
      if (response.statusCode == 200) {
        emit(AuthSuccessState(message: "Verification code sent to your email."));
      } else {
        emit(AuthFailureState(errorMessage: response.data['message'] ?? "User not found."));
      }
    } catch (e) {
      emit(AuthFailureState(errorMessage: "Connection error."));
    }
  }

  Future<void> updateProfile({required String token, required String name, required String phone}) async {
    emit(AuthLoadingStat());
    try {
      final response = await _dio.put(
        "https://route-ecommerce.onrender.com/api/v1/users/updateMe/",
        data: {"name": name, "phone": phone},
        options: Options(headers: {"token": token}),
      );
      if (response.statusCode == 200) {
        emit(AuthSuccessState(message: "Profile updated successfully!"));
      } else {
        emit(AuthFailureState(errorMessage: "Update failed."));
      }
    } catch (e) {
      emit(AuthFailureState(errorMessage: "Failed to update profile."));
    }
  }
}