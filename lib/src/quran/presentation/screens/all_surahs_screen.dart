import 'package:al_quran_al_karim/src/quran/presentation/cubit/surah_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class AllSurahsScreen extends StatelessWidget {
  const AllSurahsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SurahCubit, SurahState>(builder: (context, state) {
        if (state.status == SurahStateStatus.loaded) {
          return SingleChildScrollView(
            child: Column(
              children: List.generate(state.surahs!.length, (index) {
                final surah = state.surahs![index];
                return GestureDetector(
                  onTap: () {},
                  child: SizedBox(
                    height: 65,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: 55,
                          color: Colors.black,
                          child: Center(
                            child: Text(
                              surah.page,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Image.asset(
                          'assets/icons/${surah.type}.png',
                          width: 30,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Column(
                          children: [
                            const Text(
                              'أياتها',
                              style: TextStyle(fontSize: 16),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              '${surah.count}',
                              style: const TextStyle(fontSize: 16),
                            )
                          ],
                        ),
                        Expanded(
                          child: Text(
                            surah.titleAr,
                            textAlign: TextAlign.end,
                            style: GoogleFonts.amiri().copyWith(fontSize: 30),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Container(
                          width: 55,
                          color: Colors.black,
                          child: Center(
                            child: Text(
                              '${index + 1}',
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      }),
    );
  }
}
