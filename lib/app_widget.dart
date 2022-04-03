import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:match_code/controllers/bloc/match_timer_state.dart';
import 'package:match_code/widgets/match_actions.dart';
import 'controllers/ticker.dart';
import 'models/user_model.dart';
import 'pages/home_page.dart';
import 'pages/login_page.dart';
import 'pages/splash_page.dart';
import 'shared/themes/app_colors.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Resume',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
              primary: AppColors.primary, secondary: AppColors.secondary)),
      initialRoute: "/splash",
      routes: {
        "/splash": (context) => const SplashPage(),
        "/home": (context) => BlocProvider(
              create: (context) => MatchTimerBloc(ticker: const Ticker()),
              child: BlocBuilder<MatchTimerBloc, MatchTimerState>(
                builder: (context, state) {
                  return HomePage(
                    user:
                        ModalRoute.of(context)!.settings.arguments as UserModel,
                  );
                },
              ),
            ),
        "/login": (context) => const LoginPage(),
      },
    );
  }
}
