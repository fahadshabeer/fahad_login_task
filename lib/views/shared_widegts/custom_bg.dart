import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBg extends StatelessWidget {
  final Widget child;
  const CustomBg({super.key,required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0.sp,
            left: 0,
            right: 0,
            child: Container(
              width: 133.sp, // Set your desired width
              height: 133.sp, // Set your desired height
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFFA65AF2),
                    Color(0xFFE65C5C),
                  ],
                  stops: [0.0695, 0.7427],
                  transform: GradientRotation(136.28 * 3.1415927 / 180),
                ),
                shape: BoxShape.circle,
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 133.sp,
                  sigmaY: 133.sp,
                ),
                child: Container(
                  color: Colors.transparent, // Maintain transparency
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: child,
          )
        ],
      ),
    );
  }
}
