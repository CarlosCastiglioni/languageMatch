import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:match_code/shared/themes/app_text_styles.dart';

import '../controllers/bloc/match_timer_bloc.dart';
import '../controllers/ticker.dart';
import '../repository/languages_repository.dart';
import '../shared/themes/app_colors.dart';
import '../widgets/custom_app_bar.dart';

class PendingPage extends StatelessWidget {
  PendingPage({Key? key}) : super(key: key);
  final languages = LanguagesRepository.table;

  @override
  Widget build(BuildContext context) {
    final pendingList = [];
    for (var lng in languages) {
      if (lng.state == "Pending") {
        pendingList.add(lng);
      }
    }
    final random = Random();
    final language = random.nextInt(pendingList.length);
    return BlocProvider(
      create: (context) => MatchTimerBloc(ticker: const Ticker()),
      child: Scaffold(
        appBar: PreferredSize(
          child: CustomAppBar(
              title1: "Solicitações Pendentes",
              subtitle: "Veja abaixo suas solicitações pendentes"),
          preferredSize: const Size.fromHeight(130),
        ),
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    pendingList[language].name,
                    style: TextStyles.buttonGrey,
                  ),
                  Image.asset(pendingList[language].icon),
                ],
              ),
            )),
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
      ),
    );
  }
}
