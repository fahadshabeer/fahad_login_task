import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/constants/app_colors.dart';

class CustomButton extends StatelessWidget {
  final Function() onTap;
  final bool isLoading;
  final String title;
  const CustomButton({super.key, required this.onTap,required this.title, required this.isLoading});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MaterialButton(
        color: AppColors.white,
        shape: const StadiumBorder(),
        minWidth: 184.w,
        height: 39.h,
        onPressed: onTap,
        child: (isLoading)
            ? Container(
                padding: EdgeInsets.all(5.sp),
                height: 35.sp,
                width: 35.sp,

                child: const Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.black,
                  ),
                ),
              )
            : FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  title,
                  style: TextStyle(
                      color: AppColors.black,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600),
                ),
              ),
      ),
    );
  }
}
