import 'dart:math';
export '../controllers/bloc/match_timer_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:match_code/controllers/bloc/match_timer_bloc.dart';
import 'package:match_code/controllers/bloc/match_timer_state.dart';
import '../repository/languages_repository.dart';
import '../shared/themes/app_colors.dart';
import '../shared/themes/app_text_styles.dart';

class MatchActions extends StatelessWidget {
  MatchActions({Key? key}) : super(key: key);
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
    final language =
        pendingList.isNotEmpty ? random.nextInt(pendingList.length) : null;
    return BlocBuilder<MatchTimerBloc, MatchTimerState>(
      buildWhen: (prev, state) => prev.runtimeType != state.runtimeType,
      builder: (context, state) {
        return Scaffold(
          body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (pendingList.isEmpty) ...[
                      Text(
                        "Você já utilizou todas as linguagens disponíveis!",
                        style: TextStyles.buttonGrey,
                      )
                    ],
                    if (state is MatchTimerCounterState &&
                        pendingList.isNotEmpty) ...[
                      Text(
                        pendingList[language!].name,
                        style: TextStyles.buttonGrey,
                      ),
                      Image.asset(pendingList[language].icon),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FloatingActionButton.extended(
                            label: const Text("Aceitar"),
                            onPressed: () {
                              for (var lng in languages) {
                                if (lng.name == pendingList[language].name) {
                                  lng.state = "Accepted";
                                }
                              }
                            },
                            backgroundColor: AppColors.primary,
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          FloatingActionButton.extended(
                            label: const Text("Recusar"),
                            onPressed: () {
                              for (var lng in languages) {
                                if (lng.name == pendingList[language].name) {
                                  lng.state = "Refused";
                                }
                              }
                            },
                            backgroundColor: AppColors.delete,
                          ),
                        ],
                      )
                    ],
                    if (state is MatchTimerStartState &&
                        pendingList.isNotEmpty) ...[
                      Text(
                        "Não há linguagens pendentes!",
                        style: TextStyles.buttonGrey,
                      )
                    ],
                  ],
                ),
              )),
        );
      },
    );
  }
}
