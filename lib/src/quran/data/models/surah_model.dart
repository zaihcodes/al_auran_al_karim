import 'package:al_quran_al_karim/src/quran/data/models/juz_model.dart';
import 'package:al_quran_al_karim/src/quran/domain/entities/surah.dart';

class SurahModel extends Surah {
  SurahModel(
      {required super.place,
      required super.type,
      required super.count,
      required super.revelationOrder,
      required super.rukus,
      required super.title,
      required super.titleAr,
      required super.titleEn,
      required super.index,
      required super.pages,
      required super.page,
      required super.start,
      required super.juz});

  factory SurahModel.fromJson(Map<String, dynamic> json) {
    return SurahModel(
      place: json['place'] as String,
      type: json['type'] as String,
      count: json['count'] as int,
      revelationOrder: json['revelationOrder'] as int,
      rukus: json['rukus'] as int,
      title: json['title'] as String,
      titleAr: json['titleAr'] as String,
      titleEn: json['titleEn'] as String,
      index: json['index'] as String,
      pages: json['pages'] as String,
      page: json['page'] as String,
      start: json['start'] as int,
      juz:
          (json['juz'] as List).map((json) => JuzModel.fromJson(json)).toList(),
    );
  }
}
