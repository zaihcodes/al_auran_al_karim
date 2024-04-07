import 'package:al_quran_al_karim/core/services/quran_pages.dart';
import 'package:flutter/material.dart';

class SurahLIstWidget extends StatelessWidget {
  const SurahLIstWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      reverse: true,
      itemCount: QuranPages.quranPages.length,
      itemBuilder: (context, index) {
        return Container(
          color: Colors.grey[200],
          child: Image.asset(
            QuranPages.quranPages[index],
            fit: BoxFit.fill,
            // color: Colors.white,
          ),
        );
      },
    );
  }
}
