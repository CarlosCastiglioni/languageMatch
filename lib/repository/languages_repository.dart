import 'package:match_code/models/language.dart';

class LanguagesRepository {
  static List<Language> table = [
    Language(
      icon: "assets/images/dart.png",
      name: "Dart",
    ),
    Language(
      icon: "assets/images/javascript.png",
      name: "JavaScript",
    ),
    Language(
      icon: "assets/images/python.png",
      name: "Python",
    ),
    Language(
      icon: "assets/images/java.png",
      name: "Java",
    ),
  ];
}
