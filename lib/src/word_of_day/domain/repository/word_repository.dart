import 'package:vocab_drill/src/word_of_day/domain/entity/word_entity.dart';

// ignore: one_member_abstracts
abstract class WordRepository {
  Future<WordEntity?> getWord(String word);
}
