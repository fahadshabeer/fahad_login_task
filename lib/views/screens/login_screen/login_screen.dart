import 'dart:ui';

import 'package:aim_digital_task/cubits/login_cubit/login_cubit.dart';
import 'package:aim_digital_task/utils/constants/app_colors.dart';
import 'package:aim_digital_task/utils/constants/constants.dart';
import 'package:aim_digital_task/utils/nav_helper/nav_helper.dart';
import 'package:aim_digital_task/views/screens/home_screen/home_screen.dart';
import 'package:aim_digital_task/views/shared_widegts/custom_bg.dart';
import 'package:aim_digital_task/views/shared_widegts/custom_button.dart';
import 'package:aim_digital_task/views/shared_widegts/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _txtEmail = TextEditingController();
  final _txtPass = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return CustomBg(
      child: Form(
        key: formKey,
        child: SafeArea(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 40.w),
            children: [
              SizedBox(
                height: 150.h,
              ),
              Text(
                "Login!",
                style: TextStyle(
                    color: AppColors.loginHeading,
                    fontSize: 41.sp,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 129.h,
              ),
              CustomTextField(
                  hint: "Email",
                  prefixIcon: "email.svg",
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return "email is required";
                    } else if (!emailRegex.hasMatch(val)) {
                      return "email is badly formatted";
                    }
                    return null;
                  },
                  controller: _txtEmail),
              SizedBox(
                height: 32.h,
              ),
              CustomTextField(
                hint: "Password",
                prefixIcon: "pass.svg",
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return "Password is required";
                  } else if (val.length < 6) {
                    return "Password must be at least 6 characters";
                  } else {
                    return null;
                  }
                },
                controller: _txtPass,
                isPassword: true,
              ),
              SizedBox(
                height: 62.h,
              ),
              BlocConsumer<LoginCubit, LoginState>(
                listener: (context, state) {
                  if (state is LoginSuccess) {
                    Fluttertoast.showToast(
                        msg: "Login success",
                        backgroundColor: Colors.green,
                        toastLength: Toast.LENGTH_LONG);
                    NavHelper.navigate(context, const HomeScreen());
                  }
                  if (state is LoginFailed) {
                    Fluttertoast.showToast(
                        msg: state.err,
                        backgroundColor: Colors.red,
                        toastLength: Toast.LENGTH_LONG);
                  }
                },
                builder: (context, state) {
                  return CustomButton(
                      title: "Login",
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          context
                              .read<LoginCubit>()
                              .doLogin(_txtEmail.text, _txtPass.text);
                        }
                      },
                      isLoading: (state is LoginLoading));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
