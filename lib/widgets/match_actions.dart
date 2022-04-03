export '../controllers/bloc/match_timer_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:match_code/controllers/bloc/match_timer_bloc.dart';
import 'package:match_code/controllers/bloc/match_timer_event.dart';
import 'package:match_code/controllers/bloc/match_timer_state.dart';
import '../shared/themes/app_colors.dart';
import '../shared/themes/app_text_styles.dart';

class MatchActions extends StatefulWidget {
  const MatchActions({Key? key}) : super(key: key);

  @override
  State<MatchActions> createState() => _MatchActionsState();
}

class _MatchActionsState extends State<MatchActions> {
  @override
  Widget build(BuildContext context) {
    final controller = BlocProvider.of<MatchTimerBloc>(context);
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
                    if (controller.languageList.isEmpty) ...[
                      Text(
                        "Você já utilizou todas as linguagens disponíveis!",
                        style: TextStyles.buttonGrey,
                      )
                    ],
                    if (state is MatchTimerCounterState &&
                        controller.languageList.isNotEmpty) ...[
                      Text(
                        controller.languageList[controller.lng].name,
                        style: TextStyles.titleHome,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Image.asset(
                          controller.languageList[controller.lng].image),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FloatingActionButton.extended(
                            label: const Text("Aceitar"),
                            onPressed: () {
                              for (var lng in controller.languages) {
                                if (lng.name ==
                                        controller.languageList[controller.lng]
                                            .name &&
                                    controller.languageList.isNotEmpty) {
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
                              for (var lng in controller.languages) {
                                if (lng.name ==
                                        controller.languageList[controller.lng]
                                            .name &&
                                    controller.languageList.isNotEmpty) {
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
                        controller.languageList.isNotEmpty) ...[
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
