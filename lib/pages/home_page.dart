import 'package:flutter/material.dart';
import 'package:language_match/pages/accepted_page.dart';
import 'package:language_match/pages/lost_page.dart';
import 'package:language_match/pages/pending_page.dart';
import 'package:language_match/pages/profile_page.dart';
import 'package:language_match/pages/refused_page.dart';
import 'package:language_match/shared/themes/app_colors.dart';

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
    super.initState();
    pc = PageController(initialPage: currentPage);
  }

  setPage(page) {
    setState(() {
      currentPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        onPageChanged: setPage,
        controller: pc,
        children: [
          ProfilePage(user: widget.user!),
          PendingPage(),
          AcceptedPage(),
          RefusedPage(),
          LostPage()
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
