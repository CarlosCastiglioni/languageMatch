import 'package:flutter/material.dart';
import 'package:language_match/shared/themes/app_colors.dart';

import '../shared/themes/app_text_styles.dart';

class CustomAppBar extends StatelessWidget {
  String title1;
  String? title2;
  String subtitle;
  String? photo;
  bool center = false;
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
        height: 170,
        color: AppColors.primary,
        child: Center(
          child: ListTile(
              title: Text.rich(
                TextSpan(
                    text: title1,
                    style: TextStyles.titleRegular,
                    children: [
                      TextSpan(
                          text: title2, style: TextStyles.titleBoldBackground)
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
                      height: 48,
                      width: 48,
                      decoration: BoxDecoration(
                          color: AppColors.background,
                          borderRadius: BorderRadius.circular(5),
                          image: DecorationImage(image: NetworkImage(photo!))))
                  : null),
        ));
  }
}
