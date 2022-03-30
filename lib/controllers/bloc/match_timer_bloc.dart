import 'dart:async';

class MatchTimerBloc {
  final acceptController = StreamController();
  final refuseController = StreamController();
  final chooseTimerController = StreamController();
  final alertTimerController = StreamController();
}
