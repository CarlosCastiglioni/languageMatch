import 'package:match_code/models/language.dart';

class LanguagesRepository {
  static List<Language> table = [
    Language(icon: "assets/images/dart.png", name: "Dart", state: "Refused"),
    Language(
        icon: "assets/images/javascript.png",
        name: "JavaScript",
        state: "Accepted"),
    Language(icon: "assets/images/python.png", name: "Python", state: "Lost"),
    Language(icon: "assets/images/java.png", name: "Java", state: "Pending"),
  ];
}
