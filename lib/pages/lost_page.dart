import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controllers/bloc/match_timer_bloc.dart';
import '../widgets/custom_app_bar.dart';

class LostPage extends StatelessWidget {
  const LostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = BlocProvider.of<MatchTimerBloc>(context);
    final lostList = controller.languages
        .where((element) => element.state == "Lost")
        .toList();

    return Scaffold(
        appBar: PreferredSize(
          child: CustomAppBar(
              title1: "Missed Stacks",
              subtitle: "See your missed stacks below"),
          preferredSize: const Size.fromHeight(180),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.separated(
            scrollDirection: Axis.vertical,
            itemCount: lostList.length,
            separatorBuilder: (_, __) => const Divider(),
            itemBuilder: (BuildContext context, int language) {
              return ListTile(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                leading: Image.asset(lostList[language].icon),
                title: Text(lostList[language].name),
              );
            },
          ),
        ));
  }
}
