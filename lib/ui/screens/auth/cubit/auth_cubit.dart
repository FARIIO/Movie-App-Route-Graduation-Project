import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  Future<void> register({
    required String email,
    required String password,
    required String name,
  }) async {
    emit(AuthLoadingStat());

  Future<void> register({required String email, required String password}) async {
    emit(AuthLoadingStat());
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      await credential.user?.updateDisplayName(name);
      await credential.user?.reload();
      emit(RegisterSuccessState());
    } on FirebaseAuthException catch (e) {
      emit(AuthFailureState(errorMessage: e.message ?? "Auth Error"));
    } catch (e) {
      emit(AuthFailureState(errorMessage: e.toString()));
    }
  }

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
    } on FirebaseAuthException catch (e) {
      emit(AuthFailureState(errorMessage: e.message ?? "Auth Error"));
    } catch (e) {
      emit(AuthFailureState(errorMessage: e.toString()));
    }
  }
}