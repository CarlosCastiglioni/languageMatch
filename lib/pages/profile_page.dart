import 'package:flutter/material.dart';
import 'package:language_match/widgets/custom_app_bar.dart';

import '../models/user_model.dart';
import '../shared/themes/app_text_styles.dart';

class ProfilePage extends StatefulWidget {
  final UserModel user;
  const ProfilePage({Key? key, required this.user}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(170),
        child: CustomAppBar(
            title1: "Olá, ",
            title2: widget.user.name,
            photo: widget.user.photoURL!,
            subtitle: "Bem vindo ao Language Match!"),
      ),
    );
  }
}
