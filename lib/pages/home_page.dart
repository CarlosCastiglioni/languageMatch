import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:match_code/pages/accepted_page.dart';
import 'package:match_code/pages/lost_page.dart';
import 'package:match_code/pages/pending_page.dart';
import 'package:match_code/pages/profile_page.dart';
import 'package:match_code/pages/refused_page.dart';
import 'package:match_code/shared/themes/app_colors.dart';

import '../controllers/bloc/match_timer_bloc.dart';
import '../controllers/bloc/match_timer_event.dart';
import '../models/user_model.dart';

class HomePage extends StatefulWidget {
  final UserModel? user;
  const HomePage({Key? key, required this.user}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 0;
  late PageController pc;

  @override
  void initState() {
    setTimer(context);
    super.initState();
    pc = PageController(initialPage: currentPage);
  }

  setPage(page) {
    setState(() {
      currentPage = page;
    });
  }

  void setTimer(BuildContext context) {
    context.read<MatchTimerBloc>().add(const MatchTimerStartEvent(duration: 3));
  }

  @override
  Widget build(BuildContext context) {
    final controller = BlocProvider.of<MatchTimerBloc>(context);
    controller.lostLanguage = controller.languageList.isNotEmpty
        ? controller.languageList[controller.lng]
        : null;

    return Scaffold(
      body: PageView(
        onPageChanged: setPage,
        controller: pc,
        children: [
          ProfilePage(user: widget.user!),
          PendingPage(),
          const AcceptedPage(),
          const RefusedPage(),
          const LostPage()
        ],
      ),
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
            labelTextStyle: MaterialStateProperty.all(
                const TextStyle(fontSize: 14, fontWeight: FontWeight.w500))),
        child: NavigationBar(
          destinations: const [
            NavigationDestination(
                icon: Icon(Icons.view_list_outlined),
                label: "Profile",
                selectedIcon: Icon(Icons.view_list)),
            NavigationDestination(
                icon: Icon(Icons.watch_later_outlined),
                label: "Pendentes",
                selectedIcon: Icon(Icons.watch_later)),
            NavigationDestination(
                icon: Icon(Icons.thumb_up_alt_outlined),
                label: "Aceitas",
                selectedIcon: Icon(Icons.thumb_up_alt)),
            NavigationDestination(
                icon: Icon(Icons.thumb_down_alt_outlined),
                label: "Recusadas",
                selectedIcon: Icon(Icons.thumb_down_alt)),
            NavigationDestination(
                icon: Icon(Icons.cancel_outlined),
                label: "Perdidas",
                selectedIcon: Icon(Icons.cancel)),
          ],
          selectedIndex: currentPage,
          onDestinationSelected: (page) {
            pc.animateToPage(page,
                duration: const Duration(milliseconds: 400),
                curve: Curves.ease);
          },
          backgroundColor: AppColors.grey.withOpacity(0.4),
        ),
      ),
    );
  }
}
