import 'package:equatable/equatable.dart';

abstract class MatchTimerEvent extends Equatable {
  const MatchTimerEvent();

  @override
  List<Object> get props => [];
}

class MatchTimerStartEvent extends MatchTimerEvent {
  final int duration;

  const MatchTimerStartEvent({required this.duration});
}

class MatchTimerCounterEvent extends MatchTimerEvent {
  final int duration;

  const MatchTimerCounterEvent({required this.duration});
}

class MatchTimerTickedEvent extends MatchTimerEvent {
  const MatchTimerTickedEvent({required this.duration});
  final int duration;

  @override
  List<Object> get props => [duration];
}
