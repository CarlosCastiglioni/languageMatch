import 'package:flutter/material.dart';
import 'package:match_code/shared/themes/app_colors.dart';

import '../repository/languages_repository.dart';
import '../widgets/custom_app_bar.dart';

class PendingPage extends StatefulWidget {
  const PendingPage({Key? key}) : super(key: key);

  @override
  State<PendingPage> createState() => _PendingPageState();
}

class _PendingPageState extends State<PendingPage> {
  final languages = LanguagesRepository.table;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: CustomAppBar(
            title1: "Solicitações Pendentes",
            subtitle: "Veja abaixo suas solicitações pendentes"),
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
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Column(
          verticalDirection: VerticalDirection.up,
          children: [
            FloatingActionButton.extended(
                backgroundColor: AppColors.delete,
                label: Text(
                  "Recusar",
                ),
                onPressed: (() {})),
            SizedBox(
              height: 5,
            ),
            FloatingActionButton.extended(
                backgroundColor: AppColors.primary,
                label: Text(
                  "Aceitar",
                ),
                onPressed: (() {})),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}
