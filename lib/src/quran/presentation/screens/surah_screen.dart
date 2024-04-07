import 'package:al_quran_al_karim/core/services/quran_pages.dart';
import 'package:al_quran_al_karim/src/quran/presentation/cubit/surah_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SurahScreen extends StatelessWidget {
  const SurahScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<SurahCubit, SurahState>(
          builder: (context, state) {
            switch (state.status) {
              case SurahStateStatus.loading:
                return loadingWidget();
              case SurahStateStatus.loaded:
                return loadedWidget(size: size);
              default:
                return initialWidget();
            }
          },
        ),
      ),
    );
  }

  // Initial State
  Widget initialWidget() {
    return const Center(
      child: Text('Al Quran Al Karim'),
    );
  }

  // Loading State
  Widget loadingWidget() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
  // Loaded Stat

  Widget loadedWidget({required Size size}) {
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
