import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../controllers/bloc/match_timer_bloc.dart';
import '../widgets/custom_app_bar.dart';

class RefusedPage extends StatelessWidget {
  const RefusedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = BlocProvider.of<MatchTimerBloc>(context);
    final refusedList = controller.languages
        .where((element) => element.state == "Declined")
        .toList();

    return Scaffold(
      appBar: PreferredSize(
        child: CustomAppBar(
            title1: "Declined Stacks",
            subtitle: "See your declined stacks below"),
        preferredSize: const Size.fromHeight(180),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.separated(
          scrollDirection: Axis.vertical,
          itemCount: refusedList.length,
          separatorBuilder: (_, __) => Divider(),
          itemBuilder: (BuildContext context, int language) {
            return ListTile(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12))),
              leading: Image.asset(refusedList[language].icon),
              title: Text(refusedList[language].name),
            );
          },
        ),
      ),
    );
  }
}
