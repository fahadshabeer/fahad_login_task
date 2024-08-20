import 'dart:developer';

import 'package:aim_digital_task/utils/exception_utils/exception_utils.dart';
import 'package:aim_digital_task/utils/repositories/login_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  doLogin(String email, String password)async {
    try {
      emit(LoginLoading());
      var user=await LoginRepo.login(email, password);
      emit(LoginSuccess(user: user));
    } on Exception catch (e) {
      log(e.toString());
      emit(LoginFailed(err: ExceptionUtils.getMessage(e)));
    }
  }
}
