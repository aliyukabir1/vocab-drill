import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocab_drill/src/word_of_day/view/bloc/word_of_day_bloc.dart';
import 'package:vocab_drill/src/word_of_day/view/word_meaning_page.dart';

class WordOfDayPage extends StatefulWidget {
  const WordOfDayPage({super.key});

  @override
  State<WordOfDayPage> createState() => _WordOfDayPageState();
}

class _WordOfDayPageState extends State<WordOfDayPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<WordOfDayBloc>(context).add(LoadWord(word: 'Happy'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Word of the Day'),
      ),
      body: BlocConsumer<WordOfDayBloc, WordOfDayState>(
        listener: (context, state) {
          if (state is WordOfDayError) {
            if (kDebugMode) {
              print('error');
            }
          }
        },
        builder: (context, state) {
          if (state is WordOfDayLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is WordOfDayLoaded) {
            return Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildSoundIcon(),
                      Container(
                        width: 160,
                        height: 160,
                        margin: const EdgeInsets.symmetric(horizontal: 30),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey,
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.mic,
                            size: 60,
                          ),
                        ),
                      ),
                      buildSoundIcon(),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      state.wordEntity.wordName,
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      state.wordEntity.result[0].definition,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    children: [
                      const Text(
                        'Pronunciation',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 30),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.speaker),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      state.wordEntity.pronounciation,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Sentences made',
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      ),
                      Text('1/5'),
                    ],
                  ),
                  const SizedBox(height: 10),
                  LinearProgressIndicator(
                    value: 0.2,
                    minHeight: 24,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text('Record'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute<WordMeaningPage>(
                              builder: (context) {
                                return WordMeaningPage(
                                  wordEntity: state.wordEntity,
                                );
                              },
                            ),
                          );
                        },
                        child: const Text('See sentenses'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Daily Streaks',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Stack(
                        children: [
                          const SizedBox(
                            height: 30,
                            width: 40,
                          ),
                          Container(
                            width: 30,
                            height: 30,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.pink,
                            ),
                          ),
                          Positioned(
                            left: 5,
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.yellow,
                              ),
                            ),
                          ),
                          Positioned(
                            left: 10,
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.blue,
                              ),
                              child: const Center(
                                child: Text(
                                  '100',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }

  Container buildSoundIcon() {
    return Container(
      width: 40,
      height: 40,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.lightBlue,
      ),
      child: const Icon(Icons.music_note),
    );
  }
}
