import 'package:flutter/material.dart';
import 'package:match_code/shared/themes/app_colors.dart';

import '../shared/auth/auth_controller.dart';
import '../shared/themes/app_images.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authController = AuthController();
    authController.currentUser(context);
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Stack(
        children: [Center(child: Image.asset(AppImages.logoFull))],
      ),
    );
  }
}
