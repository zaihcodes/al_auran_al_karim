import 'package:al_quran_al_karim/src/quran/domain/entities/verse.dart';

class VerseModel extends Verse {
  VerseModel({required super.start, required super.end});

  factory VerseModel.fromJson(Map<String, dynamic> json) {
    return VerseModel(start: json['start'], end: json['end']);
  }
}
