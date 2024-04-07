import 'package:al_quran_al_karim/src/quran/presentation/cubit/surah_cubit.dart';
import 'package:al_quran_al_karim/src/quran/presentation/screens/surah_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SurahCubit()..loadSurahs(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SurahScreen(),
      ),
    );
  }
}
