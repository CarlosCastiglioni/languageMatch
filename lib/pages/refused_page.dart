import 'package:flutter/material.dart';

import '../widgets/custom_app_bar.dart';

class RefusedPage extends StatefulWidget {
  const RefusedPage({Key? key}) : super(key: key);

  @override
  State<RefusedPage> createState() => _RefusedPageState();
}

class _RefusedPageState extends State<RefusedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: CustomAppBar(
            title1: "Solicitações Recusadas",
            subtitle: "Veja abaixo suas solicitações recusadas"),
        preferredSize: Size.fromHeight(130),
      ),
    );
  }
}
