import 'dart:async';
import 'dart:math';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:match_code/controllers/bloc/match_timer_event.dart';
import 'package:match_code/controllers/bloc/match_timer_state.dart';
import 'package:match_code/controllers/ticker.dart';
import '../../api/notification_api.dart';
import '../../repository/languages_repository.dart';

class MatchTimerBloc extends Bloc<MatchTimerEvent, MatchTimerState> {
  final Ticker _ticker;
  static const int _startDuration = 60;
  static const int _counterDuration = 30;
  late dynamic lostLanguage = 0;
  late int lng = 0;
  late List languageList = [];
  List languages = LanguagesRepository.table;
  StreamSubscription<int>? _tickerSubscription;

  MatchTimerBloc({required Ticker ticker})
      : _ticker = ticker,
        super(const MatchTimerStartState(_startDuration)) {
    on<MatchTimerStartEvent>(_onStart);
    on<MatchTimerCounterEvent>(_onCount);
    on<MatchTimerTickedEvent>(_onTicked);
  }

  @override
  Future<void> close() {
    _tickerSubscription?.cancel();
    return super.close();
  }

  void _onStart(MatchTimerStartEvent event, Emitter<MatchTimerState> emit) {
    languageList = languages
        .where(
          (element) => element.state == "Pending",
        )
        .toList();
    final random = Random();
    final language =
        languageList.isNotEmpty ? random.nextInt(languageList.length) : 0;
    lng = language;
    emit(const MatchTimerStartState(_startDuration));
    _tickerSubscription?.cancel();
    _tickerSubscription = _ticker
        .tick(ticks: _startDuration)
        .listen((duration) => add(MatchTimerTickedEvent(duration: duration)));
  }

  void _onCount(MatchTimerCounterEvent event, Emitter<MatchTimerState> emit) {
    NotificationApi.showNotification(
        title: "Linguagem Disponível",
        body:
            "Corra! Você tem 30 segundos para dar match com uma nova linguagem!");
    emit(const MatchTimerCounterState(_counterDuration));
    _tickerSubscription?.cancel();
    _tickerSubscription = _ticker
        .tick(ticks: _counterDuration)
        .listen((duration) => add(MatchTimerTickedEvent(duration: duration)));
  }

  void _onTicked(MatchTimerTickedEvent event, Emitter<MatchTimerState> emit) {
    if (event.duration == 0 &&
        state is MatchTimerStartState &&
        lostLanguage != null) {
      _tickerSubscription = _ticker.tick(ticks: _startDuration).listen(
          (duration) => add(
              const MatchTimerCounterEvent(counterDuration: _counterDuration)));
    } else if (event.duration == 0 &&
        state is MatchTimerCounterState &&
        lostLanguage != null) {
      lostLanguage.state = "Lost";
      _tickerSubscription = _ticker.tick(ticks: _counterDuration).listen(
          (duration) =>
              add(const MatchTimerStartEvent(startDuration: _startDuration)));
    } else if (event.duration == 0 && languageList.isEmpty) {
      _tickerSubscription?.cancel();
    }
  }
}
