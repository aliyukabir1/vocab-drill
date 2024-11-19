import 'package:vocab_drill/src/word_of_day/domain/entity/word_entity.dart';

class WordModel extends WordEntity {
  const WordModel({
    required super.wordName,
    required super.result,
    required super.syllable,
    required super.pronounciation,
    required super.frequency,
  });

  factory WordModel.fromJson(Map<String, dynamic> json) {
    final syllables = json['syllables'];
    final pronunciation = json['pronunciation'] as Map<String, dynamic>;
    return WordModel(
      wordName: json['word'] as String,
      result: (json['results'] as List)
          .map((e) => ResultModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      syllable: SyllableModel.fromJson(syllables as Map<String, dynamic>),
      pronounciation: pronunciation['all']! as String,
      frequency: json['frequency'] as double,
    );
  }
}

class SyllableModel extends Syllable {
  const SyllableModel({required super.count, required super.list});
  factory SyllableModel.fromJson(Map<String, dynamic> json) => SyllableModel(
        count: json['count'] as int,
        list: (json['list'] as List<dynamic>).map((e) => e.toString()).toList(),
      );
}

class ResultModel extends Result {
  const ResultModel({
    required super.definition,
    required super.partOfSpeech,
    required super.synonyms,
    required super.derivation,
    required super.examples,
  });

  factory ResultModel.fromJson(Map<String, dynamic> json) {
    final synonyms = json['synonyms'] as List<dynamic>?;
    final derivation = json['derivation'] as List<dynamic>?;
    final examples = json['examples'] as List<dynamic>?;
    return ResultModel(
      definition: json['definition'] as String,
      partOfSpeech: json['partOfSpeech'] as String,
      synonyms: synonyms?.map((e) => e.toString()).toList() ?? [''],
      derivation: derivation?.map((e) => e.toString()).toList() ?? [''],
      examples: examples?.map((e) => e.toString()).toList() ?? [''],
    );
  }
}
