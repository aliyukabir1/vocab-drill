import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class WordOfDayRemoteDataSource {
  final wordsAPIHost = 'wordsapiv1.p.rapidapi.com';
  final dio = Dio(
    BaseOptions(
      method: 'GET',
      baseUrl: 'https://wordsapiv1.p.rapidapi.com',
    ),
  );

  Future<Map<String, dynamic>?> getWord(String word) async {
    Map<String, dynamic>? result;
    try {
      // ignore: inference_failure_on_function_invocation
      final response = await dio.get(
        '$wordsAPIHost//words/$word',
        options: Options(
          headers: {
            'X-RapidAPI-Key': dotenv.env['WORDS_API_KEY'],
            'X-RapidAPI-Host': wordsAPIHost,
          },
        ),
      );
      if (response.statusCode == 200) {
        result = response.data! as Map<String, dynamic>?;
      } else {
        result = null;
        throw DioException(
          requestOptions: response.requestOptions,
          message: response.statusMessage,
        );
      }
    } catch (e) {
      rethrow;
    }
    return result;
  }
}
