import 'dart:math';
export '../controllers/bloc/match_timer_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:match_code/controllers/bloc/match_timer_bloc.dart';
import 'package:match_code/controllers/bloc/match_timer_event.dart';
import 'package:match_code/controllers/bloc/match_timer_state.dart';
import '../repository/languages_repository.dart';
import '../shared/themes/app_colors.dart';
import '../shared/themes/app_text_styles.dart';

class MatchActions extends StatefulWidget {
  const MatchActions({Key? key}) : super(key: key);

  @override
  State<MatchActions> createState() => _MatchActionsState();
}

class _MatchActionsState extends State<MatchActions> {
  final languages = LanguagesRepository.table;

  @override
  void initState() {
    setTimer(context);
    super.initState();
  }

  void setTimer(BuildContext context) {
    context.read<MatchTimerBloc>().add(const MatchTimerStartEvent(duration: 3));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MatchTimerBloc, MatchTimerState>(
      buildWhen: (prev, state) => prev.runtimeType != state.runtimeType,
      builder: (context, state) {
        final pendingList = [];
        for (var lng in languages) {
          if (lng.state == "Pending") {
            pendingList.add(lng);
          }
        }
        final random = Random();
        final language =
            pendingList.isNotEmpty ? random.nextInt(pendingList.length) : 0;
        final controller = BlocProvider.of<MatchTimerBloc>(context);
        controller.lostLanguage =
            pendingList.isNotEmpty ? pendingList[language] : null;
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
                        pendingList[language].name,
                        style: TextStyles.titleHome,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Image.asset(pendingList[language].image),
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
                                if (lng.name == pendingList[language].name &&
                                    pendingList.isNotEmpty) {
                                  lng.state = "Accepted";
                                }
                              }
                              context.read<MatchTimerBloc>().add(
                                  const MatchTimerStartEvent(duration: 30));
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
                                if (lng.name == pendingList[language].name &&
                                    pendingList.isNotEmpty) {
                                  lng.state = "Refused";
                                }
                              }
                              context.read<MatchTimerBloc>().add(
                                  const MatchTimerStartEvent(duration: 30));
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
