// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:al_quran_al_karim/src/quran/domain/entities/juz.dart';

class Surah {
  final String place;
  final String type;
  final int count;
  final int revelationOrder;
  final int rukus;
  final String title;
  final String titleAr;
  final String titleEn;
  final String index;
  final String pages;
  final String page;
  final int start;
  final List<Juz> juz;
  const Surah({
    required this.place,
    required this.type,
    required this.count,
    required this.revelationOrder,
    required this.rukus,
    required this.title,
    required this.titleAr,
    required this.titleEn,
    required this.index,
    required this.pages,
    required this.page,
    required this.start,
    required this.juz,
  });
}
