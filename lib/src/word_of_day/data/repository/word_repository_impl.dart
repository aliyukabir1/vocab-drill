import 'package:vocab_drill/src/word_of_day/data/data_source/word_of_day_remote_data_source.dart';
import 'package:vocab_drill/src/word_of_day/data/model/word_model.dart';
import 'package:vocab_drill/src/word_of_day/domain/entity/word_entity.dart';
import 'package:vocab_drill/src/word_of_day/domain/repository/word_repository.dart';

class WordRepositoryImpl implements WordRepository {
  WordRepositoryImpl({required this.remoteDataSource});

  final WordOfDayRemoteDataSource remoteDataSource;
  @override
  Future<WordEntity?> getWord(String word) async {
    try {
      final result = await remoteDataSource.getWord(word);
      if (result?.isNotEmpty ?? false) {
        return WordModel.fromJson(result!);
      } else {
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }
}
