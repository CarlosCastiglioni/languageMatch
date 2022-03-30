import 'package:flutter/material.dart';

import '../widgets/custom_app_bar.dart';

class PendingPage extends StatefulWidget {
  const PendingPage({Key? key}) : super(key: key);

  @override
  State<PendingPage> createState() => _PendingPageState();
}

class _PendingPageState extends State<PendingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: CustomAppBar(
            title1: "Solicitações Pendentes",
            subtitle: "Veja abaixo suas solicitações pendentes"),
        preferredSize: Size.fromHeight(130),
      ),
    );
  }
}
