import 'package:flutter/material.dart';

import '../repository/languages_repository.dart';
import '../widgets/custom_app_bar.dart';

class AcceptedPage extends StatelessWidget {
  AcceptedPage({Key? key}) : super(key: key);
  final languages = LanguagesRepository.table;

  @override
  Widget build(BuildContext context) {
    final acceptedList = [];
    for (var lng in languages) {
      if (lng.state == "Accepted") {
        acceptedList.add(lng);
      }
    }
    return Scaffold(
      appBar: PreferredSize(
        child: CustomAppBar(
            title1: "Solicitações Aceitas",
            subtitle: "Veja abaixo suas solicitações aceitas"),
        preferredSize: Size.fromHeight(130),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.separated(
          scrollDirection: Axis.vertical,
          itemCount: acceptedList.length,
          separatorBuilder: (_, __) => Divider(),
          itemBuilder: (BuildContext context, int language) {
            return ListTile(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12))),
              leading: Image.asset(acceptedList[language].icon),
              title: Text(acceptedList[language].name),
            );
          },
        ),
      ),
    );
  }
}
