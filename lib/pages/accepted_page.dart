import 'package:flutter/material.dart';
import 'package:match_code/widgets/custom_app_bar.dart';

import '../repository/languages_repository.dart';

class AcceptedPage extends StatefulWidget {
  const AcceptedPage({Key? key}) : super(key: key);

  @override
  State<AcceptedPage> createState() => _AcceptedPageState();
}

class _AcceptedPageState extends State<AcceptedPage> {
  final languages = LanguagesRepository.table;
  @override
  Widget build(BuildContext context) {
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
          itemCount: languages.length,
          separatorBuilder: (_, __) => Divider(),
          itemBuilder: (BuildContext context, int language) {
            return ListTile(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12))),
              leading: Image.asset(languages[language].icon),
              title: Text(languages[language].name),
            );
          },
        ),
      ),
    );
  }
}
