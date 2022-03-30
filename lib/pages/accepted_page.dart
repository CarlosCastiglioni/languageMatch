import 'package:flutter/material.dart';
import 'package:language_match/widgets/custom_app_bar.dart';

class AcceptedPage extends StatefulWidget {
  const AcceptedPage({Key? key}) : super(key: key);

  @override
  State<AcceptedPage> createState() => _AcceptedPageState();
}

class _AcceptedPageState extends State<AcceptedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: CustomAppBar(
            title1: "Solicitações Aceitas",
            subtitle: "Veja abaixo suas solicitações aceitas"),
        preferredSize: Size.fromHeight(130),
      ),
    );
  }
}
