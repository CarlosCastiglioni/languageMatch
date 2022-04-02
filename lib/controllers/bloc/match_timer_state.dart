import 'package:equatable/equatable.dart';

abstract class MatchTimerState extends Equatable {
  final int duration;

  const MatchTimerState(this.duration);

  @override
  List<Object> get props => [duration];
}

class MatchTimerStartState extends MatchTimerState {
  const MatchTimerStartState(int duration) : super(duration);
}

class MatchTimerCounterState extends MatchTimerState {
  const MatchTimerCounterState(int duration) : super(duration);
}
