import 'package:flutter/material.dart';
import 'package:gainde_management_dashboard/src/presentation/pages/auth/login.dart';
import '/src/presentation/pages/home_pages.dart';


import 'package:splash_view/source/presentation/pages/splash_view.dart';
import 'package:splash_view/source/presentation/widgets/done.dart';

import '/src/utils/const/app_specifications/app_colors.dart';
import '/src/utils/const/app_specifications/app_images.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(


        body:SplashView(

          bottomLoading: true,

          backgroundColor: Colors.grey.shade300,

          logo: Image.asset(AppImages.LOGO_GAINDE),
         // logo: Image.asset(AppImages.LOGO,scale: 3,),

          done: Done(const LoginPage()),

          loadingIndicator: LinearProgressIndicator(color: AppColors.mainAppColor,),

        )
    );
  }
}