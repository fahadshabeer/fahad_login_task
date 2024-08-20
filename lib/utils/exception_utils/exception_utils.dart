import 'package:firebase_auth/firebase_auth.dart';

class ExceptionUtils {
  static String getMessage(Exception e) {
    if (e is FirebaseAuthException) {
      if(e.code=="email-already-in-use") {
        return "Your password is incorrect";
      }else{
        return e.message.toString();
      }
    } else if (e is FirebaseException) {
      return e.message.toString();
    } else {
      return e.toString();
    }
  }
}
