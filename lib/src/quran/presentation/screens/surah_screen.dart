import 'package:al_quran_al_karim/core/services/quran_pages.dart';
import 'package:al_quran_al_karim/src/quran/presentation/cubit/surah_cubit.dart';
import 'package:al_quran_al_karim/src/quran/presentation/screens/all_surahs_screen.dart';
import 'package:al_quran_al_karim/src/quran/presentation/widgets/surah_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SurahScreen extends StatelessWidget {
  const SurahScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void showModelBottomSheet() {
      showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return Container(
              height: 200,
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  Container(
                    height: 3,
                    width: 50,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: const Text(
                          'Juz',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AllSurahsScreen()),
                          );
                        },
                        child: const Text(
                          'Surahs',
                          style: TextStyle(fontSize: 18),
                        ),
                      )
                    ],
                  )
                ],
              ),
            );
          });
    }

    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<SurahCubit, SurahState>(
          builder: (context, state) {
            return GestureDetector(
              onTap: showModelBottomSheet,
              child: PageView.builder(
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
              ),
            );
          },
        ),
      ),
    );
  }
}
