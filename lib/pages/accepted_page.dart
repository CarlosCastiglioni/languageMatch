import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controllers/bloc/match_timer_bloc.dart';
import '../widgets/custom_app_bar.dart';

class AcceptedPage extends StatelessWidget {
  const AcceptedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = BlocProvider.of<MatchTimerBloc>(context);
    final acceptedList = controller.languages
        .where((element) => element.state == "Accepted")
        .toList();

    return Scaffold(
      appBar: PreferredSize(
        child: CustomAppBar(
            title1: "Solicitações Aceitas",
            subtitle: "Veja abaixo suas solicitações aceitas"),
        preferredSize: const Size.fromHeight(180),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.separated(
          scrollDirection: Axis.vertical,
          itemCount: acceptedList.length,
          separatorBuilder: (_, __) => const Divider(),
          itemBuilder: (BuildContext context, int language) {
            return ListTile(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12))),
              leading: Image.asset(acceptedList[language].icon),
              title: Text(acceptedList[language].name),
            );
          },
        ),
      ),
    );
  }
}
