import 'package:aim_digital_task/utils/nav_helper/nav_helper.dart';
import 'package:aim_digital_task/views/screens/login_screen/login_screen.dart';
import 'package:aim_digital_task/views/shared_widegts/custom_bg.dart';
import 'package:aim_digital_task/views/shared_widegts/custom_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomBg(
      child: Center(
        child: CustomButton(
          title: "Logout",
            onTap: ()async{
              try{
                await FirebaseAuth.instance.signOut();
                if(mounted) {
                  NavHelper.navigateAndPopAll(context, const LoginScreen());
                }
              }catch(e){
               if(e is FirebaseAuthException){
                 Fluttertoast.showToast(msg: e.message.toString(),backgroundColor: Colors.red,toastLength: Toast.LENGTH_LONG);
               }else{
                 Fluttertoast.showToast(msg: e.toString(),backgroundColor: Colors.red,toastLength: Toast.LENGTH_LONG);
               }
              }
            },
            isLoading: false
        ),
      ),
    );
  }
}
