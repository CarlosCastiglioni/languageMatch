import 'package:flutter/material.dart';
import 'package:match_code/shared/themes/app_colors.dart';

import '../shared/themes/app_images.dart';
import '../shared/themes/app_text_styles.dart';

class SocialLoginButton extends StatelessWidget {
  final VoidCallback onTap;
  const SocialLoginButton({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 40,
        decoration: BoxDecoration(
            color: AppColors.grey.withOpacity(0.1),
            borderRadius: BorderRadius.circular(5),
            border:
                Border.fromBorderSide(BorderSide(color: AppColors.background))),
        child: Row(
          children: [
            Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(AppImages.google),
                    Container(
                      height: 56,
                      width: 1,
                      color: AppColors.background,
                    ),
                  ],
                )),
            Expanded(
              flex: 4,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Entrar com google',
                    style: TextStyles.buttonGrey,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
