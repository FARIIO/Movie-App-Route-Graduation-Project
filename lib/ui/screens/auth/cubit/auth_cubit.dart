import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

   Future<void> register({
    required String email,
    required String password,
  }) async {
     emit(AuthLoadingStat());



    try {

      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      emit(RegisterSuccessState());
    }  on FirebaseAuthException catch (e) {

      emit(
        AuthFailureState(
          errorMessage: e.message ?? "Auth Error",
        ),
      );

    }
    catch (e) {

      emit(
        AuthFailureState(
          errorMessage: e.toString(),
        ),
      );

    }
  }

   Future<void> login({
    required String email,
    required String password,
  }) async {
     emit(AuthLoadingStat());
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(LoginSuccessState());
    }  catch (e) {
      emit(AuthFailureState(errorMessage:  "Something went wrong"));
    }
  }

   Future<void> signInWithGoogle() async {
     emit(AuthLoadingStat());
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) {
        emit(AuthInitial());
        return;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);
      emit(GoogleSuccessState());
    }on FirebaseAuthException catch (e) {

      emit(
        AuthFailureState(
          errorMessage: e.message ?? "Auth Error",
        ),
      );

    }
    catch (e) {

      emit(
        AuthFailureState(
          errorMessage: e.toString(),
        ),
      );

    }
  }
}

// 1. Logic for "Verify Email" (Forgot Password)
// This matches the "Verify Email" button in your UI
Future<void> verifyEmail(String email) async {
  emit(AuthLoading());
  try {
    final response = await Dio().post(
      "https://route-ecommerce.onrender.com/api/v1/auth/forgotPasswords",
      data: {"email": email},
    );

    if (response.statusCode == 200) {
      emit(AuthSuccess("Verification code sent to your email successfully."));
    } else {
      emit(AuthError(response.data['message'] ?? "User not found."));
    }
  } catch (e) {
    emit(AuthError("Connection error. Please check your internet."));
  }
}

Future<void> updateProfile({
  required String token,
  required String name,
  required String phone,
}) async {
  emit(AuthLoading());
  try {
    final response = await Dio().put(
      "https://route-ecommerce.onrender.com/api/v1/users/updateMe/",
      data: {
        "name": name,
        "phone": phone,
      },
      options: Options(
        headers: {"token": token},
      ),
    );

    if (response.statusCode == 200) {
      emit(AuthSuccess("Profile data updated successfully!"));
    } else {
      emit(AuthError(response.data['errors']?[0]['msg'] ?? "Update failed."));
    }
  } catch (e) {
    emit(AuthError("Failed to update profile. Try again later."));
  }
}

class AuthSuccess {
}