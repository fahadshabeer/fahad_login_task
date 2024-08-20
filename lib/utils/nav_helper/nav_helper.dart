
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavHelper
{
  static navigate(BuildContext context,Widget destination){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>destination));
  }
  static navigateAndPop(BuildContext context,Widget destination){
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>destination));
  }
  static navigateAndPopAll(BuildContext context,Widget destination){
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>destination), (route)=>false);
  }
}