import 'package:flutter/material.dart';
import '../repository/languages_repository.dart';
import '../widgets/custom_app_bar.dart';

class RefusedPage extends StatelessWidget {
  RefusedPage({Key? key}) : super(key: key);
  final languages = LanguagesRepository.table;

  @override
  Widget build(BuildContext context) {
    final refusedList = [];
    for (var lng in languages) {
      if (lng.state == "Refused") {
        refusedList.add(lng);
      }
    }
    return Scaffold(
      appBar: PreferredSize(
        child: CustomAppBar(
            title1: "Solicitações Recusadas",
            subtitle: "Veja abaixo suas solicitações recusadas"),
        preferredSize: const Size.fromHeight(130),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.separated(
          scrollDirection: Axis.vertical,
          itemCount: refusedList.length,
          separatorBuilder: (_, __) => Divider(),
          itemBuilder: (BuildContext context, int language) {
            return ListTile(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12))),
              leading: Image.asset(refusedList[language].icon),
              title: Text(refusedList[language].name),
            );
          },
        ),
      ),
    );
  }
}
