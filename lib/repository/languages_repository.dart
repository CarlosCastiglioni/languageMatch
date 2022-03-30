import 'package:language_match/models/language.dart';

class LanguagesRepository {
  static List<Language> table = [
    Language(
      icon: "images/dart.png",
      name: "Dart",
    ),
    Language(
      icon: "images/javascript.png",
      name: "JavaScript",
    ),
    Language(
      icon: "images/python.png",
      name: "Python",
    ),
    Language(
      icon: "images/java.png",
      name: "Java",
    ),
  ];
}
