import 'package:flutter/material.dart';
import 'package:match_code/repository/languages_repository.dart';
import 'package:match_code/widgets/custom_app_bar.dart';

import '../models/user_model.dart';

class ProfilePage extends StatefulWidget {
  final UserModel user;
  const ProfilePage({Key? key, required this.user}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final languages = LanguagesRepository.table;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(170),
        child: CustomAppBar(
            title1: "Olá, ",
            title2: widget.user.name,
            photo: widget.user.photoURL!,
            subtitle: "Veja abaixo as linguagens disponíveis"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: languages.isNotEmpty
            ? ListView.separated(
                scrollDirection: Axis.vertical,
                itemCount: languages.length,
                separatorBuilder: (_, __) => Divider(),
                itemBuilder: (BuildContext context, int language) {
                  return ListTile(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    leading: Image.asset(languages[language].icon),
                    title: Text(languages[language].name),
                  );
                },
              )
            : const Text("Não há registros"),
      ),
    );
  }
}
