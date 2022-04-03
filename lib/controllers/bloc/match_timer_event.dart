import 'package:equatable/equatable.dart';

abstract class MatchTimerEvent extends Equatable {
  const MatchTimerEvent();

  @override
  List<Object> get props => [];
}

class MatchTimerStartEvent extends MatchTimerEvent {
  final int startDuration;

  const MatchTimerStartEvent({required this.startDuration});
}

class MatchTimerCounterEvent extends MatchTimerEvent {
  final int counterDuration;

  const MatchTimerCounterEvent({required this.counterDuration});
}

class MatchTimerTickedEvent extends MatchTimerEvent {
  const MatchTimerTickedEvent({required this.duration});
  final int duration;

  @override
  List<Object> get props => [duration];
}
