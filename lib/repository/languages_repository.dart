import 'package:match_code/models/language.dart';
import 'package:match_code/shared/themes/app_images.dart';

class LanguagesRepository {
  static List<Language> table = [
    Language(
        icon: AppImages.dartIcon,
        name: "Dart",
        state: "Pending",
        image: AppImages.dartImg),
    Language(
        icon: AppImages.javascriptIcon,
        name: "JavaScript",
        state: "Pending",
        image: AppImages.javascriptImg),
    Language(
        icon: AppImages.pythonIcon,
        name: "Python",
        state: "Pending",
        image: AppImages.pythonImg),
    Language(
        icon: AppImages.javaIcon,
        name: "Java",
        state: "Pending",
        image: AppImages.javaImg),
  ];
}
