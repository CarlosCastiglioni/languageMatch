import 'package:flutter/material.dart';

import '../widgets/custom_app_bar.dart';

class LostPage extends StatefulWidget {
  const LostPage({Key? key}) : super(key: key);

  @override
  State<LostPage> createState() => _LostPageState();
}

class _LostPageState extends State<LostPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: CustomAppBar(
            title1: "Solicitações Perdidas",
            subtitle: "Veja abaixo suas solicitações perdidas"),
        preferredSize: Size.fromHeight(130),
      ),
    );
  }
}
