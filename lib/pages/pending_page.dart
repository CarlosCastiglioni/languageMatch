import 'package:flutter/material.dart';
import 'package:match_code/widgets/match_actions.dart';
import '../repository/languages_repository.dart';
import '../widgets/custom_app_bar.dart';

class PendingPage extends StatelessWidget {
  PendingPage({Key? key}) : super(key: key);
  final languages = LanguagesRepository.table;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: CustomAppBar(
            title1: "Solicitações Pendentes",
            subtitle: "Veja abaixo suas solicitações pendentes"),
        preferredSize: const Size.fromHeight(180),
      ),
      body: const MatchActions(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}
