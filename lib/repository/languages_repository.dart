import 'package:match_code/models/language.dart';

class LanguagesRepository {
  static List<Language> table = [
    Language(
        icon: "assets/images/dart.png",
        name: "Dart",
        state: "Pending",
        image: 'assets/images/dartImg.png'),
    Language(
        icon: "assets/images/javascript.png",
        name: "JavaScript",
        state: "Pending",
        image: 'assets/images/javascriptImg.png'),
    Language(
        icon: "assets/images/python.png",
        name: "Python",
        state: "Pending",
        image: 'assets/images/pythonImg.png'),
    Language(
        icon: "assets/images/java.png",
        name: "Java",
        state: "Pending",
        image: 'assets/images/javaImg.png'),
  ];
}
