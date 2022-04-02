import 'package:flutter/material.dart';
import 'package:match_code/controllers/login_controller.dart';
import 'package:match_code/shared/themes/app_colors.dart';

import '../shared/themes/app_text_styles.dart';

class CustomAppBar extends StatelessWidget {
  final loginController = LoginController();
  final String title1;
  final String? title2;
  final String subtitle;
  final String? photo;
  final bool center = false;

  CustomAppBar(
      {Key? key,
      required this.title1,
      this.title2,
      this.photo,
      required this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200,
        color: AppColors.primary,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () {
                      loginController.signOut(context);
                    },
                    child: Text(
                      "Sair",
                      style: TextStyles.logout,
                    )),
              ],
            ),
            ListTile(
                title: Text.rich(
                  TextSpan(
                      text: title1,
                      style: TextStyles.titleRegular,
                      children: [
                        TextSpan(
                            text: title2,
                            style: TextStyles.titleBoldBackground),
                      ]),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 25.0),
                  child: Text(
                    subtitle,
                    style: TextStyles.captionShape,
                  ),
                ),
                trailing: photo != null
                    ? Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            color: AppColors.background,
                            borderRadius: BorderRadius.circular(5),
                            image:
                                DecorationImage(image: NetworkImage(photo!))))
                    : null),
          ],
        ));
  }
}
