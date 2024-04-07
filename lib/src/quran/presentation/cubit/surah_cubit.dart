import 'dart:convert';

import 'package:al_quran_al_karim/src/quran/data/models/surah_model.dart';
import 'package:al_quran_al_karim/src/quran/domain/entities/surah.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';

part 'surah_state.dart';

class SurahCubit extends Cubit<SurahState> {
  SurahCubit() : super(const SurahState(status: SurahStateStatus.initial));

  Future loadSurahs() async {
    emit(state.copyWith(status: SurahStateStatus.loading));

    final surahsString = await rootBundle.loadString('assets/data/surah.json');
    final List<dynamic> surahsJson = jsonDecode(surahsString);

    final surahs = surahsJson.map((json) => SurahModel.fromJson(json)).toList();

    emit(state.copyWith(status: SurahStateStatus.loaded, surahs: surahs));
  }
}
