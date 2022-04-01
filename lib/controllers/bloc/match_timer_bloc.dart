import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:match_code/controllers/bloc/match_timer_event.dart';
import 'package:match_code/controllers/bloc/match_timer_state.dart';
import 'package:match_code/controllers/ticker.dart';

class MatchTimerBloc extends Bloc<MatchTimerEvent, MatchTimerState> {
  final Ticker _ticker;
  static const int _duration = 30;

  StreamSubscription<int>? _tickerSubscription;

  MatchTimerBloc({required Ticker ticker})
      : _ticker = ticker,
        super(const MatchTimerStartState(_duration)) {
    on<MatchTimerStartEvent>(_onStart);
    on<MatchTimerCounterEvent>(_onCount);
  }

  @override
  Future<void> close() {
    _tickerSubscription?.cancel();
    return super.close();
  }

  void _onStart(MatchTimerStartEvent event, Emitter<MatchTimerState> emit) {
    emit(const MatchTimerStartState(_duration));
    _tickerSubscription?.cancel();
    _tickerSubscription = _ticker
        .tick(ticks: _duration)
        .listen((duration) => add(MatchTimerTickedEvent(duration: duration)));
  }

  void _onCount(MatchTimerCounterEvent event, Emitter<MatchTimerState> emit) {
    emit(const MatchTimerCounterState(_duration));
    _tickerSubscription?.cancel();
    _tickerSubscription = _ticker
        .tick(ticks: 10)
        .listen((duration) => add(MatchTimerTickedEvent(duration: duration)));
  }
}
