import 'package:aim_digital_task/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomTextField extends StatefulWidget {
  final String hint;
  final bool isPassword;
  final String prefixIcon;
  final TextEditingController controller;
  final String? Function(String?) validator;
  const CustomTextField({
    super.key,
    required this.hint,
    required this.validator,
    required this.controller,
    this.isPassword=false,
    required this.prefixIcon
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final border=UnderlineInputBorder(
      borderSide: BorderSide(
          width: 1.sp,
          color: Colors.white
      )
  );
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.isPassword,
      controller: widget.controller,
      validator: widget.validator,
      cursorColor: AppColors.loginHeading,

      autovalidateMode: AutovalidateMode.onUserInteraction,
      style: TextStyle(
        color: Colors.white,
        fontSize: 16.sp
      ),
      decoration: InputDecoration(
        hintText: widget.hint,
        isDense: true,
        contentPadding: EdgeInsets.symmetric(
          horizontal: 10.w,
          vertical: 12.sp
        ),
        prefixIcon: SizedBox(
          width: 25.sp,
          child: Center(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: SvgPicture.asset(
                  "assets/svgs/${widget.prefixIcon}",
                height: 25.sp,
                width: 25.sp,
              ),
            ),
          ),
        ),
        hintStyle: TextStyle(
          color: Colors.white,
          fontSize: 14.sp
        ),
        border: border,
        enabledBorder: border,
        focusedBorder: border,
        errorBorder: border
      ),
    );
  }
}
