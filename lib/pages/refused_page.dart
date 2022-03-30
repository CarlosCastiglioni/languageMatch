import 'package:flutter/material.dart';

import '../repository/languages_repository.dart';
import '../widgets/custom_app_bar.dart';

class RefusedPage extends StatefulWidget {
  const RefusedPage({Key? key}) : super(key: key);

  @override
  State<RefusedPage> createState() => _RefusedPageState();
}

class _RefusedPageState extends State<RefusedPage> {
  final languages = LanguagesRepository.table;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: CustomAppBar(
            title1: "Solicitações Recusadas",
            subtitle: "Veja abaixo suas solicitações recusadas"),
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
