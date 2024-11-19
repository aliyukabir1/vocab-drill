import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:vocab_drill/src/word_of_day/data/data_source/word_of_day_remote_data_source.dart';
import 'package:vocab_drill/src/word_of_day/data/repository/word_repository_impl.dart';
import 'package:vocab_drill/src/word_of_day/domain/entity/word_entity.dart';

part 'word_of_day_event.dart';
part 'word_of_day_state.dart';

class WordOfDayBloc extends Bloc<WordOfDayEvent, WordOfDayState> {
  WordOfDayBloc() : super(WordOfDayInitial()) {
    on<LoadWord>(_loadWord);
    on<ListenToSentence>(_listenToSentence);
    on<PronounceWord>(_pronounceWord);
  }

  Future<void> _loadWord(LoadWord event, Emitter<WordOfDayState> emit) async {
    emit(WordOfDayLoading());
    try {
      final wordEntity = await WordRepositoryImpl(
        remoteDataSource: WordOfDayRemoteDataSource(),
      ).getWord(event.word);
      if (wordEntity != null) emit(WordOfDayLoaded(wordEntity: wordEntity));
    } catch (e) {
      emit(WordOfDayError(errorMessage: e.toString()));
    }
  }

  void _listenToSentence(WordOfDayEvent event, Emitter<WordOfDayState> emit) {}
  void _pronounceWord(WordOfDayEvent event, Emitter<WordOfDayState> emit) {}
}
