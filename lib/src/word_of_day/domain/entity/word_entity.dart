import 'package:equatable/equatable.dart';

class WordEntity extends Equatable {
  const WordEntity({
    required this.wordName,
    required this.result,
    required this.syllable,
    required this.pronounciation,
    required this.frequency,
  });

  final String wordName;
  final List<Result> result;
  final Syllable syllable;
  final String pronounciation;
  final double frequency;

  @override
  List<Object?> get props => [];
}

class Result extends Equatable {
  const Result({
    required this.definition,
    required this.partOfSpeech,
    required this.synonyms,
    required this.derivation,
    required this.examples,
  });

  final String definition;
  final String partOfSpeech;
  final List<String> synonyms;
  final List<String> derivation;
  final List<String> examples;

  @override
  List<Object?> get props => [];
}

class Syllable extends Equatable {
  const Syllable({required this.count, required this.list});

  final int count;
  final List<String> list;

  @override
  List<Object?> get props => [];
}
