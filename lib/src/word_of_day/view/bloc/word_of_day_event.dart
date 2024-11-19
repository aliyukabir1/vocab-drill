part of 'word_of_day_bloc.dart';

@immutable
sealed class WordOfDayEvent {}

class LoadWord extends WordOfDayEvent {
  LoadWord({required this.word});

  final String word;
}

class ListenToSentence extends WordOfDayEvent {}

class PronounceWord extends WordOfDayEvent {}
