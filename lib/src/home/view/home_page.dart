import 'package:flutter/material.dart';

import 'package:vocab_drill/src/word_of_day/view/word_of_day_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vocal Drill'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('data'),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute<WordOfDayPage>(
                    builder: (context) {
                      return const WordOfDayPage();
                    },
                  ),
                );
              },
              child: const Text('Word of the Day'),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute<WordOfDayPage>(
                    builder: (context) {
                      return const WordOfDayPage();
                    },
                  ),
                );
              },
              child: const Text('Word of the Day'),
            ),
          ],
        ),
      ),
    );
  }
}
