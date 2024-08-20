
import 'package:aim_digital_task/cubits/login_cubit/login_cubit.dart';
import 'package:aim_digital_task/firebase_options.dart';
import 'package:aim_digital_task/utils/constants/app_colors.dart';
import 'package:aim_digital_task/views/screens/home_screen/home_screen.dart';
import 'package:aim_digital_task/views/screens/login_screen/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]
  );
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>LoginCubit())
      ],
      child: ScreenUtilInit(
        designSize: const Size(375,812),
        minTextAdapt: true,
        child: MaterialApp(
          theme: ThemeData(
            fontFamily: "Poppins",
            scaffoldBackgroundColor: AppColors.darkBg,
          ),
          home: FirebaseAuth.instance.currentUser==null?const LoginScreen():const HomeScreen(),
        ),
      ),
    );
  }
}



