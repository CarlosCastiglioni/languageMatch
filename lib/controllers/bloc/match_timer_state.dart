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


// Inicial - 30 segundos para chamar a linguagem
// Contagem - 10 segundos

// se não escolher, vai para perdida - Resetar
// se aceitar vai para aceita - Resetar
// se rejeitar vai para rejeitado - Resetar
