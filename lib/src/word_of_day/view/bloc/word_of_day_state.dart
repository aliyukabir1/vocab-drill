part of 'word_of_day_bloc.dart';

@immutable
sealed class WordOfDayState {}

final class WordOfDayInitial extends WordOfDayState {}

final class WordOfDayLoading extends WordOfDayState {}

final class WordOfDayLoaded extends WordOfDayState {
  WordOfDayLoaded({required this.wordEntity});
  final WordEntity wordEntity;
}

final class WordOfDayError extends WordOfDayState {
  WordOfDayError({required this.errorMessage});
  final String errorMessage;
}
