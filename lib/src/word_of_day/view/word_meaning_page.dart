import 'package:flutter/material.dart';
import 'package:vocab_drill/src/word_of_day/domain/entity/word_entity.dart';

class WordMeaningPage extends StatelessWidget {
  const WordMeaningPage({
    required this.wordEntity,
    super.key,
  });
  final WordEntity wordEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(wordEntity.wordName),
        centerTitle: true,
      ),
      body: ListView(
        children: wordEntity.result
            .map(
              (result) => Container(
                margin: const EdgeInsets.only(bottom: 5),
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                decoration: const BoxDecoration(
                  border: Border.symmetric(
                    horizontal: BorderSide(color: Colors.black12),
                  ),
                  color: Color.fromARGB(104, 225, 177, 233),
                ),
                child: Column(
                  children: [
                    _buildInfoRow('definiton', result.definition),
                    const Divider(),
                    _buildInfoRow('part of speech', result.partOfSpeech),
                    const Divider(),
                    _buildTexts('derivations', result.derivation),
                    const Divider(),
                    _buildTexts('synonyms', result.synonyms),
                    const Divider(),
                    _buildTexts('examples', result.examples),
                  ],
                ),
                // title: Text(
                //   result.definition,
                // ),
                // subtitle: Text(result.partOfSpeech),
              ),
            )
            .toList(),
      ),
    );
  }

  Row _buildInfoRow(String title, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$title :',
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Text(
            value,
          ),
        ),
      ],
    );
  }

  Widget _buildTexts(String title, List<String> listOfText) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            '$title :',
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
        ...listOfText.map((e) {
          if (e.isNotEmpty || (e != '')) {
            return Align(
              alignment: Alignment.centerLeft,
              child: Text(e),
            );
          }
          return const SizedBox.shrink();
        }),
        const SizedBox(height: 3),
      ],
    );
  }
}
