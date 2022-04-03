import 'package:flutter/material.dart';
import 'package:match_code/shared/themes/app_text_styles.dart';

class ConfirmationDialog extends StatelessWidget {
  final String image;
  final String name;
  final String title;
  const ConfirmationDialog(
      {Key? key, required this.image, required this.name, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(
          child: Text(
        title,
        style: TextStyles.titleRegularGrey,
      )),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            name,
            style: TextStyles.languageName,
          ),
          const SizedBox(
            height: 15,
          ),
          Image.asset(image),
          const SizedBox(height: 15),
          SizedBox(
            width: 120,
            child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("OK")),
          )
        ],
      ),
    );
  }
}
