import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

class LoginRepo {
  static Future<User> login(String email, String pass) async {
    try {
      var res = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: pass);

      if (res.user != null) {
        return res.user!;
      } else {
        throw FirebaseAuthException(
            message: "Invalid email or password", code: 'INVALID_CREDENTIALS');
      }
    }catch(e){
      log(e.toString());
      if(e is FirebaseAuthException){
        if(e.code.toLowerCase()=="invalid-credential"){
         var user= await createUser(email, pass);
         return user;
        }else {
          rethrow;
        }
      }else{
        rethrow;
      }
    }
  }

  static Future<User> createUser(String email, String pass) async {
    var res = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: pass);
    if (res.user != null) {
      return res.user!;
    } else {
      throw FirebaseAuthException(
          message: "Invalid signup data", code: 'INVALID_DATA');
    }
  }
}
