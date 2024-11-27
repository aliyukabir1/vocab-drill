import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
        padding: const EdgeInsets.all(15),
        children: [
          Container(
            height: 200,
            margin: const EdgeInsets.symmetric(vertical: 20),
            padding: const EdgeInsets.all(25),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 40, 18, 79),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      wordEntity.wordName,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        'assets/speaker.svg',
                        width: 30,
                        height: 30,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                RichText(
                  text: TextSpan(
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                    children: [
                      const TextSpan(text: 'Pronunciation:   '),
                      TextSpan(
                        text: ' [${wordEntity.pronounciation}]',
                        style: const TextStyle(
                          color: Color.fromARGB(255, 239, 76, 131),
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          ...wordEntity.result.map(
            (result) => Container(
              margin: const EdgeInsets.only(bottom: 20),
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              decoration: BoxDecoration(
                  border: const Border.symmetric(
                    horizontal: BorderSide(color: Colors.black12),
                  ),
                  color: const Color.fromARGB(104, 225, 177, 233),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  _buildInfoRow('definiton', result.definition),
                  const Divider(),
                  _buildInfoRow('part of speech', result.partOfSpeech),
                  _buildTexts('derivations', result.derivation),
                  _buildTexts('synonyms', result.synonyms),
                  _buildTexts('examples', result.examples),
                ],
              ),
            ),
          ),
        ],
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
    if (listOfText.isEmpty ||
        (listOfText.length == 1 && listOfText.first == '')) {
      return const SizedBox.shrink();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(),
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
              child: Text('- $e'),
            );
          }
          return const SizedBox.shrink();
        }),
        const SizedBox(height: 3),
      ],
    );
  }
}
